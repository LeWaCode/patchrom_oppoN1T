.class Lcom/android/internal/policy/impl/OppoGlobalActions$1;
.super Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;
.source "OppoGlobalActions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/OppoGlobalActions;->createDialog()Landroid/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/OppoGlobalActions;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/OppoGlobalActions;IIIII)V
    .locals 6
    .parameter
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 209
    iput-object p1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions$1;->this$0:Lcom/android/internal/policy/impl/OppoGlobalActions;

    move-object v0, p0

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;-><init>(IIIII)V

    return-void
.end method


# virtual methods
.method protected changeStateFromPress(Z)V
    .locals 2
    .parameter "buttonOn"

    .prologue
    .line 227
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions$1;->this$0:Lcom/android/internal/policy/impl/OppoGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/OppoGlobalActions;->mHasTelephony:Z
    invoke-static {v0}, Lcom/android/internal/policy/impl/OppoGlobalActions;->access$000(Lcom/android/internal/policy/impl/OppoGlobalActions;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 230
    :cond_1
    const-string v0, "ril.cdma.inecmmode"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 232
    if-eqz p1, :cond_2

    sget-object v0, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;->TurningOn:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    :goto_1
    iput-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions$1;->mState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    .line 233
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions$1;->this$0:Lcom/android/internal/policy/impl/OppoGlobalActions;

    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions$1;->mState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    #setter for: Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/OppoGlobalActions;->access$402(Lcom/android/internal/policy/impl/OppoGlobalActions;Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;)Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    goto :goto_0

    .line 232
    :cond_2
    sget-object v0, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;->TurningOff:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    goto :goto_1
.end method

.method onToggle(Z)V
    .locals 3
    .parameter "on"

    .prologue
    .line 212
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions$1;->this$0:Lcom/android/internal/policy/impl/OppoGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/OppoGlobalActions;->mHasTelephony:Z
    invoke-static {v1}, Lcom/android/internal/policy/impl/OppoGlobalActions;->access$000(Lcom/android/internal/policy/impl/OppoGlobalActions;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "ril.cdma.inecmmode"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 214
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions$1;->this$0:Lcom/android/internal/policy/impl/OppoGlobalActions;

    const/4 v2, 0x1

    #setter for: Lcom/android/internal/policy/impl/OppoGlobalActions;->mIsWaitingForEcmExit:Z
    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/OppoGlobalActions;->access$102(Lcom/android/internal/policy/impl/OppoGlobalActions;Z)Z

    .line 216
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 218
    .local v0, ecmDialogIntent:Landroid/content/Intent;
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 219
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions$1;->this$0:Lcom/android/internal/policy/impl/OppoGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/internal/policy/impl/OppoGlobalActions;->access$200(Lcom/android/internal/policy/impl/OppoGlobalActions;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 223
    .end local v0           #ecmDialogIntent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 221
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions$1;->this$0:Lcom/android/internal/policy/impl/OppoGlobalActions;

    #calls: Lcom/android/internal/policy/impl/OppoGlobalActions;->changeAirplaneModeSystemSetting(Z)V
    invoke-static {v1, p1}, Lcom/android/internal/policy/impl/OppoGlobalActions;->access$300(Lcom/android/internal/policy/impl/OppoGlobalActions;Z)V

    goto :goto_0
.end method

.method public showBeforeProvisioning()Z
    .locals 1

    .prologue
    .line 242
    const/4 v0, 0x0

    return v0
.end method

.method public showDuringKeyguard()Z
    .locals 1

    .prologue
    .line 238
    const/4 v0, 0x1

    return v0
.end method
