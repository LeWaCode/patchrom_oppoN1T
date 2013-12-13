.class public Lcom/android/server/SreService;
.super Lcom/android/internal/sre/ISreManager$Stub;
.source "SreService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/SreService$MyPhoneStateListener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = true

.field private static final GLOABL_OPEN_SRE:Z = false

.field public static final PROP_SRE_FLAG:Ljava/lang/String; = "persist.sys.sre_flag"

.field public static final PROP_SRE_VALUE:Ljava/lang/String; = "persist.sys.sre_value"

.field private static final SENDOR_DELAY:I = 0x1312d00

.field public static final SRE_NODE:Ljava/lang/String; = "/sys/devices/virtual/graphics/fb0/sre"

.field private static final TAG:Ljava/lang/String; = "SreService"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mLightSensor:Landroid/hardware/Sensor;

.field private mLightSensorListener:Landroid/hardware/SensorEventListener;

.field private mRecevier:Landroid/content/BroadcastReceiver;

.field private mScreenOn:Z

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mShouldListenerWhenScreenOn:Z

.field private mSreHandler:Landroid/os/Handler;

.field private mSreHandlerThread:Landroid/os/HandlerThread;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private mValue:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 75
    invoke-direct {p0}, Lcom/android/internal/sre/ISreManager$Stub;-><init>()V

    .line 54
    iput-object v1, p0, Lcom/android/server/SreService;->mContext:Landroid/content/Context;

    .line 55
    iput-object v1, p0, Lcom/android/server/SreService;->mSensorManager:Landroid/hardware/SensorManager;

    .line 57
    iput-object v1, p0, Lcom/android/server/SreService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/server/SreService;->mValue:I

    .line 64
    iput-boolean v2, p0, Lcom/android/server/SreService;->mScreenOn:Z

    .line 65
    iput-boolean v2, p0, Lcom/android/server/SreService;->mShouldListenerWhenScreenOn:Z

    .line 67
    iput-object v1, p0, Lcom/android/server/SreService;->mSreHandlerThread:Landroid/os/HandlerThread;

    .line 68
    iput-object v1, p0, Lcom/android/server/SreService;->mSreHandler:Landroid/os/Handler;

    .line 69
    iput-object v1, p0, Lcom/android/server/SreService;->mLightSensor:Landroid/hardware/Sensor;

    .line 117
    new-instance v0, Lcom/android/server/SreService$1;

    invoke-direct {v0, p0}, Lcom/android/server/SreService$1;-><init>(Lcom/android/server/SreService;)V

    iput-object v0, p0, Lcom/android/server/SreService;->mLightSensorListener:Landroid/hardware/SensorEventListener;

    .line 158
    new-instance v0, Lcom/android/server/SreService$2;

    invoke-direct {v0, p0}, Lcom/android/server/SreService$2;-><init>(Lcom/android/server/SreService;)V

    iput-object v0, p0, Lcom/android/server/SreService;->mRecevier:Landroid/content/BroadcastReceiver;

    .line 76
    iput-object p1, p0, Lcom/android/server/SreService;->mContext:Landroid/content/Context;

    .line 79
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "SreService"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/SreService;->mSreHandlerThread:Landroid/os/HandlerThread;

    .line 80
    iget-object v0, p0, Lcom/android/server/SreService;->mSreHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 82
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/SreService;->mSreHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/server/SreService;->mSreHandler:Landroid/os/Handler;

    .line 83
    new-instance v0, Landroid/hardware/SystemSensorManager;

    iget-object v1, p0, Lcom/android/server/SreService;->mSreHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/hardware/SystemSensorManager;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/server/SreService;->mSensorManager:Landroid/hardware/SensorManager;

    .line 85
    iget-object v0, p0, Lcom/android/server/SreService;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/SreService;->mLightSensor:Landroid/hardware/Sensor;

    .line 88
    const-string v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/android/server/SreService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 89
    iget-object v0, p0, Lcom/android/server/SreService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    new-instance v1, Lcom/android/server/SreService$MyPhoneStateListener;

    invoke-direct {v1, p0}, Lcom/android/server/SreService$MyPhoneStateListener;-><init>(Lcom/android/server/SreService;)V

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 90
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/SreService;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget v0, p0, Lcom/android/server/SreService;->mValue:I

    return v0
