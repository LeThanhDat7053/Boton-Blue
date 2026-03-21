@extends(BaseHelper::getAdminMasterLayoutTemplate())

@section('content')
    <div class="card">
        <div class="card-header">
            <h4>{{ trans('plugins/product::product.order_detail', ['number' => $order->order_number]) }}</h4>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <h5>Thông tin khách hàng</h5>
                    <table class="table table-bordered">
                        <tr><th>Tên</th><td>{{ $order->customer_name }}</td></tr>
                        <tr><th>Email</th><td>{{ $order->customer_email }}</td></tr>
                        <tr><th>SĐT</th><td>{{ $order->customer_phone }}</td></tr>
                        @if($order->customer_note)
                        <tr><th>Ghi chú</th><td>{{ $order->customer_note }}</td></tr>
                        @endif
                        <tr><th>Ngày đặt</th><td>{{ $order->created_at->format('d/m/Y H:i') }}</td></tr>
                    </table>
                </div>
                <div class="col-md-6">
                    <h5>Chi tiết đơn hàng</h5>
                    <table class="table table-bordered">
                        <thead>
                            <tr><th>Sản phẩm</th><th>Giá</th><th>SL</th><th>Thành tiền</th></tr>
                        </thead>
                        <tbody>
                            @foreach($order->items as $item)
                            <tr>
                                <td>{{ $item->product_name }}</td>
                                <td>{{ number_format($item->product_price, 0, ',', '.') }} VND</td>
                                <td>{{ $item->quantity }}</td>
                                <td>{{ number_format($item->product_price * $item->quantity, 0, ',', '.') }} VND</td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="3">Tổng</th>
                                <th>{{ number_format($order->total_amount, 0, ',', '.') }} VND</th>
                            </tr>
                        </tfoot>
                    </table>
                    <form action="{{ route('product-order.update', $order->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="mb-3">
                            <label class="form-label">Trạng thái</label>
                            <select name="status" class="form-control">
                                <option value="pending" @selected($order->status === 'pending')>Pending</option>
                                <option value="processing" @selected($order->status === 'processing')>Processing</option>
                                <option value="completed" @selected($order->status === 'completed')>Completed</option>
                                <option value="cancelled" @selected($order->status === 'cancelled')>Cancelled</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
