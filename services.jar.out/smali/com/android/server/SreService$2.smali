.class Lcom/android/server/SreService$2;
.super Landroid/content/BroadcastReceiver;
.source "SreService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/SreService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/SreService;


# direct methods
.method constructor <init>(Lcom/android/server/SreService;)V
    .locals 0
    .parameter

    .prologue
    .line 159
    iput-object p1, p0, Lcom/android/server/SreService$2;->this$0:Lcom/android/server/SreService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 162
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 165
    .local v0, action:Ljava/lang/String;
    const-string v1, "SreService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceive===== action = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 169
    const-string v1, "persist.sys.sre_flag"

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    iget-object v1, p0, Lcom/android/server/SreService$2;->this$0:Lcom/android/server/SreService;

    #calls: Lcom/android/server/SreService;->unRegisterSreLightSensorListenr()V
    invoke-static {v1}, Lcom/android/server/SreService;->access$200(Lcom/android/server/SreService;)V

    .line 174
    iget-object v1, p0, Lcom/android/server/SreService$2;->this$0:Lcom/android/server/SreService;

    const/4 v2, 0x0

    #setter for: Lcom/android/server/SreService;->mScreenOn:Z
    invoke-static {v1, v2}, Lcom/android/server/SreService;->access$302(Lcom/android/server/SreService;Z)Z

    .line 193
    :cond_0
    :goto_0
    return-void

    .line 176
    :cond_1
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/server/SreService$2;->this$0:Lcom/android/server/SreService;

    #getter for: Lcom/android/server/SreService;->mShouldListenerWhenScreenOn:Z
    invoke-static {v1}, Lcom/android/server/SreService;->access$400(Lcom/android/server/SreService;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 178
    const-string v1, "persist.sys.sre_flag"

    const-string v2, "1"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    iget-object v1, p0, Lcom/android/server/SreService$2;->this$0:Lcom/android/server/SreService;

    #calls: Lcom/android/server/SreService;->registerSreLightSensorListenr()V
    invoke-static {v1}, Lcom/android/server/SreService;->access$500(Lcom/android/server/SreService;)V

    .line 191
    iget-object v1, p0, Lcom/android/server/SreService$2;->this$0:Lcom/android/server/SreService;

    const/4 v2, 0x1

    #setter for: Lcom/android/server/SreService;->mScreenOn:Z
    invoke-static {v1, v2}, Lcom/android/server/SreService;->access$302(Lcom/android/server/SreService;Z)Z

    goto :goto_0
.end method
