.class final Lcom/android/server/MountService$MountServiceBinderListener;
.super Ljava/lang/Object;
.source "MountService.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation build Landroid/annotation/OppoHook;
    level = .enum Landroid/annotation/OppoHook$OppoHookType;->CHANGE_CODE:Landroid/annotation/OppoHook$OppoHookType;
    note = "ZhiYong.Lin@Plf.Framework modify for BPM"
    property = .enum Landroid/annotation/OppoHook$OppoRomType;->OPPO:Landroid/annotation/OppoHook$OppoRomType;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/MountService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MountServiceBinderListener"
.end annotation


# instance fields
.field listenerPid:I

.field final mListener:Landroid/os/storage/IMountServiceListener;

.field final synthetic this$0:Lcom/android/server/MountService;


# direct methods
.method constructor <init>(Lcom/android/server/MountService;Landroid/os/storage/IMountServiceListener;)V
    .locals 1
    .parameter
    .parameter "listener"

    .prologue
    .line 610
    iput-object p1, p0, Lcom/android/server/MountService$MountServiceBinderListener;->this$0:Lcom/android/server/MountService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 611
    iput-object p2, p0, Lcom/android/server/MountService$MountServiceBinderListener;->mListener:Landroid/os/storage/IMountServiceListener;

    .line 615
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    iput v0, p0, Lcom/android/server/MountService$MountServiceBinderListener;->listenerPid:I

    .line 617
    return-void
.end method


# virtual methods
.method public binderDied()V
    .locals 3

    .prologue
    .line 621
    iget-object v0, p0, Lcom/android/server/MountService$MountServiceBinderListener;->this$0:Lcom/android/server/MountService;

    #getter for: Lcom/android/server/MountService;->mListeners:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/android/server/MountService;->access$1100(Lcom/android/server/MountService;)Ljava/util/ArrayList;

    move-result-object v1

    monitor-enter v1

    .line 622
    :try_start_0
    iget-object v0, p0, Lcom/android/server/MountService$MountServiceBinderListener;->this$0:Lcom/android/server/MountService;

    #getter for: Lcom/android/server/MountService;->mListeners:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/android/server/MountService;->access$1100(Lcom/android/server/MountService;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 623
    iget-object v0, p0, Lcom/android/server/MountService$MountServiceBinderListener;->mListener:Landroid/os/storage/IMountServiceListener;

    invoke-interface {v0}, Landroid/os/storage/IMountServiceListener;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    const/4 v2, 0x0

    invoke-interface {v0, p0, v2}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 624
    monitor-exit v1

    .line 625
    return-void

    .line 624
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
