.class Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$2;
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
    .line 161
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$2;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIndicatorClick(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 163
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 172
    :goto_0
    return-void

    .line 165
    :pswitch_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$2;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->checkPuk()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->access$000(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;)V

    goto :goto_0

    .line 169
    :pswitch_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$2;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->mFocusedEntry:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->access$300(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 163
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
