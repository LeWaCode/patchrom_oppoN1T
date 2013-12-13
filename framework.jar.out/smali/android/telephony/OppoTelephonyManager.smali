.class public Landroid/telephony/OppoTelephonyManager;
.super Landroid/telephony/TelephonyManager;
.source "OppoTelephonyManager.java"


# annotations
.annotation build Landroid/annotation/OppoHook;
    level = .enum Landroid/annotation/OppoHook$OppoHookType;->NEW_CLASS:Landroid/annotation/OppoHook$OppoHookType;
    note = "sub class of TelephonyManager"
    property = .enum Landroid/annotation/OppoHook$OppoRomType;->ROM:Landroid/annotation/OppoHook$OppoRomType;
.end annotation


# static fields
.field static final TAG:Ljava/lang/String; = "OppoTelephonyManager"

.field private static isMtkGeminiSupport:Z

.field private static isMtkSupport:Z

.field private static isOppoSupport:Z

.field private static isRomSupport:Z

.field private static sContext:Landroid/content/Context;

.field private static sInstance:Landroid/telephony/OppoTelephonyManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    new-instance v0, Landroid/telephony/OppoTelephonyManager;

    invoke-direct {v0}, Landroid/telephony/OppoTelephonyManager;-><init>()V

    sput-object v0, Landroid/telephony/OppoTelephonyManager;->sInstance:Landroid/telephony/OppoTelephonyManager;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Landroid/telephony/TelephonyManager;-><init>()V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Landroid/telephony/TelephonyManager;-><init>(Landroid/content/Context;)V

    .line 41
    sget-object v1, Landroid/telephony/OppoTelephonyManager;->sContext:Landroid/content/Context;

    if-nez v1, :cond_0

    .line 42
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 43
    .local v0, appContext:Landroid/content/Context;
    if-eqz v0, :cond_1

    .line 44
    sput-object v0, Landroid/telephony/OppoTelephonyManager;->sContext:Landroid/content/Context;

    .line 50
    .end local v0           #appContext:Landroid/content/Context;
    :cond_0
    :goto_0
    sget-object v1, Landroid/telephony/OppoTelephonyManager;->sContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string/jumbo v2, "oppo.sw.solution.device"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    sput-boolean v1, Landroid/telephony/OppoTelephonyManager;->isOppoSupport:Z

    .line 51
    sget-object v1, Landroid/telephony/OppoTelephonyManager;->sContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string/jumbo v2, "oppo.sw.solution.rom"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    sput-boolean v1, Landroid/telephony/OppoTelephonyManager;->isRomSupport:Z

    .line 52
    sget-object v1, Landroid/telephony/OppoTelephonyManager;->sContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string/jumbo v2, "mtk.gemini.support"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    sput-boolean v1, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    .line 53
    sget-object v1, Landroid/telephony/OppoTelephonyManager;->sContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string/jumbo v2, "oppo.hw.manufacturer.mtk"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    sput-boolean v1, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    .line 54
    const-string v1, "OppoTelephonyManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "OppoTelephonyManager isMtkSupport ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-boolean v3, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " isMtkGeminiSupport ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-boolean v3, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    return-void

    .line 46
    .restart local v0       #appContext:Landroid/content/Context;
    :cond_1
    sput-object p1, Landroid/telephony/OppoTelephonyManager;->sContext:Landroid/content/Context;

    goto :goto_0
.end method

.method public static getDefault()Landroid/telephony/OppoTelephonyManager;
    .locals 1

    .prologue
    .line 67
    sget-object v0, Landroid/telephony/OppoTelephonyManager;->sInstance:Landroid/telephony/OppoTelephonyManager;

    return-object v0
.end method

.method private getITelephony()Lcom/android/internal/telephony/ITelephony;
    .locals 1

    .prologue
    .line 71
    const-string/jumbo v0, "phone"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    return-object v0
.end method

