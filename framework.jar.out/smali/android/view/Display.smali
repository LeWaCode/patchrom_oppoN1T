.class public final Landroid/view/Display;
.super Ljava/lang/Object;
.source "Display.java"


# static fields
.field private static final CACHED_APP_SIZE_DURATION_MILLIS:I = 0x14

.field private static final DEBUG:Z = false

.field public static final DEFAULT_DISPLAY:I = 0x0

.field public static final FLAG_SECURE:I = 0x2

.field public static final FLAG_SUPPORTS_PROTECTED_BUFFERS:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Display"

.field public static final TYPE_BUILT_IN:I = 0x1

.field public static final TYPE_HDMI:I = 0x2

.field public static final TYPE_OVERLAY:I = 0x4

.field public static final TYPE_UNKNOWN:I = 0x0

.field public static final TYPE_WIFI:I = 0x3


# instance fields
.field private final mAddress:Ljava/lang/String;

.field private mCachedAppHeightCompat:I

.field private mCachedAppWidthCompat:I

.field private final mCompatibilityInfo:Landroid/view/CompatibilityInfoHolder;

.field private final mDisplayId:I

.field private mDisplayInfo:Landroid/view/DisplayInfo;

.field private final mFlags:I

.field private final mGlobal:Landroid/hardware/display/DisplayManagerGlobal;

.field private mIsValid:Z

.field private mLastCachedAppSizeUpdate:J

.field private final mLayerStack:I

.field private final mTempMetrics:Landroid/util/DisplayMetrics;

.field private final mType:I


# direct methods
.method public constructor <init>(Landroid/hardware/display/DisplayManagerGlobal;ILandroid/view/DisplayInfo;Landroid/view/CompatibilityInfoHolder;)V
    .locals 1
    .parameter "global"
    .parameter "displayId"
    .parameter "displayInfo"
    .parameter "compatibilityInfo"

    .prologue
    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    .line 187
    iput-object p1, p0, Landroid/view/Display;->mGlobal:Landroid/hardware/display/DisplayManagerGlobal;

    .line 188
    iput p2, p0, Landroid/view/Display;->mDisplayId:I

    .line 189
    iput-object p3, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    .line 190
    iput-object p4, p0, Landroid/view/Display;->mCompatibilityInfo:Landroid/view/CompatibilityInfoHolder;

    .line 191
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/view/Display;->mIsValid:Z

    .line 194
    iget v0, p3, Landroid/view/DisplayInfo;->layerStack:I

    iput v0, p0, Landroid/view/Display;->mLayerStack:I

    .line 195
    iget v0, p3, Landroid/view/DisplayInfo;->flags:I

    iput v0, p0, Landroid/view/Display;->mFlags:I

    .line 196
    iget v0, p3, Landroid/view/DisplayInfo;->type:I

    iput v0, p0, Landroid/view/Display;->mType:I

    .line 197
    iget-object v0, p3, Landroid/view/DisplayInfo;->address:Ljava/lang/String;

    iput-object v0, p0, Landroid/view/Display;->mAddress:Ljava/lang/String;

    .line 198
    return-void
.end method

.method public static typeToString(I)Ljava/lang/String;
    .locals 1
    .parameter "type"

    .prologue
    .line 612
    packed-switch p0, :pswitch_data_0

    .line 624
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 614
    :pswitch_0
    const-string v0, "UNKNOWN"

    goto :goto_0

    .line 616
    :pswitch_1
    const-string v0, "BUILT_IN"

    goto :goto_0

    .line 618
    :pswitch_2
    const-string v0, "HDMI"

    goto :goto_0

    .line 620
    :pswitch_3
    const-string v0, "WIFI"

    goto :goto_0

    .line 622
    :pswitch_4
    const-string v0, "OVERLAY"

    goto :goto_0

    .line 612
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private updateCachedAppSizeIfNeededLocked()V
    .locals 6

    .prologue
    .line 587
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 588
    .local v0, now:J
    iget-wide v2, p0, Landroid/view/Display;->mLastCachedAppSizeUpdate:J

    const-wide/16 v4, 0x14

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 589
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 590
    iget-object v2, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget-object v3, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    iget-object v4, p0, Landroid/view/Display;->mCompatibilityInfo:Landroid/view/CompatibilityInfoHolder;

    invoke-virtual {v2, v3, v4}, Landroid/view/DisplayInfo;->getAppMetrics(Landroid/util/DisplayMetrics;Landroid/view/CompatibilityInfoHolder;)V

    .line 591
    iget-object v2, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v2, p0, Landroid/view/Display;->mCachedAppWidthCompat:I

    .line 592
    iget-object v2, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v2, p0, Landroid/view/Display;->mCachedAppHeightCompat:I

    .line 593
    iput-wide v0, p0, Landroid/view/Display;->mLastCachedAppSizeUpdate:J

    .line 595
    :cond_0
    return-void
.end method

