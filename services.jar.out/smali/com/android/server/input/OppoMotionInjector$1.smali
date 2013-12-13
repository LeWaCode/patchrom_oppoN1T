.class Lcom/android/server/input/OppoMotionInjector$1;
.super Ljava/lang/Object;
.source "OppoMotionInjector.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/input/OppoMotionInjector;->injectPendingMotion(JJIFFIIJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/input/OppoMotionInjector;

.field final synthetic val$action:I

.field final synthetic val$injectEvent:Landroid/view/MotionEvent;

.field final synthetic val$sleepMills:J


# direct methods
.method constructor <init>(Lcom/android/server/input/OppoMotionInjector;Landroid/view/MotionEvent;IJ)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/server/input/OppoMotionInjector$1;->this$0:Lcom/android/server/input/OppoMotionInjector;

    iput-object p2, p0, Lcom/android/server/input/OppoMotionInjector$1;->val$injectEvent:Landroid/view/MotionEvent;

    iput p3, p0, Lcom/android/server/input/OppoMotionInjector$1;->val$action:I

    iput-wide p4, p0, Lcom/android/server/input/OppoMotionInjector$1;->val$sleepMills:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 42
    iget-object v0, p0, Lcom/android/server/input/OppoMotionInjector$1;->this$0:Lcom/android/server/input/OppoMotionInjector;

    #getter for: Lcom/android/server/input/OppoMotionInjector;->mSv:Lcom/android/server/input/InputManagerService;
    invoke-static {v0}, Lcom/android/server/input/OppoMotionInjector;->access$000(Lcom/android/server/input/OppoMotionInjector;)Lcom/android/server/input/InputManagerService;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/input/OppoMotionInjector$1;->val$injectEvent:Landroid/view/MotionEvent;

    invoke-virtual {v0, v1, v2}, Lcom/android/server/input/InputManagerService;->injectInputEvent(Landroid/view/InputEvent;I)Z

    .line 44
    :try_start_0
    iget-object v0, p0, Lcom/android/server/input/OppoMotionInjector$1;->this$0:Lcom/android/server/input/OppoMotionInjector;

    #getter for: Lcom/android/server/input/OppoMotionInjector;->mCancelPending:Z
    invoke-static {v0}, Lcom/android/server/input/OppoMotionInjector;->access$100(Lcom/android/server/input/OppoMotionInjector;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 45
    iget v0, p0, Lcom/android/server/input/OppoMotionInjector$1;->val$action:I

    if-eq v0, v2, :cond_0

    iget v0, p0, Lcom/android/server/input/OppoMotionInjector$1;->val$action:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/android/server/input/OppoMotionInjector$1;->this$0:Lcom/android/server/input/OppoMotionInjector;

    const/4 v1, 0x0

    #setter for: Lcom/android/server/input/OppoMotionInjector;->mCancelPending:Z
    invoke-static {v0, v1}, Lcom/android/server/input/OppoMotionInjector;->access$102(Lcom/android/server/input/OppoMotionInjector;Z)Z

    .line 53
    :cond_1
    :goto_0
    return-void

    .line 49
    :cond_2
    iget-wide v0, p0, Lcom/android/server/input/OppoMotionInjector$1;->val$sleepMills:J

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    goto :goto_0
.end method
