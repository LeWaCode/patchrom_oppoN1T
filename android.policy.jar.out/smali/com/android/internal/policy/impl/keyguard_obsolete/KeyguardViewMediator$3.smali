.class Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator$3;
.super Ljava/lang/Object;
.source "KeyguardViewMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;->onScreenTurnedOff(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;)V
    .locals 0
    .parameter

    .prologue
    .line 563
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator$3;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 565
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator$3;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;->mLockScreenManager:Lcom/oppo/individuationsettings/unlocker/ILockScreenManager;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;->access$1000(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;)Lcom/oppo/individuationsettings/unlocker/ILockScreenManager;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 567
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator$3;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;->mLockScreenManager:Lcom/oppo/individuationsettings/unlocker/ILockScreenManager;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;->access$1000(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewMediator;)Lcom/oppo/individuationsettings/unlocker/ILockScreenManager;

    move-result-object v1

    invoke-interface {v1}, Lcom/oppo/individuationsettings/unlocker/ILockScreenManager;->notifyScreenTurnedOff()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 574
    :goto_0
    return-void

    .line 568
    :catch_0
    move-exception v0

    .line 569
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "KeyguardViewMediator"

    const-string v2, "notifyScreenTurnedOff() failed!!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 572
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_0
    const-string v1, "KeyguardViewMediator"

    const-string v2, "mLockScreenManager == null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
