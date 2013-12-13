.class public Landroid/view/BackTouchGestureDetector;
.super Ljava/lang/Object;
.source "BackTouchGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/view/BackTouchGestureDetector$GestureHandler;,
        Landroid/view/BackTouchGestureDetector$SimpleOnGestureListener;,
        Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;,
        Landroid/view/BackTouchGestureDetector$OnGestureListener;
    }
.end annotation


# static fields
.field private static final DOUBLE_TAP_TIMEOUT:I = 0x190

.field private static final DOUBLE_TAP_TOO_FAST_TIME:J = 0x96L

#the value of this static final field might be set in the static constructor
.field private static final LONGPRESS_TIMEOUT:I = 0x0

.field private static final LONG_PRESS:I = 0x2

.field private static final MIN_SINGLE_TAP_DURATION:J = 0x37L

.field private static final SHOW_PRESS:I = 0x1

.field private static final SPECIAL_LONG_PRESS:I = 0x4

.field private static final SPECIAL_LONG_PRESS_TIMEOUT:J = 0xc8L

.field private static final TAP:I = 0x3

#the value of this static final field might be set in the static constructor
.field private static final TAP_TIMEOUT:I = 0x0

.field private static final tag:Ljava/lang/String; = "BackTouch_GestureDetector"


# instance fields
.field private mAlwaysInBiggerTapRegion:Z

.field private mAlwaysInTapRegion:Z

.field private mCurrentDownEvent:Landroid/view/MotionEvent;

.field private mDoubleTapListener:Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

.field private mDoubleTapSlopSquare:I

.field private mDoubleTapTouchSlopSquare:I

.field private mDownFocusX:F

.field private mDownFocusY:F

.field private final mHandler:Landroid/os/Handler;

.field private mInLongPress:Z

.field private mInSpecialLongPress:Z

.field private final mInputEventConsistencyVerifier:Landroid/view/InputEventConsistencyVerifier;

.field private mIsDoubleTapping:Z

.field private mIsFastTap:Z

.field private mIsLongpressEnabled:Z

.field private mLastFocusX:F

.field private mLastFocusY:F

.field private final mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

.field private mMaximumFlingVelocity:I

.field private mMinimumFlingVelocity:I

.field private mPreviousUpEvent:Landroid/view/MotionEvent;

.field private mStillDown:Z

.field private mTouchSlopSquare:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 213
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v0

    sput v0, Landroid/view/BackTouchGestureDetector;->LONGPRESS_TIMEOUT:I

    .line 214
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v0

    sput v0, Landroid/view/BackTouchGestureDetector;->TAP_TIMEOUT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/BackTouchGestureDetector$OnGestureListener;)V
    .locals 1
    .parameter "context"
    .parameter "listener"

    .prologue
    .line 352
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/BackTouchGestureDetector;-><init>(Landroid/content/Context;Landroid/view/BackTouchGestureDetector$OnGestureListener;Landroid/os/Handler;)V

    .line 353
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/BackTouchGestureDetector$OnGestureListener;Landroid/os/Handler;)V
    .locals 2
    .parameter "context"
    .parameter "listener"
    .parameter "handler"

    .prologue
    .line 367
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 258
    invoke-static {}, Landroid/view/InputEventConsistencyVerifier;->isInstrumentationEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Landroid/view/InputEventConsistencyVerifier;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/view/InputEventConsistencyVerifier;-><init>(Ljava/lang/Object;I)V

    :goto_0
    iput-object v0, p0, Landroid/view/BackTouchGestureDetector;->mInputEventConsistencyVerifier:Landroid/view/InputEventConsistencyVerifier;

    .line 368
    if-eqz p3, :cond_2

    .line 369
    new-instance v0, Landroid/view/BackTouchGestureDetector$GestureHandler;

    invoke-direct {v0, p0, p3}, Landroid/view/BackTouchGestureDetector$GestureHandler;-><init>(Landroid/view/BackTouchGestureDetector;Landroid/os/Handler;)V

    iput-object v0, p0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    .line 373
    :goto_1
    iput-object p2, p0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    .line 374
    instance-of v0, p2, Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    if-eqz v0, :cond_0

    .line 375
    check-cast p2, Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    .end local p2
    invoke-virtual {p0, p2}, Landroid/view/BackTouchGestureDetector;->setOnDoubleTapListener(Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;)V

    .line 377
    :cond_0
    invoke-direct {p0, p1}, Landroid/view/BackTouchGestureDetector;->init(Landroid/content/Context;)V

    .line 378
    return-void

    .line 258
    .restart local p2
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 371
    :cond_2
    new-instance v0, Landroid/view/BackTouchGestureDetector$GestureHandler;

    invoke-direct {v0, p0}, Landroid/view/BackTouchGestureDetector$GestureHandler;-><init>(Landroid/view/BackTouchGestureDetector;)V

    iput-object v0, p0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    goto :goto_1
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/BackTouchGestureDetector$OnGestureListener;Landroid/os/Handler;Z)V
    .locals 0
    .parameter "context"
    .parameter "listener"
    .parameter "handler"
    .parameter "unused"

    .prologue
    .line 394
    invoke-direct {p0, p1, p2, p3}, Landroid/view/BackTouchGestureDetector;-><init>(Landroid/content/Context;Landroid/view/BackTouchGestureDetector$OnGestureListener;Landroid/os/Handler;)V

    .line 395
    return-void
