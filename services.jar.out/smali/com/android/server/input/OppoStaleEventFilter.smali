.class public Lcom/android/server/input/OppoStaleEventFilter;
.super Ljava/lang/Object;
.source "OppoStaleEventFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;
    }
.end annotation


# static fields
.field private static final BIG_CHANGE_THRESHOLD:F = 80.0f

.field private static final DEBUG:Z = true

.field private static final MIN_CHANGE_POINTS:I = 0x6

.field private static final SMALL_CHANGE_THRESHOLD:F = 60.0f

.field private static final tag:Ljava/lang/String; = "BackTouch_StaleEventFilter"


# instance fields
.field private angleCount:I

.field private bigChange:I

.field private changeAngleSum:F

.field private intercepted:Z

.field private lastAngle:F

.field private lastX:F

.field private lastY:F

.field private mLsnr:Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;

.field private motionBuf:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/MotionEvent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;)V
    .locals 1
    .parameter "lsnr"

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/android/server/input/OppoStaleEventFilter;->motionBuf:Ljava/util/List;

    .line 31
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/input/OppoStaleEventFilter;->bigChange:I

    .line 33
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/input/OppoStaleEventFilter;->changeAngleSum:F

    .line 40
    iput-object p1, p0, Lcom/android/server/input/OppoStaleEventFilter;->mLsnr:Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;

    .line 41
    return-void
.end method

.method public static angle(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)F
    .locals 6
    .parameter "from"
    .parameter "to"

    .prologue
    const/4 v4, 0x0

    .line 44
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p0}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float v0, v2, v3

    .line 45
    .local v0, dx:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {p0}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    add-float v1, v2, v3

    .line 46
    .local v1, dy:F
    cmpl-float v2, v0, v4

    if-nez v2, :cond_0

    cmpl-float v2, v1, v4

    if-eqz v2, :cond_1

    .line 47
    :cond_0
    float-to-double v2, v1

    float-to-double v4, v0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    const-wide v4, 0x4066800000000000L

    mul-double/2addr v2, v4

    const-wide v4, 0x400921fb54442d18L

    div-double/2addr v2, v4

    double-to-float v2, v2

    .line 49
    :goto_0
    return v2

    :cond_1
    const/high16 v2, 0x43b4

    goto :goto_0
.end method

.method private findBigChange(Landroid/view/MotionEvent;F)V
    .locals 8
    .parameter "event"
    .parameter "angle"

    .prologue
    const/4 v7, 0x6

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 84
    iget v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->bigChange:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->bigChange:I

    .line 85
    iget v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->bigChange:I

    if-ne v2, v5, :cond_0

    .line 86
    const/4 v2, 0x0

    iput v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->changeAngleSum:F

    .line 88
    :cond_0
    iget v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->bigChange:I

    if-ge v2, v7, :cond_3

    .line 94
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-eq v2, v5, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_2

    .line 96
    :cond_1
    iget v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastX:F

    iget v3, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastY:F

    invoke-virtual {p1, v2, v3}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 98
    const-string v2, "BackTouch_StaleEventFilter"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "detect bend, pass event:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    iget-object v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->mLsnr:Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;

    invoke-interface {v2, p1}, Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;->onEventFilted(Landroid/view/MotionEvent;)V

    .line 105
    :goto_0
    iput-boolean v5, p0, Lcom/android/server/input/OppoStaleEventFilter;->intercepted:Z

    .line 119
    :goto_1
    return-void

    .line 101
    :cond_2
    const-string v2, "BackTouch_StaleEventFilter"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "detect change, angle:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iget-object v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->motionBuf:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    iget v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->changeAngleSum:F

    add-float/2addr v2, p2

    iput v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->changeAngleSum:F

    goto :goto_0

    .line 108
    :cond_3
    iget-object v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->motionBuf:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MotionEvent;

    .line 109
    .local v0, e:Landroid/view/MotionEvent;
    const-string v2, "BackTouch_StaleEventFilter"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "real action, pass event:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    iget-object v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->mLsnr:Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;

    invoke-interface {v2, v0}, Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;->onEventFilted(Landroid/view/MotionEvent;)V

    goto :goto_2

    .line 113
    .end local v0           #e:Landroid/view/MotionEvent;
    :cond_4
    iget-object v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->motionBuf:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 114
    iput-boolean v6, p0, Lcom/android/server/input/OppoStaleEventFilter;->intercepted:Z

    .line 115
    iput v6, p0, Lcom/android/server/input/OppoStaleEventFilter;->bigChange:I

    .line 116
    iget v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->changeAngleSum:F

    const/high16 v3, 0x40c0

    div-float/2addr v2, v3

    iput v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastAngle:F

    .line 117
    iput v7, p0, Lcom/android/server/input/OppoStaleEventFilter;->angleCount:I

    goto :goto_1
.end method

