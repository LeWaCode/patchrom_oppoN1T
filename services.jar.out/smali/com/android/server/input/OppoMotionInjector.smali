.class public Lcom/android/server/input/OppoMotionInjector;
.super Ljava/lang/Object;
.source "OppoMotionInjector.java"


# static fields
.field private static final DEBUG:Z = true


# instance fields
.field private MIN_TIME_STEP:F

.field private lastPoint:Landroid/view/MotionEvent;

.field private mCancelPending:Z

.field private mHandler:Landroid/os/Handler;

.field private mSv:Lcom/android/server/input/InputManagerService;

.field private tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/android/server/input/InputManagerService;)V
    .locals 3
    .parameter "sv"

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const-string v1, "BackTouch_OppoMotionInjector"

    iput-object v1, p0, Lcom/android/server/input/OppoMotionInjector;->tag:Ljava/lang/String;

    .line 15
    const/high16 v1, 0x4120

    iput v1, p0, Lcom/android/server/input/OppoMotionInjector;->MIN_TIME_STEP:F

    .line 22
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "inject_thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 23
    .local v0, thd:Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 24
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/server/input/OppoMotionInjector;->mHandler:Landroid/os/Handler;

    .line 25
    iput-object p1, p0, Lcom/android/server/input/OppoMotionInjector;->mSv:Lcom/android/server/input/InputManagerService;

    .line 26
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/input/OppoMotionInjector;)Lcom/android/server/input/InputManagerService;
    .locals 1
    .parameter "x0"

    .prologue
    .line 12
    iget-object v0, p0, Lcom/android/server/input/OppoMotionInjector;->mSv:Lcom/android/server/input/InputManagerService;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/input/OppoMotionInjector;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 12
    iget-boolean v0, p0, Lcom/android/server/input/OppoMotionInjector;->mCancelPending:Z

    return v0
.end method

