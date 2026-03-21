<?php

namespace Botble\Hotel\Models;

use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RoomMedia extends BaseModel
{
    protected $table = 'ht_room_media';

    protected $fillable = [
        'room_id',
        'type',
        'url',
        'thumbnail',
        'order',
    ];

    protected $casts = [
        'order' => 'integer',
    ];

    public function room(): BelongsTo
    {
        return $this->belongsTo(Room::class, 'room_id');
    }

    public function isImage(): bool
    {
        return $this->type === 'image';
    }

    public function isVideo(): bool
    {
        return $this->type === 'video';
    }

    public function isVr360(): bool
    {
        return $this->type === 'vr360';
    }
}
