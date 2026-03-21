<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đơn hàng mới</title>
</head>
<body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
    <h2>Đơn hàng mới #{{ $order->order_number }}</h2>
    <table style="width: 100%; border-collapse: collapse; margin: 20px 0;">
        <tr>
            <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Khách hàng</td>
            <td style="padding: 8px; border: 1px solid #ddd;">{{ $order->customer_name }}</td>
        </tr>
        <tr>
            <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Email</td>
            <td style="padding: 8px; border: 1px solid #ddd;">{{ $order->customer_email }}</td>
        </tr>
        <tr>
            <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Số điện thoại</td>
            <td style="padding: 8px; border: 1px solid #ddd;">{{ $order->customer_phone }}</td>
        </tr>
        <tr>
            <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Sản phẩm</td>
            <td style="padding: 8px; border: 1px solid #ddd;">{{ $product->name }} x {{ $quantity }}</td>
        </tr>
        <tr>
            <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Tổng tiền</td>
            <td style="padding: 8px; border: 1px solid #ddd;">{{ number_format($order->total_amount, 0, ',', '.') }} VND</td>
        </tr>
        @if ($order->customer_note)
        <tr>
            <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Ghi chú</td>
            <td style="padding: 8px; border: 1px solid #ddd;">{{ $order->customer_note }}</td>
        </tr>
        @endif
        <tr>
            <td style="padding: 8px; border: 1px solid #ddd; font-weight: bold;">Thời gian</td>
            <td style="padding: 8px; border: 1px solid #ddd;">{{ $order->created_at->format('d/m/Y H:i') }}</td>
        </tr>
    </table>
</body>
</html>