.method static synthetic access$102(Lcom/android/server/input/OppoMotionInjector;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 12
    iput-boolean p1, p0, Lcom/android/server/input/OppoMotionInjector;->mCancelPending:Z

    return p1
.end method

.method private injectPendingMotion(JJIFFIIJ)V
    .locals 16
    .parameter "downTime"
    .parameter "eventTime"
    .parameter "action"
    .parameter "x"
    .parameter "y"
    .parameter "deviceId"
    .parameter "source"
    .parameter "sleepMills"

    .prologue
    .line 34
    const/high16 v9, 0x3f80

    const/high16 v10, 0x3f80

    const/4 v11, 0x0

    const/high16 v12, 0x3f80

    const/high16 v13, 0x3f80

    const/4 v15, 0x0

    move-wide/from16 v2, p1

    move-wide/from16 v4, p3

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v14, p8

    invoke-static/range {v2 .. v15}, Landroid/view/MotionEvent;->obtain(JJIFFFFIFFII)Landroid/view/MotionEvent;

    move-result-object v4

    .line 35
    .local v4, injectEvent:Landroid/view/MotionEvent;
    move/from16 v0, p9

    invoke-virtual {v4, v0}, Landroid/view/MotionEvent;->setSource(I)V

    .line 36
    const/4 v2, 0x1

    move/from16 v0, p5

    if-eq v0, v2, :cond_0

    const/4 v2, 0x3

    move/from16 v0, p5

    if-ne v0, v2, :cond_1

    .line 37
    :cond_0
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/server/input/OppoMotionInjector;->mCancelPending:Z

    .line 39
    :cond_1
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/server/input/OppoMotionInjector;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/server/input/OppoMotionInjector$1;

    move-object/from16 v3, p0

    move/from16 v5, p5

    move-wide/from16 v6, p10

    invoke-direct/range {v2 .. v7}, Lcom/android/server/input/OppoMotionInjector$1;-><init>(Lcom/android/server/input/OppoMotionInjector;Landroid/view/MotionEvent;IJ)V

    invoke-virtual {v8, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 55
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/input/OppoMotionInjector;->tag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "inject pending at:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " event:x:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p6

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " y:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p7

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    return-void
.end method


# virtual methods
.method public dump(Ljava/io/PrintWriter;)V
    .locals 2
    .parameter "pw"

    .prologue
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MIN_TIME_STEP="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/input/OppoMotionInjector;->MIN_TIME_STEP:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 30
    return-void
.end method

.method public enqueue(Landroid/view/MotionEvent;)V
    .locals 31
    .parameter "e"

    .prologue
    .line 59
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_2

    .line 60
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    if-eqz v2, :cond_0

    .line 61
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 63
    :cond_0
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    .line 64
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v8

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v10

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v11

    const-wide/16 v12, 0x0

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v13}, Lcom/android/server/input/OppoMotionInjector;->injectPendingMotion(JJIFFIIJ)V

    .line 110
    :cond_1
    :goto_0
    return-void

    .line 67
    :cond_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float v23, v2, v3

    .line 68
    .local v23, deltaX:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    sub-float v24, v2, v3

    .line 69
    .local v24, deltaY:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    invoke-virtual {v4}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v10

    sub-long/2addr v2, v10

    long-to-float v0, v2

    move/from16 v22, v0

    .line 71
    .local v22, deltaTime:F
    const/4 v2, 0x0

    cmpl-float v2, v22, v2

    if-nez v2, :cond_3

    .line 72
    const/high16 v22, 0x3f80

    .line 75
    :cond_3
    mul-float v2, v23, v23

    mul-float v3, v24, v24

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    move/from16 v0, v22

    float-to-double v10, v0

    div-double/2addr v2, v10

    double-to-float v0, v2

    move/from16 v28, v0

    .line 78
    .local v28, velocity:F
    move/from16 v0, v28

    float-to-double v2, v0

    const-wide v10, 0x3fd3333333333333L

    cmpg-double v2, v2, v10

    if-gez v2, :cond_4

    const/4 v2, 0x0

    cmpl-float v2, v28, v2

    if-lez v2, :cond_4

    .line 79
    mul-float v2, v28, v22

    const/high16 v3, 0x4000

    div-float v22, v2, v3

    .line 82
    :cond_4
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/server/input/OppoMotionInjector;->MIN_TIME_STEP:F

    div-float v26, v22, v2

    .line 83
    .local v26, steps:F
    div-float v27, v22, v26

    .line 84
    .local v27, timeStep:F
    div-float v29, v23, v26

    .line 85
    .local v29, xStep:F
    div-float v30, v24, v26

    .line 88
    .local v30, yStep:F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/input/OppoMotionInjector;->tag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "deltaX:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " deltaY:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v24

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " deltaTime:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "steps:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v26

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " timeStep:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " xStep:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v29

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "yStep"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v30

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    const/16 v25, 0x0

    .local v25, i:I
    :goto_1
    move/from16 v0, v25

    int-to-float v2, v0

    cmpg-float v2, v2, v26

    if-gez v2, :cond_5

    .line 96
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    long-to-float v2, v2

    move/from16 v0, v25

    int-to-float v3, v0

    mul-float v3, v3, v27

    add-float/2addr v2, v3

    float-to-long v5, v2

    .line 97
    .local v5, eventTime:J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    move/from16 v0, v25

    int-to-float v3, v0

    mul-float v3, v3, v29

    add-float v8, v2, v3

    .line 98
    .local v8, x:F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    move/from16 v0, v25

    int-to-float v3, v0

    mul-float v3, v3, v30

    add-float v9, v2, v3

    .line 99
    .local v9, y:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v3

    const/4 v7, 0x2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v10

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v11

    move/from16 v0, v27

    float-to-long v12, v0

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v13}, Lcom/android/server/input/OppoMotionInjector;->injectPendingMotion(JJIFFIIJ)V

    .line 95
    add-int/lit8 v25, v25, 0x1

    goto :goto_1

    .line 103
    .end local v5           #eventTime:J
    .end local v8           #x:F
    .end local v9           #y:F
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    if-eqz v2, :cond_6

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 104
    :cond_6
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/input/OppoMotionInjector;->lastPoint:Landroid/view/MotionEvent;

    .line 105
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_7

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 106
    :cond_7
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v11

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v13

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v15

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v16

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v17

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v18

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v19

    const-wide/16 v20, 0x0

    move-object/from16 v10, p0

    invoke-direct/range {v10 .. v21}, Lcom/android/server/input/OppoMotionInjector;->injectPendingMotion(JJIFFIIJ)V

    goto/16 :goto_0
.end method
