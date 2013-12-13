.class public Lcom/android/server/input/OppoBackTouchInspector;
.super Landroid/view/BackTouchGestureDetector$SimpleOnGestureListener;
.source "OppoBackTouchInspector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = true

.field private static final DEBUG_GESTURE:Z = false

.field private static final FLING_ANGLE:I = 0x37

.field private static final MIN_SLIDE_DISTANCE:F = 324.0f

.field private static final tag:Ljava/lang/String; = "BackTouch_Inspector"


# instance fields
.field private USE_FILTER:Z

.field private USE_INJECTOR:Z

.field private doubleTapIntent:Landroid/content/ComponentName;

.field private isDoubleTapIntentEnabled:Z

.field private isEnabled:Z

.field private isSlideEnabled:Z

.field private mAm:Landroid/app/ActivityManager;

.field private mBypassComponent:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mBypassPackage:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mCurrentComponent:Landroid/content/ComponentName;

.field private mDetector:Landroid/view/BackTouchGestureDetector;

.field private mDoubleTapDisableComponent:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mDownEvent:Landroid/view/MotionEvent;

.field private mEventsBeforeScroll:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/MotionEvent;",
            ">;"
        }
    .end annotation
.end field

.field private mFilter:Lcom/android/server/input/OppoStaleEventFilter;

.field private mHandler:Landroid/os/Handler;

.field private mHasBackTouchFeature:Z

.field private mInjector:Lcom/android/server/input/OppoMotionInjector;

.field private mLock:Ljava/lang/Object;

.field private mLongPressEnableComponent:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mLongPressVibEnabledComponent:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mLongTapDown:Z

.field private mOppoAm:Landroid/app/OppoActivityManager;

.field private mScrollEnabledComponent:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSettingsObserver:Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;

.field private mShouldBypassMotion:Z

.field private mSv:Lcom/android/server/input/InputManagerService;

.field private mTapVibEnabledComponent:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private shouldControlMusic:Z

.field private shouldControlReading:Z

.field private shouldControlRecord:Z

.field private shouldVibrate:Z

.field private speedScale:F

.field private startScroll:Z

.field private xScale:F

.field private yScale:F


# direct methods
.method public constructor <init>(Lcom/android/server/input/InputManagerService;Landroid/content/Context;)V
    .locals 2
    .parameter "sv"
    .parameter "context"

    .prologue
    const/4 v1, 0x1

    .line 96
    invoke-direct {p0}, Landroid/view/BackTouchGestureDetector$SimpleOnGestureListener;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->USE_INJECTOR:Z

    .line 58
    iput-boolean v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->USE_FILTER:Z

    .line 63
    const/high16 v0, 0x4080

    iput v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->xScale:F

    .line 64
    const/high16 v0, 0x4040

    iput v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->yScale:F

    .line 68
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLock:Ljava/lang/Object;

    .line 76
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongPressEnableComponent:Ljava/util/HashMap;

    .line 77
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mDoubleTapDisableComponent:Ljava/util/Set;

    .line 78
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mBypassPackage:Ljava/util/Set;

    .line 79
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mBypassComponent:Ljava/util/Set;

    .line 80
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongPressVibEnabledComponent:Ljava/util/Set;

    .line 81
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mTapVibEnabledComponent:Ljava/util/Set;

    .line 83
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mScrollEnabledComponent:Ljava/util/Set;

    .line 87
    iput-boolean v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->shouldVibrate:Z

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mEventsBeforeScroll:Ljava/util/List;

    .line 89
    const v0, 0x3f4ccccd

    iput v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->speedScale:F

    .line 97
    const-string v0, "BackTouch_Inspector"

    const-string v1, "OppoBackTouchInspector"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    iput-object p2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mContext:Landroid/content/Context;

    .line 99
    iput-object p1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mSv:Lcom/android/server/input/InputManagerService;

    .line 100
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/input/OppoBackTouchInspector;)Lcom/android/server/input/InputManagerService;
    .locals 1
    .parameter "x0"

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mSv:Lcom/android/server/input/InputManagerService;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/input/OppoBackTouchInspector;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/server/input/OppoBackTouchInspector;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/android/server/input/OppoBackTouchInspector;->handleSettingsChangedLocked()V

    return-void
.end method

