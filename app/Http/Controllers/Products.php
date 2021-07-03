<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Catalog;

class Products extends Controller
{
    /**
     * @param Request $request
     * @param $idCategory
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Request $request, $idCategory)
    {
        $filters = $request->all();

        $validator = Validator::make(
            $filters,
            [
                'price.from' => 'required',
                'price.to' => 'required',
                'sorting.sortBy' => 'required',
                'sorting.isDesc' => 'required',
            ],
            [
                'sorting.isDesc.required' => 'Вы не заполнили поле isDesc',
                'sorting.sortBy.required' => 'Вы не заполнили поле sortBy',
                'price.to.required' => 'Вы не заполнили поле to',
                'price.from.required' => 'Вы не заполнили поле from',
            ]
        );

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->all(),
                'status' => false
            ], 200);
        }

        $totalQuantityOfGoods = Catalog::count();
        $products = Catalog::with(['catalogCurrencies' => function($query)
        {
            $query->select('id', 'rate');
        }])->where('id_category', $idCategory);

        foreach ($filters as $filter => $value) {
            switch ($filter) {
                case 'brand':
                    $products->where('id_brand', $value);
                    break;
                case 'availability':
                    $products->where('id_awailability', $value);
                    break;
                case 'sorting':
                    if (in_array('name', $value)) {
                        $products->orderBy('name', (bool) $value['isDesc'] ? 'asc' : 'desc');
                    }
                    break;
            }
        }

        $products = $products->get();
        $result = [];
        $total = 0;

        foreach ($products as $product) {
            $product->priceUAH = $product->price * $product->catalogCurrencies->rate;

            if ($product->priceUAH >= $filters['price']['from'] && $product->priceUAH <= $filters['price']['to']) {
                $result[$total] = $product->toArray();
            }

            unset($result[$total]['catalog_currencies']);
            $total++;
        }

        if (in_array('price', $filters['sorting'])) {
            $this->sortByPryce(
                $result,
                filter_var($filters['sorting']['isDesc'], FILTER_VALIDATE_BOOLEAN)
            );
        }

        return response()->json([
            'products' => $result,
            'totalQuantityOfGoods' => $totalQuantityOfGoods,
            'totalNumberOfFilteredItems' => count($result),
        ], 200);
    }

    /**
     * @param array $products
     * @param bool $flag
     */
    protected function sortByPryce(array &$products, $flag = true)
    {
        usort($products, function ($product1, $product2) use ($flag)
        {
            $result = null;

            if ($product1['priceUAH'] == $product2['priceUAH']) {
                 $result = 0;
            } elseif ($flag) {
                $result = ($product1['priceUAH'] < $product2['priceUAH']) ? -1 : 1;
            } else {
                $result = ($product1['priceUAH'] > $product2['priceUAH']) ? -1 : 1;
            }

            return $result;
        });
    }
}
