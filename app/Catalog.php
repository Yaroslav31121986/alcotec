<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Catalog extends Model
{
    protected $table = 'catalog';
    protected $fillable = [
        'name',
        'id_brand',
        'id_category',
        'id_awailability',
        'price',
        'id_currency',
    ];

    public function catalogCurrencies()
    {
        return $this->belongsTo(CatalogCurrencies::class, 'id_currency', 'id');
    }

//    public function getPriceAttribute($value)
//    {
//        dump($value);
//        dump($this);
////        $this->attributes['priceUAH'] = $value * $this->catalogCurrencies->rate;
//    }
}
