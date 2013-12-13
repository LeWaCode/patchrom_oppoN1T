.class public Lcom/android/internal/telephony/uicc/OppoUiccFunction;
.super Ljava/lang/Object;
.source "OppoUiccFunction.java"


# annotations
.annotation build Landroid/annotation/OppoHook;
    level = .enum Landroid/annotation/OppoHook$OppoHookType;->NEW_CLASS:Landroid/annotation/OppoHook$OppoHookType;
    note = "add for SIMInfo db, only for QCOM platform"
    property = .enum Landroid/annotation/OppoHook$OppoRomType;->OPPO:Landroid/annotation/OppoHook$OppoRomType;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static oppoGetSimType()Z
    .locals 4

    .prologue
    .line 44
    const/4 v0, 0x0

    .line 46
    .local v0, vRet:Z
    const-string v2, "gsm.sim.card.type"

    const-string v3, "SIM"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 47
    .local v1, vStr:Ljava/lang/String;
    const-string v2, "USIM"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 49
    const/4 v0, 0x1

    .line 52
    :cond_0
    return v0
.end method

.method public static oppoWriteSim()V
    .locals 2

    .prologue
    .line 36
    const-string v0, "gsm.sim.card.type"

    const-string v1, "SIM"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "USIM"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    const-string v0, "gsm.sim.card.type"

    const-string v1, "SIM"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    :cond_0
    return-void
.end method

.method public static oppoWriteUsim()V
    .locals 2

    .prologue
    .line 28
    const-string v0, "gsm.sim.card.type"

    const-string v1, "SIM"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "SIM"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 30
    const-string v0, "gsm.sim.card.type"

    const-string v1, "USIM"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    :cond_0
    return-void
.end method