.method private getIccPhoneBookInfo()Lcom/android/internal/telephony/IIccPhoneBook;
    .locals 1

    .prologue
    .line 75
    sget-boolean v0, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->getDefaultSim()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/telephony/OppoTelephonyManager;->getIccPhoneBookInfoGemini(I)Lcom/android/internal/telephony/IIccPhoneBook;

    move-result-object v0

    .line 78
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "simphonebook"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/IIccPhoneBook$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/IIccPhoneBook;

    move-result-object v0

    goto :goto_0
.end method

.method private getIccPhoneBookInfoGemini(I)Lcom/android/internal/telephony/IIccPhoneBook;
    .locals 1
    .parameter "simId"

    .prologue
    .line 363
    const-string/jumbo v0, "simphonebook"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/IIccPhoneBook$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/IIccPhoneBook;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public oppoChangeIccLockPassword(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 3
    .parameter "oldPassword"
    .parameter "newPassword"
    .parameter "onComplete"

    .prologue
    .line 286
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    invoke-interface {v1, p1, p2, p3}, Lcom/android/internal/telephony/ITelephony;->oppoChangeIccLockPassword(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 292
    :goto_0
    return-void

    .line 287
    :catch_0
    move-exception v0

    .line 288
    .local v0, ex:Landroid/os/RemoteException;
    const-string v1, "TelephonyManager"

    const-string/jumbo v2, "oppoChangeIccLockPassword: remote exception."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 289
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 290
    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v1, "TelephonyManager"

    const-string/jumbo v2, "oppoChangeIccLockPassword: null pointer exception."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public oppoCheckPhbNameLength(Ljava/lang/String;)I
    .locals 4
    .parameter "name"

    .prologue
    const/4 v3, 0x3

    .line 165
    sget-boolean v2, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    if-eqz v2, :cond_1

    sget-boolean v2, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    if-eqz v2, :cond_1

    .line 166
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->getDefaultSim()I

    move-result v2

    invoke-virtual {p0, p1, v2}, Landroid/telephony/OppoTelephonyManager;->oppoCheckPhbNameLengthGenimi(Ljava/lang/String;I)I

    move-result v1

    .line 177
    :cond_0
    :goto_0
    return v1

    .line 168
    :cond_1
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->oppoGetSimPhonebookNameLength()I

    move-result v1

    .line 169
    .local v1, leng:I
    const/4 v2, 0x0

    invoke-static {p1, v2}, Landroid/telephony/SmsMessage;->calculateLength(Ljava/lang/String;Z)[I

    move-result-object v0

    .line 171
    .local v0, encodeInfo:[I
    invoke-static {p1}, Lcom/android/internal/telephony/OppoGsmAlphabet;->enableEncodeTo0x81(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 172
    add-int/lit8 v1, v1, -0x3

    goto :goto_0

    .line 174
    :cond_2
    aget v2, v0, v3

    if-ne v2, v3, :cond_0

    .line 175
    add-int/lit8 v2, v1, -0x1

    div-int/lit8 v1, v2, 0x2

    goto :goto_0
.end method

.method public oppoCheckPhbNameLengthGenimi(Ljava/lang/String;I)I
    .locals 1
    .parameter "name"
    .parameter "simId"

    .prologue
    .line 383
    const/4 v0, -0x1

    return v0
.end method

.method public oppoDisableDataConnectivity()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 198
    sget-boolean v2, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    if-eqz v2, :cond_1

    sget-boolean v2, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    if-eqz v2, :cond_1

    .line 199
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->getDefaultSim()I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/telephony/OppoTelephonyManager;->oppoDisableDataConnectivityGemini(I)I

    move-result v2

    if-lez v2, :cond_0

    const/4 v1, 0x1

    .line 204
    :cond_0
    :goto_0
    return v1

    .line 202
    :cond_1
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/ITelephony;->disableDataConnectivity()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 203
    :catch_0
    move-exception v0

    .line 204
    .local v0, ex:Landroid/os/RemoteException;
    goto :goto_0
.end method

.method public oppoDisableDataConnectivityGemini(I)I
    .locals 1
    .parameter "simId"

    .prologue
    .line 403
    const/4 v0, -0x1

    return v0
.end method

.method public oppoEmtDial(Ljava/lang/String;)V
    .locals 1
    .parameter "telNumber"

    .prologue
    .line 437
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/ITelephony;->emtDial(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 442
    :goto_0
    return-void

    .line 438
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public oppoEmtHungup(Ljava/lang/String;)V
    .locals 1
    .parameter "telNumber"

    .prologue
    .line 446
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/ITelephony;->emtHungup(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 451
    :goto_0
    return-void

    .line 447
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public oppoEnableDataConnectivity()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 186
    sget-boolean v2, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    if-eqz v2, :cond_1

    sget-boolean v2, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    if-eqz v2, :cond_1

    .line 187
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->getDefaultSim()I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/telephony/OppoTelephonyManager;->oppoEnableDataConnectivityGemini(I)I

    move-result v2

    if-lez v2, :cond_0

    const/4 v1, 0x1

    .line 192
    :cond_0
    :goto_0
    return v1

    .line 190
    :cond_1
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/ITelephony;->enableDataConnectivity()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 191
    :catch_0
    move-exception v0

    .line 192
    .local v0, ex:Landroid/os/RemoteException;
    goto :goto_0
.end method

.method public oppoEnableDataConnectivityGemini(I)I
    .locals 1
    .parameter "simId"

    .prologue
    .line 399
    const/4 v0, -0x1

    return v0
.end method

.method public oppoEnableEngineerTest(Z)V
    .locals 1
    .parameter "on"

    .prologue
    .line 455
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/ITelephony;->enableEngineerTest(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 460
    :goto_0
    return-void

    .line 456
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public oppoGetAudioRecordState()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 352
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/ITelephony;->getAudioRecordState()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    .line 358
    :goto_0
    return v1

    .line 353
    :catch_0
    move-exception v0

    .line 354
    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "TelephonyManager"

    const-string/jumbo v3, "oppoGetAudioRecordState: remote exception."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 356
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 357
    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v2, "TelephonyManager"

    const-string/jumbo v3, "oppoGetAudioRecordState: null pointer exception."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public oppoGetIccCardType()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 416
    const-string v2, "gsm.sim.card.type"

    const-string v3, "SIM"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 418
    .local v0, vStr:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 420
    const-string v2, "USIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 422
    const-string v1, "USIM"

    .line 432
    :cond_0
    :goto_0
    return-object v1

    .line 424
    :cond_1
    const-string v2, "SIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 426
    const-string v1, "SIM"

    goto :goto_0
.end method

.method public oppoGetIccLockEnabled()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 264
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/ITelephony;->oppoGetIccLockEnabled()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    .line 270
    :goto_0
    return v1

    .line 265
    :catch_0
    move-exception v0

    .line 266
    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "TelephonyManager"

    const-string/jumbo v3, "oppoGetIccLockEnabled: remote exception."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 268
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 269
    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v2, "TelephonyManager"

    const-string/jumbo v3, "oppoGetIccLockEnabled: null pointer exception."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public oppoGetIccPin1RetryCount()I
    .locals 4

    .prologue
    const/4 v1, -0x1

    .line 340
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/ITelephony;->oppoGetIccPin1RetryCount()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    .line 346
    :goto_0
    return v1

    .line 341
    :catch_0
    move-exception v0

    .line 342
    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "TelephonyManager"

    const-string/jumbo v3, "oppoGetIccPin1RetryCount: remote exception."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 344
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 345
    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v2, "TelephonyManager"

    const-string/jumbo v3, "oppoGetIccPin1RetryCount: null pointer exception."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public oppoGetPreferredNetworkType()I
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 96
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 98
    .local v1, telephony:Lcom/android/internal/telephony/ITelephony;
    if-eqz v1, :cond_0

    .line 99
    invoke-interface {v1}, Lcom/android/internal/telephony/ITelephony;->getPreferredNetworkType()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    .line 106
    .end local v1           #telephony:Lcom/android/internal/telephony/ITelephony;
    :cond_0
    :goto_0
    return v2

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, ex:Landroid/os/RemoteException;
    goto :goto_0

    .line 105
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 106
    .local v0, ex:Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method public oppoGetScAddress(I)Ljava/lang/String;
    .locals 4
    .parameter "slotId"

    .prologue
    const/4 v2, 0x0

    .line 313
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v3

    invoke-interface {v3, p1}, Lcom/android/internal/telephony/ITelephony;->getScAddressGemini(I)Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 317
    :goto_0
    return-object v2

    .line 314
    :catch_0
    move-exception v0

    .line 315
    .local v0, e1:Landroid/os/RemoteException;
    goto :goto_0

    .line 316
    .end local v0           #e1:Landroid/os/RemoteException;
    :catch_1
    move-exception v1

    .line 317
    .local v1, e2:Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method public oppoGetServiceState()Landroid/os/Bundle;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 210
    sget-boolean v3, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    if-eqz v3, :cond_1

    sget-boolean v3, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    if-eqz v3, :cond_1

    .line 211
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->getDefaultSim()I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/telephony/OppoTelephonyManager;->oppoGetServiceStateGemini(I)Landroid/os/Bundle;

    move-result-object v2

    .line 223
    :cond_0
    :goto_0
    return-object v2

    .line 214
    :cond_1
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 215
    .local v1, telephony:Lcom/android/internal/telephony/ITelephony;
    if-eqz v1, :cond_0

    .line 216
    invoke-interface {v1}, Lcom/android/internal/telephony/ITelephony;->getServiceState()Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    goto :goto_0

    .line 220
    .end local v1           #telephony:Lcom/android/internal/telephony/ITelephony;
    :catch_0
    move-exception v0

    .line 221
    .local v0, ex:Landroid/os/RemoteException;
    goto :goto_0

    .line 222
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 223
    .local v0, ex:Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method public oppoGetServiceStateGemini(I)Landroid/os/Bundle;
    .locals 1
    .parameter "simId"

    .prologue
    .line 407
    const/4 v0, 0x0

    return-object v0
.end method

.method public oppoGetSimIndicatorState()I
    .locals 4

    .prologue
    const/4 v2, -0x1

    .line 229
    sget-boolean v3, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    if-eqz v3, :cond_1

    sget-boolean v3, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    if-eqz v3, :cond_1

    .line 230
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->getDefaultSim()I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/telephony/OppoTelephonyManager;->oppoGetSimIndicatorStateGemini(I)I

    move-result v2

    .line 242
    :cond_0
    :goto_0
    return v2

    .line 233
    :cond_1
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 234
    .local v1, telephony:Lcom/android/internal/telephony/ITelephony;
    if-eqz v1, :cond_0

    .line 235
    invoke-interface {v1}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorState()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    goto :goto_0

    .line 239
    .end local v1           #telephony:Lcom/android/internal/telephony/ITelephony;
    :catch_0
    move-exception v0

    .line 240
    .local v0, ex:Landroid/os/RemoteException;
    goto :goto_0

    .line 241
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 242
    .local v0, ex:Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method public oppoGetSimIndicatorStateGemini(I)I
    .locals 1
    .parameter "simId"

    .prologue
    .line 411
    const/4 v0, -0x1

    return v0
.end method

.method public oppoGetSimPhonebookAllSpace()I
    .locals 2

    .prologue
    .line 126
    sget-boolean v1, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    if-eqz v1, :cond_0

    sget-boolean v1, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    if-eqz v1, :cond_0

    .line 127
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->getDefaultSim()I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/telephony/OppoTelephonyManager;->oppoGetSimPhonebookAllSpaceGemini(I)I

    move-result v1

    .line 132
    :goto_0
    return v1

    .line 130
    :cond_0
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getIccPhoneBookInfo()Lcom/android/internal/telephony/IIccPhoneBook;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/IIccPhoneBook;->oppoGetSimPhonebookAllSpace()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 131
    :catch_0
    move-exception v0

    .line 132
    .local v0, ex:Landroid/os/RemoteException;
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public oppoGetSimPhonebookAllSpaceGemini(I)I
    .locals 1
    .parameter "simId"

    .prologue
    .line 371
    const/4 v0, -0x1

    return v0
.end method

.method public oppoGetSimPhonebookEmailLength()I
    .locals 1

    .prologue
    .line 391
    const/4 v0, -0x1

    return v0
.end method

.method public oppoGetSimPhonebookEmailLengthGemini(I)I
    .locals 1
    .parameter "simId"

    .prologue
    .line 395
    const/4 v0, -0x1

    return v0
.end method

.method public oppoGetSimPhonebookNameLength()I
    .locals 3

    .prologue
    const/4 v1, -0x1

    .line 150
    sget-boolean v2, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    if-eqz v2, :cond_0

    sget-boolean v2, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    if-eqz v2, :cond_0

    .line 151
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->getDefaultSim()I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/telephony/OppoTelephonyManager;->oppoGetSimPhonebookNameLengthGemini(I)I

    move-result v1

    .line 158
    :goto_0
    return v1

    .line 154
    :cond_0
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getIccPhoneBookInfo()Lcom/android/internal/telephony/IIccPhoneBook;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/IIccPhoneBook;->oppoGetSimPhonebookNameLength()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    goto :goto_0

    .line 155
    :catch_0
    move-exception v0

    .line 156
    .local v0, ex:Landroid/os/RemoteException;
    goto :goto_0

    .line 157
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 158
    .local v0, ex:Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method public oppoGetSimPhonebookNameLengthGemini(I)I
    .locals 1
    .parameter "simId"

    .prologue
    .line 379
    const/4 v0, -0x1

    return v0
.end method

.method public oppoGetSimPhonebookNumberLength()I
    .locals 1

    .prologue
    .line 182
    const/16 v0, 0x14

    return v0
.end method

.method public oppoGetSimPhonebookNumberLengthGemini(I)I
    .locals 1
    .parameter "simId"

    .prologue
    .line 387
    const/4 v0, -0x1

    return v0
.end method

.method public oppoGetSimPhonebookUsedSpace()I
    .locals 2

    .prologue
    .line 138
    sget-boolean v1, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    if-eqz v1, :cond_0

    sget-boolean v1, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    if-eqz v1, :cond_0

    .line 139
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->getDefaultSim()I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/telephony/OppoTelephonyManager;->oppoGetSimPhonebookUsedSpaceGemini(I)I

    move-result v1

    .line 144
    :goto_0
    return v1

    .line 142
    :cond_0
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getIccPhoneBookInfo()Lcom/android/internal/telephony/IIccPhoneBook;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/IIccPhoneBook;->oppoGetSimPhonebookUsedSpace()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 143
    :catch_0
    move-exception v0

    .line 144
    .local v0, ex:Landroid/os/RemoteException;
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public oppoGetSimPhonebookUsedSpaceGemini(I)I
    .locals 1
    .parameter "simId"

    .prologue
    .line 375
    const/4 v0, -0x1

    return v0
.end method

.method public oppoIsDialing()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 296
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/ITelephony;->oppoIsDialing()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    .line 302
    :goto_0
    return v1

    .line 297
    :catch_0
    move-exception v0

    .line 298
    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "TelephonyManager"

    const-string/jumbo v3, "oppoIsDialing: remote exception."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 300
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 301
    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v2, "TelephonyManager"

    const-string/jumbo v3, "oppoIsDialing: null pointer exception."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public oppoSetEngineerModeNvProcess(I)V
    .locals 1
    .parameter "processcmd"

    .prologue
    .line 464
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/ITelephony;->setEngineerModeNvProcess(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 469
    :goto_0
    return-void

    .line 465
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public oppoSetIccLockEnabled(ZLjava/lang/String;Landroid/os/Message;)V
    .locals 3
    .parameter "enabled"
    .parameter "password"
    .parameter "onComplete"

    .prologue
    .line 276
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    invoke-interface {v1, p1, p2, p3}, Lcom/android/internal/telephony/ITelephony;->oppoSetIccLockEnabled(ZLjava/lang/String;Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 282
    :goto_0
    return-void

    .line 277
    :catch_0
    move-exception v0

    .line 278
    .local v0, ex:Landroid/os/RemoteException;
    const-string v1, "TelephonyManager"

    const-string/jumbo v2, "oppoSetIccLockEnabled: remote exception."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 279
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 280
    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v1, "TelephonyManager"

    const-string/jumbo v2, "oppoSetIccLockEnabled: null pointer exception."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public oppoSetLine1Number(Ljava/lang/String;)Z
    .locals 4
    .parameter "phoneNumber"

    .prologue
    const/4 v1, 0x0

    .line 250
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v2

    invoke-interface {v2, p1}, Lcom/android/internal/telephony/ITelephony;->setLine1Number(Ljava/lang/String;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    .line 258
    :goto_0
    return v1

    .line 251
    :catch_0
    move-exception v0

    .line 252
    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "TelephonyManager"

    const-string/jumbo v3, "setLine1Number: remote exception."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 255
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 256
    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v2, "TelephonyManager"

    const-string/jumbo v3, "setLine1Number: null pointer exception."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public oppoSetPreferredNetworkType(I)I
    .locals 3
    .parameter "networkType"

    .prologue
    const/4 v2, -0x1

    .line 112
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 113
    .local v1, telephony:Lcom/android/internal/telephony/ITelephony;
    if-eqz v1, :cond_0

    .line 114
    invoke-interface {v1, p1}, Lcom/android/internal/telephony/ITelephony;->setPreferredNetworkType(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    .line 121
    .end local v1           #telephony:Lcom/android/internal/telephony/ITelephony;
    :cond_0
    :goto_0
    return v2

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, ex:Landroid/os/RemoteException;
    goto :goto_0

    .line 120
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 121
    .local v0, ex:Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method public oppoSetScAddress(Ljava/lang/String;I)Z
    .locals 4
    .parameter "address"
    .parameter "slotId"

    .prologue
    const/4 v2, 0x0

    .line 329
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v3

    invoke-interface {v3, p1, p2}, Lcom/android/internal/telephony/ITelephony;->setScAddressGemini(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 330
    const/4 v2, 0x1

    .line 334
    :goto_0
    return v2

    .line 331
    :catch_0
    move-exception v0

    .line 332
    .local v0, e1:Landroid/os/RemoteException;
    goto :goto_0

    .line 333
    .end local v0           #e1:Landroid/os/RemoteException;
    :catch_1
    move-exception v1

    .line 334
    .local v1, e2:Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method public oppoSimPhonebookIsReady()I
    .locals 2

    .prologue
    .line 83
    sget-boolean v1, Landroid/telephony/OppoTelephonyManager;->isMtkSupport:Z

    if-eqz v1, :cond_0

    sget-boolean v1, Landroid/telephony/OppoTelephonyManager;->isMtkGeminiSupport:Z

    if-eqz v1, :cond_0

    .line 84
    invoke-virtual {p0}, Landroid/telephony/OppoTelephonyManager;->getDefaultSim()I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/telephony/OppoTelephonyManager;->oppoSimPhonebookIsReadyGemini(I)I

    move-result v1

    .line 89
    :goto_0
    return v1

    .line 87
    :cond_0
    :try_start_0
    invoke-direct {p0}, Landroid/telephony/OppoTelephonyManager;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/ITelephony;->oppoSimPhonebookIsReady()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, ex:Landroid/os/RemoteException;
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public oppoSimPhonebookIsReadyGemini(I)I
    .locals 1
    .parameter "simId"

    .prologue
    .line 367
    const/4 v0, -0x1

    return v0
.end method
