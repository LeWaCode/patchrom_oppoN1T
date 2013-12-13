.class final Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;
.super Landroid/database/ContentObserver;
.source "OppoBackTouchInspector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/input/OppoBackTouchInspector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SettingsObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/input/OppoBackTouchInspector;


# direct methods
.method public constructor <init>(Lcom/android/server/input/OppoBackTouchInspector;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "handler"

    .prologue
    .line 521
    iput-object p1, p0, Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;->this$0:Lcom/android/server/input/OppoBackTouchInspector;

    .line 522
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 523
    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 2
    .parameter "selfChange"
    .parameter "uri"

    .prologue
    .line 527
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;->this$0:Lcom/android/server/input/OppoBackTouchInspector;

    #getter for: Lcom/android/server/input/OppoBackTouchInspector;->mLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/input/OppoBackTouchInspector;->access$100(Lcom/android/server/input/OppoBackTouchInspector;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 528
    :try_start_0
    iget-object v0, p0, Lcom/android/server/input/OppoBackTouchInspector$SettingsObserver;->this$0:Lcom/android/server/input/OppoBackTouchInspector;

    #calls: Lcom/android/server/input/OppoBackTouchInspector;->handleSettingsChangedLocked()V
    invoke-static {v0}, Lcom/android/server/input/OppoBackTouchInspector;->access$200(Lcom/android/server/input/OppoBackTouchInspector;)V

    .line 529
    monitor-exit v1

    .line 530
    return-void

    .line 529
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
