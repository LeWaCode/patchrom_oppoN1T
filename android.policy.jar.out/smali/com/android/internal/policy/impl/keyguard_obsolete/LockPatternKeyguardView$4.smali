.class Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;
.super Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitorCallback;
.source "LockPatternKeyguardView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)V
    .locals 0
    .parameter

    .prologue
    .line 724
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitorCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onClockVisibilityChanged()V
    .locals 0

    .prologue
    .line 753
    return-void
.end method

.method public onPhoneStateChanged(I)V
    .locals 2
    .parameter "phoneState"

    .prologue
    const/4 v1, 0x1

    .line 759
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;

    move-result-object v0

    if-eqz v0, :cond_0

    if-ne p1, v1, :cond_0

    .line 760
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mSuppressBiometricUnlock:Z
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1202(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;Z)Z

    .line 761
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;->stop()Z

    .line 762
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;->hide()V

    .line 764
    :cond_0
    return-void
.end method

.method public onRefreshBatteryInfo(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;)V
    .locals 3
    .parameter "status"

    .prologue
    .line 734
    invoke-virtual {p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;->isPluggedIn()Z

    move-result v0

    .line 735
    .local v0, pluggedIn:Z
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mPluggedIn:Z
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$2000(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Z

    move-result v1

    if-eq v1, v0, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;->isRunning()Z

    move-result v1

    if-nez v1, :cond_0

    .line 737
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;->stop()Z

    .line 738
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;->hide()V

    .line 739
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    const/4 v2, 0x1

    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mSuppressBiometricUnlock:Z
    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1202(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;Z)Z

    .line 741
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mPluggedIn:Z
    invoke-static {v1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$2002(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;Z)Z

    .line 742
    return-void
.end method

.method public onUserSwitched(I)V
    .locals 3
    .parameter "userId"

    .prologue
    .line 768
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 769
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$1300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/BiometricSensorUnlock;->stop()Z

    .line 771
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$800(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/internal/widget/LockPatternUtils;->setCurrentUser(I)V

    .line 772
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->getInitialMode()Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$2100(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;

    move-result-object v1

    const/4 v2, 0x1

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->updateScreen(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;Z)V
    invoke-static {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$200(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;Z)V

    .line 773
    return-void
.end method
