.class Lcom/android/server/input/OppoBackTouchInspector$2;
.super Ljava/lang/Object;
.source "OppoBackTouchInspector.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/input/OppoBackTouchInspector;->asynInjectEvent(Landroid/view/InputEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/input/OppoBackTouchInspector;

.field final synthetic val$event:Landroid/view/InputEvent;


# direct methods
.method constructor <init>(Lcom/android/server/input/OppoBackTouchInspector;Landroid/view/InputEvent;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 446
    iput-object p1, p0, Lcom/android/server/input/OppoBackTouchInspector$2;->this$0:Lcom/android/server/input/OppoBackTouchInspector;

    iput-object p2, p0, Lcom/android/server/input/OppoBackTouchInspector$2;->val$event:Landroid/view/InputEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 449
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector$2;->this$0:Lcom/android/server/input/OppoBackTouchInspector;

    #getter for: Lcom/android/server/input/OppoBackTouchInspector;->mSv:Lcom/android/server/input/InputManagerService;
    invoke-static {v0}, Lcom/android/server/input/OppoBackTouchInspector;->access$000(Lcom/android/server/input/OppoBackTouchInspector;)Lcom/android/server/input/InputManagerService;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/input/OppoBackTouchInspector$2;->val$event:Landroid/view/InputEvent;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Lcom/android/server/input/InputManagerService;->injectInputEvent(Landroid/view/InputEvent;I)Z

    .line 450
    return-void
.end method