.method private onAngle(Landroid/view/MotionEvent;F)V
    .locals 5
    .parameter "event"
    .parameter "angle"

    .prologue
    const/4 v4, 0x0

    .line 129
    iget v1, p0, Lcom/android/server/input/OppoStaleEventFilter;->angleCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/server/input/OppoStaleEventFilter;->angleCount:I

    .line 130
    iget v1, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastAngle:F

    sub-float v1, p2, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 131
    .local v0, change:F
    const/high16 v1, 0x4334

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    const/high16 v1, 0x43b4

    sub-float v0, v1, v0

    .line 132
    :cond_0
    const-string v1, "BackTouch_StaleEventFilter"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "angle:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " lastAngle:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastAngle:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " angle change:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    iget v1, p0, Lcom/android/server/input/OppoStaleEventFilter;->angleCount:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    const/high16 v1, 0x42a0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    .line 134
    invoke-direct {p0, p1, p2}, Lcom/android/server/input/OppoStaleEventFilter;->findBigChange(Landroid/view/MotionEvent;F)V

    .line 154
    :goto_0
    return-void

    .line 136
    :cond_1
    iget v1, p0, Lcom/android/server/input/OppoStaleEventFilter;->bigChange:I

    if-eqz v1, :cond_2

    .line 137
    const/high16 v1, 0x4270

    cmpg-float v1, v0, v1

    if-gez v1, :cond_3

    .line 139
    iput v4, p0, Lcom/android/server/input/OppoStaleEventFilter;->bigChange:I

    .line 141
    iput-boolean v4, p0, Lcom/android/server/input/OppoStaleEventFilter;->intercepted:Z

    .line 143
    invoke-direct {p0}, Lcom/android/server/input/OppoStaleEventFilter;->recycleMotionBuffer()V

    .line 144
    const-string v1, "BackTouch_StaleEventFilter"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "detect noise, change angle:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    :cond_2
    iget v1, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastAngle:F

    iget v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->angleCount:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v2, v2

    mul-float/2addr v1, v2

    add-float/2addr v1, p2

    iget v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->angleCount:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    iput v1, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastAngle:F

    goto :goto_0

    .line 148
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/android/server/input/OppoStaleEventFilter;->findBigChange(Landroid/view/MotionEvent;F)V

    goto :goto_0
.end method

.method private recycleMotionBuffer()V
    .locals 3

    .prologue
    .line 122
    iget-object v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->motionBuf:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MotionEvent;

    .line 123
    .local v0, e:Landroid/view/MotionEvent;
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_0

    .line 125
    .end local v0           #e:Landroid/view/MotionEvent;
    :cond_0
    iget-object v2, p0, Lcom/android/server/input/OppoStaleEventFilter;->motionBuf:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 126
    return-void
.end method


# virtual methods
.method public onBackTouchEvent(Landroid/view/MotionEvent;)V
    .locals 8
    .parameter "event"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 53
    const-string v3, "BackTouch_StaleEventFilter"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onBackTouchEvent:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_1

    .line 55
    iput v6, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastX:F

    .line 56
    iput v6, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastY:F

    .line 57
    iput v6, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastAngle:F

    .line 58
    iput v7, p0, Lcom/android/server/input/OppoStaleEventFilter;->angleCount:I

    .line 59
    iput-boolean v7, p0, Lcom/android/server/input/OppoStaleEventFilter;->intercepted:Z

    .line 60
    iput v6, p0, Lcom/android/server/input/OppoStaleEventFilter;->changeAngleSum:F

    .line 61
    iget-object v3, p0, Lcom/android/server/input/OppoStaleEventFilter;->motionBuf:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 70
    :cond_0
    :goto_0
    iget-boolean v3, p0, Lcom/android/server/input/OppoStaleEventFilter;->intercepted:Z

    if-eqz v3, :cond_3

    .line 79
    :goto_1
    return-void

    .line 63
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget v4, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastX:F

    sub-float v1, v3, v4

    .line 64
    .local v1, dx:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    neg-float v3, v3

    iget v4, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastY:F

    add-float v2, v3, v4

    .line 65
    .local v2, dy:F
    cmpl-float v3, v1, v6

    if-nez v3, :cond_2

    cmpl-float v3, v2, v6

    if-eqz v3, :cond_0

    .line 66
    :cond_2
    float-to-double v3, v2

    float-to-double v5, v1

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v3

    const-wide v5, 0x4066800000000000L

    mul-double/2addr v3, v5

    const-wide v5, 0x400921fb54442d18L

    div-double/2addr v3, v5

    double-to-float v0, v3

    .line 67
    .local v0, angle:F
    invoke-direct {p0, p1, v0}, Lcom/android/server/input/OppoStaleEventFilter;->onAngle(Landroid/view/MotionEvent;F)V

    goto :goto_0

    .line 74
    .end local v0           #angle:F
    .end local v1           #dx:F
    .end local v2           #dy:F
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iput v3, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastX:F

    .line 75
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v3, p0, Lcom/android/server/input/OppoStaleEventFilter;->lastY:F

    .line 77
    iget-object v3, p0, Lcom/android/server/input/OppoStaleEventFilter;->mLsnr:Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;

    invoke-interface {v3, p1}, Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;->onEventFilted(Landroid/view/MotionEvent;)V

    goto :goto_1
.end method
