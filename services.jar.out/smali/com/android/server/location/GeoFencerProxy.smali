.class public Lcom/android/server/location/GeoFencerProxy;
.super Lcom/android/server/location/GeoFencerBase;
.source "GeoFencerProxy.java"


# static fields
.field private static final LOGV_ENABLED:Z = true

.field private static final TAG:Ljava/lang/String; = "GeoFencerProxy"

.field private static mGeoFencerProxy:Lcom/android/server/location/GeoFencerProxy;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mGeoFencer:Landroid/location/IGeoFencer;

.field private final mIntent:Landroid/content/Intent;

.field private final mListener:Landroid/location/IGeoFenceListener$Stub;

.field private final mServiceConnection:Landroid/content/ServiceConnection;


# direct methods
.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5
    .parameter "context"
    .parameter "serviceName"

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/android/server/location/GeoFencerBase;-><init>()V

    .line 50
    new-instance v0, Lcom/android/server/location/GeoFencerProxy$1;

    invoke-direct {v0, p0}, Lcom/android/server/location/GeoFencerProxy$1;-><init>(Lcom/android/server/location/GeoFencerProxy;)V

    iput-object v0, p0, Lcom/android/server/location/GeoFencerProxy;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 66
    new-instance v0, Lcom/android/server/location/GeoFencerProxy$2;

    invoke-direct {v0, p0}, Lcom/android/server/location/GeoFencerProxy$2;-><init>(Lcom/android/server/location/GeoFencerProxy;)V

    iput-object v0, p0, Lcom/android/server/location/GeoFencerProxy;->mListener:Landroid/location/IGeoFenceListener$Stub;

    .line 83
    iput-object p1, p0, Lcom/android/server/location/GeoFencerProxy;->mContext:Landroid/content/Context;

    .line 84
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/location/GeoFencerProxy;->mIntent:Landroid/content/Intent;

    .line 85
    iget-object v0, p0, Lcom/android/server/location/GeoFencerProxy;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/server/location/GeoFencerProxy;->mIntent:Landroid/content/Intent;

    iget-object v2, p0, Lcom/android/server/location/GeoFencerProxy;->mServiceConnection:Landroid/content/ServiceConnection;

    const/16 v3, 0x15

    const/4 v4, -0x2

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;II)Z

    .line 88
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/location/GeoFencerProxy;)Landroid/location/IGeoFencer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencer:Landroid/location/IGeoFencer;

    return-object v0
.end method

.method static synthetic access$002(Lcom/android/server/location/GeoFencerProxy;Landroid/location/IGeoFencer;)Landroid/location/IGeoFencer;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    iput-object p1, p0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencer:Landroid/location/IGeoFencer;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/server/location/GeoFencerProxy;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/android/server/location/GeoFencerProxy;->logv(Ljava/lang/String;)V

    return-void
.end method

