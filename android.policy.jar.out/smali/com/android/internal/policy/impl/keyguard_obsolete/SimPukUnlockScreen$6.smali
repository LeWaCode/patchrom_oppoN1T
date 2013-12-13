.class Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$6;
.super Landroid/os/Handler;
.source "SimPukUnlockScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 266
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$6;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 269
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 274
    :goto_0
    return-void

    .line 271
    :pswitch_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$6;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->keyguardDone(Z)V

    goto :goto_0

    .line 269
    nop

    :pswitch_data_0
    .packed-switch 0x1f41
        :pswitch_0
    .end packed-switch
.end method
