.class Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$1;
.super Ljava/lang/Object;
.source "SimPukUnlockScreen.java"

# interfaces
.implements Lcom/oppo/widget/OppoShortCutIndicators$OnIndicatorClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;-><init>(Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;Lcom/android/internal/widget/LockPatternUtils;)V
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
    .line 124
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIndicatorClick(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 126
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 134
    :goto_0
    return-void

    .line 128
    :pswitch_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->checkPuk()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->access$000(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;)V

    goto :goto_0

    .line 131
    :pswitch_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->takeEmergencyCallAction()V

    goto :goto_0

    .line 126
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
