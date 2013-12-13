.class Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$1;
.super Landroid/os/Handler;
.source "KeyguardViewManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;)V
    .locals 0
    .parameter

    .prologue
    .line 283
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 287
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 288
    iget v1, p1, Landroid/os/Message;->what:I

    sget v2, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->REFRESH_KEYGUARD_WALL_PAPER:I

    if-ne v1, v2, :cond_1

    .line 289
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->getLockScreenWallpaper()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 290
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 291
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;

    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->mLockPaper:Landroid/graphics/drawable/Drawable;
    invoke-static {v1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->access$202(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 295
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->mKeyguardView:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewBase;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->access$300(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewBase;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->mLockPaper:Landroid/graphics/drawable/Drawable;
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->access$200(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewBase;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 297
    .end local v0           #drawable:Landroid/graphics/drawable/Drawable;
    :cond_1
    return-void
.end method
