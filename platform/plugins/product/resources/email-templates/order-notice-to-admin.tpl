{{ header }}

<div class="bb-main-content">
    <table class="bb-box" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="bb-content bb-pb-0" align="center">
                    <table class="bb-icon bb-icon-lg bb-bg-blue" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td valign="middle" align="center">
                                    <img src="{{ 'mail' | icon_url }}" class="bb-va-middle" width="40" height="40" alt="Icon">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <h1 class="bb-text-center bb-m-0 bb-mt-md">Đơn hàng mới #{{ order_number }}</h1>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td class="bb-content">
                                    <p>Bạn nhận được đơn hàng mới từ website.</p>

                                    <h4>Thông tin đơn hàng</h4>

                                    <table class="bb-table" cellspacing="0" cellpadding="0">
                                        <thead>
                                            <tr>
                                                <th width="120px"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {% if customer_name %}
                                            <tr>
                                                <td>Khách hàng</td>
                                                <td class="bb-font-strong bb-text-left">{{ customer_name }}</td>
                                            </tr>
                                            {% endif %}
                                            {% if customer_email %}
                                            <tr>
                                                <td>Email</td>
                                                <td class="bb-font-strong bb-text-left">{{ customer_email }}</td>
                                            </tr>
                                            {% endif %}
                                            {% if customer_phone %}
                                            <tr>
                                                <td>Số điện thoại</td>
                                                <td class="bb-font-strong bb-text-left">{{ customer_phone }}</td>
                                            </tr>
                                            {% endif %}
                                            {% if product_name %}
                                            <tr>
                                                <td>Sản phẩm</td>
                                                <td class="bb-font-strong bb-text-left">{{ product_name }} x {{ quantity }}</td>
                                            </tr>
                                            {% endif %}
                                            {% if total_amount %}
                                            <tr>
                                                <td>Tổng tiền</td>
                                                <td class="bb-font-strong bb-text-left">{{ total_amount }}</td>
                                            </tr>
                                            {% endif %}
                                            {% if customer_note %}
                                            <tr>
                                                <td>Ghi chú</td>
                                                <td class="bb-font-strong bb-text-left">{{ customer_note }}</td>
                                            </tr>
                                            {% endif %}
                                            {% if order_date %}
                                            <tr>
                                                <td>Thời gian</td>
                                                <td class="bb-font-strong bb-text-left">{{ order_date }}</td>
                                            </tr>
                                            {% endif %}
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</div>

{{ footer }}
