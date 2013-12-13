.class Lcom/android/server/input/OppoBackTouchInspector$1;
.super Ljava/lang/Object;
.source "OppoBackTouchInspector.java"

# interfaces
.implements Lcom/android/server/input/OppoStaleEventFilter$EventFiltedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/input/OppoBackTouchInspector;->systemReady()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/input/OppoBackTouchInspector;


# direct methods
.method constructor <init>(Lcom/android/server/input/OppoBackTouchInspector;)V
    .locals 0
    .parameter

    .prologue
    .line 114
    iput-object p1, p0, Lcom/android/server/input/OppoBackTouchInspector$1;->this$0:Lcom/android/server/input/OppoBackTouchInspector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEventFilted(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter "event"

    .prologue
    .line 117
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector$1;->this$0:Lcom/android/server/input/OppoBackTouchInspector;

    invoke-virtual {v0, p1}, Lcom/android/server/input/OppoBackTouchInspector;->onFilterBackTouchEvent(Landroid/view/MotionEvent;)V

    .line 118
    return-void
.end method