.method private updateDisplayInfoLocked()V
    .locals 3

    .prologue
    .line 565
    iget-object v1, p0, Landroid/view/Display;->mGlobal:Landroid/hardware/display/DisplayManagerGlobal;

    iget v2, p0, Landroid/view/Display;->mDisplayId:I

    invoke-virtual {v1, v2}, Landroid/hardware/display/DisplayManagerGlobal;->getDisplayInfo(I)Landroid/view/DisplayInfo;

    move-result-object v0

    .line 566
    .local v0, newInfo:Landroid/view/DisplayInfo;
    if-nez v0, :cond_1

    .line 568
    iget-boolean v1, p0, Landroid/view/Display;->mIsValid:Z

    if-eqz v1, :cond_0

    .line 569
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/view/Display;->mIsValid:Z

    .line 584
    :cond_0
    :goto_0
    return-void

    .line 576
    :cond_1
    iput-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    .line 577
    iget-boolean v1, p0, Landroid/view/Display;->mIsValid:Z

    if-nez v1, :cond_0

    .line 578
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/view/Display;->mIsValid:Z

    goto :goto_0
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 295
    iget-object v0, p0, Landroid/view/Display;->mAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getCompatibilityInfo()Landroid/view/CompatibilityInfoHolder;
    .locals 1

    .prologue
    .line 305
    iget-object v0, p0, Landroid/view/Display;->mCompatibilityInfo:Landroid/view/CompatibilityInfoHolder;

    return-object v0
.end method

.method public getCurrentSizeRange(Landroid/graphics/Point;Landroid/graphics/Point;)V
    .locals 1
    .parameter "outSmallestSize"
    .parameter "outLargestSize"

    .prologue
    .line 397
    monitor-enter p0

    .line 398
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 399
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v0, v0, Landroid/view/DisplayInfo;->smallestNominalAppWidth:I

    iput v0, p1, Landroid/graphics/Point;->x:I

    .line 400
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v0, v0, Landroid/view/DisplayInfo;->smallestNominalAppHeight:I

    iput v0, p1, Landroid/graphics/Point;->y:I

    .line 401
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v0, v0, Landroid/view/DisplayInfo;->largestNominalAppWidth:I

    iput v0, p2, Landroid/graphics/Point;->x:I

    .line 402
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v0, v0, Landroid/view/DisplayInfo;->largestNominalAppHeight:I

    iput v0, p2, Landroid/graphics/Point;->y:I

    .line 403
    monitor-exit p0

    .line 404
    return-void

    .line 403
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getDisplayId()I
    .locals 1

    .prologue
    .line 208
    iget v0, p0, Landroid/view/Display;->mDisplayId:I

    return v0
.end method

.method public getDisplayInfo(Landroid/view/DisplayInfo;)Z
    .locals 1
    .parameter "outDisplayInfo"

    .prologue
    .line 239
    monitor-enter p0

    .line 240
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 241
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    invoke-virtual {p1, v0}, Landroid/view/DisplayInfo;->copyFrom(Landroid/view/DisplayInfo;)V

    .line 242
    iget-boolean v0, p0, Landroid/view/Display;->mIsValid:Z

    monitor-exit p0

    return v0

    .line 243
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getFlags()I
    .locals 1

    .prologue
    .line 268
    iget v0, p0, Landroid/view/Display;->mFlags:I

    return v0
.end method

.method public getHeight()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 434
    monitor-enter p0

    .line 435
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateCachedAppSizeIfNeededLocked()V

    .line 436
    iget v0, p0, Landroid/view/Display;->mCachedAppHeightCompat:I

    monitor-exit p0

    return v0

    .line 437
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getLayerStack()I
    .locals 1

    .prologue
    .line 256
    iget v0, p0, Landroid/view/Display;->mLayerStack:I

    return v0
.end method

.method public getMaximumSizeDimension()I
    .locals 2

    .prologue
    .line 412
    monitor-enter p0

    .line 413
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 414
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v0, v0, Landroid/view/DisplayInfo;->logicalWidth:I

    iget-object v1, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v1, v1, Landroid/view/DisplayInfo;->logicalHeight:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    monitor-exit p0

    return v0

    .line 415
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getMetrics(Landroid/util/DisplayMetrics;)V
    .locals 2
    .parameter "outMetrics"

    .prologue
    .line 519
    monitor-enter p0

    .line 520
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 521
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget-object v1, p0, Landroid/view/Display;->mCompatibilityInfo:Landroid/view/CompatibilityInfoHolder;

    invoke-virtual {v0, p1, v1}, Landroid/view/DisplayInfo;->getAppMetrics(Landroid/util/DisplayMetrics;Landroid/view/CompatibilityInfoHolder;)V

    .line 522
    monitor-exit p0

    .line 523
    return-void

    .line 522
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 317
    monitor-enter p0

    .line 318
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 319
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget-object v0, v0, Landroid/view/DisplayInfo;->name:Ljava/lang/String;

    monitor-exit p0

    return-object v0

    .line 320
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getOrientation()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 470
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    move-result v0

    return v0