.end method

.method static synthetic access$002(Lcom/android/server/SreService;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 49
    iput p1, p0, Lcom/android/server/SreService;->mValue:I

    return p1
.end method

.method static synthetic access$100(Lcom/android/server/SreService;Ljava/lang/String;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/android/server/SreService;->writeSreNode(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/android/server/SreService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/android/server/SreService;->unRegisterSreLightSensorListenr()V

    return-void
.end method

.method static synthetic access$302(Lcom/android/server/SreService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/android/server/SreService;->mScreenOn:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/server/SreService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/android/server/SreService;->mShouldListenerWhenScreenOn:Z

    return v0
.end method

.method static synthetic access$402(Lcom/android/server/SreService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/android/server/SreService;->mShouldListenerWhenScreenOn:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/server/SreService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/android/server/SreService;->registerSreLightSensorListenr()V

    return-void
.end method

.method private registerSreLightSensorListenr()V
    .locals 0

    .prologue
    .line 283
    return-void
.end method

.method private unRegisterSreLightSensorListenr()V
    .locals 0

    .prologue
    .line 291
    return-void
.end method

.method private writeSreNode(Ljava/lang/String;)Z
    .locals 6
    .parameter "value"

    .prologue
    .line 143
    new-instance v0, Ljava/io/File;

    const-string v3, "/sys/devices/virtual/graphics/fb0/sre"

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 146
    .local v0, cabcFile:Ljava/io/File;
    :try_start_0
    new-instance v2, Ljava/io/FileWriter;

    invoke-direct {v2, v0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 147
    .local v2, fr:Ljava/io/FileWriter;
    invoke-virtual {v2, p1}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 148
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V

    .line 149
    const-string v3, "SreService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "write sre node succeed! value="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    const/4 v3, 0x1

    .line 155
    .end local v2           #fr:Ljava/io/FileWriter;
    :goto_0
    return v3

    .line 151
    :catch_0
    move-exception v1

    .line 152
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 153
    const-string v3, "SreService"

    const-string v4, "write sre node failed!"

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    const/4 v3, 0x0

    goto :goto_0
.end method


# virtual methods
.method public closeSre()V
    .locals 2

    .prologue
    .line 208
    const-string v0, "persist.sys.sre_flag"

    const-string v1, "1"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    return-void
.end method

.method public openSre()V
    .locals 2

    .prologue
    .line 203
    const-string v0, "persist.sys.sre_flag"

    const-string v1, "0"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    return-void
.end method

.method public setValue(I)V
    .locals 2
    .parameter "value"

    .prologue
    .line 198
    const-string v0, "persist.sys.sre_value"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    return-void
.end method

.method public startListener()V
    .locals 3

    .prologue
    .line 216
    const-string v0, "SreService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startListener=========== mScreenOn = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/server/SreService;->mScreenOn:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    iget-object v0, p0, Lcom/android/server/SreService;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/server/SreService;->mScreenOn:Z

    if-eqz v0, :cond_0

    .line 224
    invoke-direct {p0}, Lcom/android/server/SreService;->registerSreLightSensorListenr()V

    .line 226
    :cond_0
    return-void
.end method

.method public stopListener()V
    .locals 2

    .prologue
    .line 232
    const-string v0, "SreService"

    const-string v1, "stopListener==========="

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    iget-object v0, p0, Lcom/android/server/SreService;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_0

    .line 238
    invoke-direct {p0}, Lcom/android/server/SreService;->unRegisterSreLightSensorListenr()V

    .line 240
    :cond_0
    return-void
.end method

.method public systemReady()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    .line 96
    const-string v0, "SreService"

    const-string v1, "systemReady=========="

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .line 99
    .local v3, filter:Landroid/content/IntentFilter;
    const-string v0, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 100
    const-string v0, "android.intent.action.SCREEN_ON"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 101
    iget-object v0, p0, Lcom/android/server/SreService;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/server/SreService;->mRecevier:Landroid/content/BroadcastReceiver;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/Context;->registerReceiverAsUser(Landroid/content/BroadcastReceiver;Landroid/os/UserHandle;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 113
    invoke-direct {p0}, Lcom/android/server/SreService;->registerSreLightSensorListenr()V

    .line 115
    return-void
.end method
