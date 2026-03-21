<?php

namespace Botble\Product\Tables;

use Botble\Product\Models\ProductCategory;
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

class ProductCategoryTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(ProductCategory::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('product-category.create'))
            ->addActions([
                EditAction::make()->route('product-category.edit'),
                DeleteAction::make()->route('product-category.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table->eloquent($this->query());

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->select(['id', 'name', 'status', 'created_at']);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('name')
                ->title(trans('core/base::tables.name'))
                ->alignLeft(),
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ];
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('product-category.destroy'),
        ];
    }
}
