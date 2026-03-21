# 📋 TECHNICAL SPECIFICATION — Hotel Booking Platform Customization

> **Platform:** Botble CMS (Laravel 12) + Hotel Plugin + Theme Riorelax  
> **Database:** MySQL 8.4.5 — `archi_riorelax`  
> **PHP:** ^8.2 | ^8.3  
> **Ngày tạo:** 2026-03-20  
> **Trạng thái:** Draft

---

## MỤC LỤC

- [A. ROOMS — Tùy chỉnh module phòng](#a-rooms)
  - [A1. Nút VR360 trên danh sách phòng](#a1-nút-vr360-trên-danh-sách-phòng)
  - [A2. Check Availability → redirect booking ngoài](#a2-check-availability--redirect-booking-ngoài)
  - [A3. Room Detail — VR360 + Book Now với rateId](#a3-room-detail--vr360--book-now-với-rateid)
  - [A4. Xóa hoàn toàn hệ thống Review](#a4-xóa-hoàn-toàn-hệ-thống-review)
  - [A5. Đổi nút day-book từ Booking → VR360](#a5-đổi-nút-day-book-từ-booking--vr360)
- [B. PAGE — Custom HTML Block + Đa ngôn ngữ](#b-page--custom-html-block--đa-ngôn-ngữ)
- [C. BLOG — Fix Gallery Block FE](#c-blog--fix-gallery-block-fe)
- [D. PRODUCT — Module bán gói dịch vụ mới](#d-product--module-bán-gói-dịch-vụ-mới)

---

## KIẾN TRÚC HIỆN TẠI (AS-IS)

### Stack tổng quan

```
┌─────────────────────────────────────────────────────────┐
│                      BROWSER (FE)                       │
│     Theme: riorelax (Blade templates + jQuery + Mix)    │
├─────────────────────────────────────────────────────────┤
│                    ROUTES (web.php)                     │
│  platform/plugins/hotel/routes/web.php                  │
│  platform/packages/page/routes/web.php                  │
├─────────────────────────────────────────────────────────┤
│                   CONTROLLERS                           │
│  PublicController → getRooms(), getRoom()               │
│  RoomController → CRUD admin                            │
│  ReviewController → admin list/delete                   │
│  BookingController → admin CRUD                         │
├─────────────────────────────────────────────────────────┤
│                     MODELS                              │
│  Room, Booking, BookingRoom, Review, Customer...        │
│  Tables: ht_rooms, ht_bookings, ht_room_reviews...      │
├─────────────────────────────────────────────────────────┤
│                   MySQL 8.4.5                           │
│              Database: archi_riorelax                   │
└─────────────────────────────────────────────────────────┘
```

### Cấu trúc file quan trọng

```
platform/
├── plugins/hotel/
│   ├── src/
│   │   ├── Models/Room.php              # Eloquent model, table: ht_rooms
│   │   ├── Models/Review.php            # Eloquent model, table: ht_room_reviews
│   │   ├── Models/Booking.php           # Eloquent model, table: ht_bookings
│   │   ├── Forms/RoomForm.php           # Admin form tạo/sửa room
│   │   ├── Http/Controllers/
│   │   │   ├── RoomController.php       # Admin CRUD room
│   │   │   ├── ReviewController.php     # Admin review management
│   │   │   ├── PublicController.php     # FE routes (getRooms, getRoom, postBooking)
│   │   │   └── Front/ReviewController.php # FE ajax review store
│   │   ├── Supports/HotelSupport.php    # Helper (isReviewEnabled, isBookingEnabled)
│   │   └── Tables/ReviewTable.php       # Admin datatable
│   ├── routes/web.php                   # Tất cả routes hotel (admin + public)
│   ├── database/migrations/
│   │   └── 2023_08_23_022361_create_hotel_review_table.php
│   └── resources/views/
│       └── themes/partials/             # Blade views cho FE
│
├── packages/page/
│   ├── src/Forms/PageForm.php           # Admin form tạo/sửa page
│   └── src/Models/Page.php              # Eloquent model, table: pages
│
├── plugins/gallery/
│   └── src/Providers/HookServiceProvider.php  # Shortcode [gallery]
│
└── themes/riorelax/
    ├── views/hotel/
    │   ├── rooms.blade.php              # Trang /rooms (danh sách)
    │   ├── room.blade.php               # Trang chi tiết phòng
    │   ├── booking.blade.php            # Trang checkout
    │   └── partials/
    │       ├── reviews.blade.php        # Block review/đánh giá
    │       ├── reviews-list.blade.php
    │       └── review-star.blade.php
    ├── views/page.blade.php             # Render page
    ├── partials/
    │   ├── rooms/item.blade.php         # Card phòng (danh sách)
    │   └── hotel/forms/form.blade.php   # Booking form (sidebar + hero)
    └── widgets/
        └── check-availability-form/     # Widget check availability
```

### Database Schema liên quan

```sql
-- Bảng phòng
CREATE TABLE ht_rooms (
    id             BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name           VARCHAR(120) NOT NULL,
    description    TEXT,
    content        LONGTEXT,
    is_featured    TINYINT UNSIGNED DEFAULT 0,
    images         TEXT,                    -- JSON array đường dẫn ảnh
    price          DECIMAL(15,0) UNSIGNED,
    currency_id    BIGINT UNSIGNED,
    number_of_rooms INT UNSIGNED DEFAULT 0,
    number_of_beds  INT UNSIGNED DEFAULT 0,
    size           INT UNSIGNED DEFAULT 0,
    max_adults     INT DEFAULT 0,
    max_children   INT DEFAULT 0,
    room_category_id BIGINT UNSIGNED,
    tax_id         BIGINT UNSIGNED,
    status         VARCHAR(60) DEFAULT 'published',
    created_at     TIMESTAMP,
    updated_at     TIMESTAMP,
    `order`        INT UNSIGNED DEFAULT 0
);

-- Bảng review (SẼ XÓA)
CREATE TABLE ht_room_reviews (
    id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT UNSIGNED NOT NULL,
    room_id     INT NOT NULL,
    star        TINYINT NOT NULL,
    content     VARCHAR(500) NOT NULL,
    status      VARCHAR(60) DEFAULT 'approved',
    created_at  TIMESTAMP,
    updated_at  TIMESTAMP
);

-- Bảng bản dịch phòng
CREATE TABLE ht_rooms_translations (
    lang_code   VARCHAR(191) NOT NULL,
    ht_rooms_id BIGINT UNSIGNED NOT NULL,
    name        VARCHAR(191),
    description TEXT,
    content     TEXT,
    PRIMARY KEY (lang_code, ht_rooms_id)
);

-- Bảng pages
CREATE TABLE pages (
    id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(120) NOT NULL,
    content     LONGTEXT,
    user_id     BIGINT UNSIGNED,
    image       VARCHAR(191),
    template    VARCHAR(60),
    description VARCHAR(400),
    status      VARCHAR(60) DEFAULT 'published',
    created_at  TIMESTAMP,
    updated_at  TIMESTAMP
);

-- Bảng bản dịch pages
CREATE TABLE pages_translations (
    lang_code VARCHAR(20) NOT NULL,
    pages_id  BIGINT UNSIGNED NOT NULL,
    name      VARCHAR(191),
    description VARCHAR(400),
    content   LONGTEXT,
    PRIMARY KEY (lang_code, pages_id)
);
```

---

## A. ROOMS

---

### A1. Nút VR360 trên danh sách phòng

**Mô tả:** Mỗi room card trên trang `/rooms` hiển thị thêm nút "Xem VR360". Click → mở tab mới đến URL VR360 được cấu hình cho phòng đó.

#### Database

**Migration mới:** `2026_03_20_000001_add_vr360_url_to_ht_rooms_table.php`

```sql
ALTER TABLE ht_rooms
    ADD COLUMN vr360_url VARCHAR(500) DEFAULT NULL AFTER images;

ALTER TABLE ht_rooms_translations
    ADD COLUMN vr360_url VARCHAR(500) DEFAULT NULL AFTER content;
```

| Table | Column | Type | Nullable | Mô tả |
|-------|--------|------|----------|-------|
| `ht_rooms` | `vr360_url` | VARCHAR(500) | YES | URL VR360 (matterport, kuula, v.v.) |
| `ht_rooms_translations` | `vr360_url` | VARCHAR(500) | YES | URL VR360 theo ngôn ngữ |

#### Backend — Model

**File:** `platform/plugins/hotel/src/Models/Room.php`

```php
// Thêm 'vr360_url' vào $fillable
protected $fillable = [
    'name', 'description', 'content', 'is_featured', 'images',
    'vr360_url',  // ← THÊM MỚI
    'price', 'currency_id', 'number_of_rooms', 'number_of_beds',
    'size', 'max_adults', 'max_children', 'room_category_id',
    'tax_id', 'order', 'status',
];
```

#### Backend — Admin Form

**File:** `platform/plugins/hotel/src/Forms/RoomForm.php`

Thêm field mới trong method `setup()`, đặt **sau** field `images[]`:

```php
->add('vr360_url', 'text', [
    'label'    => 'VR360 URL',
    'required' => false,
    'attr'     => [
        'placeholder' => 'https://my.matterport.com/show/?m=XXXX',
        'class'       => 'form-control',
    ],
    'help_block' => [
        'text' => 'Nhập URL VR360 (Matterport, Kuula, v.v.). Để trống nếu không có.',
    ],
])
```

#### Frontend — Room Card (danh sách `/rooms`)

**File:** `platform/themes/riorelax/partials/rooms/item.blade.php`

**Vị trí:** Trong block `.day-book > ul > li`, thêm **trước** form booking hiện tại:

```blade
@if ($room->vr360_url)
    <li>
        <a href="{{ $room->vr360_url }}"
           target="_blank"
           rel="noopener noreferrer"
           class="btn-vr360"
           data-animation="fadeInRight"
           data-delay=".6s">
            <i class="fas fa-vr-cardboard"></i> {{ __('VIEW VR360') }}
        </a>
    </li>
@endif
```

#### Luồng dữ liệu

```
Admin Dashboard                        Database                    Frontend
┌──────────────┐                 ┌──────────────────┐      ┌─────────────────────┐
│ RoomForm.php │──── save ──────►│ ht_rooms          │      │ rooms/item.blade.php│
│ + vr360_url  │                 │ + vr360_url col   │◄─────│ $room->vr360_url    │
└──────────────┘                 └──────────────────┘      │ → <a target=_blank> │
                                                            └─────────────────────┘
```

---

### A2. Check Availability → Redirect Booking Ngoài

**Mô tả:** Trên trang `/rooms`, sidebar widget "Check Availability" thay vì submit nội bộ (GET → `/rooms?start_date=...`) → tạo URL external redirect đến hệ thống booking bên ngoài `book-directonline.com`.

#### URL Pattern (Target)

```
https://book-directonline.com/properties/botbluhotspadirect
    ?locale=vi
    &lang=en
    &checkInDate=2026-03-21          // YYYY-MM-DD
    &arrivalDate=21032026            // DDMMYYYY
    &nightsStay=
    &checkOutDate=2026-03-22         // YYYY-MM-DD
    &items[0][adults]=2
    &items[0][children]=1
    &items[0][infants]=0
    &currency=VND
    &trackPage=yes
```

#### Cách triển khai — JavaScript (FE-only, không cần thay đổi backend)

**Lý do chọn JS approach:** Form check availability hiện có ở 2 nơi (widget sidebar + shortcode hero). Dùng JS intercept submit sẽ không cần sửa form backend.

**File mới:** `platform/themes/riorelax/assets/js/external-booking.js`

```javascript
document.addEventListener('DOMContentLoaded', function () {
    // Target: form KHÔNG có availableForBooking (form ở sidebar rooms page)
    const BASE_URL = 'https://book-directonline.com/properties/botbluhotspadirect';

    document.querySelectorAll('.sidebar-widget-rooms .form-booking').forEach(function (form) {
        form.addEventListener('submit', function (e) {
            e.preventDefault();

            const startDateRaw = form.querySelector('[name="start_date"]').value;
            const endDateRaw   = form.querySelector('[name="end_date"]').value;
            const adults       = form.querySelector('[name="adults"]').value || 1;
            const children     = form.querySelector('[name="children"]').value || 0;

            // Parse dates → YYYY-MM-DD và DDMMYYYY
            const startDate = parseDate(startDateRaw);
            const endDate   = parseDate(endDateRaw);

            const checkInISO  = formatISO(startDate);    // 2026-03-21
            const arrivalDDMM = formatDDMMYYYY(startDate); // 21032026
            const checkOutISO = formatISO(endDate);       // 2026-03-22

            const url = `${BASE_URL}?locale=vi&lang=en`
                + `&checkInDate=${checkInISO}`
                + `&arrivalDate=${arrivalDDMM}`
                + `&nightsStay=`
                + `&checkOutDate=${checkOutISO}`
                + `&items[0][adults]=${adults}`
                + `&items[0][children]=${children}`
                + `&items[0][infants]=0`
                + `&currency=VND`
                + `&trackPage=yes`;

            window.open(url, '_blank');
        });
    });
});
```

**Load file:** Trong theme header/footer asset pipeline hoặc `webpack.mix.js`.

#### Luồng xử lý

```
User fills sidebar form (/rooms)
    │
    ├── start_date: 21/03/2026
    ├── end_date: 22/03/2026
    ├── adults: 2
    └── children: 1
         │
         ▼
  JS intercepts submit (preventDefault)
         │
         ▼
  Build external URL:
    https://book-directonline.com/properties/botbluhotspadirect
      ?checkInDate=2026-03-21
      &arrivalDate=21032026
      &checkOutDate=2026-03-22
      &items[0][adults]=2
      &items[0][children]=1
      &items[0][infants]=0
      &currency=VND
         │
         ▼
  window.open(url, '_blank')  →  Tab mới mở trang booking bên ngoài
```

---

### A3. Room Detail — VR360 + Book Now với rateId

**Mô tả:** Trang chi tiết phòng (`/rooms/{slug}`):
1. Sidebar `services-sidebar` thêm **nút VR360** ngay trên booking form
2. Thêm trường `external_rate_id` trong dashboard + database
3. Nút **Book Now** tạo URL external với `rateId`

#### Database

**Migration mới:** `2026_03_20_000002_add_external_rate_id_to_ht_rooms_table.php`

```sql
ALTER TABLE ht_rooms
    ADD COLUMN external_rate_id VARCHAR(50) DEFAULT NULL AFTER vr360_url;
```

| Table | Column | Type | Nullable | Mô tả |
|-------|--------|------|----------|-------|
| `ht_rooms` | `external_rate_id` | VARCHAR(50) | YES | Rate ID trên hệ thống booking ngoài |

#### Backend — Model

**File:** `platform/plugins/hotel/src/Models/Room.php`

```php
// Thêm vào $fillable
'external_rate_id',
```

#### Backend — Admin Form

**File:** `platform/plugins/hotel/src/Forms/RoomForm.php`

Thêm **sau** field `vr360_url`:

```php
->add('external_rate_id', 'text', [
    'label'    => 'External Rate ID',
    'required' => false,
    'attr'     => [
        'placeholder' => 'Ví dụ: 559561',
        'class'       => 'form-control',
    ],
    'help_block' => [
        'text' => 'ID phòng trên hệ thống booking ngoài (book-directonline.com)',
    ],
])
```

#### Frontend — Room Detail Sidebar

**File:** `platform/themes/riorelax/views/hotel/room.blade.php`

Thêm **trước** block `@if (HotelHelper::isBookingEnabled())`:

```blade
{{-- Nút VR360 --}}
@if ($room->vr360_url)
    <div class="sidebar-widget categories mb-20">
        <div class="widget-content text-center">
            <a href="{{ $room->vr360_url }}"
               target="_blank"
               rel="noopener noreferrer"
               class="btn ss-btn w-100">
                <i class="fas fa-vr-cardboard"></i> {{ __('View VR360') }}
            </a>
        </div>
    </div>
@endif
```

#### Frontend — Book Now URL Pattern

**URL Target cho detail page:**

```
https://book-directonline.com/properties/botbluhotspadirect/book
    ?locale=vi
    &lang=en
    &checkInDate=2026-03-21
    &arrivalDate=21032026
    &nightsStay=
    &checkOutDate=2026-03-22
    &items[0][adults]=2
    &items[0][children]=1
    &items[0][infants]=0
    &items[0][rateId]=559561          ← LẤY TỪ $room->external_rate_id
    &currency=VND
    &trackPage=yes
    &selected=0
    &step=step1
```

**File:** `platform/themes/riorelax/assets/js/external-booking.js` (bổ sung)

```javascript
// Target: form booking ở room detail page (sidebar services-sidebar)
document.querySelectorAll('.services-sidebar .form-booking').forEach(function (form) {
    form.addEventListener('submit', function (e) {
        e.preventDefault();

        const rateId = form.querySelector('[name="room_id"]')
                           ?.dataset?.rateId || '';  // data-rate-id truyền từ Blade

        const url = `${BASE_URL}/book?locale=vi&lang=en`
            + `&checkInDate=${checkInISO}`
            + `&arrivalDate=${arrivalDDMM}`
            + `&nightsStay=`
            + `&checkOutDate=${checkOutISO}`
            + `&items[0][adults]=${adults}`
            + `&items[0][children]=${children}`
            + `&items[0][infants]=0`
            + `&items[0][rateId]=${rateId}`
            + `&currency=VND`
            + `&trackPage=yes`
            + `&selected=0`
            + `&step=step1`;

        window.open(url, '_blank');
    });
});
```

**File Blade cần sửa:** `platform/themes/riorelax/partials/hotel/forms/form.blade.php`

Truyền `data-rate-id` vào hidden input:

```blade
@if ($availableForBooking)
    @csrf
    <input type="hidden" name="room_id"
           value="{{ $room->id }}"
           data-rate-id="{{ $room->external_rate_id }}">
@endif
```

#### Luồng dữ liệu toàn bộ A3

```
Dashboard Admin
┌────────────────────────┐
│ RoomForm.php           │
│  + vr360_url           │
│  + external_rate_id    │
│                        │
│ [Save] ────────────────┼──► ht_rooms table
└────────────────────────┘     │  + vr360_url
                               │  + external_rate_id
                               ▼
                    PublicController::getRoom()
                               │
                    Load Room + relationships
                               │
              ┌────────────────┼──────────────────┐
              ▼                ▼                  ▼
        room.blade.php   form.blade.php    external-booking.js
        │                │                │
        │ $room->        │ hidden input   │ Read data-rate-id
        │ vr360_url      │ data-rate-id   │ Build URL + /book path
        │                │                │
        ▼                ▼                ▼
   [Nút VR360]     [Book Now]      window.open(url)
   target=_blank   submit→JS       → tab mới booking
```

---

### A4. Xóa hoàn toàn hệ thống Review

**Mô tả:** Xóa toàn bộ review khách: database table, model, controller, routes, admin dashboard section, frontend views.

#### Checklist xóa

| # | Layer | File/Location | Hành động |
|---|-------|---------------|-----------|
| 1 | **Database** | `ht_room_reviews` | DROP TABLE hoặc tạo migration xóa |
| 2 | **Migration** | `2023_08_23_022361_create_hotel_review_table.php` | Giữ nguyên (lịch sử), migration mới để drop |
| 3 | **Model** | `src/Models/Review.php` | Xóa file |
| 4 | **Model** | `src/Models/Room.php` → `reviews()` relationship | Xóa method `reviews()` |
| 5 | **Enum** | `src/Enums/ReviewStatusEnum.php` | Xóa file |
| 6 | **Controller** | `src/Http/Controllers/ReviewController.php` | Xóa file |
| 7 | **Controller** | `src/Http/Controllers/Front/ReviewController.php` | Xóa file |
| 8 | **Table** | `src/Tables/ReviewTable.php` | Xóa file |
| 9 | **Routes** | `routes/web.php` — admin `review.*` group | Xóa block Route |
| 10 | **Routes** | `routes/web.php` — `customer.ajax.review.*` | Xóa block Route |
| 11 | **Routes** | `routes/web.php` — `customer.reviews` | Xóa route |
| 12 | **Support** | `src/Supports/HotelSupport.php` → `isReviewEnabled()` | Luôn return `false` hoặc xóa |
| 13 | **Support** | `src/Supports/HotelSupport.php` → `getReviewExtraData()` | Return `[]` hoặc xóa |
| 14 | **Provider** | `src/Providers/HotelServiceProvider.php` → dòng `isReviewEnabled()` | Xóa reference |
| 15 | **PublicController** | `src/Http/Controllers/PublicController.php` → `withCount('reviews')`, `withAvg('reviews', 'star')` | Xóa các dòng này |
| 16 | **Settings** | `src/Http/Controllers/Settings/ReviewSettingController.php` | Xóa file |
| 17 | **Admin routes** | `hotel.settings.review` | Xóa route |
| 18 | **FE View** | `views/hotel/partials/reviews.blade.php` | Xóa file |
| 19 | **FE View** | `views/hotel/partials/reviews-list.blade.php` | Xóa file |
| 20 | **FE View** | `views/hotel/partials/review-star.blade.php` | Xóa file |
| 21 | **FE View** | `views/hotel/room.blade.php` → `@if(HotelHelper::isReviewEnabled())` block | Xóa block |
| 22 | **FE Assets** | `review.js`, `jquery-bar-rating` | Xóa load asset references |
| 23 | **Customer FE** | Customer panel → "Reviews" tab | Xóa menu + route |

#### Migration mới

**File:** `2026_03_20_000003_drop_ht_room_reviews_table.php`

```php
public function up(): void
{
    Schema::dropIfExists('ht_room_reviews');
}

public function down(): void
{
    Schema::create('ht_room_reviews', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('customer_id');
        $table->integer('room_id');
        $table->tinyInteger('star');
        $table->string('content', 500);
        $table->string('status', 60)->default('approved');
        $table->timestamps();
    });
}
```

#### Luồng xóa (thứ tự thực hiện)

```
1. Tạo migration DROP TABLE ht_room_reviews
2. Xóa Model Review.php + Enum ReviewStatusEnum.php
3. Xóa relationship reviews() trong Room.php
4. Xóa Controllers: ReviewController (admin + front)
5. Xóa Table ReviewTable.php
6. Xóa Settings ReviewSettingController.php
7. Sửa routes/web.php → xóa tất cả route review.*
8. Sửa HotelSupport.php → xóa/disable isReviewEnabled()
9. Sửa PublicController.php → xóa withCount('reviews'), withAvg
10. Sửa room.blade.php → xóa @include reviews block
11. Xóa 3 view files: reviews.blade.php, reviews-list.blade.php, review-star.blade.php
12. Chạy: php artisan migrate
13. Chạy: php artisan cache:clear && php artisan view:clear
```

---

### A5. Đổi nút day-book từ Booking → VR360

**Mô tả:** Trong room card (danh sách `/rooms`), block `.day-book` hiện có nút **BOOK NOW** → đổi thành nút **VIEW VR360**.

#### File sửa

**File:** `platform/themes/riorelax/partials/rooms/item.blade.php`

**Hiện tại:**

```blade
<div class="day-book">
    <ul>
        <li>
            <form action="{{ route('public.booking') }}" method="POST">
                @csrf
                ...
                <button class="book-button-custom" type="submit">
                    {{ __('BOOK NOW FOR :price', ...) }}
                </button>
            </form>
        </li>
    </ul>
</div>
```

**Thay thế bằng:**

```blade
<div class="day-book">
    <ul>
        @if ($room->vr360_url)
            <li>
                <a href="{{ $room->vr360_url }}"
                   target="_blank"
                   rel="noopener noreferrer"
                   class="book-button-custom d-block text-center"
                   data-animation="fadeInRight"
                   data-delay=".8s">
                    <i class="fas fa-vr-cardboard"></i> {{ __('VIEW VR360') }}
                </a>
            </li>
        @endif
    </ul>
</div>
```

> **Lưu ý:** Nút booking form cũ bị xóa hoàn toàn ở đây vì booking sẽ thông qua sidebar form → redirect external (A2).

---

## B. PAGE — Custom HTML Block + Đa Ngôn Ngữ

**Mô tả:** Thêm trường `custom_html` vào Page form trong admin. Trường này cho phép nhập HTML/CSS/JS thuần, không qua CKEditor filter, không bị giới hạn thẻ. Hỗ trợ đa ngôn ngữ qua hệ thống `pages_translations`.

### Phương án triển khai

#### Database

**Migration:** `2026_03_20_000004_add_custom_html_to_pages_table.php`

```sql
ALTER TABLE pages
    ADD COLUMN custom_html LONGTEXT DEFAULT NULL AFTER content;

ALTER TABLE pages_translations
    ADD COLUMN custom_html LONGTEXT DEFAULT NULL AFTER content;
```

| Table | Column | Type | Nullable | Mô tả |
|-------|--------|------|----------|-------|
| `pages` | `custom_html` | LONGTEXT | YES | Raw HTML/CSS/JS, không sanitize |
| `pages_translations` | `custom_html` | LONGTEXT | YES | Raw HTML theo ngôn ngữ |

#### Backend — Model

**File:** `platform/packages/page/src/Models/Page.php`

Thêm `custom_html` vào `$fillable`.

#### Backend — Form

**File:** `platform/packages/page/src/Forms/PageForm.php`

Thêm **sau** field `content`:

```php
->add('custom_html', 'textarea', [
    'label'    => 'Custom HTML Block',
    'required' => false,
    'attr'     => [
        'rows'        => 15,
        'class'       => 'form-control',
        'placeholder' => 'Nhập HTML/CSS/JS thuần tại đây...',
        'style'       => 'font-family: monospace; font-size: 13px;',
    ],
    'help_block' => [
        'text' => 'Khối HTML thuần (cho phép CSS và JS). Không bị giới hạn thẻ. Nội dung sẽ được render trực tiếp ở frontend.',
    ],
])
```

> **Lưu ý:** KHÔNG dùng `EditorField` (CKEditor) — phải dùng `textarea` thuần để tránh CKEditor sanitize/filter tags. Có thể bổ sung CodeMirror/Ace Editor JS cho syntax highlighting.

#### Frontend — Render

**File:** `platform/themes/riorelax/views/page.blade.php`

Thêm **sau** block content hiện tại:

```blade
{!!
    apply_filters(
        PAGE_FILTER_FRONT_PAGE_CONTENT,
        Html::tag('div', BaseHelper::clean($page->content), ['class' => 'ck-content'])->toHtml(),
        $page
    )
!!}

{{-- Custom HTML Block — RAW output, không sanitize --}}
@if ($page->custom_html)
    {!! $page->custom_html !!}
@endif
```

> **⚠️ Bảo mật:** Vì `custom_html` render raw (không qua `BaseHelper::clean()`), chỉ admin được phép sửa field này. Đây là chấp nhận được vì chỉ admin đăng nhập dashboard mới truy cập form.

#### Đa ngôn ngữ

Hệ thống `language-advanced` plugin hiện tại đã hỗ trợ tự động cho `pages_translations`. Chỉ cần:

1. Thêm column `custom_html` vào `pages_translations` (migration)
2. Đăng ký column mới trong cấu hình translation của plugin `language-advanced` (nếu cần)

Khi user chuyển ngôn ngữ → `$page->custom_html` sẽ tự động lấy bản dịch tương ứng từ `pages_translations`.

#### Luồng dữ liệu

```
Admin Dashboard                    Database                      Frontend
┌───────────────────┐       ┌──────────────────┐         ┌─────────────────┐
│ PageForm.php      │       │ pages            │         │ page.blade.php  │
│ + content (CKE)   │──────►│ + content        │────────►│ {!! clean() !!} │
│ + custom_html     │       │ + custom_html    │         │ {!! raw !!}     │
│   (textarea thuần)│       └──────────────────┘         └─────────────────┘
└───────────────────┘       ┌──────────────────┐
                            │ pages_translations│
    Chuyển ngôn ngữ ───────►│ + custom_html    │──► Auto-resolve by locale
                            └──────────────────┘
```

---

## C. BLOG — Fix Gallery Block FE

**Mô tả:** Shortcode `[gallery]` trong blog post content không hiển thị hình ảnh ở frontend.

### Phân tích nguyên nhân

Gallery shortcode được đăng ký tại:  
`platform/plugins/gallery/src/Providers/HookServiceProvider.php`

```php
add_shortcode('gallery', ..., [$this, 'render']);
```

Method `render()` query `GalleryModel` và render view:

```php
$view = apply_filters('galleries_box_template_view', 'plugins/gallery::shortcodes.gallery');
return view($view, compact('shortcode', 'galleries'))->render();
```

#### Nguyên nhân có thể

1. **View override ở theme chưa đúng:** Theme `riorelax` có thể override view `shortcodes.gallery` nhưng template thiếu hoặc sai
2. **CSS/JS chưa load:** Lightbox/gallery JS/CSS chưa được enqueue cho blog page
3. **Shortcode không được parse:** Content blog có thể không qua `do_shortcode()` filter

### Hướng điều tra & fix

#### Bước 1: Kiểm tra view template tồn tại

```
Kiểm tra file:
  platform/plugins/gallery/resources/views/shortcodes/gallery.blade.php
  platform/themes/riorelax/views/shortcodes/gallery.blade.php (override?)
```

#### Bước 2: Kiểm tra blog post có parse shortcode

**File:** `platform/themes/riorelax/views/post.blade.php`

Đảm bảo content được render qua shortcode parser:

```blade
{!! do_shortcode($post->content) !!}
```

Thay vì chỉ:

```blade
{!! BaseHelper::clean($post->content) !!}
```

#### Bước 3: Kiểm tra CSS/JS gallery

Đảm bảo assets gallery (lightbox, gallery grid CSS) được load trên blog pages.

#### Luồng debug

```
Blog Post Content (DB)
    │
    │  Chứa: [gallery gallery_ids="1,2,3" limit="5"]
    │
    ▼
post.blade.php
    │
    ├── do_shortcode() có được gọi?
    │   ├── YES → HookServiceProvider::render() được trigger
    │   │         │
    │   │         ├── Query GalleryModel → có data?
    │   │         ├── View file tồn tại?
    │   │         └── CSS/JS load đúng?
    │   │
    │   └── NO → Shortcode hiển thị dưới dạng text thuần
    │
    └── BaseHelper::clean() có strip shortcode tags?
```

---

## D. PRODUCT — Module Bán Gói Dịch Vụ

**Mô tả:** Tạo plugin mới `product` cho phép khách sạn bán các gói dịch vụ (combo ăn uống, spa, buffet, v.v.). Khách đặt → ghi nhận thông tin → gửi email cho sales.

> **Tham khảo:** [booking.premierpearlrooftop.com](https://booking.premierpearlrooftop.com/)  
> Trang bán: Buffet Tối, Buffet Trưa, Buffet Beer, Khay nổi hồ bơi, Set trà chiều...

### Database Schema

#### Migration: `2026_03_20_000005_create_ht_products_tables.php`

```sql
-- Danh mục sản phẩm
CREATE TABLE ht_product_categories (
    id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(191) NOT NULL,
    description TEXT,
    image       VARCHAR(191),
    `order`     INT UNSIGNED DEFAULT 0,
    status      VARCHAR(60) DEFAULT 'published',
    created_at  TIMESTAMP NULL,
    updated_at  TIMESTAMP NULL
);

-- Bản dịch danh mục
CREATE TABLE ht_product_categories_translations (
    lang_code                  VARCHAR(20) NOT NULL,
    ht_product_categories_id   BIGINT UNSIGNED NOT NULL,
    name                       VARCHAR(191),
    description                TEXT,
    PRIMARY KEY (lang_code, ht_product_categories_id)
);

-- Sản phẩm / gói dịch vụ
CREATE TABLE ht_products (
    id                   BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name                 VARCHAR(191) NOT NULL,
    description          TEXT,
    content              LONGTEXT,
    image                VARCHAR(191),
    images               TEXT,                          -- JSON array ảnh phụ
    price                DECIMAL(15,0) UNSIGNED NOT NULL,
    price_sale           DECIMAL(15,0) UNSIGNED,        -- Giá khuyến mãi
    currency_id          BIGINT UNSIGNED,
    category_id          BIGINT UNSIGNED,               -- FK → ht_product_categories
    stock_quantity       INT UNSIGNED DEFAULT 0,         -- 0 = không giới hạn
    total_sold           INT UNSIGNED DEFAULT 0,
    is_featured          TINYINT UNSIGNED DEFAULT 0,
    status               VARCHAR(60) DEFAULT 'published',
    `order`              INT UNSIGNED DEFAULT 0,
    created_at           TIMESTAMP NULL,
    updated_at           TIMESTAMP NULL,
    FOREIGN KEY (category_id) REFERENCES ht_product_categories(id) ON DELETE SET NULL
);

-- Bản dịch sản phẩm
CREATE TABLE ht_products_translations (
    lang_code       VARCHAR(20) NOT NULL,
    ht_products_id  BIGINT UNSIGNED NOT NULL,
    name            VARCHAR(191),
    description     TEXT,
    content         LONGTEXT,
    PRIMARY KEY (lang_code, ht_products_id)
);

-- Đơn hàng
CREATE TABLE ht_product_orders (
    id               BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_number     VARCHAR(50) UNIQUE,
    customer_name    VARCHAR(191) NOT NULL,
    customer_email   VARCHAR(191) NOT NULL,
    customer_phone   VARCHAR(30) NOT NULL,
    customer_note    TEXT,
    total_amount     DECIMAL(15,0) UNSIGNED NOT NULL,
    currency_id      BIGINT UNSIGNED,
    status           VARCHAR(60) DEFAULT 'pending',     -- pending, confirmed, completed, cancelled
    created_at       TIMESTAMP NULL,
    updated_at       TIMESTAMP NULL
);

-- Chi tiết đơn hàng
CREATE TABLE ht_product_order_items (
    id               BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id         BIGINT UNSIGNED NOT NULL,
    product_id       BIGINT UNSIGNED NOT NULL,
    product_name     VARCHAR(191) NOT NULL,             -- Snapshot tên tại thời điểm mua
    quantity         INT UNSIGNED NOT NULL DEFAULT 1,
    price            DECIMAL(15,0) UNSIGNED NOT NULL,   -- Giá tại thời điểm mua
    created_at       TIMESTAMP NULL,
    updated_at       TIMESTAMP NULL,
    FOREIGN KEY (order_id) REFERENCES ht_product_orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES ht_products(id) ON DELETE CASCADE
);
```

### Cấu trúc Plugin

```
platform/plugins/product/
├── plugin.json
├── composer.json
├── config/
│   └── general.php
├── database/
│   └── migrations/
│       └── 2026_03_20_000005_create_ht_products_tables.php
├── routes/
│   └── web.php
├── resources/
│   ├── lang/
│   │   └── en/
│   │       └── product.php
│   └── views/
│       ├── products/          # Admin views
│       ├── orders/            # Admin order views
│       ├── themes/            # FE views
│       │   ├── products.blade.php      # Danh sách sản phẩm
│       │   ├── product.blade.php       # Chi tiết sản phẩm
│       │   └── partials/
│       │       ├── product-card.blade.php
│       │       └── order-form.blade.php
│       └── emails/
│           └── order-notification.blade.php
├── src/
│   ├── Models/
│   │   ├── Product.php
│   │   ├── ProductCategory.php
│   │   ├── ProductOrder.php
│   │   └── ProductOrderItem.php
│   ├── Forms/
│   │   ├── ProductForm.php
│   │   └── ProductCategoryForm.php
│   ├── Http/
│   │   ├── Controllers/
│   │   │   ├── ProductController.php         # Admin CRUD
│   │   │   ├── ProductCategoryController.php # Admin CRUD
│   │   │   ├── ProductOrderController.php    # Admin quản lý đơn hàng
│   │   │   └── PublicProductController.php   # FE hiển thị + đặt hàng
│   │   └── Requests/
│   │       ├── ProductRequest.php
│   │       └── OrderRequest.php
│   ├── Tables/
│   │   ├── ProductTable.php
│   │   └── ProductOrderTable.php
│   ├── Notifications/
│   │   └── NewOrderNotification.php          # Gửi email cho sales
│   ├── Providers/
│   │   └── ProductServiceProvider.php
│   └── Plugin.php
└── webpack.mix.js
```

### Luồng đặt hàng (Order Flow)

```
               FRONTEND                                    BACKEND
┌───────────────────────────────┐          ┌──────────────────────────────────┐
│  /products                    │          │                                  │
│  ┌─────────────────────────┐  │          │  PublicProductController         │
│  │ Product Card             │  │          │   │                              │
│  │ ┌─────┐                 │  │          │   ├── getProducts()              │
│  │ │ IMG │  Buffet Tối     │  │          │   │   Query Product::published() │
│  │ └─────┘  300,000đ      │  │          │   │                              │
│  │  Đã bán: 579            │  │          │   ├── getProduct($slug)          │
│  │  [Đặt vé ngay]          │  │──click──►│   │   Show detail + order form   │
│  └─────────────────────────┘  │          │   │                              │
│                               │          │   └── postOrder(Request)         │
│  /products/{slug}             │          │       │                          │
│  ┌─────────────────────────┐  │          │       ├── Validate input         │
│  │ Product Detail           │  │          │       ├── Create ProductOrder    │
│  │ + Mô tả chi tiết       │  │          │       ├── Create OrderItems      │
│  │                         │  │          │       ├── Update total_sold      │
│  │ ┌───────────────────┐   │  │          │       ├── Send email to sales   │
│  │ │ Form đặt hàng     │   │  │          │       │   (NewOrderNotification) │
│  │ │ - Họ tên (*)      │   │  │          │       └── Redirect + success msg│
│  │ │ - Email (*)       │   │  │          │                                  │
│  │ │ - Điện thoại (*)  │   │  │          │  ADMIN DASHBOARD                 │
│  │ │ - Số lượng        │   │  │          │  ┌────────────────────────────┐  │
│  │ │ - Ghi chú         │   │  │          │  │ ProductOrderController    │  │
│  │ │ [ĐẶT HÀNG]       │   │──submit──►  │  │  - Danh sách đơn hàng    │  │
│  │ └───────────────────┘   │  │          │  │  - Chi tiết đơn          │  │
│  └─────────────────────────┘  │          │  │  - Đổi trạng thái       │  │
│                               │          │  └────────────────────────────┘  │
└───────────────────────────────┘          └──────────────────────────────────┘
                                                       │
                                                       ▼
                                              ┌──────────────────┐
                                              │  Mail to Sales   │
                                              │  - Tên khách     │
                                              │  - SĐT + Email   │
                                              │  - Sản phẩm      │
                                              │  - Số lượng       │
                                              │  - Tổng tiền      │
                                              └──────────────────┘
```

### Routes

```php
// Admin routes
Route::group(['prefix' => 'products', 'as' => 'product.'], function () {
    Route::resource('', ProductController::class)->parameters(['' => 'product']);
});

Route::group(['prefix' => 'product-categories', 'as' => 'product-category.'], function () {
    Route::resource('', ProductCategoryController::class)->parameters(['' => 'product-category']);
});

Route::group(['prefix' => 'product-orders', 'as' => 'product-order.'], function () {
    Route::resource('', ProductOrderController::class)->parameters(['' => 'order']);
});

// Public routes (FE)
Theme::registerRoutes(function () {
    Route::get('products', 'PublicProductController@getProducts')->name('public.products');
    Route::get('products/{slug}', 'PublicProductController@getProduct');
    Route::post('products/order', 'PublicProductController@postOrder')->name('public.product.order');
});
```

### Email Notification

**File:** `resources/views/emails/order-notification.blade.php`

Template gửi cho sales khi có đơn hàng mới:

```
Subject: [Đơn hàng mới #{{order_number}}] - {{product_name}}

Nội dung:
- Khách hàng: {{customer_name}}
- Email: {{customer_email}}
- SĐT: {{customer_phone}}
- Sản phẩm: {{product_name}} x {{quantity}}
- Tổng tiền: {{total_amount}} VND
- Ghi chú: {{customer_note}}
- Thời gian: {{created_at}}
```

Cấu hình email sales trong `.env`:

```
PRODUCT_SALES_EMAIL=sales@your-hotel.com
```

Hoặc trong Admin Dashboard → Settings.

---

## TỔNG KẾT — THỨ TỰ TRIỂN KHAI

### Phase 1: Database & Backend (Ưu tiên cao)

| # | Task | Files chính | Ước lượng |
|---|------|-------------|-----------|
| 1 | Migration thêm `vr360_url`, `external_rate_id` vào `ht_rooms` | migration file | 15 phút |
| 2 | Migration thêm `custom_html` vào `pages` | migration file | 10 phút |
| 3 | Migration DROP `ht_room_reviews` | migration file | 5 phút |
| 4 | Cập nhật Model `Room.php` ($fillable) | Room.php | 10 phút |
| 5 | Cập nhật Model `Page.php` ($fillable) | Page.php | 5 phút |
| 6 | Cập nhật `RoomForm.php` (thêm 2 field) | RoomForm.php | 15 phút |
| 7 | Cập nhật `PageForm.php` (thêm custom_html) | PageForm.php | 10 phút |
| 8 | Xóa Review system (model, controller, routes, views) | ~10 files | 45 phút |

### Phase 2: Frontend (Ưu tiên cao)

| # | Task | Files chính | Ước lượng |
|---|------|-------------|-----------|
| 9 | Sửa `rooms/item.blade.php` (VR360 button thay booking) | item.blade.php | 20 phút |
| 10 | Sửa `room.blade.php` (VR360 sidebar + xóa reviews) | room.blade.php | 20 phút |
| 11 | Tạo `external-booking.js` (redirect booking ngoài) | JS file mới | 40 phút |
| 12 | Sửa `form.blade.php` (truyền data-rate-id) | form.blade.php | 10 phút |
| 13 | Sửa `page.blade.php` (render custom_html) | page.blade.php | 5 phút |

### Phase 3: Bug Fix (Ưu tiên trung bình)

| # | Task | Files chính | Ước lượng |
|---|------|-------------|-----------|
| 14 | Debug & fix Gallery shortcode trong Blog | HookServiceProvider.php, post.blade.php | 30 phút |

### Phase 4: Plugin mới (Ưu tiên thấp — lớn nhất)

| # | Task | Files chính | Ước lượng |
|---|------|-------------|-----------|
| 15 | Tạo plugin `product` scaffolding | plugin structure | 1 giờ |
| 16 | Models + Migrations | 4 models, 1 migration | 1 giờ |
| 17 | Admin Forms + Tables + Controllers | Forms, Tables, Controllers | 2 giờ |
| 18 | Frontend views (product list, detail, order form) | Blade templates | 2 giờ |
| 19 | Email notification system | Notification + email template | 1 giờ |
| 20 | Testing & styling | CSS/JS + testing | 1 giờ |

---

## LỆNH TRIỂN KHAI

```bash
# Sau khi code xong tất cả changes:

# 1. Chạy migrations
php artisan migrate

# 2. Clear tất cả cache
php artisan cache:clear
php artisan config:clear
php artisan view:clear
php artisan route:clear

# 3. Build frontend assets
npm run production

# 4. Nếu tạo plugin mới
php artisan plugin:activate product

# 5. Kiểm tra
php artisan route:list --name=room
php artisan route:list --name=product
```

---

*Spec version 1.0 — Tạo bởi phân tích codebase hiện tại.*
