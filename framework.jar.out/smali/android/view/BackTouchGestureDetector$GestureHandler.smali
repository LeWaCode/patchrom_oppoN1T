.class Landroid/view/BackTouchGestureDetector$GestureHandler;
.super Landroid/os/Handler;
.source "BackTouchGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/view/BackTouchGestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GestureHandler"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/view/BackTouchGestureDetector;


# direct methods
.method constructor <init>(Landroid/view/BackTouchGestureDetector;)V
    .locals 0
    .parameter

    .prologue
    .line 270
    iput-object p1, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    .line 271
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 272
    return-void
.end method

.method constructor <init>(Landroid/view/BackTouchGestureDetector;Landroid/os/Handler;)V
    .locals 1
    .parameter
    .parameter "handler"

    .prologue
    .line 274
    iput-object p1, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    .line 275
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 276
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 280
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 301
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown message "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 282
    :pswitch_0
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    #getter for: Landroid/view/BackTouchGestureDetector;->mListener:Landroid/view/BackTouchGestureDetector$OnGestureListener;
    invoke-static {v0}, Landroid/view/BackTouchGestureDetector;->access$100(Landroid/view/BackTouchGestureDetector;)Landroid/view/BackTouchGestureDetector$OnGestureListener;

    move-result-object v0

    iget-object v1, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    #getter for: Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;
    invoke-static {v1}, Landroid/view/BackTouchGestureDetector;->access$000(Landroid/view/BackTouchGestureDetector;)Landroid/view/MotionEvent;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/BackTouchGestureDetector$OnGestureListener;->onShowPress(Landroid/view/MotionEvent;)V

    .line 303
    :cond_0
    :goto_0
    return-void

    .line 286
    :pswitch_1
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    #calls: Landroid/view/BackTouchGestureDetector;->dispatchLongPress()V
    invoke-static {v0}, Landroid/view/BackTouchGestureDetector;->access$200(Landroid/view/BackTouchGestureDetector;)V

    goto :goto_0

    .line 290
    :pswitch_2
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    #calls: Landroid/view/BackTouchGestureDetector;->dispatchSpecialLongPress()V
    invoke-static {v0}, Landroid/view/BackTouchGestureDetector;->access$300(Landroid/view/BackTouchGestureDetector;)V

    goto :goto_0

    .line 295
    :pswitch_3
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    #getter for: Landroid/view/BackTouchGestureDetector;->mDoubleTapListener:Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;
    invoke-static {v0}, Landroid/view/BackTouchGestureDetector;->access$400(Landroid/view/BackTouchGestureDetector;)Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    #getter for: Landroid/view/BackTouchGestureDetector;->mStillDown:Z
    invoke-static {v0}, Landroid/view/BackTouchGestureDetector;->access$500(Landroid/view/BackTouchGestureDetector;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    #getter for: Landroid/view/BackTouchGestureDetector;->mIsFastTap:Z
    invoke-static {v0}, Landroid/view/BackTouchGestureDetector;->access$600(Landroid/view/BackTouchGestureDetector;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 296
    iget-object v0, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    #getter for: Landroid/view/BackTouchGestureDetector;->mDoubleTapListener:Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;
    invoke-static {v0}, Landroid/view/BackTouchGestureDetector;->access$400(Landroid/view/BackTouchGestureDetector;)Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;

    move-result-object v0

    iget-object v1, p0, Landroid/view/BackTouchGestureDetector$GestureHandler;->this$0:Landroid/view/BackTouchGestureDetector;

    #getter for: Landroid/view/BackTouchGestureDetector;->mCurrentDownEvent:Landroid/view/MotionEvent;
    invoke-static {v1}, Landroid/view/BackTouchGestureDetector;->access$000(Landroid/view/BackTouchGestureDetector;)Landroid/view/MotionEvent;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/BackTouchGestureDetector$OnDoubleTapListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    goto :goto_0

    .line 280
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method