.method private ensureGeoFencer()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 103
    iget-object v2, p0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencer:Landroid/location/IGeoFencer;

    if-nez v2, :cond_0

    .line 105
    :try_start_0
    iget-object v3, p0, Lcom/android/server/location/GeoFencerProxy;->mServiceConnection:Landroid/content/ServiceConnection;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :try_start_1
    const-string v2, "waiting..."

    invoke-direct {p0, v2}, Lcom/android/server/location/GeoFencerProxy;->logv(Ljava/lang/String;)V

    .line 107
    iget-object v2, p0, Lcom/android/server/location/GeoFencerProxy;->mServiceConnection:Landroid/content/ServiceConnection;

    const-wide/32 v4, 0xea60

    invoke-virtual {v2, v4, v5}, Ljava/lang/Object;->wait(J)V

    .line 108
    const-string v2, "woke up!!!"

    invoke-direct {p0, v2}, Lcom/android/server/location/GeoFencerProxy;->logv(Ljava/lang/String;)V

    .line 109
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 115
    iget-object v2, p0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencer:Landroid/location/IGeoFencer;

    if-nez v2, :cond_0

    .line 116
    const-string v2, "GeoFencerProxy"

    const-string v3, "Timed out. No GeoFencer connection"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :goto_0
    return v1

    .line 109
    :catchall_0
    move-exception v2

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v2
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 110
    :catch_0
    move-exception v0

    .line 111
    .local v0, ie:Ljava/lang/InterruptedException;
    const-string v2, "GeoFencerProxy"

    const-string v3, "Interrupted while waiting for GeoFencer"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 121
    .end local v0           #ie:Ljava/lang/InterruptedException;
    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static getGeoFencerProxy(Landroid/content/Context;Ljava/lang/String;)Lcom/android/server/location/GeoFencerProxy;
    .locals 1
    .parameter "context"
    .parameter "serviceName"

    .prologue
    .line 76
    sget-object v0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencerProxy:Lcom/android/server/location/GeoFencerProxy;

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Lcom/android/server/location/GeoFencerProxy;

    invoke-direct {v0, p0, p1}, Lcom/android/server/location/GeoFencerProxy;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencerProxy:Lcom/android/server/location/GeoFencerProxy;

    .line 79
    :cond_0
    sget-object v0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencerProxy:Lcom/android/server/location/GeoFencerProxy;

    return-object v0
.end method

.method private logv(Ljava/lang/String;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 146
    const-string v0, "GeoFencerProxy"

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    return-void
.end method


# virtual methods
.method public removeCaller(I)V
    .locals 2
    .parameter "uid"

    .prologue
    .line 91
    invoke-super {p0, p1}, Lcom/android/server/location/GeoFencerBase;->removeCaller(I)V

    .line 92
    iget-object v0, p0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencer:Landroid/location/IGeoFencer;

    if-eqz v0, :cond_0

    .line 94
    :try_start_0
    iget-object v0, p0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencer:Landroid/location/IGeoFencer;

    invoke-interface {v0, p1}, Landroid/location/IGeoFencer;->clearGeoFenceUser(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    return-void

    .line 99
    :cond_0
    const-string v0, "GeoFencerProxy"

    const-string v1, "removeCaller - mGeoFencer is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 95
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected start(Landroid/location/GeoFenceParams;)Z
    .locals 2
    .parameter "geofence"

    .prologue
    .line 125
    invoke-direct {p0}, Lcom/android/server/location/GeoFencerProxy;->ensureGeoFencer()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    :try_start_0
    iget-object v0, p0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencer:Landroid/location/IGeoFencer;

    iget-object v1, p0, Lcom/android/server/location/GeoFencerProxy;->mListener:Landroid/location/IGeoFenceListener$Stub;

    invoke-interface {v0, v1, p1}, Landroid/location/IGeoFencer;->setGeoFence(Landroid/os/IBinder;Landroid/location/GeoFenceParams;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 131
    :goto_0
    return v0

    .line 128
    :catch_0
    move-exception v0

    .line 131
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected stop(Landroid/app/PendingIntent;)Z
    .locals 2
    .parameter "intent"

    .prologue
    .line 135
    invoke-direct {p0}, Lcom/android/server/location/GeoFencerProxy;->ensureGeoFencer()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    :try_start_0
    iget-object v0, p0, Lcom/android/server/location/GeoFencerProxy;->mGeoFencer:Landroid/location/IGeoFencer;

    iget-object v1, p0, Lcom/android/server/location/GeoFencerProxy;->mListener:Landroid/location/IGeoFenceListener$Stub;

    invoke-interface {v0, v1, p1}, Landroid/location/IGeoFencer;->clearGeoFence(Landroid/os/IBinder;Landroid/app/PendingIntent;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    const/4 v0, 0x1

    .line 142
    :goto_0
    return v0

    .line 139
    :catch_0
    move-exception v0

    .line 142
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
