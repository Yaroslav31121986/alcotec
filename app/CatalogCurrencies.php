<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CatalogCurrencies extends Model
{
    protected $table = 'catalog_currencies';
    protected $fillable = [
        'name',
        'title',
        'short_name',
        'rate',
    ];

    public function catalog()
    {
        return $this->hasMany(Catalog::class, 'id_currency', 'id');
    }
}