.end method

.method public getPixelFormat()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 482
    const/4 v0, 0x1

    return v0
.end method

.method public getRealMetrics(Landroid/util/DisplayMetrics;)V
    .locals 2
    .parameter "outMetrics"

    .prologue
    .line 557
    monitor-enter p0

    .line 558
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 559
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/view/DisplayInfo;->getLogicalMetrics(Landroid/util/DisplayMetrics;Landroid/view/CompatibilityInfoHolder;)V

    .line 560
    monitor-exit p0

    .line 561
    return-void

    .line 560
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getRealSize(Landroid/graphics/Point;)V
    .locals 1
    .parameter "outSize"

    .prologue
    .line 538
    monitor-enter p0

    .line 539
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 540
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v0, v0, Landroid/view/DisplayInfo;->logicalWidth:I

    iput v0, p1, Landroid/graphics/Point;->x:I

    .line 541
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v0, v0, Landroid/view/DisplayInfo;->logicalHeight:I

    iput v0, p1, Landroid/graphics/Point;->y:I

    .line 542
    monitor-exit p0

    .line 543
    return-void

    .line 542
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getRectSize(Landroid/graphics/Rect;)V
    .locals 4
    .parameter "outSize"

    .prologue
    .line 359
    monitor-enter p0

    .line 360
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 361
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget-object v1, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    iget-object v2, p0, Landroid/view/Display;->mCompatibilityInfo:Landroid/view/CompatibilityInfoHolder;

    invoke-virtual {v0, v1, v2}, Landroid/view/DisplayInfo;->getAppMetrics(Landroid/util/DisplayMetrics;Landroid/view/CompatibilityInfoHolder;)V

    .line 362
    const/4 v0, 0x0

    const/4 v1, 0x0

    iget-object v2, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v3, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 363
    monitor-exit p0

    .line 364
    return-void

    .line 363
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getRefreshRate()F
    .locals 2

    .prologue
    .line 489
    monitor-enter p0

    .line 490
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 494
    const-string v0, "persist.oppo.ctsversion"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 495
    const/high16 v0, 0x426e

    monitor-exit p0

    .line 497
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v0, v0, Landroid/view/DisplayInfo;->refreshRate:F

    monitor-exit p0

    goto :goto_0

    .line 501
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getRotation()I
    .locals 1

    .prologue
    .line 458
    monitor-enter p0

    .line 459
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 460
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v0, v0, Landroid/view/DisplayInfo;->rotation:I

    monitor-exit p0

    return v0

    .line 461
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getSize(Landroid/graphics/Point;)V
    .locals 3
    .parameter "outSize"

    .prologue
    .line 344
    monitor-enter p0

    .line 345
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 346
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget-object v1, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    iget-object v2, p0, Landroid/view/Display;->mCompatibilityInfo:Landroid/view/CompatibilityInfoHolder;

    invoke-virtual {v0, v1, v2}, Landroid/view/DisplayInfo;->getAppMetrics(Landroid/util/DisplayMetrics;Landroid/view/CompatibilityInfoHolder;)V

    .line 347
    iget-object v0, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p1, Landroid/graphics/Point;->x:I

    .line 348
    iget-object v0, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v0, p1, Landroid/graphics/Point;->y:I

    .line 349
    monitor-exit p0

    .line 350
    return-void

    .line 349
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 284
    iget v0, p0, Landroid/view/Display;->mType:I

    return v0
.end method

.method public getWidth()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 423
    monitor-enter p0

    .line 424
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateCachedAppSizeIfNeededLocked()V

    .line 425
    iget v0, p0, Landroid/view/Display;->mCachedAppWidthCompat:I

    monitor-exit p0

    return v0

    .line 426
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isValid()Z
    .locals 1

    .prologue
    .line 225
    monitor-enter p0

    .line 226
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 227
    iget-boolean v0, p0, Landroid/view/Display;->mIsValid:Z

    monitor-exit p0

    return v0

    .line 228
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 600
    monitor-enter p0

    .line 601
    :try_start_0
    invoke-direct {p0}, Landroid/view/Display;->updateDisplayInfoLocked()V

    .line 602
    iget-object v0, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget-object v1, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    iget-object v2, p0, Landroid/view/Display;->mCompatibilityInfo:Landroid/view/CompatibilityInfoHolder;

    invoke-virtual {v0, v1, v2}, Landroid/view/DisplayInfo;->getAppMetrics(Landroid/util/DisplayMetrics;Landroid/view/CompatibilityInfoHolder;)V

    .line 603
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Display id "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/view/Display;->mDisplayId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/view/Display;->mDisplayInfo:Landroid/view/DisplayInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/view/Display;->mTempMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", isValid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroid/view/Display;->mIsValid:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 605
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