.end method

.method public constructor <init>(Landroid/view/BackTouchGestureDetector$OnGestureListener;)V
    .locals 1
    .parameter "listener"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 337
    invoke-direct {p0, v0, p1, v0}, Landroid/view/BackTouchGestureDetector;-><init>(Landroid/content/Context;Landroid/view/BackTouchGestureDetector$OnGestureListener;Landroid/os/Handler;)V

    .line 338
    return-void
.end method

.method public constructor <init>(Landroid/view/BackTouchGestureDetector$OnGestureListener;Landroid/os/Handler;)V
    .locals 1
    .parameter "listener"
    .parameter "handler"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 321
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Landroid/view/BackTouchGestureDetector;-><init>(Landroid/content/Context;Landroid/view/BackTouchGestureDetector$OnGestureListener;Landroid/os/Handler;)V

    .line 322
    return-void
.end method

.method static synthetic access$000(Landroid/view/BackTouchGestureDetector;)Landroid/view/MotionEvent;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    return-object v0
.end method

.method static synthetic access$100(Landroid/view/BackTouchGestureDetector;)Landroid/view/BackTouchGestureDetector$OnGestureListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    return-object v0
.end method

.method static synthetic access$200(Landroid/view/BackTouchGestureDetector;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/view/BackTouchGestureDetector;->dispatchLongPress()V

    return-void
.end method

.method static synthetic access$300(Landroid/view/BackTouchGestureDetector;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/view/BackTouchGestureDetector;->dispatchSpecialLongPress()V

    return-void
.end method

.method static synthetic access$400(Landroid/view/BackTouchGestureDetector;)Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mDoubleTapListener:Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    return-object v0
.end method

.method static synthetic access$500(Landroid/view/BackTouchGestureDetector;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-boolean v0, p0, Landroid/view/BackTouchGestureDetector;->mStillDown:Z

    return v0
.end method

.method static synthetic access$600(Landroid/view/BackTouchGestureDetector;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-boolean v0, p0, Landroid/view/BackTouchGestureDetector;->mIsFastTap:Z

    return v0
.end method

.method private cancel()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 680
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 681
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 682
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 683
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 684
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 685
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 686
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mIsDoubleTapping:Z

    .line 687
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mStillDown:Z

    .line 688
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mAlwaysInTapRegion:Z

    .line 689
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mAlwaysInBiggerTapRegion:Z

    .line 690
    iget-boolean v0, p0, Landroid/view/BackTouchGestureDetector;->mInLongPress:Z

    if-eqz v0, :cond_0

    .line 691
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mInLongPress:Z

    .line 693
    :cond_0
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mInSpecialLongPress:Z

    .line 694
    return-void
.end method

.method private cancelTaps()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 697
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 698
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 699
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 700
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mIsDoubleTapping:Z

    .line 701
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mAlwaysInTapRegion:Z

    .line 702
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mAlwaysInBiggerTapRegion:Z

    .line 703
    iget-boolean v0, p0, Landroid/view/BackTouchGestureDetector;->mInLongPress:Z

    if-eqz v0, :cond_0

    .line 704
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mInLongPress:Z

    .line 706
    :cond_0
    return-void
.end method

.method private dispatchLongPress()V
    .locals 2

    .prologue
    .line 731
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 732
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/view/BackTouchGestureDetector;->mInLongPress:Z

    .line 733
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    iget-object v1, p0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v0, v1}, Landroid/view/BackTouchGestureDetector$OnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    .line 734
    return-void
.end method

.method private dispatchSpecialLongPress()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 737
    iput-boolean v1, p0, Landroid/view/BackTouchGestureDetector;->mInSpecialLongPress:Z

    .line 738
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    invoke-interface {v0, v1}, Landroid/view/BackTouchGestureDetector$OnGestureListener;->onSpecialLongPress(Z)V

    .line 739
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    .line 398
    iget-object v4, p0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    if-nez v4, :cond_0

    .line 399
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "OnGestureListener must not be null"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 401
    :cond_0
    const/4 v4, 0x1

    iput-boolean v4, p0, Landroid/view/BackTouchGestureDetector;->mIsLongpressEnabled:Z

    .line 405
    if-nez p1, :cond_1

    .line 407
    invoke-static {}, Landroid/view/ViewConfiguration;->getTouchSlop()I

    move-result v3

    .line 408
    .local v3, touchSlop:I
    move v2, v3

    .line 409
    .local v2, doubleTapTouchSlop:I
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapSlop()I

    move-result v1

    .line 411
    .local v1, doubleTapSlop:I
    invoke-static {}, Landroid/view/ViewConfiguration;->getMinimumFlingVelocity()I

    move-result v4

    iput v4, p0, Landroid/view/BackTouchGestureDetector;->mMinimumFlingVelocity:I

    .line 412
    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumFlingVelocity()I

    move-result v4

    iput v4, p0, Landroid/view/BackTouchGestureDetector;->mMaximumFlingVelocity:I

    .line 422
    :goto_0
    mul-int v4, v3, v3

    iput v4, p0, Landroid/view/BackTouchGestureDetector;->mTouchSlopSquare:I

    .line 423
    mul-int v4, v2, v2

    iput v4, p0, Landroid/view/BackTouchGestureDetector;->mDoubleTapTouchSlopSquare:I

    .line 424
    mul-int v4, v1, v1

    iput v4, p0, Landroid/view/BackTouchGestureDetector;->mDoubleTapSlopSquare:I

    .line 425
    return-void

    .line 414
    .end local v1           #doubleTapSlop:I
    .end local v2           #doubleTapTouchSlop:I
    .end local v3           #touchSlop:I
    :cond_1
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 415
    .local v0, configuration:Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v3

    .line 416
    .restart local v3       #touchSlop:I
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledDoubleTapTouchSlop()I

    move-result v2

    .line 418
    .restart local v2       #doubleTapTouchSlop:I
    const/16 v1, 0x28

    .line 419
    .restart local v1       #doubleTapSlop:I
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v4

    iput v4, p0, Landroid/view/BackTouchGestureDetector;->mMinimumFlingVelocity:I

    .line 420
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v4

    iput v4, p0, Landroid/view/BackTouchGestureDetector;->mMaximumFlingVelocity:I

    goto :goto_0
.end method

.method private isConsideredDoubleTap(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 10
    .parameter "firstDown"
    .parameter "firstUp"
    .parameter "secondUp"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 710
    iget-boolean v4, p0, Landroid/view/BackTouchGestureDetector;->mAlwaysInBiggerTapRegion:Z

    if-nez v4, :cond_1

    .line 727
    :cond_0
    :goto_0
    return v3

    .line 714
    :cond_1
    const-string v4, "BackTouch_GestureDetector"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "double tap duration:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v8

    sub-long/2addr v6, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 715
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x96

    cmp-long v4, v4, v6

    if-gez v4, :cond_2

    .line 716
    iput-boolean v2, p0, Landroid/view/BackTouchGestureDetector;->mIsFastTap:Z

    goto :goto_0

    .line 720
    :cond_2
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x190

    cmp-long v4, v4, v6

    if-gtz v4, :cond_0

    .line 724
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v5, v5

    sub-int v0, v4, v5

    .line 725
    .local v0, deltaX:I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    float-to-int v5, v5

    sub-int v1, v4, v5

    .line 726
    .local v1, deltaY:I
    const-string v4, "BackTouch_GestureDetector"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "double tap slop:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    mul-int v6, v0, v0

    mul-int v7, v1, v1

    add-int/2addr v6, v7

    int-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 727
    mul-int v4, v0, v0

    mul-int v5, v1, v1

    add-int/2addr v4, v5

    iget v5, p0, Landroid/view/BackTouchGestureDetector;->mDoubleTapSlopSquare:I

    if-ge v4, v5, :cond_3

    :goto_1
    move v3, v2

    goto/16 :goto_0

    :cond_3
    move v2, v3

    goto :goto_1
.end method


# virtual methods
.method public dump(Ljava/io/PrintWriter;)V
    .locals 2
    .parameter "pw"

    .prologue
    .line 428
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mMinimumFlingVelocity="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/view/BackTouchGestureDetector;->mMinimumFlingVelocity:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 429
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mMaximumFlingVelocity="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/view/BackTouchGestureDetector;->mMaximumFlingVelocity:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 430
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mTouchSlopSquare="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/view/BackTouchGestureDetector;->mTouchSlopSquare:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 431
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mDoubleTapTouchSlopSquare="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/view/BackTouchGestureDetector;->mDoubleTapTouchSlopSquare:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 432
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mDoubleTapSlopSquare="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/view/BackTouchGestureDetector;->mDoubleTapSlopSquare:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 433
    return-void
.end method

.method public isLongpressEnabled()Z
    .locals 1

    .prologue
    .line 463
    iget-boolean v0, p0, Landroid/view/BackTouchGestureDetector;->mIsLongpressEnabled:Z

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 43
    .parameter "ev"

    .prologue
    .line 475
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mInputEventConsistencyVerifier:Landroid/view/InputEventConsistencyVerifier;

    move-object/from16 v37, v0

    if-eqz v37, :cond_0

    .line 476
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mInputEventConsistencyVerifier:Landroid/view/InputEventConsistencyVerifier;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, p1

    move/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Landroid/view/InputEventConsistencyVerifier;->onTouchEvent(Landroid/view/MotionEvent;I)V

    .line 479
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    .line 481
    .local v5, action:I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v37, v0

    if-nez v37, :cond_1

    .line 482
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 484
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 486
    and-int/lit16 v0, v5, 0xff

    move/from16 v37, v0

    const/16 v38, 0x6

    move/from16 v0, v37

    move/from16 v1, v38

    if-ne v0, v1, :cond_2

    const/16 v21, 0x1

    .line 488
    .local v21, pointerUp:Z
    :goto_0
    if-eqz v21, :cond_3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v24

    .line 491
    .local v24, skipIndex:I
    :goto_1
    const/16 v25, 0x0

    .local v25, sumX:F
    const/16 v26, 0x0

    .line 492
    .local v26, sumY:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    .line 493
    .local v6, count:I
    const/16 v17, 0x0

    .local v17, i:I
    :goto_2
    move/from16 v0, v17

    if-ge v0, v6, :cond_5

    .line 494
    move/from16 v0, v24

    move/from16 v1, v17

    if-ne v0, v1, :cond_4

    .line 493
    :goto_3
    add-int/lit8 v17, v17, 0x1

    goto :goto_2

    .line 486
    .end local v6           #count:I
    .end local v17           #i:I
    .end local v21           #pointerUp:Z
    .end local v24           #skipIndex:I
    .end local v25           #sumX:F
    .end local v26           #sumY:F
    :cond_2
    const/16 v21, 0x0

    goto :goto_0

    .line 488
    .restart local v21       #pointerUp:Z
    :cond_3
    const/16 v24, -0x1

    goto :goto_1

    .line 495
    .restart local v6       #count:I
    .restart local v17       #i:I
    .restart local v24       #skipIndex:I
    .restart local v25       #sumX:F
    .restart local v26       #sumY:F
    :cond_4
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v37

    add-float v25, v25, v37

    .line 496
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v37

    add-float v26, v26, v37

    goto :goto_3

    .line 498
    :cond_5
    if-eqz v21, :cond_8

    add-int/lit8 v11, v6, -0x1

    .line 499
    .local v11, div:I
    :goto_4
    int-to-float v0, v11

    move/from16 v37, v0

    div-float v13, v25, v37

    .line 500
    .local v13, focusX:F
    int-to-float v0, v11

    move/from16 v37, v0

    div-float v14, v26, v37

    .line 502
    .local v14, focusY:F
    const/16 v16, 0x0

    .line 504
    .local v16, handled:Z
    and-int/lit16 v0, v5, 0xff

    move/from16 v37, v0

    packed-switch v37, :pswitch_data_0

    .line 673
    :cond_6
    :goto_5
    :pswitch_0
    if-nez v16, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mInputEventConsistencyVerifier:Landroid/view/InputEventConsistencyVerifier;

    move-object/from16 v37, v0

    if-eqz v37, :cond_7

    .line 674
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mInputEventConsistencyVerifier:Landroid/view/InputEventConsistencyVerifier;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, p1

    move/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Landroid/view/InputEventConsistencyVerifier;->onUnhandledEvent(Landroid/view/InputEvent;I)V

    .line 676
    :cond_7
    return v16

    .end local v11           #div:I
    .end local v13           #focusX:F
    .end local v14           #focusY:F
    .end local v16           #handled:Z
    :cond_8
    move v11, v6

    .line 498
    goto :goto_4

    .line 506
    .restart local v11       #div:I
    .restart local v13       #focusX:F
    .restart local v14       #focusY:F
    .restart local v16       #handled:Z
    :pswitch_1
    move-object/from16 v0, p0

    iput v13, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusX:F

    move-object/from16 v0, p0

    iput v13, v0, Landroid/view/BackTouchGestureDetector;->mDownFocusX:F

    .line 507
    move-object/from16 v0, p0

    iput v14, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusY:F

    move-object/from16 v0, p0

    iput v14, v0, Landroid/view/BackTouchGestureDetector;->mDownFocusY:F

    .line 509
    invoke-direct/range {p0 .. p0}, Landroid/view/BackTouchGestureDetector;->cancelTaps()V

    goto :goto_5

    .line 513
    :pswitch_2
    move-object/from16 v0, p0

    iput v13, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusX:F

    move-object/from16 v0, p0

    iput v13, v0, Landroid/view/BackTouchGestureDetector;->mDownFocusX:F

    .line 514
    move-object/from16 v0, p0

    iput v14, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusY:F

    move-object/from16 v0, p0

    iput v14, v0, Landroid/view/BackTouchGestureDetector;->mDownFocusY:F

    .line 518
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v37, v0

    const/16 v38, 0x3e8

    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/BackTouchGestureDetector;->mMaximumFlingVelocity:I

    move/from16 v39, v0

    move/from16 v0, v39

    int-to-float v0, v0

    move/from16 v39, v0

    invoke-virtual/range {v37 .. v39}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 519
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v29

    .line 520
    .local v29, upIndex:I
    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v18

    .line 521
    .local v18, id1:I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v34

    .line 522
    .local v34, x1:F
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v36

    .line 523
    .local v36, y1:F
    const/16 v17, 0x0

    :goto_6
    move/from16 v0, v17

    if-ge v0, v6, :cond_6

    .line 524
    move/from16 v0, v17

    move/from16 v1, v29

    if-ne v0, v1, :cond_a

    .line 523
    :cond_9
    add-int/lit8 v17, v17, 0x1

    goto :goto_6

    .line 526
    :cond_a
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v19

    .line 527
    .local v19, id2:I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v37

    mul-float v33, v34, v37

    .line 528
    .local v33, x:F
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v37

    mul-float v35, v36, v37

    .line 530
    .local v35, y:F
    add-float v12, v33, v35

    .line 531
    .local v12, dot:F
    const/16 v37, 0x0

    cmpg-float v37, v12, v37

    if-gez v37, :cond_9

    .line 532
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Landroid/view/VelocityTracker;->clear()V

    goto/16 :goto_5

    .line 539
    .end local v12           #dot:F
    .end local v18           #id1:I
    .end local v19           #id2:I
    .end local v29           #upIndex:I
    .end local v33           #x:F
    .end local v34           #x1:F
    .end local v35           #y:F
    .end local v36           #y1:F
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mDoubleTapListener:Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    move-object/from16 v37, v0

    if-eqz v37, :cond_b

    .line 540
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x3

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v15

    .line 541
    .local v15, hadTapMessage:Z
    if-eqz v15, :cond_e

    .line 542
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x3

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 549
    .end local v15           #hadTapMessage:Z
    :cond_b
    :goto_7
    move-object/from16 v0, p0

    iput v13, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusX:F

    move-object/from16 v0, p0

    iput v13, v0, Landroid/view/BackTouchGestureDetector;->mDownFocusX:F

    .line 550
    move-object/from16 v0, p0

    iput v14, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusY:F

    move-object/from16 v0, p0

    iput v14, v0, Landroid/view/BackTouchGestureDetector;->mDownFocusY:F

    .line 551
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    if-eqz v37, :cond_c

    .line 552
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Landroid/view/MotionEvent;->recycle()V

    .line 554
    :cond_c
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    .line 555
    const/16 v37, 0x1

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mAlwaysInTapRegion:Z

    .line 556
    const/16 v37, 0x1

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mAlwaysInBiggerTapRegion:Z

    .line 557
    const/16 v37, 0x1

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mStillDown:Z

    .line 558
    const/16 v37, 0x0

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mInLongPress:Z

    .line 559
    const/16 v37, 0x0

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mInSpecialLongPress:Z

    .line 560
    const/16 v37, 0x0

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mIsFastTap:Z

    .line 562
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/view/BackTouchGestureDetector;->mIsLongpressEnabled:Z

    move/from16 v37, v0

    if-eqz v37, :cond_d

    .line 563
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x2

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 564
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v39

    sget v41, Landroid/view/BackTouchGestureDetector;->TAP_TIMEOUT:I

    move/from16 v0, v41

    int-to-long v0, v0

    move-wide/from16 v41, v0

    add-long v39, v39, v41

    sget v41, Landroid/view/BackTouchGestureDetector;->LONGPRESS_TIMEOUT:I

    move/from16 v0, v41

    int-to-long v0, v0

    move-wide/from16 v41, v0

    add-long v39, v39, v41

    invoke-virtual/range {v37 .. v40}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 567
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x4

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 568
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v39

    const-wide/16 v41, 0xc8

    add-long v39, v39, v41

    invoke-virtual/range {v37 .. v40}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 571
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v39

    sget v41, Landroid/view/BackTouchGestureDetector;->TAP_TIMEOUT:I

    move/from16 v0, v41

    int-to-long v0, v0

    move-wide/from16 v41, v0

    add-long v39, v39, v41

    invoke-virtual/range {v37 .. v40}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 572
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/BackTouchGestureDetector$OnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result v37

    or-int v16, v16, v37

    .line 573
    goto/16 :goto_5

    .line 545
    .restart local v15       #hadTapMessage:Z
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x3

    const-wide/16 v39, 0x190

    invoke-virtual/range {v37 .. v40}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_7

    .line 576
    .end local v15           #hadTapMessage:Z
    :pswitch_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/view/BackTouchGestureDetector;->mInLongPress:Z

    move/from16 v37, v0

    if-eqz v37, :cond_f

    .line 579
    :cond_f
    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusX:F

    move/from16 v37, v0

    sub-float v22, v37, v13

    .line 580
    .local v22, scrollX:F
    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusY:F

    move/from16 v37, v0

    sub-float v23, v37, v14

    .line 581
    .local v23, scrollY:F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/view/BackTouchGestureDetector;->mIsDoubleTapping:Z

    move/from16 v37, v0

    if-eqz v37, :cond_10

    .line 583
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mDoubleTapListener:Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result v37

    or-int v16, v16, v37

    goto/16 :goto_5

    .line 584
    :cond_10
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/view/BackTouchGestureDetector;->mAlwaysInTapRegion:Z

    move/from16 v37, v0

    if-eqz v37, :cond_12

    .line 585
    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/BackTouchGestureDetector;->mDownFocusX:F

    move/from16 v37, v0

    sub-float v37, v13, v37

    move/from16 v0, v37

    float-to-int v8, v0

    .line 586
    .local v8, deltaX:I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/BackTouchGestureDetector;->mDownFocusY:F

    move/from16 v37, v0

    sub-float v37, v14, v37

    move/from16 v0, v37

    float-to-int v9, v0

    .line 587
    .local v9, deltaY:I
    mul-int v37, v8, v8

    mul-int v38, v9, v9

    add-int v10, v37, v38

    .line 588
    .local v10, distance:I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/BackTouchGestureDetector;->mTouchSlopSquare:I

    move/from16 v37, v0

    move/from16 v0, v37

    if-le v10, v0, :cond_11

    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v38, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, p1

    move/from16 v3, v22

    move/from16 v4, v23

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/BackTouchGestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v16

    .line 590
    move-object/from16 v0, p0

    iput v13, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusX:F

    .line 591
    move-object/from16 v0, p0

    iput v14, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusY:F

    .line 592
    const/16 v37, 0x0

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mAlwaysInTapRegion:Z

    .line 593
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x3

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 594
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x1

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 595
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x2

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 596
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x4

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 598
    :cond_11
    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/BackTouchGestureDetector;->mDoubleTapTouchSlopSquare:I

    move/from16 v37, v0

    move/from16 v0, v37

    if-le v10, v0, :cond_6

    .line 599
    const/16 v37, 0x0

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mAlwaysInBiggerTapRegion:Z

    goto/16 :goto_5

    .line 601
    .end local v8           #deltaX:I
    .end local v9           #deltaY:I
    .end local v10           #distance:I
    :cond_12
    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->abs(F)F

    move-result v37

    const/high16 v38, 0x3f80

    cmpl-float v37, v37, v38

    if-gez v37, :cond_13

    invoke-static/range {v23 .. v23}, Ljava/lang/Math;->abs(F)F

    move-result v37

    const/high16 v38, 0x3f80

    cmpl-float v37, v37, v38

    if-ltz v37, :cond_6

    .line 602
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v38, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, p1

    move/from16 v3, v22

    move/from16 v4, v23

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/BackTouchGestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v16

    .line 603
    move-object/from16 v0, p0

    iput v13, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusX:F

    .line 604
    move-object/from16 v0, p0

    iput v14, v0, Landroid/view/BackTouchGestureDetector;->mLastFocusY:F

    goto/16 :goto_5

    .line 609
    .end local v22           #scrollX:F
    .end local v23           #scrollY:F
    :pswitch_5
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mDoubleTapListener:Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    move-object/from16 v37, v0

    if-eqz v37, :cond_14

    .line 610
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    if-eqz v37, :cond_14

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mPreviousUpEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    if-eqz v37, :cond_14

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mPreviousUpEvent:Landroid/view/MotionEvent;

    move-object/from16 v38, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Landroid/view/BackTouchGestureDetector;->isConsideredDoubleTap(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    move-result v37

    if-eqz v37, :cond_14

    .line 612
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mDoubleTapListener:Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result v37

    or-int v16, v16, v37

    .line 616
    :cond_14
    const/16 v37, 0x0

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mStillDown:Z

    .line 617
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v7

    .line 618
    .local v7, currentUpEvent:Landroid/view/MotionEvent;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/view/BackTouchGestureDetector;->mIsDoubleTapping:Z

    move/from16 v37, v0

    if-eqz v37, :cond_18

    .line 620
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mDoubleTapListener:Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result v37

    or-int v16, v16, v37

    .line 651
    :cond_15
    :goto_8
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mPreviousUpEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    if-eqz v37, :cond_16

    .line 652
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mPreviousUpEvent:Landroid/view/MotionEvent;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Landroid/view/MotionEvent;->recycle()V

    .line 655
    :cond_16
    move-object/from16 v0, p0

    iput-object v7, v0, Landroid/view/BackTouchGestureDetector;->mPreviousUpEvent:Landroid/view/MotionEvent;

    .line 656
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v37, v0

    if-eqz v37, :cond_17

    .line 659
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Landroid/view/VelocityTracker;->recycle()V

    .line 660
    const/16 v37, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 662
    :cond_17
    const/16 v37, 0x0

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mIsDoubleTapping:Z

    .line 663
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x1

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 664
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x2

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 665
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x4

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    goto/16 :goto_5

    .line 621
    :cond_18
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/view/BackTouchGestureDetector;->mInSpecialLongPress:Z

    move/from16 v37, v0

    if-eqz v37, :cond_19

    .line 622
    const/16 v37, 0x0

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mInSpecialLongPress:Z

    .line 623
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    invoke-interface/range {v37 .. v38}, Landroid/view/BackTouchGestureDetector$OnGestureListener;->onSpecialLongPress(Z)V

    goto :goto_8

    .line 624
    :cond_19
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/view/BackTouchGestureDetector;->mInLongPress:Z

    move/from16 v37, v0

    if-eqz v37, :cond_1a

    .line 625
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x3

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 626
    const/16 v37, 0x0

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mInLongPress:Z

    goto/16 :goto_8

    .line 627
    :cond_1a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/view/BackTouchGestureDetector;->mAlwaysInTapRegion:Z

    move/from16 v37, v0

    if-eqz v37, :cond_1c

    .line 628
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v37

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v39

    sub-long v27, v37, v39

    .line 629
    .local v27, tapDuration:J
    const-wide/16 v37, 0x37

    cmp-long v37, v27, v37

    if-gez v37, :cond_1b

    .line 630
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mHandler:Landroid/os/Handler;

    move-object/from16 v37, v0

    const/16 v38, 0x3

    invoke-virtual/range {v37 .. v38}, Landroid/os/Handler;->removeMessages(I)V

    .line 631
    const/16 v37, 0x1

    move/from16 v0, v37

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/view/BackTouchGestureDetector;->mIsFastTap:Z

    .line 632
    const-string v37, "BackTouch_GestureDetector"

    new-instance v38, Ljava/lang/StringBuilder;

    invoke-direct/range {v38 .. v38}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "detect fast single tap duration:"

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    move-object/from16 v0, v38

    move-wide/from16 v1, v27

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v37 .. v38}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 636
    :goto_9
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Landroid/view/BackTouchGestureDetector$OnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v16

    .line 637
    goto/16 :goto_8

    .line 634
    :cond_1b
    const-string v37, "BackTouch_GestureDetector"

    new-instance v38, Ljava/lang/StringBuilder;

    invoke-direct/range {v38 .. v38}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "single tap duration:"

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    move-object/from16 v0, v38

    move-wide/from16 v1, v27

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v37 .. v38}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 640
    .end local v27           #tapDuration:J
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v30, v0

    .line 641
    .local v30, velocityTracker:Landroid/view/VelocityTracker;
    const/16 v37, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v20

    .line 642
    .local v20, pointerId:I
    const/16 v37, 0x3e8

    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/BackTouchGestureDetector;->mMaximumFlingVelocity:I

    move/from16 v38, v0

    move/from16 v0, v38

    int-to-float v0, v0

    move/from16 v38, v0

    move-object/from16 v0, v30

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 643
    move-object/from16 v0, v30

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v32

    .line 644
    .local v32, velocityY:F
    move-object/from16 v0, v30

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v31

    .line 646
    .local v31, velocityX:F
    invoke-static/range {v32 .. v32}, Ljava/lang/Math;->abs(F)F

    move-result v37

    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/BackTouchGestureDetector;->mMinimumFlingVelocity:I

    move/from16 v38, v0

    move/from16 v0, v38

    int-to-float v0, v0

    move/from16 v38, v0

    cmpl-float v37, v37, v38

    if-gtz v37, :cond_1d

    invoke-static/range {v31 .. v31}, Ljava/lang/Math;->abs(F)F

    move-result v37

    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/BackTouchGestureDetector;->mMinimumFlingVelocity:I

    move/from16 v38, v0

    move/from16 v0, v38

    int-to-float v0, v0

    move/from16 v38, v0

    cmpl-float v37, v37, v38

    if-lez v37, :cond_15

    .line 648
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;

    move-object/from16 v38, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, p1

    move/from16 v3, v31

    move/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/BackTouchGestureDetector$OnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v16

    goto/16 :goto_8

    .line 669
    .end local v7           #currentUpEvent:Landroid/view/MotionEvent;
    .end local v20           #pointerId:I
    .end local v30           #velocityTracker:Landroid/view/VelocityTracker;
    .end local v31           #velocityX:F
    .end local v32           #velocityY:F
    :pswitch_6
    invoke-direct/range {p0 .. p0}, Landroid/view/BackTouchGestureDetector;->cancel()V

    goto/16 :goto_5

    .line 504
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setIsLongpressEnabled(Z)V
    .locals 0
    .parameter "isLongpressEnabled"

    .prologue
    .line 456
    iput-boolean p1, p0, Landroid/view/BackTouchGestureDetector;->mIsLongpressEnabled:Z

    .line 457
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;)V
    .locals 0
    .parameter "onDoubleTapListener"

    .prologue
    .line 443
    iput-object p1, p0, Landroid/view/BackTouchGestureDetector;->mDoubleTapListener:Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    .line 444
    return-void
.end method
