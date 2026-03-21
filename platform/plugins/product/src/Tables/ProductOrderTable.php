<?php

namespace Botble\Product\Tables;

use Botble\Product\Models\ProductOrder;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class ProductOrderTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(ProductOrder::class)
            ->addActions([
                EditAction::make()->route('product-order.edit'),
                DeleteAction::make()->route('product-order.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('total_amount', function (ProductOrder $item) {
                return number_format($item->total_amount, 0, ',', '.') . ' VND';
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
                'order_number',
                'customer_name',
                'customer_email',
                'customer_phone',
                'total_amount',
                'status',
                'created_at',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('order_number')
                ->title(trans('plugins/product::product.order_number'))
                ->alignLeft(),
            Column::make('customer_name')
                ->title(trans('plugins/product::product.customer_name'))
                ->alignLeft(),
            Column::make('customer_phone')
                ->title(trans('plugins/product::product.customer_phone')),
            Column::make('total_amount')
                ->title(trans('plugins/product::product.total_amount')),
            Column::make('status')
                ->title(trans('core/base::tables.status')),
            CreatedAtColumn::make(),
        ];
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('product-order.destroy'),
        ];
    }
}
