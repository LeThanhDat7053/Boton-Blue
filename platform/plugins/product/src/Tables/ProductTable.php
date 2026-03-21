<?php

namespace Botble\Product\Tables;

use Botble\Product\Models\Product;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class ProductTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Product::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('product.create'))
            ->addActions([
                EditAction::make()->route('product.edit'),
                DeleteAction::make()->route('product.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('price', function (Product $item) {
                return number_format($item->price, 0, ',', '.') . ' VND';
            })
            ->editColumn('category_id', function (Product $item) {
                return $item->category->name ?? '—';
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->select([
                'id',
                'name',
                'price',
                'category_id',
                'total_sold',
                'status',
                'created_at',
            ])
            ->with(['category']);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('name')
                ->title(trans('core/base::tables.name'))
                ->alignLeft(),
            Column::make('price')
                ->title(trans('plugins/product::product.price')),
            Column::make('category_id')
                ->title(trans('plugins/product::product.category'))
                ->orderable(false)
                ->searchable(false),
            Column::make('total_sold')
                ->title(trans('plugins/product::product.total_sold')),
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ];
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('product.destroy'),
        ];
    }
}