.method private asynInjectEvent(Landroid/view/InputEvent;)V
    .locals 2
    .parameter "event"

    .prologue
    .line 445
    instance-of v0, p1, Landroid/view/KeyEvent;

    if-eqz v0, :cond_0

    .line 446
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/input/OppoBackTouchInspector$2;

    invoke-direct {v1, p0, p1}, Lcom/android/server/input/OppoBackTouchInspector$2;-><init>(Lcom/android/server/input/OppoBackTouchInspector;Landroid/view/InputEvent;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 464
    .end local p1
    :goto_0
    return-void

    .line 453
    .restart local p1
    :cond_0
    iget-boolean v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->USE_INJECTOR:Z

    if-eqz v0, :cond_1

    .line 454
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mInjector:Lcom/android/server/input/OppoMotionInjector;

    check-cast p1, Landroid/view/MotionEvent;

    .end local p1
    invoke-virtual {v0, p1}, Lcom/android/server/input/OppoMotionInjector;->enqueue(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 456
    .restart local p1
    :cond_1
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/input/OppoBackTouchInspector$3;

    invoke-direct {v1, p0, p1}, Lcom/android/server/input/OppoBackTouchInspector$3;-><init>(Lcom/android/server/input/OppoBackTouchInspector;Landroid/view/InputEvent;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private getSystemState(Ljava/lang/String;)Z
    .locals 3
    .parameter "name"

    .prologue
    const/4 v1, 0x0

    .line 514
    :try_start_0
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v2, p1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 516
    :cond_0
    :goto_0
    return v1

    .line 515
    :catch_0
    move-exception v0

    .line 516
    .local v0, snfe:Landroid/provider/Settings$SettingNotFoundException;
    goto :goto_0
.end method

.method private handleSettingsChangedLocked()V
    .locals 6

    .prologue
    .line 486
    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 488
    .local v2, resolver:Landroid/content/ContentResolver;
    const-string v3, "oppo_touchpad_ctrl_enabled"

    invoke-direct {p0, v3}, Lcom/android/server/input/OppoBackTouchInspector;->getSystemState(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->isEnabled:Z

    .line 490
    :try_start_0
    new-instance v1, Ljava/io/FileWriter;

    const-string v3, "/proc/touchpad/enable"

    invoke-direct {v1, v3}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    .line 491
    .local v1, fw:Ljava/io/FileWriter;
    iget-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->isEnabled:Z

    if-eqz v3, :cond_0

    const-string v3, "1"

    :goto_0
    invoke-virtual {v1, v3}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 492
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 497
    .end local v1           #fw:Ljava/io/FileWriter;
    :goto_1
    const-string v3, "tp_ctrl_touch_to_slide_enabled"

    invoke-direct {p0, v3}, Lcom/android/server/input/OppoBackTouchInspector;->getSystemState(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->isSlideEnabled:Z

    .line 499
    const-string v3, "tp_ctrl_double_click_start_app_enabled"

    invoke-direct {p0, v3}, Lcom/android/server/input/OppoBackTouchInspector;->getSystemState(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->isDoubleTapIntentEnabled:Z

    .line 502
    :try_start_1
    const-string v3, "tp_ctrl_double_click_start_app_set"

    invoke-static {v2, v3}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v3

    iput-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->doubleTapIntent:Landroid/content/ComponentName;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 507
    :goto_2
    const-string v3, "tp_ctrl_in_recording_enabled"

    invoke-direct {p0, v3}, Lcom/android/server/input/OppoBackTouchInspector;->getSystemState(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->shouldControlRecord:Z

    .line 508
    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongPressEnableComponent:Ljava/util/HashMap;

    const-string v4, "com.tencent.mm/com.tencent.mm.ui.chatting.ChattingUI"

    iget-boolean v5, p0, Lcom/android/server/input/OppoBackTouchInspector;->shouldControlRecord:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongPressEnableComponent:Ljava/util/HashMap;

    const-string v4, "com.tencent.mobileqq/com.tencent.mobileqq.activity.ChatActivity"

    iget-boolean v5, p0, Lcom/android/server/input/OppoBackTouchInspector;->shouldControlRecord:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    return-void

    .line 491
    .restart local v1       #fw:Ljava/io/FileWriter;
    :cond_0
    :try_start_2
    const-string v3, "0"
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 493
    .end local v1           #fw:Ljava/io/FileWriter;
    :catch_0
    move-exception v0

    .line 494
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 503
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 504
    .local v0, e:Ljava/lang/Exception;
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->doubleTapIntent:Landroid/content/ComponentName;

    goto :goto_2
.end method

.method private inDoubleTapDisableComponent()Z
    .locals 2

    .prologue
    .line 409
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mDoubleTapDisableComponent:Ljava/util/Set;

    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private injectKey(IIZ)V
    .locals 13
    .parameter "keycode"
    .parameter "action"
    .parameter "vibrate"

    .prologue
    .line 467
    if-eqz p3, :cond_0

    const/16 v0, 0x1f9

    if-eq p1, v0, :cond_0

    .line 468
    packed-switch p1, :pswitch_data_0

    .line 476
    :pswitch_0
    const/16 p3, 0x0

    .line 480
    :cond_0
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    if-eqz p3, :cond_1

    const/16 v10, 0x40

    :goto_1
    const v11, 0x100008

    const-string v12, ""

    move v4, p2

    move v5, p1

    invoke-static/range {v0 .. v12}, Landroid/view/KeyEvent;->obtain(JJIIIIIIIILjava/lang/String;)Landroid/view/KeyEvent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/server/input/OppoBackTouchInspector;->asynInjectEvent(Landroid/view/InputEvent;)V

    .line 483
    return-void

    .line 470
    :pswitch_1
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongPressVibEnabledComponent:Ljava/util/Set;

    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p3

    .line 471
    goto :goto_0

    .line 473
    :pswitch_2
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mTapVibEnabledComponent:Ljava/util/Set;

    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p3

    .line 474
    goto :goto_0

    .line 480
    :cond_1
    const/4 v10, 0x0

    goto :goto_1

    .line 468
    :pswitch_data_0
    .packed-switch 0x1f8
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private isInCall()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 418
    const-string v3, "phone"

    invoke-static {v3}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 420
    .local v1, telephonyService:Lcom/android/internal/telephony/ITelephony;
    if-eqz v1, :cond_0

    .line 422
    :try_start_0
    invoke-interface {v1}, Lcom/android/internal/telephony/ITelephony;->isIdle()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-nez v3, :cond_0

    const/4 v2, 0x1

    .line 427
    :cond_0
    :goto_0
    return v2

    .line 423
    :catch_0
    move-exception v0

    .line 424
    .local v0, ex:Landroid/os/RemoteException;
    const-string v3, "BackTouch_Inspector"

    const-string v4, "ITelephony threw RemoteException"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private isKeyguardActive()Z
    .locals 3

    .prologue
    .line 413
    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mContext:Landroid/content/Context;

    const-string v2, "keyguard"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    .line 414
    .local v0, mKeyguardManager:Landroid/app/KeyguardManager;
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v1

    return v1
.end method

.method private onSlide(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V
    .locals 13
    .parameter "down"
    .parameter "up"

    .prologue
    const/high16 v12, 0x42fa

    const/high16 v11, 0x425c

    const/high16 v10, -0x3da4

    const/4 v9, 0x0

    .line 277
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    sub-float v3, v5, v6

    .line 278
    .local v3, dx:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    sub-float v4, v5, v6

    .line 279
    .local v4, dy:F
    mul-float v5, v3, v3

    mul-float v6, v4, v4

    add-float v2, v5, v6

    .line 280
    .local v2, distance:F
    neg-float v5, v4

    float-to-double v5, v5

    float-to-double v7, v3

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v5

    const-wide v7, 0x4066800000000000L

    mul-double/2addr v5, v7

    const-wide v7, 0x400921fb54442d18L

    div-double/2addr v5, v7

    double-to-float v0, v5

    .line 282
    .local v0, angle:F
    const/high16 v5, 0x43a2

    cmpg-float v5, v2, v5

    if-gez v5, :cond_0

    .line 297
    :goto_0
    return-void

    .line 285
    :cond_0
    const/4 v1, 0x0

    .line 286
    .local v1, direction:I
    cmpl-float v5, v0, v10

    if-ltz v5, :cond_2

    cmpg-float v5, v0, v11

    if-gtz v5, :cond_2

    .line 287
    const/16 v1, 0x1f5

    .line 295
    :cond_1
    :goto_1
    invoke-direct {p0, v1, v9, v9}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    .line 296
    const/4 v5, 0x1

    invoke-direct {p0, v1, v5, v9}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    goto :goto_0

    .line 288
    :cond_2
    cmpl-float v5, v0, v11

    if-ltz v5, :cond_3

    cmpg-float v5, v0, v12

    if-gtz v5, :cond_3

    .line 289
    const/16 v1, 0x1f6

    goto :goto_1

    .line 290
    :cond_3
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v5, v5, v12

    if-ltz v5, :cond_4

    .line 291
    const/16 v1, 0x1f4

    goto :goto_1

    .line 292
    :cond_4
    cmpg-float v5, v0, v10

    if-gtz v5, :cond_1

    const/high16 v5, -0x3d06

    cmpl-float v5, v0, v5

    if-ltz v5, :cond_1

    .line 293
    const/16 v1, 0x1f7

    goto :goto_1
.end method

.method private scale(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;
    .locals 24
    .parameter "event"

    .prologue
    .line 300
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v20

    .line 301
    .local v20, count:I
    move/from16 v0, v20

    new-array v9, v0, [Landroid/view/MotionEvent$PointerProperties;

    .line 302
    .local v9, props:[Landroid/view/MotionEvent$PointerProperties;
    move/from16 v0, v20

    new-array v10, v0, [Landroid/view/MotionEvent$PointerCoords;

    .line 303
    .local v10, coords:[Landroid/view/MotionEvent$PointerCoords;
    const/16 v21, 0x0

    .local v21, i:I
    :goto_0
    move/from16 v0, v21

    move/from16 v1, v20

    if-ge v0, v1, :cond_0

    .line 304
    new-instance v23, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct/range {v23 .. v23}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 305
    .local v23, prop:Landroid/view/MotionEvent$PointerProperties;
    new-instance v19, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct/range {v19 .. v19}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 306
    .local v19, coord:Landroid/view/MotionEvent$PointerCoords;
    move-object/from16 v0, p1

    move/from16 v1, v21

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/view/MotionEvent;->getPointerProperties(ILandroid/view/MotionEvent$PointerProperties;)V

    .line 307
    move-object/from16 v0, p1

    move/from16 v1, v21

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/view/MotionEvent;->getPointerCoords(ILandroid/view/MotionEvent$PointerCoords;)V

    .line 308
    move-object/from16 v0, v19

    iget v3, v0, Landroid/view/MotionEvent$PointerCoords;->x:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/server/input/OppoBackTouchInspector;->xScale:F

    mul-float/2addr v3, v4

    move-object/from16 v0, v19

    iput v3, v0, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 309
    move-object/from16 v0, v19

    iget v3, v0, Landroid/view/MotionEvent$PointerCoords;->y:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/server/input/OppoBackTouchInspector;->yScale:F

    mul-float/2addr v3, v4

    move-object/from16 v0, v19

    iput v3, v0, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 310
    aput-object v23, v9, v21

    .line 311
    aput-object v19, v10, v21

    .line 303
    add-int/lit8 v21, v21, 0x1

    goto :goto_0

    .line 313
    .end local v19           #coord:Landroid/view/MotionEvent$PointerCoords;
    .end local v23           #prop:Landroid/view/MotionEvent$PointerProperties;
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v7

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v11

    sub-long/2addr v7, v11

    long-to-float v7, v7

    move-object/from16 v0, p0

    iget v8, v0, Lcom/android/server/input/OppoBackTouchInspector;->speedScale:F

    mul-float/2addr v7, v8

    float-to-long v7, v7

    add-long v5, v3, v7

    .line 314
    .local v5, eventTime:J
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v8

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v11

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v12

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getXPrecision()F

    move-result v13

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getYPrecision()F

    move-result v14

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v15

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v16

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v17

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getFlags()I

    move-result v18

    invoke-static/range {v3 .. v18}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v22

    .line 318
    .local v22, injectEvent:Landroid/view/MotionEvent;
    return-object v22
.end method

.method private shouldBypassMotion(Landroid/content/ComponentName;)Z
    .locals 3
    .parameter "componentName"

    .prologue
    const/4 v0, 0x0

    .line 266
    if-nez p1, :cond_1

    .line 273
    :cond_0
    :goto_0
    return v0

    .line 269
    :cond_1
    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mBypassPackage:Ljava/util/Set;

    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mBypassComponent:Ljava/util/Set;

    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 271
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private shouldDispatchLongPress()Z
    .locals 2

    .prologue
    .line 340
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongPressEnableComponent:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 341
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongPressEnableComponent:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 343
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private shouldDispatchScroll()Z
    .locals 2

    .prologue
    .line 348
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mScrollEnabledComponent:Ljava/util/Set;

    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public dump(Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 4
    .parameter "pw"
    .parameter "args"

    .prologue
    .line 534
    array-length v2, p2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_0

    .line 535
    const/4 v2, 0x0

    aget-object v2, p2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iput v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->xScale:F

    .line 536
    const/4 v2, 0x1

    aget-object v2, p2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iput v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->yScale:F

    .line 537
    const/4 v2, 0x2

    aget-object v2, p2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iput v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->speedScale:F

    .line 538
    const/4 v2, 0x3

    aget-object v2, p2, v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->USE_FILTER:Z

    .line 539
    const/4 v2, 0x4

    aget-object v2, p2, v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->USE_INJECTOR:Z

    .line 541
    :cond_0
    const-string v2, "OppoBackTouchInspector:"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 542
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "xScale="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->xScale:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " yScale="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->yScale:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " speedScale="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->speedScale:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 543
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "USE_FILTER="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->USE_FILTER:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " USE_INJECTOR="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->USE_INJECTOR:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 544
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mCurrentComponent="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 545
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mHasBackTouchFeature="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mHasBackTouchFeature:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 546
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isEnabled="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->isEnabled:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 547
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isSlideEnabled="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->isSlideEnabled:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 548
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isDoubleTapIntentEnabled="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->isDoubleTapIntentEnabled:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 549
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "doubleTapIntent="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->doubleTapIntent:Landroid/content/ComponentName;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 550
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "shouldControlReading="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->shouldControlReading:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 551
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "shouldControlRecord="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->shouldControlRecord:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 552
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "shouldControlMusic="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->shouldControlMusic:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 553
    const-string v2, "\nmDoubleTapDisableComponent:"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 554
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mDoubleTapDisableComponent:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 555
    .local v0, e:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 557
    .end local v0           #e:Ljava/lang/String;
    :cond_1
    const-string v2, "\nmLongPressEnableComponent:"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 558
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongPressEnableComponent:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 559
    .restart local v0       #e:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongPressEnableComponent:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_1

    .line 561
    .end local v0           #e:Ljava/lang/String;
    :cond_2
    const-string v2, "\nmLongPressVibEnabledComponent:"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 562
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongPressVibEnabledComponent:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 563
    .restart local v0       #e:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 565
    .end local v0           #e:Ljava/lang/String;
    :cond_3
    const-string v2, "\nmTapVibEnabledComponent:"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 566
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mTapVibEnabledComponent:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 567
    .restart local v0       #e:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_3

    .line 569
    .end local v0           #e:Ljava/lang/String;
    :cond_4
    const-string v2, "\ngesture detector:"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 570
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mDetector:Landroid/view/BackTouchGestureDetector;

    invoke-virtual {v2, p1}, Landroid/view/BackTouchGestureDetector;->dump(Ljava/io/PrintWriter;)V

    .line 571
    return-void
.end method

.method public onBackTouchEvent(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter "event"

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->USE_FILTER:Z

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mFilter:Lcom/android/server/input/OppoStaleEventFilter;

    invoke-virtual {v0, p1}, Lcom/android/server/input/OppoStaleEventFilter;->onBackTouchEvent(Landroid/view/MotionEvent;)V

    .line 172
    :goto_0
    return-void

    .line 170
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/server/input/OppoBackTouchInspector;->onFilterBackTouchEvent(Landroid/view/MotionEvent;)V

    goto :goto_0
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 14
    .parameter "e"

    .prologue
    const/16 v13, 0x1f9

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 370
    const/4 v6, 0x0

    .line 373
    .local v6, vibrate:Z
    iget-object v8, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLock:Ljava/lang/Object;

    monitor-enter v8

    .line 374
    :try_start_0
    iget-boolean v7, p0, Lcom/android/server/input/OppoBackTouchInspector;->isDoubleTapIntentEnabled:Z

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/android/server/input/OppoBackTouchInspector;->doubleTapIntent:Landroid/content/ComponentName;

    if-eqz v7, :cond_0

    invoke-direct {p0}, Lcom/android/server/input/OppoBackTouchInspector;->isInCall()Z

    move-result v7

    if-nez v7, :cond_0

    invoke-direct {p0}, Lcom/android/server/input/OppoBackTouchInspector;->isKeyguardActive()Z

    move-result v7

    if-nez v7, :cond_0

    invoke-direct {p0}, Lcom/android/server/input/OppoBackTouchInspector;->inDoubleTapDisableComponent()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    if-nez v7, :cond_0

    .line 377
    :try_start_1
    iget-object v7, p0, Lcom/android/server/input/OppoBackTouchInspector;->mOppoAm:Landroid/app/OppoActivityManager;

    invoke-virtual {v7}, Landroid/app/OppoActivityManager;->getTopActivityComponentName()Landroid/content/ComponentName;

    move-result-object v0

    .line 379
    .local v0, comp:Landroid/content/ComponentName;
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v5

    .line 380
    .local v5, pkgName:Ljava/lang/String;
    if-eqz v5, :cond_1

    const-string v7, "com.oppo.engineeringmode"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 381
    const-string v7, "BackTouch_Inspector"

    const-string v9, "double tap in engineeringmode, ignore!"

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 400
    .end local v0           #comp:Landroid/content/ComponentName;
    .end local v5           #pkgName:Ljava/lang/String;
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 402
    invoke-direct {p0, v13, v11, v6}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    .line 403
    invoke-direct {p0, v13, v12, v11}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    .line 405
    return v11

    .line 383
    .restart local v0       #comp:Landroid/content/ComponentName;
    .restart local v5       #pkgName:Ljava/lang/String;
    :cond_1
    :try_start_3
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v7

    iget-object v9, p0, Lcom/android/server/input/OppoBackTouchInspector;->doubleTapIntent:Landroid/content/ComponentName;

    invoke-virtual {v9}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 384
    .local v4, isInApp:Z
    if-eqz v4, :cond_3

    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const-string v9, "com.oppo.drivemode"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 385
    iget-object v7, p0, Lcom/android/server/input/OppoBackTouchInspector;->mAm:Landroid/app/ActivityManager;

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-virtual {v7, v9, v10}, Landroid/app/ActivityManager;->getRecentTasks(II)Ljava/util/List;

    move-result-object v2

    .line 386
    .local v2, first:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RecentTaskInfo;>;"
    if-eqz v2, :cond_2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_2

    .line 387
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v9

    const/4 v7, 0x0

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/app/ActivityManager$RecentTaskInfo;

    iget v7, v7, Landroid/app/ActivityManager$RecentTaskInfo;->id:I

    invoke-interface {v9, v7}, Landroid/app/IActivityManager;->moveTaskToBack(I)V

    .line 394
    .end local v2           #first:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RecentTaskInfo;>;"
    :cond_2
    :goto_1
    iget-boolean v6, p0, Lcom/android/server/input/OppoBackTouchInspector;->shouldVibrate:Z

    goto :goto_0

    .line 389
    :cond_3
    iget-object v7, p0, Lcom/android/server/input/OppoBackTouchInspector;->doubleTapIntent:Landroid/content/ComponentName;

    invoke-static {v7}, Landroid/content/Intent;->makeMainActivity(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v3

    .line 390
    .local v3, intent:Landroid/content/Intent;
    const/high16 v7, 0x1020

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 391
    const-string v7, "source"

    const-string v9, "backtouch"

    invoke-virtual {v3, v7, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 392
    iget-object v7, p0, Lcom/android/server/input/OppoBackTouchInspector;->mContext:Landroid/content/Context;

    invoke-virtual {v7, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 396
    .end local v0           #comp:Landroid/content/ComponentName;
    .end local v3           #intent:Landroid/content/Intent;
    .end local v4           #isInApp:Z
    .end local v5           #pkgName:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 397
    .local v1, e1:Landroid/os/RemoteException;
    :try_start_4
    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 400
    .end local v1           #e1:Landroid/os/RemoteException;
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v7
.end method

.method public onFilterBackTouchEvent(Landroid/view/MotionEvent;)V
    .locals 17
    .parameter "event"

    .prologue
    .line 176
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mOppoAm:Landroid/app/OppoActivityManager;

    invoke-virtual {v13}, Landroid/app/OppoActivityManager;->getTopActivityComponentName()Landroid/content/ComponentName;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    .line 177
    const-string v13, "BackTouch_Inspector"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "current component:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    invoke-virtual {v15}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    :goto_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/input/OppoBackTouchInspector;->mLock:Ljava/lang/Object;

    monitor-enter v14

    .line 184
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mHasBackTouchFeature:Z

    if-eqz v13, :cond_0

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->isEnabled:Z

    if-nez v13, :cond_1

    .line 185
    :cond_0
    const-string v13, "BackTouch_Inspector"

    const-string v15, "backtouch not enabled"

    invoke-static {v13, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->recycle()V

    .line 187
    monitor-exit v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 263
    :goto_1
    return-void

    .line 178
    :catch_0
    move-exception v6

    .line 179
    .local v6, e1:Landroid/os/RemoteException;
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    .line 180
    invoke-virtual {v6}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 189
    .end local v6           #e1:Landroid/os/RemoteException;
    :cond_1
    :try_start_2
    monitor-exit v14
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 191
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    .line 193
    .local v2, action:I
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->USE_FILTER:Z

    if-nez v13, :cond_2

    const-string v13, "BackTouch_Inspector"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "onBackTouchEvent:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    :cond_2
    if-nez v2, :cond_4

    .line 196
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mDownEvent:Landroid/view/MotionEvent;

    if-eqz v13, :cond_3

    .line 197
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mDownEvent:Landroid/view/MotionEvent;

    invoke-virtual {v13}, Landroid/view/MotionEvent;->recycle()V

    .line 199
    :cond_3
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mDownEvent:Landroid/view/MotionEvent;

    .line 200
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mEventsBeforeScroll:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->clear()V

    .line 201
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mCurrentComponent:Landroid/content/ComponentName;

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/android/server/input/OppoBackTouchInspector;->shouldBypassMotion(Landroid/content/ComponentName;)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mShouldBypassMotion:Z

    .line 203
    const/16 v13, 0x1fc

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14, v15}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    .line 204
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mShouldBypassMotion:Z

    if-nez v13, :cond_4

    .line 206
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v4

    .line 207
    .local v4, downEvent:Landroid/view/MotionEvent;
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v3

    .line 208
    .local v3, cancelEvent:Landroid/view/MotionEvent;
    const/4 v13, 0x3

    invoke-virtual {v3, v13}, Landroid/view/MotionEvent;->setAction(I)V

    .line 209
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/server/input/OppoBackTouchInspector;->asynInjectEvent(Landroid/view/InputEvent;)V

    .line 210
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/server/input/OppoBackTouchInspector;->asynInjectEvent(Landroid/view/InputEvent;)V

    .line 214
    .end local v3           #cancelEvent:Landroid/view/MotionEvent;
    .end local v4           #downEvent:Landroid/view/MotionEvent;
    :cond_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mDetector:Landroid/view/BackTouchGestureDetector;

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Landroid/view/BackTouchGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 216
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->startScroll:Z

    if-nez v13, :cond_5

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mShouldBypassMotion:Z

    if-eqz v13, :cond_d

    :cond_5
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->isSlideEnabled:Z

    if-nez v13, :cond_6

    invoke-direct/range {p0 .. p0}, Lcom/android/server/input/OppoBackTouchInspector;->shouldDispatchScroll()Z

    move-result v13

    if-eqz v13, :cond_d

    .line 217
    :cond_6
    const/4 v10, 0x0

    .line 218
    .local v10, startInject:Z
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mEventsBeforeScroll:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_b

    .line 219
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mEventsBeforeScroll:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/MotionEvent;

    .line 220
    .local v5, e:Landroid/view/MotionEvent;
    invoke-virtual {v5}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    .line 221
    .local v11, x:F
    invoke-virtual {v5}, Landroid/view/MotionEvent;->getY()F

    move-result v12

    .line 222
    .local v12, y:F
    if-nez v10, :cond_7

    const/high16 v13, 0x4345

    cmpg-float v13, v11, v13

    if-gez v13, :cond_7

    const/high16 v13, 0x4040

    cmpl-float v13, v11, v13

    if-lez v13, :cond_7

    const/high16 v13, 0x431d

    cmpg-float v13, v12, v13

    if-gez v13, :cond_7

    const/high16 v13, 0x4040

    cmpl-float v13, v12, v13

    if-lez v13, :cond_7

    .line 223
    const/4 v10, 0x1

    .line 224
    const/4 v13, 0x0

    invoke-virtual {v5, v13}, Landroid/view/MotionEvent;->setAction(I)V

    .line 226
    :cond_7
    if-eqz v10, :cond_8

    .line 227
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/android/server/input/OppoBackTouchInspector;->scale(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v9

    .line 228
    .local v9, scaleEvent:Landroid/view/MotionEvent;
    const-string v13, "BackTouch_Inspector"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "inject backtouch scroll:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/android/server/input/OppoBackTouchInspector;->asynInjectEvent(Landroid/view/InputEvent;)V

    .line 231
    .end local v9           #scaleEvent:Landroid/view/MotionEvent;
    :cond_8
    invoke-virtual {v5}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_2

    .line 189
    .end local v2           #action:I
    .end local v5           #e:Landroid/view/MotionEvent;
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v10           #startInject:Z
    .end local v11           #x:F
    .end local v12           #y:F
    :catchall_0
    move-exception v13

    :try_start_3
    monitor-exit v14
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v13

    .line 233
    .restart local v2       #action:I
    .restart local v7       #i$:Ljava/util/Iterator;
    .restart local v10       #startInject:Z
    :cond_9
    if-nez v10, :cond_a

    .line 234
    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/MotionEvent;->setAction(I)V

    .line 236
    :cond_a
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mEventsBeforeScroll:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->clear()V

    .line 238
    .end local v7           #i$:Ljava/util/Iterator;
    :cond_b
    invoke-direct/range {p0 .. p1}, Lcom/android/server/input/OppoBackTouchInspector;->scale(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v9

    .line 239
    .restart local v9       #scaleEvent:Landroid/view/MotionEvent;
    const-string v13, "BackTouch_Inspector"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "inject backtouch event:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/android/server/input/OppoBackTouchInspector;->asynInjectEvent(Landroid/view/InputEvent;)V

    .line 245
    .end local v9           #scaleEvent:Landroid/view/MotionEvent;
    .end local v10           #startInject:Z
    :goto_3
    const/4 v13, 0x1

    if-ne v2, v13, :cond_c

    .line 246
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->startScroll:Z

    .line 247
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/input/OppoBackTouchInspector;->onUp()Z

    .line 248
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v13, v1}, Lcom/android/server/input/OppoBackTouchInspector;->onSlide(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V

    .line 250
    const/16 v13, 0x1fc

    const/4 v14, 0x1

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14, v15}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    .line 252
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPressure()F

    move-result v8

    .line 253
    .local v8, pressure:F
    const-string v13, "BackTouch_Inspector"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "onFilterBackTouchEvent: pressure:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v13

    float-to-double v13, v13

    const-wide v15, 0x3eb0c6f7a0b5ed8dL

    cmpg-double v13, v13, v15

    if-gez v13, :cond_c

    .line 256
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v3

    .line 257
    .restart local v3       #cancelEvent:Landroid/view/MotionEvent;
    const/4 v13, 0x3

    invoke-virtual {v3, v13}, Landroid/view/MotionEvent;->setAction(I)V

    .line 258
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mDetector:Landroid/view/BackTouchGestureDetector;

    invoke-virtual {v13, v3}, Landroid/view/BackTouchGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 262
    .end local v3           #cancelEvent:Landroid/view/MotionEvent;
    .end local v8           #pressure:F
    :cond_c
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->recycle()V

    goto/16 :goto_1

    .line 242
    :cond_d
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/input/OppoBackTouchInspector;->mEventsBeforeScroll:Ljava/util/List;

    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v14

    invoke-interface {v13, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 3
    .parameter "e"

    .prologue
    .line 333
    invoke-direct {p0}, Lcom/android/server/input/OppoBackTouchInspector;->shouldDispatchLongPress()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 334
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongTapDown:Z

    .line 335
    const/16 v0, 0x1fa

    const/4 v1, 0x0

    iget-boolean v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->shouldVibrate:Z

    invoke-direct {p0, v0, v1, v2}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    .line 337
    :cond_0
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 2
    .parameter "e1"
    .parameter "e2"
    .parameter "distanceX"
    .parameter "distanceY"

    .prologue
    .line 434
    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 436
    :try_start_0
    iget-boolean v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->startScroll:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->isSlideEnabled:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/server/input/OppoBackTouchInspector;->shouldDispatchScroll()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 437
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->startScroll:Z

    .line 439
    :cond_1
    monitor-exit v1

    .line 441
    const/4 v0, 0x0

    return v0

    .line 439
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "e"

    .prologue
    const/16 v3, 0x1f8

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 362
    iget-boolean v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->shouldVibrate:Z

    invoke-direct {p0, v3, v1, v0}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    .line 363
    invoke-direct {p0, v3, v2, v1}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    .line 364
    return v2
.end method

.method public onSpecialLongPress(Z)V
    .locals 3
    .parameter "down"

    .prologue
    const/4 v1, 0x0

    .line 354
    if-eqz p1, :cond_0

    move v0, v1

    .line 356
    .local v0, action:I
    :goto_0
    const/16 v2, 0x1fb

    invoke-direct {p0, v2, v0, v1}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    .line 357
    return-void

    .line 354
    .end local v0           #action:I
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onUp()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 322
    iget-boolean v0, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongTapDown:Z

    if-eqz v0, :cond_0

    .line 324
    iput-boolean v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mLongTapDown:Z

    .line 325
    const/16 v0, 0x1fa

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/android/server/input/OppoBackTouchInspector;->injectKey(IIZ)V

    .line 327
    :cond_0
    return v2
.end method

.method public systemReady()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 103
    const-string v2, "BackTouch_Inspector"

    const-string v3, "systemReady"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    new-instance v2, Landroid/app/OppoActivityManager;

    invoke-direct {v2}, Landroid/app/OppoActivityManager;-><init>()V

    iput-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mOppoAm:Landroid/app/OppoActivityManager;

    .line 105
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mContext:Landroid/content/Context;

    const-string v3, "activity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager;

    iput-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mAm:Landroid/app/ActivityManager;

    .line 106
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v3, "oppo.backtouch.support"

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mHasBackTouchFeature:Z

    .line 107
    new-instance v2, Landroid/view/BackTouchGestureDetector;

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, p0}, Landroid/view/BackTouchGestureDetector;-><init>(Landroid/content/Context;Landroid/view/BackTouchGestureDetector$OnGestureListener;)V

    iput-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mDetector:Landroid/view/BackTouchGestureDetector;

    .line 108
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mDetector:Landroid/view/BackTouchGestureDetector;

    invoke-virtual {v2, p0}, Landroid/view/BackTouchGestureDetector;->setOnDoubleTapListener(Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;)V

    .line 109
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "inject_thread"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 110
    .local v1, thd:Landroid/os/HandlerThread;
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 111
    new-instance v2, Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mHandler:Landroid/os/Handler;

    .line 112
    new-instance v2, Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mHandler:Landroid/os/Handler;

    invoke-direct {v2, p0, v3}, Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;-><init>(Lcom/android/server/input/OppoBackTouchInspector;Landroid/os/Handler;)V

    iput-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mSettingsObserver:Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;

    .line 113
    new-instance v2, Lcom/android/server/input/OppoMotionInjector;

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mSv:Lcom/android/server/input/InputManagerService;

    invoke-direct {v2, v3}, Lcom/android/server/input/OppoMotionInjector;-><init>(Lcom/android/server/input/InputManagerService;)V

    iput-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mInjector:Lcom/android/server/input/OppoMotionInjector;

    .line 114
    new-instance v2, Lcom/android/server/input/OppoStaleEventFilter;

    new-instance v3, Lcom/android/server/input/OppoBackTouchInspector$1;

    invoke-direct {v3, p0}, Lcom/android/server/input/OppoBackTouchInspector$1;-><init>(Lcom/android/server/input/OppoBackTouchInspector;)V

    invoke-direct {v2, v3}, Lcom/android/server/input/OppoStaleEventFilter;-><init>(Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;)V

    iput-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mFilter:Lcom/android/server/input/OppoStaleEventFilter;

    .line 120
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 121
    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v2, "tp_ctrl_in_recording_enabled"

    invoke-static {v2}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mSettingsObserver:Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;

    invoke-virtual {v0, v2, v5, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 124
    const-string v2, "oppo_touchpad_ctrl_enabled"

    invoke-static {v2}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mSettingsObserver:Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;

    invoke-virtual {v0, v2, v5, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 127
    const-string v2, "tp_ctrl_double_click_start_app_enabled"

    invoke-static {v2}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mSettingsObserver:Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;

    invoke-virtual {v0, v2, v5, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 130
    const-string v2, "tp_ctrl_double_click_start_app_set"

    invoke-static {v2}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mSettingsObserver:Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;

    invoke-virtual {v0, v2, v5, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 133
    const-string v2, "tp_ctrl_touch_to_slide_enabled"

    invoke-static {v2}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/input/OppoBackTouchInspector;->mSettingsObserver:Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;

    invoke-virtual {v0, v2, v5, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 136
    invoke-direct {p0}, Lcom/android/server/input/OppoBackTouchInspector;->handleSettingsChangedLocked()V

    .line 138
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mBypassPackage:Ljava/util/Set;

    const-string v3, "com.oppo.launcher"

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 142
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mDoubleTapDisableComponent:Ljava/util/Set;

    const-string v3, "com.tencent.mm/com.tencent.mm.plugin.voip.ui.VideoActivity"

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 144
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mDoubleTapDisableComponent:Ljava/util/Set;

    const-string v3, "com.tencent.mobileqq/com.tencent.video.activity.VideoChatActivity"

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 155
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mTapVibEnabledComponent:Ljava/util/Set;

    const-string v3, "com.netease.cloudmusic/com.netease.cloudmusic.activity.MainActivity"

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 157
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mTapVibEnabledComponent:Ljava/util/Set;

    const-string v3, "com.netease.newsreader.activity/com.netease.nr.biz.audio.AudioPlayActivity"

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 161
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mScrollEnabledComponent:Ljava/util/Set;

    const-string v3, "im.yixin/im.yixin.activity.message.PublicMessageActivity"

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 163
    iget-object v2, p0, Lcom/android/server/input/OppoBackTouchInspector;->mScrollEnabledComponent:Ljava/util/Set;

    const-string v3, "com.tencent.mm/com.tencent.mm.ui.chatting.ChattingUI"

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 164
    return-void
.end method
