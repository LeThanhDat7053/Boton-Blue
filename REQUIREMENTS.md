# 📝 YÊU CẦU DỰ ÁN — Hotel Booking Platform Customization

> **Ngày tạo:** 2026-03-20  
> **Dự án:** Boton Hotel (Theme Riorelax)  
> **Trạng thái:** Chờ triển khai

---

## A. MODULE ROOMS (Phòng khách sạn)

### A1. Thêm nút xem VR360 cho mỗi phòng

- Mỗi phòng trong danh sách trang `/rooms` có thêm **một nút "Xem VR360"**.
- Khi click → **mở tab trình duyệt mới** đến đường dẫn VR360 đã được cấu hình cho phòng đó.
- Đường dẫn VR360 được **nhập từ Dashboard admin** khi tạo/sửa phòng (ví dụ: link Matterport, Kuula...).

---

### A2. Nút "Check Availability" redirect sang hệ thống booking bên ngoài

- Trang `/rooms` có sidebar widget **Booking Form** (class `sidebar-widget-rooms`).
- Nút **"Check Availability"** khi click → **không submit nội bộ** nữa, thay vào đó tạo URL và **mở tab mới** đến hệ thống booking bên ngoài.
- URL mẫu:

```
https://book-directonline.com/properties/botbluhotspadirect?locale=vi&lang=en&checkInDate=2026-03-21&arrivalDate=21032026&nightsStay=&checkOutDate=2026-03-22&items[0][adults]=2&items[0][children]=1&items[0][infants]=0&currency=VND&trackPage=yes
```

- Dữ liệu từ form (ngày check-in, check-out, số người lớn, trẻ em) phải được **mang theo vào URL**.

---

### A3. Trang chi tiết phòng — Nút VR360 + Book Now với Rate ID

Khi vào trang chi tiết một phòng cụ thể (`/rooms/{slug}`):

1. **Sidebar (`services-sidebar`)** có thêm **nút "Xem VR360"** nằm **ngay phía trên** form booking.

2. Trong **Dashboard admin** và **database**, mỗi phòng có thêm **trường Rate ID** (ID phòng trên hệ thống booking bên ngoài) — cho phép nhập và cập nhật từ admin.

3. Nút **"Book Now"** trong form booking sidebar cũng **redirect ra ngoài** tương tự A2, nhưng thêm trường `rateId` và path `/book`. URL mẫu:

```
https://book-directonline.com/properties/botbluhotspadirect/book?locale=vi&lang=en&checkInDate=2026-03-21&arrivalDate=21032026&nightsStay=&checkOutDate=2026-03-22&items[0][adults]=2&items[0][children]=1&items[0][infants]=0&items[0][rateId]=559561&currency=VND&trackPage=yes&selected=0&step=step1
```

---

### A4. Xóa hoàn toàn hệ thống đánh giá (Review)

- **Bỏ hết** tất cả những gì liên quan đến review/đánh giá của khách.
- Phạm vi xóa: **Database** (table), **Dashboard admin** (menu, form, controller), **Frontend** (views, JS, CSS).
- Không giữ lại bất kỳ phần nào.

---

### A5. Đổi nút booking trên room card thành nút VR360

- Trong danh sách phòng trang `/rooms`, mỗi room card hiện có khối `day-book` chứa nút **"BOOK NOW FOR ..."**.
- **Đổi nút này** thành nút **"Xem VR360"** — click mở tab mới đến URL VR360 của phòng.
- Nút booking cũ bị thay thế hoàn toàn (vì booking đã chuyển sang form sidebar → redirect external ở A2).

---

## B. MODULE PAGE (Trang tĩnh)

### Thêm khối HTML thuần vào form tạo/sửa Page

- Trong Dashboard admin, form tạo/sửa Page **thêm một trường mới** cho phép nhập **HTML thuần** (bao gồm cả CSS và JS inline).
- Trường này **không bị giới hạn thẻ HTML** như HTML Block hiện có của CKEditor (hiện tại quá hạn chế và phiền phức).
- Trường phải **hỗ trợ đa ngôn ngữ**: mỗi Page có nhiều phiên bản ngôn ngữ, nội dung HTML thay đổi tương ứng khi chuyển ngôn ngữ trên trang (phù hợp với hệ thống đa ngôn ngữ hiện có của trang).

---

## C. MODULE BLOG

### Fix lỗi Gallery Block không hiển thị ở Frontend

- Shortcode **thư viện ảnh (Gallery Block)** khi chèn vào nội dung blog post → **không hiển thị hình ảnh ở frontend**.
- Cần tìm nguyên nhân và sửa để gallery hiển thị đúng trên giao diện người dùng.

---

## D. MODULE PRODUCT MỚI (Bán gói dịch vụ)

### Bổ sung chức năng bán sản phẩm/gói dịch vụ cho khách sạn

**Mục đích:** Cho phép khách sạn bán các gói dịch vụ trực tuyến — ví dụ: combo ăn uống, spa, combo bia, buffet, v.v.

**Tham khảo giao diện:** [https://booking.premierpearlrooftop.com/](https://booking.premierpearlrooftop.com/)

**Yêu cầu chức năng:**

1. **Dashboard admin:**
   - Quản lý danh sách sản phẩm (tên, mô tả, hình ảnh, giá, danh mục).
   - Quản lý đơn đặt hàng từ khách.

2. **Frontend:**
   - Trang hiển thị danh sách sản phẩm (có ảnh, giá, trạng thái "đã bán").
   - Trang chi tiết sản phẩm.
   - Form đặt hàng đơn giản: khách nhập **tên, số điện thoại, email** rồi submit.

3. **Xử lý đơn hàng:**
   - Khi khách đặt → ghi nhận thông tin đơn hàng vào database.
   - Gửi **email thông báo** về địa chỉ mail của bộ phận sales với đầy đủ thông tin đơn hàng.

---

## TÓM TẮT

| # | Hạng mục | Loại thay đổi |
|---|----------|---------------|
| A1 | Nút VR360 trên danh sách phòng | Thêm field DB + UI |
| A2 | Check Availability → booking ngoài | Thay đổi hành vi form (JS) |
| A3 | Room detail: VR360 + Rate ID + Book ngoài | Thêm field DB + UI + JS |
| A4 | Xóa toàn bộ Review | Xóa DB + backend + frontend |
| A5 | Nút day-book → VR360 | Thay đổi UI |
| B | Custom HTML block + đa ngôn ngữ cho Page | Thêm field DB + UI |
| C | Fix Gallery Block trong Blog | Bug fix |
| D | Module Product bán gói dịch vụ | Plugin mới hoàn toàn |

---

*Tài liệu yêu cầu v1.0 — 2026-03-20*
