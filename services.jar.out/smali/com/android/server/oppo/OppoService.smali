.class public final Lcom/android/server/oppo/OppoService;
.super Landroid/os/IOppoService$Stub;
.source "OppoService.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final GET_IMEI_NO_DELAY:I = 0x4e20

.field private static final MSG_GET_IMEI_NO:I = 0x2

.field private static final TAG:Ljava/lang/String; = "OppoService"


# instance fields
.field private mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mRetry:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    .line 77
    invoke-direct {p0}, Landroid/os/IOppoService$Stub;-><init>()V

    .line 27
    const/4 v1, 0x7

    iput v1, p0, Lcom/android/server/oppo/OppoService;->mRetry:I

    .line 31
    new-instance v1, Lcom/android/server/oppo/OppoService$1;

    invoke-direct {v1, p0}, Lcom/android/server/oppo/OppoService$1;-><init>(Lcom/android/server/oppo/OppoService;)V

    iput-object v1, p0, Lcom/android/server/oppo/OppoService;->mHandler:Landroid/os/Handler;

    .line 78
    iput-object p1, p0, Lcom/android/server/oppo/OppoService;->mContext:Landroid/content/Context;

    .line 81
    iget-object v1, p0, Lcom/android/server/oppo/OppoService;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/server/oppo/OppoService;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v3, 0x4e20

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 83
    invoke-direct {p0}, Lcom/android/server/oppo/OppoService;->native_initRawPartition()Z

    move-result v0

    .line 84
    .local v0, b:Z
    if-nez v0, :cond_0

    .line 85
    const-string v1, "OppoService"

    const-string v2, "RawPartition init failed!"

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/oppo/OppoService;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    iget v0, p0, Lcom/android/server/oppo/OppoService;->mRetry:I

    return v0
.end method

.method static synthetic access$002(Lcom/android/server/oppo/OppoService;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 20
    iput p1, p0, Lcom/android/server/oppo/OppoService;->mRetry:I

    return p1
.end method

.method static synthetic access$010(Lcom/android/server/oppo/OppoService;)I
    .locals 2
    .parameter "x0"

    .prologue
    .line 20
    iget v0, p0, Lcom/android/server/oppo/OppoService;->mRetry:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/android/server/oppo/OppoService;->mRetry:I

    return v0
.end method

.method static synthetic access$100(Lcom/android/server/oppo/OppoService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/android/server/oppo/OppoService;->isFactoryMode()Z

    move-result v0

    return v0
.end method

.method private isFactoryMode()Z
    .locals 7

    .prologue
    .line 58
    const/4 v2, 0x0

    .line 59
    .local v2, imei:Ljava/lang/String;
    const/4 v3, 0x0

    .line 61
    .local v3, result:Z
    :try_start_0
    const-string v4, "iphonesubinfo"

    invoke-static {v4}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/IPhoneSubInfo$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/IPhoneSubInfo;

    move-result-object v1

    .line 62
    .local v1, iPhoneSubInfo:Lcom/android/internal/telephony/IPhoneSubInfo;
    if-nez v1, :cond_0

    .line 63
    const-string v4, "OppoService"

    const-string v5, "iphonesubinfo service is not ready!"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    const/4 v4, 0x0

    .line 75
    .end local v1           #iPhoneSubInfo:Lcom/android/internal/telephony/IPhoneSubInfo;
    :goto_0
    return v4

    .line 66
    .restart local v1       #iPhoneSubInfo:Lcom/android/internal/telephony/IPhoneSubInfo;
    :cond_0
    invoke-interface {v1}, Lcom/android/internal/telephony/IPhoneSubInfo;->getDeviceId()Ljava/lang/String;

    move-result-object v2

    .line 67
    if-eqz v2, :cond_1

    if-eqz v2, :cond_2

    const-string v4, "0"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_2

    .line 68
    :cond_1
    const/4 v3, 0x1

    .end local v1           #iPhoneSubInfo:Lcom/android/internal/telephony/IPhoneSubInfo;
    :cond_2
    :goto_1
    move v4, v3

    .line 75
    goto :goto_0

    .line 70
    :catch_0
    move-exception v0

    .line 71
    .local v0, ex:Landroid/os/RemoteException;
    const/4 v3, 0x0

    .line 72
    const-string v4, "OppoService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getDeviceId remoteException:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private native nativeAdjustLCDFrequency(I)I
.end method

.method private native native_finalizeRawPartition()V
.end method

.method private native native_initRawPartition()Z
.end method

.method private native native_readRawPartition(II)Ljava/lang/String;
.end method

.method private native native_writeRawPartition(ILjava/lang/String;)I
.end method


# virtual methods
.method public adjustLCDFrequency(I)I
    .locals 4
    .parameter "rate"

    .prologue
    .line 103
    invoke-direct {p0, p1}, Lcom/android/server/oppo/OppoService;->nativeAdjustLCDFrequency(I)I

    move-result v0

    .line 104
    .local v0, res:I
    const-string v1, "OppoService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "nativeAdjustLCDFrequency return :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    return v0
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/android/server/oppo/OppoService;->native_finalizeRawPartition()V

    .line 90
    invoke-super {p0}, Landroid/os/IOppoService$Stub;->finalize()V

    .line 91
    return-void
.end method

.method public readRawPartition(II)Ljava/lang/String;
    .locals 1
    .parameter "id"
    .parameter "size"

    .prologue
    .line 120
    invoke-direct {p0, p1, p2}, Lcom/android/server/oppo/OppoService;->native_readRawPartition(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeRawPartition(ILjava/lang/String;)I
    .locals 1
    .parameter "id"
    .parameter "content"

    .prologue
    .line 124
    invoke-direct {p0, p1, p2}, Lcom/android/server/oppo/OppoService;->native_writeRawPartition(ILjava/lang/String;)I

    move-result v0

    return v0
.end method
