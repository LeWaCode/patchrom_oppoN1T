.class Lcom/android/server/ServerThread;
.super Ljava/lang/Thread;
.source "SystemServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/ServerThread$Injector;
    }
.end annotation


# static fields
.field private static final ENCRYPTED_STATE:Ljava/lang/String; = "1"

.field private static final ENCRYPTING_STATE:Ljava/lang/String; = "trigger_restart_min_framework"

.field private static final TAG:Ljava/lang/String; = "SystemServer"


# instance fields
.field mContentResolver:Landroid/content/ContentResolver;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method static final startSystemUi(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    .line 1156
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1157
    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1160
    sget-object v1, Landroid/os/UserHandle;->OWNER:Landroid/os/UserHandle;

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->startServiceAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/ComponentName;

    .line 1161
    return-void
.end method


# virtual methods
.method reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .parameter "msg"
    .parameter "e"

    .prologue
    .line 113
    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    const-string v0, "SystemServer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BOOT FAILURE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 115
    return-void
.end method

.method public run()V
    .locals 160
    .annotation build Landroid/annotation/OppoHook;
        level = .enum Landroid/annotation/OppoHook$OppoHookType;->CHANGE_CODE:Landroid/annotation/OppoHook$OppoHookType;
        note = "Jun.Zhang@Plf.Framework, to use oppo button light, three pointers move shot screen; TongXi.Li@Plf.Framework modify for use OppoUsbService"
        property = .enum Landroid/annotation/OppoHook$OppoRomType;->ROM:Landroid/annotation/OppoHook$OppoRomType;
    .end annotation

    .prologue
    .line 122
    const/16 v7, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    invoke-static {v7, v11, v12}, Landroid/util/EventLog;->writeEvent(IJ)I

    .line 125
    invoke-static {}, Landroid/os/Looper;->prepareMainLooper()V

    .line 127
    const/4 v7, -0x2

    invoke-static {v7}, Landroid/os/Process;->setThreadPriority(I)V

    .line 130
    const/4 v7, 0x1

    invoke-static {v7}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    .line 131
    const/4 v7, 0x0

    invoke-static {v7}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 135
    const-string v7, "sys.shutdown.requested"

    const-string v9, ""

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v130

    .line 137
    .local v130, shutdownAction:Ljava/lang/String;
    if-eqz v130, :cond_0

    invoke-virtual/range {v130 .. v130}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_0

    .line 138
    const/4 v7, 0x0

    move-object/from16 v0, v130

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v9, 0x31

    if-ne v7, v9, :cond_10

    const/16 v121, 0x1

    .line 141
    .local v121, reboot:Z
    :goto_0
    invoke-virtual/range {v130 .. v130}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v9, 0x1

    if-le v7, v9, :cond_11

    .line 142
    const/4 v7, 0x1

    invoke-virtual/range {v130 .. v130}, Ljava/lang/String;->length()I

    move-result v9

    move-object/from16 v0, v130

    invoke-virtual {v0, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v120

    .line 147
    .local v120, reason:Ljava/lang/String;
    :goto_1
    move/from16 v0, v121

    move-object/from16 v1, v120

    invoke-static {v0, v1}, Lcom/android/server/power/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 151
    .end local v120           #reason:Ljava/lang/String;
    .end local v121           #reboot:Z
    :cond_0
    const-string v7, "ro.factorytest"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v90

    .line 152
    .local v90, factoryTestStr:Ljava/lang/String;
    const-string v7, ""

    move-object/from16 v0, v90

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_12

    const/16 v89, 0x0

    .line 154
    .local v89, factoryTest:I
    :goto_2
    const-string v7, "1"

    const-string v9, "ro.config.headless"

    const-string v11, "0"

    invoke-static {v9, v11}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    .line 156
    .local v33, headless:Z
    const/16 v95, 0x0

    .line 157
    .local v95, installer:Lcom/android/server/pm/Installer;
    const/16 v61, 0x0

    .line 158
    .local v61, accountManager:Landroid/accounts/AccountManagerService;
    const/16 v77, 0x0

    .line 159
    .local v77, contentService:Landroid/content/ContentService;
    const/16 v97, 0x0

    .line 160
    .local v97, lights:Lcom/android/server/LightsService;
    const/16 v115, 0x0

    .line 161
    .local v115, power:Lcom/android/server/power/PowerManagerService;
    const/16 v83, 0x0

    .line 162
    .local v83, display:Lcom/android/server/display/DisplayManagerService;
    const/16 v67, 0x0

    .line 163
    .local v67, battery:Lcom/android/server/BatteryService;
    const/16 v149, 0x0

    .line 164
    .local v149, vibrator:Lcom/android/server/VibratorService;
    const/16 v63, 0x0

    .line 165
    .local v63, alarm:Lcom/android/server/AlarmManagerService;
    const/16 v103, 0x0

    .line 166
    .local v103, mountService:Lcom/android/server/MountService;
    const/16 v30, 0x0

    .line 167
    .local v30, networkManagement:Lcom/android/server/NetworkManagementService;
    const/16 v29, 0x0

    .line 168
    .local v29, networkStats:Lcom/android/server/net/NetworkStatsService;
    const/16 v107, 0x0

    .line 169
    .local v107, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    const/16 v75, 0x0

    .line 170
    .local v75, connectivity:Lcom/android/server/ConnectivityService;
    const/16 v116, 0x0

    .line 171
    .local v116, qcCon:Ljava/lang/Object;
    const/16 v156, 0x0

    .line 172
    .local v156, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    const/16 v154, 0x0

    .line 173
    .local v154, wifi:Lcom/android/server/WifiService;
    const/16 v129, 0x0

    .line 174
    .local v129, serviceDiscovery:Lcom/android/server/NsdService;
    const/16 v114, 0x0

    .line 175
    .local v114, pm:Landroid/content/pm/IPackageManager;
    const/4 v5, 0x0

    .line 176
    .local v5, context:Landroid/content/Context;
    const/16 v158, 0x0

    .line 177
    .local v158, wm:Lcom/android/server/wm/WindowManagerService;
    const/16 v68, 0x0

    .line 178
    .local v68, bluetooth:Lcom/android/server/BluetoothManagerService;
    const/16 v84, 0x0

    .line 179
    .local v84, dock:Lcom/android/server/DockObserver;
    const/16 v124, 0x0

    .line 180
    .local v124, regulatory:Lcom/android/server/RegulatoryObserver;
    const/16 v146, 0x0

    .line 181
    .local v146, usb:Lcom/android/server/usb/UsbService;
    const/16 v127, 0x0

    .line 182
    .local v127, serial:Lcom/android/server/SerialService;
    const/16 v141, 0x0

    .line 183
    .local v141, twilight:Lcom/android/server/TwilightService;
    const/16 v144, 0x0

    .line 184
    .local v144, uiMode:Lcom/android/server/UiModeManagerService;
    const/16 v122, 0x0

    .line 185
    .local v122, recognition:Lcom/android/server/RecognitionManagerService;
    const/16 v137, 0x0

    .line 186
    .local v137, throttle:Lcom/android/server/ThrottleService;
    const/16 v109, 0x0

    .line 187
    .local v109, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    const/16 v72, 0x0

    .line 188
    .local v72, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    const/16 v94, 0x0

    .line 189
    .local v94, inputManager:Lcom/android/server/input/InputManagerService;
    const/16 v135, 0x0

    .line 190
    .local v135, telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    const/16 v105, 0x0

    .line 197
    .local v105, msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    new-instance v143, Landroid/os/HandlerThread;

    const-string v7, "UI"

    move-object/from16 v0, v143

    invoke-direct {v0, v7}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 198
    .local v143, uiHandlerThread:Landroid/os/HandlerThread;
    invoke-virtual/range {v143 .. v143}, Landroid/os/HandlerThread;->start()V

    .line 199
    new-instance v20, Landroid/os/Handler;

    invoke-virtual/range {v143 .. v143}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-direct {v0, v7}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 200
    .local v20, uiHandler:Landroid/os/Handler;
    new-instance v7, Lcom/android/server/ServerThread$1;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;)V

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 217
    new-instance v159, Landroid/os/HandlerThread;

    const-string v7, "WindowManager"

    move-object/from16 v0, v159

    invoke-direct {v0, v7}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 218
    .local v159, wmHandlerThread:Landroid/os/HandlerThread;
    invoke-virtual/range {v159 .. v159}, Landroid/os/HandlerThread;->start()V

    .line 219
    new-instance v21, Landroid/os/Handler;

    invoke-virtual/range {v159 .. v159}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v7

    move-object/from16 v0, v21

    invoke-direct {v0, v7}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 220
    .local v21, wmHandler:Landroid/os/Handler;
    new-instance v7, Lcom/android/server/ServerThread$2;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/android/server/ServerThread$2;-><init>(Lcom/android/server/ServerThread;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 237
    const/16 v24, 0x0

    .line 242
    .local v24, onlyCore:Z
    :try_start_0
    const-string v7, "SystemServer"

    const-string v9, "Waiting for installd to be ready."

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    new-instance v96, Lcom/android/server/pm/Installer;

    invoke-direct/range {v96 .. v96}, Lcom/android/server/pm/Installer;-><init>()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_52

    .line 244
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .local v96, installer:Lcom/android/server/pm/Installer;
    :try_start_1
    invoke-virtual/range {v96 .. v96}, Lcom/android/server/pm/Installer;->ping()Z

    .line 246
    const-string v7, "SystemServer"

    const-string v9, "Entropy Mixer"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    const-string v7, "entropy"

    new-instance v9, Lcom/android/server/EntropyMixer;

    invoke-direct {v9}, Lcom/android/server/EntropyMixer;-><init>()V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 249
    const-string v7, "SystemServer"

    const-string v9, "Power Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    new-instance v4, Lcom/android/server/power/PowerManagerService;

    invoke-direct {v4}, Lcom/android/server/power/PowerManagerService;-><init>()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_53

    .line 251
    .end local v115           #power:Lcom/android/server/power/PowerManagerService;
    .local v4, power:Lcom/android/server/power/PowerManagerService;
    :try_start_2
    const-string v7, "power"

    invoke-static {v7, v4}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 253
    const-string v7, "SystemServer"

    const-string v9, "Activity Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    invoke-static/range {v89 .. v89}, Lcom/android/server/am/ActivityManagerService;->main(I)Landroid/content/Context;

    move-result-object v5

    .line 256
    const-string v7, "SystemServer"

    const-string v9, "Display Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    new-instance v10, Lcom/android/server/display/DisplayManagerService;

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-direct {v10, v5, v0, v1}, Lcom/android/server/display/DisplayManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;Landroid/os/Handler;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_54

    .line 258
    .end local v83           #display:Lcom/android/server/display/DisplayManagerService;
    .local v10, display:Lcom/android/server/display/DisplayManagerService;
    :try_start_3
    const-string v7, "display"

    const/4 v9, 0x1

    invoke-static {v7, v10, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;Z)V

    .line 260
    const-string v7, "SystemServer"

    const-string v9, "Telephony Registry"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    new-instance v136, Lcom/android/server/TelephonyRegistry;

    move-object/from16 v0, v136

    invoke-direct {v0, v5}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_55

    .line 262
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .local v136, telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :try_start_4
    const-string v7, "telephony.registry"

    move-object/from16 v0, v136

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 264
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 265
    const-string v7, "SystemServer"

    const-string v9, "MSimTelephony Registry"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    new-instance v106, Lcom/android/server/MSimTelephonyRegistry;

    move-object/from16 v0, v106

    invoke-direct {v0, v5}, Lcom/android/server/MSimTelephonyRegistry;-><init>(Landroid/content/Context;)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_1

    .line 267
    .end local v105           #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .local v106, msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    :try_start_5
    const-string v7, "telephony.msim.registry"

    move-object/from16 v0, v106

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_56

    move-object/from16 v105, v106

    .line 270
    .end local v106           #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .restart local v105       #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    :cond_1
    :try_start_6
    const-string v7, "SystemServer"

    const-string v9, "Scheduling Policy"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    const-string v7, "scheduling_policy"

    new-instance v9, Landroid/os/SchedulingPolicyService;

    invoke-direct {v9}, Landroid/os/SchedulingPolicyService;-><init>()V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 274
    invoke-static {v5}, Lcom/android/server/AttributeCache;->init(Landroid/content/Context;)V

    .line 276
    invoke-virtual {v10}, Lcom/android/server/display/DisplayManagerService;->waitForDefaultDisplay()Z

    move-result v7

    if-nez v7, :cond_2

    .line 277
    const-string v7, "Timeout waiting for default display to be initialized."

    new-instance v9, Ljava/lang/Throwable;

    invoke-direct {v9}, Ljava/lang/Throwable;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v9}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 281
    :cond_2
    const-string v7, "SystemServer"

    const-string v9, "Package Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    const-string v7, "vold.decrypt"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v80

    .line 284
    .local v80, cryptState:Ljava/lang/String;
    const-string v7, "trigger_restart_min_framework"

    move-object/from16 v0, v80

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 285
    const-string v7, "SystemServer"

    const-string v9, "Detected encryption in progress - only parsing core apps"

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    const/16 v24, 0x1

    .line 292
    :cond_3
    :goto_3
    if-eqz v89, :cond_14

    const/4 v7, 0x1

    :goto_4
    move-object/from16 v0, v96

    move/from16 v1, v24

    invoke-static {v5, v0, v7, v1}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;Lcom/android/server/pm/Installer;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_1

    move-result-object v114

    .line 295
    const/16 v91, 0x0

    .line 297
    .local v91, firstBoot:Z
    :try_start_7
    invoke-interface/range {v114 .. v114}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_3a
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_1

    move-result v91

    .line 301
    :goto_5
    :try_start_8
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    .line 303
    const-string v7, "SystemServer"

    const-string v9, "User Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    const-string v7, "user"

    invoke-static {}, Lcom/android/server/pm/UserManagerService;->getInstance()Lcom/android/server/pm/UserManagerService;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 308
    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_1

    .line 312
    :try_start_9
    const-string v7, "SystemServer"

    const-string v9, "Account Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    new-instance v62, Landroid/accounts/AccountManagerService;

    move-object/from16 v0, v62

    invoke-direct {v0, v5}, Landroid/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_1

    .line 314
    .end local v61           #accountManager:Landroid/accounts/AccountManagerService;
    .local v62, accountManager:Landroid/accounts/AccountManagerService;
    :try_start_a
    const-string v7, "account"

    move-object/from16 v0, v62

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_5d
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_57

    move-object/from16 v61, v62

    .line 319
    .end local v62           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v61       #accountManager:Landroid/accounts/AccountManagerService;
    :goto_6
    :try_start_b
    const-string v7, "SystemServer"

    const-string v9, "Content Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    const/4 v7, 0x1

    move/from16 v0, v89

    if-ne v0, v7, :cond_15

    const/4 v7, 0x1

    :goto_7
    invoke-static {v5, v7}, Landroid/content/ContentService;->main(Landroid/content/Context;Z)Landroid/content/ContentService;

    move-result-object v77

    .line 323
    const-string v7, "SystemServer"

    const-string v9, "System Content Providers"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->installSystemProviders()V

    .line 326
    const-string v7, "SystemServer"

    const-string v9, "Lights Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    new-instance v6, Lcom/android/server/LewaLightsService;

    invoke-direct {v6, v5}, Lcom/android/server/LewaLightsService;-><init>(Landroid/content/Context;)V
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_1

    .line 337
    .end local v97           #lights:Lcom/android/server/LightsService;
    .local v6, lights:Lcom/android/server/LightsService;
    :try_start_c
    const-string v7, "SystemServer"

    const-string v9, "Battery Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    new-instance v8, Lcom/android/server/BatteryService;

    invoke-direct {v8, v5, v6}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;Lcom/android/server/LightsService;)V
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_58

    .line 339
    .end local v67           #battery:Lcom/android/server/BatteryService;
    .local v8, battery:Lcom/android/server/BatteryService;
    :try_start_d
    const-string v7, "battery"

    invoke-static {v7, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 341
    const-string v7, "SystemServer"

    const-string v9, "Vibrator Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 349
    new-instance v150, Lcom/android/server/OppoVibratorService;

    move-object/from16 v0, v150

    invoke-direct {v0, v5}, Lcom/android/server/OppoVibratorService;-><init>(Landroid/content/Context;)V
    :try_end_d
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_59

    .line 351
    .end local v149           #vibrator:Lcom/android/server/VibratorService;
    .local v150, vibrator:Lcom/android/server/VibratorService;
    :try_start_e
    const-string v7, "vibrator"

    move-object/from16 v0, v150

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 355
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    invoke-static {}, Lcom/android/server/am/BatteryStatsService;->getService()Lcom/android/internal/app/IBatteryStats;

    move-result-object v9

    invoke-virtual/range {v4 .. v10}, Lcom/android/server/power/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Lcom/android/server/am/ActivityManagerService;Lcom/android/server/BatteryService;Lcom/android/internal/app/IBatteryStats;Lcom/android/server/display/DisplayManagerService;)V

    .line 358
    const-string v7, "SystemServer"

    const-string v9, "Alarm Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    new-instance v15, Lcom/android/server/AlarmManagerService;

    invoke-direct {v15, v5}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_e} :catch_5a

    .line 360
    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .local v15, alarm:Lcom/android/server/AlarmManagerService;
    :try_start_f
    const-string v7, "alarm"

    invoke-static {v7, v15}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 362
    const-string v7, "SystemServer"

    const-string v9, "Init Watchdog"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v11

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v16

    move-object v12, v5

    move-object v13, v8

    move-object v14, v4

    invoke-virtual/range {v11 .. v16}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/power/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V

    .line 366
    const-string v7, "SystemServer"

    const-string v9, "Input Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    new-instance v19, Lcom/android/server/input/OppoInputManagerService;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-direct {v0, v5, v1}, Lcom/android/server/input/OppoInputManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_f} :catch_5b

    .line 374
    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .local v19, inputManager:Lcom/android/server/input/InputManagerService;
    :try_start_10
    const-string v7, "SystemServer"

    const-string v9, "Window Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    const/4 v7, 0x1

    move/from16 v0, v89

    if-eq v0, v7, :cond_16

    const/16 v22, 0x1

    :goto_8
    if-nez v91, :cond_17

    const/16 v23, 0x1

    :goto_9
    move-object/from16 v16, v5

    move-object/from16 v17, v4

    move-object/from16 v18, v10

    invoke-static/range {v16 .. v24}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/power/PowerManagerService;Lcom/android/server/display/DisplayManagerService;Lcom/android/server/input/InputManagerService;Landroid/os/Handler;Landroid/os/Handler;ZZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v158

    .line 379
    const-string v7, "window"

    move-object/from16 v0, v158

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 380
    const-string v7, "input"

    move-object/from16 v0, v19

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 382
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    move-object/from16 v0, v158

    invoke-virtual {v7, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    .line 384
    invoke-virtual/range {v158 .. v158}, Lcom/android/server/wm/WindowManagerService;->getInputMonitor()Lcom/android/server/wm/InputMonitor;

    move-result-object v7

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Lcom/android/server/input/InputManagerService;->setWindowManagerCallbacks(Lcom/android/server/input/InputManagerService$WindowManagerCallbacks;)V

    .line 385
    invoke-virtual/range {v19 .. v19}, Lcom/android/server/input/InputManagerService;->start()V

    .line 387
    move-object/from16 v0, v158

    invoke-virtual {v10, v0}, Lcom/android/server/display/DisplayManagerService;->setWindowManager(Lcom/android/server/display/DisplayManagerService$WindowManagerFuncs;)V

    .line 388
    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Lcom/android/server/display/DisplayManagerService;->setInputManager(Lcom/android/server/display/DisplayManagerService$InputManagerFuncs;)V

    .line 393
    const-string v7, "ro.kernel.qemu"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v9, "1"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_18

    .line 394
    const-string v7, "SystemServer"

    const-string v9, "No Bluetooh Service (emulator)"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_10
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_10} :catch_2

    :goto_a
    move-object/from16 v135, v136

    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v149, v150

    .end local v150           #vibrator:Lcom/android/server/VibratorService;
    .restart local v149       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v95, v96

    .line 408
    .end local v80           #cryptState:Ljava/lang/String;
    .end local v91           #firstBoot:Z
    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    :goto_b
    const/16 v81, 0x0

    .line 409
    .local v81, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    const/16 v133, 0x0

    .line 410
    .local v133, statusBar:Lcom/android/server/StatusBarManagerService;
    const/16 v92, 0x0

    .line 411
    .local v92, imm:Lcom/android/server/InputMethodManagerService;
    const/16 v64, 0x0

    .line 412
    .local v64, appWidget:Lcom/android/server/AppWidgetService;
    const/16 v70, 0x0

    .line 413
    .local v70, cabcService:Lcom/android/server/CabcService;
    const/16 v131, 0x0

    .line 414
    .local v131, sreService:Lcom/android/server/SreService;
    const/16 v111, 0x0

    .line 415
    .local v111, notification:Lcom/android/server/NotificationManagerService;
    const/16 v152, 0x0

    .line 416
    .local v152, wallpaper:Lcom/android/server/WallpaperManagerService;
    const/16 v98, 0x0

    .line 417
    .local v98, location:Lcom/android/server/LocationManagerService;
    const/16 v78, 0x0

    .line 418
    .local v78, countryDetector:Lcom/android/server/CountryDetectorService;
    const/16 v139, 0x0

    .line 419
    .local v139, tsms:Lcom/android/server/TextServicesManagerService;
    const/16 v100, 0x0

    .line 420
    .local v100, lockSettings:Lcom/android/internal/widget/LockSettingsService;
    const/16 v86, 0x0

    .line 423
    .local v86, dreamy:Lcom/android/server/dreams/DreamManagerService;
    const/4 v7, 0x1

    move/from16 v0, v89

    if-eq v0, v7, :cond_4

    .line 425
    :try_start_11
    const-string v7, "SystemServer"

    const-string v9, "Input Method Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    new-instance v93, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v93

    move-object/from16 v1, v158

    invoke-direct {v0, v5, v1}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_11} :catch_3

    .line 427
    .end local v92           #imm:Lcom/android/server/InputMethodManagerService;
    .local v93, imm:Lcom/android/server/InputMethodManagerService;
    :try_start_12
    const-string v7, "input_method"

    move-object/from16 v0, v93

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_12
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_12} :catch_51

    move-object/from16 v92, v93

    .line 433
    .end local v93           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v92       #imm:Lcom/android/server/InputMethodManagerService;
    :goto_c
    :try_start_13
    const-string v7, "SystemServer"

    const-string v9, "Accessibility Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 434
    const-string v7, "accessibility"

    new-instance v9, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v9, v5}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_13
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_13} :catch_4

    .line 442
    :cond_4
    :goto_d
    :try_start_14
    invoke-virtual/range {v158 .. v158}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_14} :catch_5

    .line 448
    :goto_e
    :try_start_15
    invoke-interface/range {v114 .. v114}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_15} :catch_6

    .line 454
    :goto_f
    :try_start_16
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v7

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x10403f2

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    const/4 v11, 0x0

    invoke-interface {v7, v9, v11}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_16
    .catch Landroid/os/RemoteException; {:try_start_16 .. :try_end_16} :catch_50

    .line 461
    :goto_10
    const/4 v7, 0x1

    move/from16 v0, v89

    if-eq v0, v7, :cond_1b

    .line 462
    const-string v7, "0"

    const-string v9, "system_init.startmountservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 468
    :try_start_17
    const-string v7, "SystemServer"

    const-string v9, "Mount Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 469
    new-instance v104, Lcom/android/server/MountService;

    move-object/from16 v0, v104

    invoke-direct {v0, v5}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_17 .. :try_end_17} :catch_7

    .line 470
    .end local v103           #mountService:Lcom/android/server/MountService;
    .local v104, mountService:Lcom/android/server/MountService;
    :try_start_18
    const-string v7, "mount"

    move-object/from16 v0, v104

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_18
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_18} :catch_4f

    move-object/from16 v103, v104

    .line 477
    .end local v104           #mountService:Lcom/android/server/MountService;
    .restart local v103       #mountService:Lcom/android/server/MountService;
    :cond_5
    :goto_11
    :try_start_19
    const-string v7, "SystemServer"

    const-string v9, "LockSettingsService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    new-instance v101, Lcom/android/internal/widget/LockSettingsService;

    move-object/from16 v0, v101

    invoke-direct {v0, v5}, Lcom/android/internal/widget/LockSettingsService;-><init>(Landroid/content/Context;)V
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_19} :catch_8

    .line 479
    .end local v100           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .local v101, lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :try_start_1a
    const-string v7, "lock_settings"

    move-object/from16 v0, v101

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_1a} :catch_4e

    move-object/from16 v100, v101

    .line 485
    .end local v101           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v100       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :goto_12
    :try_start_1b
    const-string v7, "SystemServer"

    const-string v9, "Device Policy"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    new-instance v82, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v82

    invoke-direct {v0, v5}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_1b
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_1b} :catch_9

    .line 487
    .end local v81           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .local v82, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :try_start_1c
    const-string v7, "device_policy"

    move-object/from16 v0, v82

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1c
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_4d

    move-object/from16 v81, v82

    .line 493
    .end local v82           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v81       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :goto_13
    :try_start_1d
    const-string v7, "SystemServer"

    const-string v9, "Status Bar"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    new-instance v134, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v134

    move-object/from16 v1, v158

    invoke-direct {v0, v5, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_1d
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_1d} :catch_a

    .line 495
    .end local v133           #statusBar:Lcom/android/server/StatusBarManagerService;
    .local v134, statusBar:Lcom/android/server/StatusBarManagerService;
    :try_start_1e
    const-string v7, "statusbar"

    move-object/from16 v0, v134

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_1e .. :try_end_1e} :catch_4c

    move-object/from16 v133, v134

    .line 501
    .end local v134           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v133       #statusBar:Lcom/android/server/StatusBarManagerService;
    :goto_14
    :try_start_1f
    const-string v7, "SystemServer"

    const-string v9, "Clipboard Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 502
    const-string v7, "clipboard"

    new-instance v9, Lcom/android/server/ClipboardService;

    invoke-direct {v9, v5}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "lewa.clipserviceext"

    new-instance v9, Lcom/lewa/server/ClipServiceExtra;

    invoke-direct {v9}, Lcom/lewa/server/ClipServiceExtra;-><init>()V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_1f .. :try_end_1f} :catch_b

    .line 509
    :goto_15
    :try_start_20
    const-string v7, "SystemServer"

    const-string v9, "NetworkManagement Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    invoke-static {v5}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v30

    .line 511
    const-string v7, "network_management"

    move-object/from16 v0, v30

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_20} :catch_c

    .line 517
    :goto_16
    :try_start_21
    const-string v7, "SystemServer"

    const-string v9, "Text Service Manager Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    new-instance v140, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v140

    invoke-direct {v0, v5}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_21
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_21} :catch_d

    .line 519
    .end local v139           #tsms:Lcom/android/server/TextServicesManagerService;
    .local v140, tsms:Lcom/android/server/TextServicesManagerService;
    :try_start_22
    const-string v7, "textservices"

    move-object/from16 v0, v140

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_22} :catch_4b

    move-object/from16 v139, v140

    .line 525
    .end local v140           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v139       #tsms:Lcom/android/server/TextServicesManagerService;
    :goto_17
    :try_start_23
    const-string v7, "SystemServer"

    const-string v9, "NetworkStats Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 526
    new-instance v108, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v108

    move-object/from16 v1, v30

    invoke-direct {v0, v5, v1, v15}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_23
    .catch Ljava/lang/Throwable; {:try_start_23 .. :try_end_23} :catch_e

    .line 527
    .end local v29           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .local v108, networkStats:Lcom/android/server/net/NetworkStatsService;
    :try_start_24
    const-string v7, "netstats"

    move-object/from16 v0, v108

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_24} :catch_4a

    move-object/from16 v29, v108

    .line 533
    .end local v108           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v29       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :goto_18
    :try_start_25
    const-string v7, "SystemServer"

    const-string v9, "NetworkPolicy Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 534
    new-instance v25, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v27

    move-object/from16 v26, v5

    move-object/from16 v28, v4

    invoke-direct/range {v25 .. v30}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_25
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_25} :catch_f

    .line 537
    .end local v107           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .local v25, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    :try_start_26
    const-string v7, "netpolicy"

    move-object/from16 v0, v25

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_26
    .catch Ljava/lang/Throwable; {:try_start_26 .. :try_end_26} :catch_49

    .line 543
    :goto_19
    :try_start_27
    const-string v7, "SystemServer"

    const-string v9, "Regulatory Observer"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 545
    new-instance v125, Lcom/android/server/RegulatoryObserver;

    move-object/from16 v0, v125

    invoke-direct {v0, v5}, Lcom/android/server/RegulatoryObserver;-><init>(Landroid/content/Context;)V
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_27} :catch_10

    .end local v124           #regulatory:Lcom/android/server/RegulatoryObserver;
    .local v125, regulatory:Lcom/android/server/RegulatoryObserver;
    move-object/from16 v124, v125

    .line 551
    .end local v125           #regulatory:Lcom/android/server/RegulatoryObserver;
    .restart local v124       #regulatory:Lcom/android/server/RegulatoryObserver;
    :goto_1a
    :try_start_28
    const-string v7, "SystemServer"

    const-string v9, "Wi-Fi P2pService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    new-instance v157, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v157

    invoke-direct {v0, v5}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_28
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_28} :catch_11

    .line 553
    .end local v156           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .local v157, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :try_start_29
    const-string v7, "wifip2p"

    move-object/from16 v0, v157

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_29
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_29} :catch_48

    move-object/from16 v156, v157

    .line 559
    .end local v157           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v156       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :goto_1b
    :try_start_2a
    const-string v7, "SystemServer"

    const-string v9, "Wi-Fi Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 560
    new-instance v155, Lcom/android/server/WifiService;

    move-object/from16 v0, v155

    invoke-direct {v0, v5}, Lcom/android/server/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_2a
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_2a} :catch_12

    .line 561
    .end local v154           #wifi:Lcom/android/server/WifiService;
    .local v155, wifi:Lcom/android/server/WifiService;
    :try_start_2b
    const-string v7, "wifi"

    move-object/from16 v0, v155

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2b
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2b} :catch_47

    move-object/from16 v154, v155

    .line 567
    .end local v155           #wifi:Lcom/android/server/WifiService;
    .restart local v154       #wifi:Lcom/android/server/WifiService;
    :goto_1c
    :try_start_2c
    const-string v7, "persist.cne.feature"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v148

    .line 568
    .local v148, value:I
    if-lez v148, :cond_1a

    const/4 v7, 0x7

    move/from16 v0, v148

    if-ge v0, v7, :cond_1a

    .line 569
    const-string v7, "SystemServer"

    const-string v9, "QcConnectivity Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    new-instance v118, Ldalvik/system/PathClassLoader;

    const-string v7, "/system/framework/services-ext.jar"

    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    move-object/from16 v0, v118

    invoke-direct {v0, v7, v9}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 573
    .local v118, qcsClassLoader:Ldalvik/system/PathClassLoader;
    const-string v7, "com.android.server.QcConnectivityService"

    move-object/from16 v0, v118

    invoke-virtual {v0, v7}, Ldalvik/system/PathClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v117

    .line 575
    .local v117, qcsClass:Ljava/lang/Class;
    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v11, Landroid/content/Context;

    aput-object v11, v7, v9

    const/4 v9, 0x1

    const-class v11, Landroid/os/INetworkManagementService;

    aput-object v11, v7, v9

    const/4 v9, 0x2

    const-class v11, Landroid/net/INetworkStatsService;

    aput-object v11, v7, v9

    const/4 v9, 0x3

    const-class v11, Landroid/net/INetworkPolicyManager;

    aput-object v11, v7, v9

    move-object/from16 v0, v117

    invoke-virtual {v0, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v119

    .line 578
    .local v119, qcsConstructor:Ljava/lang/reflect/Constructor;
    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v7, v9

    const/4 v9, 0x1

    aput-object v30, v7, v9

    const/4 v9, 0x2

    aput-object v29, v7, v9

    const/4 v9, 0x3

    aput-object v25, v7, v9

    move-object/from16 v0, v119

    invoke-virtual {v0, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v116

    .line 580
    move-object/from16 v0, v116

    check-cast v0, Lcom/android/server/ConnectivityService;

    move-object/from16 v75, v0

    .line 586
    .end local v116           #qcCon:Ljava/lang/Object;
    .end local v117           #qcsClass:Ljava/lang/Class;
    .end local v118           #qcsClassLoader:Ldalvik/system/PathClassLoader;
    .end local v119           #qcsConstructor:Ljava/lang/reflect/Constructor;
    :goto_1d
    if-eqz v75, :cond_6

    .line 587
    const-string v7, "connectivity"

    move-object/from16 v0, v75

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 588
    move-object/from16 v0, v29

    move-object/from16 v1, v75

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 589
    move-object/from16 v0, v25

    move-object/from16 v1, v75

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 590
    invoke-virtual/range {v154 .. v154}, Lcom/android/server/WifiService;->checkAndStartWifi()V

    .line 591
    invoke-virtual/range {v156 .. v156}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_2c
    .catch Ljava/lang/Throwable; {:try_start_2c .. :try_end_2c} :catch_13

    .line 598
    .end local v148           #value:I
    :cond_6
    :goto_1e
    :try_start_2d
    const-string v7, "SystemServer"

    const-string v9, "Network Service Discovery Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 599
    invoke-static {v5}, Lcom/android/server/NsdService;->create(Landroid/content/Context;)Lcom/android/server/NsdService;

    move-result-object v129

    .line 600
    const-string v7, "servicediscovery"

    move-object/from16 v0, v129

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2d
    .catch Ljava/lang/Throwable; {:try_start_2d .. :try_end_2d} :catch_14

    .line 607
    :goto_1f
    :try_start_2e
    const-string v7, "SystemServer"

    const-string v9, "Throttle Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 608
    new-instance v138, Lcom/android/server/ThrottleService;

    move-object/from16 v0, v138

    invoke-direct {v0, v5}, Lcom/android/server/ThrottleService;-><init>(Landroid/content/Context;)V
    :try_end_2e
    .catch Ljava/lang/Throwable; {:try_start_2e .. :try_end_2e} :catch_15

    .line 609
    .end local v137           #throttle:Lcom/android/server/ThrottleService;
    .local v138, throttle:Lcom/android/server/ThrottleService;
    :try_start_2f
    const-string v7, "throttle"

    move-object/from16 v0, v138

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2f
    .catch Ljava/lang/Throwable; {:try_start_2f .. :try_end_2f} :catch_46

    move-object/from16 v137, v138

    .line 616
    .end local v138           #throttle:Lcom/android/server/ThrottleService;
    .restart local v137       #throttle:Lcom/android/server/ThrottleService;
    :goto_20
    :try_start_30
    const-string v7, "SystemServer"

    const-string v9, "UpdateLock Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    const-string v7, "updatelock"

    new-instance v9, Lcom/android/server/UpdateLockService;

    invoke-direct {v9, v5}, Lcom/android/server/UpdateLockService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_30
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_30} :catch_16

    .line 628
    :goto_21
    if-eqz v103, :cond_7

    .line 629
    invoke-virtual/range {v103 .. v103}, Lcom/android/server/MountService;->waitForAsecScan()V

    .line 633
    :cond_7
    if-eqz v61, :cond_8

    .line 634
    :try_start_31
    invoke-virtual/range {v61 .. v61}, Landroid/accounts/AccountManagerService;->systemReady()V
    :try_end_31
    .catch Ljava/lang/Throwable; {:try_start_31 .. :try_end_31} :catch_17

    .line 640
    :cond_8
    :goto_22
    if-eqz v77, :cond_9

    .line 641
    :try_start_32
    invoke-virtual/range {v77 .. v77}, Landroid/content/ContentService;->systemReady()V
    :try_end_32
    .catch Ljava/lang/Throwable; {:try_start_32 .. :try_end_32} :catch_18

    .line 647
    :cond_9
    :goto_23
    :try_start_33
    const-string v7, "SystemServer"

    const-string v9, "Notification Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    new-instance v112, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v112

    move-object/from16 v1, v133

    invoke-direct {v0, v5, v1, v6}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_33
    .catch Ljava/lang/Throwable; {:try_start_33 .. :try_end_33} :catch_19

    .line 649
    .end local v111           #notification:Lcom/android/server/NotificationManagerService;
    .local v112, notification:Lcom/android/server/NotificationManagerService;
    :try_start_34
    const-string v7, "notification"

    move-object/from16 v0, v112

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 650
    move-object/from16 v0, v25

    move-object/from16 v1, v112

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_34
    .catch Ljava/lang/Throwable; {:try_start_34 .. :try_end_34} :catch_45

    move-object/from16 v111, v112

    .line 656
    .end local v112           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v111       #notification:Lcom/android/server/NotificationManagerService;
    :goto_24
    :try_start_35
    const-string v7, "SystemServer"

    const-string v9, "Device Storage Monitor"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 657
    const-string v7, "devicestoragemonitor"

    new-instance v9, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v9, v5}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_35
    .catch Ljava/lang/Throwable; {:try_start_35 .. :try_end_35} :catch_1a

    .line 664
    :goto_25
    :try_start_36
    const-string v7, "SystemServer"

    const-string v9, "Location Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 665
    new-instance v99, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v99

    invoke-direct {v0, v5}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_36
    .catch Ljava/lang/Throwable; {:try_start_36 .. :try_end_36} :catch_1b

    .line 666
    .end local v98           #location:Lcom/android/server/LocationManagerService;
    .local v99, location:Lcom/android/server/LocationManagerService;
    :try_start_37
    const-string v7, "location"

    move-object/from16 v0, v99

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_37
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_37} :catch_44

    move-object/from16 v98, v99

    .line 672
    .end local v99           #location:Lcom/android/server/LocationManagerService;
    .restart local v98       #location:Lcom/android/server/LocationManagerService;
    :goto_26
    :try_start_38
    const-string v7, "SystemServer"

    const-string v9, "Country Detector"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 673
    new-instance v79, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v79

    invoke-direct {v0, v5}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_38
    .catch Ljava/lang/Throwable; {:try_start_38 .. :try_end_38} :catch_1c

    .line 674
    .end local v78           #countryDetector:Lcom/android/server/CountryDetectorService;
    .local v79, countryDetector:Lcom/android/server/CountryDetectorService;
    :try_start_39
    const-string v7, "country_detector"

    move-object/from16 v0, v79

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_39
    .catch Ljava/lang/Throwable; {:try_start_39 .. :try_end_39} :catch_43

    move-object/from16 v78, v79

    .line 680
    .end local v79           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v78       #countryDetector:Lcom/android/server/CountryDetectorService;
    :goto_27
    :try_start_3a
    const-string v7, "SystemServer"

    const-string v9, "Search Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 681
    const-string v7, "search"

    new-instance v9, Landroid/server/search/SearchManagerService;

    invoke-direct {v9, v5}, Landroid/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3a
    .catch Ljava/lang/Throwable; {:try_start_3a .. :try_end_3a} :catch_1d

    .line 688
    :goto_28
    :try_start_3b
    const-string v7, "SystemServer"

    const-string v9, "DropBox Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 689
    const-string v7, "dropbox"

    new-instance v9, Lcom/android/server/DropBoxManagerService;

    new-instance v11, Ljava/io/File;

    const-string v12, "/data/system/dropbox"

    invoke-direct {v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v5, v11}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3b
    .catch Ljava/lang/Throwable; {:try_start_3b .. :try_end_3b} :catch_1e

    .line 695
    :goto_29
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v9, 0x111002b

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 698
    :try_start_3c
    const-string v7, "SystemServer"

    const-string v9, "Wallpaper Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 699
    if-nez v33, :cond_a

    .line 700
    new-instance v153, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v153

    invoke-direct {v0, v5}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_3c
    .catch Ljava/lang/Throwable; {:try_start_3c .. :try_end_3c} :catch_1f

    .line 701
    .end local v152           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .local v153, wallpaper:Lcom/android/server/WallpaperManagerService;
    :try_start_3d
    const-string v7, "wallpaper"

    move-object/from16 v0, v153

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3d
    .catch Ljava/lang/Throwable; {:try_start_3d .. :try_end_3d} :catch_42

    move-object/from16 v152, v153

    .line 708
    .end local v153           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v152       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_a
    :goto_2a
    const-string v7, "0"

    const-string v9, "system_init.startaudioservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_b

    .line 710
    :try_start_3e
    const-string v7, "SystemServer"

    const-string v9, "Audio Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 711
    const-string v7, "audio"

    new-instance v9, Landroid/media/AudioService;

    invoke-direct {v9, v5}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3e
    .catch Ljava/lang/Throwable; {:try_start_3e .. :try_end_3e} :catch_20

    .line 718
    :cond_b
    :goto_2b
    :try_start_3f
    const-string v7, "SystemServer"

    const-string v9, "Dock Observer"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 720
    new-instance v85, Lcom/android/server/DockObserver;

    move-object/from16 v0, v85

    invoke-direct {v0, v5}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;)V
    :try_end_3f
    .catch Ljava/lang/Throwable; {:try_start_3f .. :try_end_3f} :catch_21

    .end local v84           #dock:Lcom/android/server/DockObserver;
    .local v85, dock:Lcom/android/server/DockObserver;
    move-object/from16 v84, v85

    .line 726
    .end local v85           #dock:Lcom/android/server/DockObserver;
    .restart local v84       #dock:Lcom/android/server/DockObserver;
    :goto_2c
    :try_start_40
    const-string v7, "SystemServer"

    const-string v9, "Wired Accessory Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 728
    new-instance v7, Lcom/android/server/WiredAccessoryManager;

    move-object/from16 v0, v19

    invoke-direct {v7, v5, v0}, Lcom/android/server/WiredAccessoryManager;-><init>(Landroid/content/Context;Lcom/android/server/input/InputManagerService;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Lcom/android/server/input/InputManagerService;->setWiredAccessoryCallbacks(Lcom/android/server/input/InputManagerService$WiredAccessoryCallbacks;)V
    :try_end_40
    .catch Ljava/lang/Throwable; {:try_start_40 .. :try_end_40} :catch_22

    .line 735
    :goto_2d
    :try_start_41
    const-string v7, "SystemServer"

    const-string v9, "USB Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 744
    new-instance v147, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v147

    invoke-direct {v0, v5}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_41
    .catch Ljava/lang/Throwable; {:try_start_41 .. :try_end_41} :catch_23

    .line 746
    .end local v146           #usb:Lcom/android/server/usb/UsbService;
    .local v147, usb:Lcom/android/server/usb/UsbService;
    :try_start_42
    const-string v7, "usb"

    move-object/from16 v0, v147

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_42
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_42} :catch_41

    move-object/from16 v146, v147

    .line 752
    .end local v147           #usb:Lcom/android/server/usb/UsbService;
    .restart local v146       #usb:Lcom/android/server/usb/UsbService;
    :goto_2e
    :try_start_43
    const-string v7, "SystemServer"

    const-string v9, "Serial Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    new-instance v128, Lcom/android/server/SerialService;

    move-object/from16 v0, v128

    invoke-direct {v0, v5}, Lcom/android/server/SerialService;-><init>(Landroid/content/Context;)V
    :try_end_43
    .catch Ljava/lang/Throwable; {:try_start_43 .. :try_end_43} :catch_24

    .line 755
    .end local v127           #serial:Lcom/android/server/SerialService;
    .local v128, serial:Lcom/android/server/SerialService;
    :try_start_44
    const-string v7, "serial"

    move-object/from16 v0, v128

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_44
    .catch Ljava/lang/Throwable; {:try_start_44 .. :try_end_44} :catch_40

    move-object/from16 v127, v128

    .line 761
    .end local v128           #serial:Lcom/android/server/SerialService;
    .restart local v127       #serial:Lcom/android/server/SerialService;
    :goto_2f
    :try_start_45
    const-string v7, "SystemServer"

    const-string v9, "Twilight Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 762
    new-instance v142, Lcom/android/server/TwilightService;

    move-object/from16 v0, v142

    invoke-direct {v0, v5}, Lcom/android/server/TwilightService;-><init>(Landroid/content/Context;)V
    :try_end_45
    .catch Ljava/lang/Throwable; {:try_start_45 .. :try_end_45} :catch_25

    .end local v141           #twilight:Lcom/android/server/TwilightService;
    .local v142, twilight:Lcom/android/server/TwilightService;
    move-object/from16 v141, v142

    .line 768
    .end local v142           #twilight:Lcom/android/server/TwilightService;
    .restart local v141       #twilight:Lcom/android/server/TwilightService;
    :goto_30
    :try_start_46
    const-string v7, "SystemServer"

    const-string v9, "UI Mode Manager Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 770
    new-instance v145, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v145

    move-object/from16 v1, v141

    invoke-direct {v0, v5, v1}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;Lcom/android/server/TwilightService;)V
    :try_end_46
    .catch Ljava/lang/Throwable; {:try_start_46 .. :try_end_46} :catch_26

    .end local v144           #uiMode:Lcom/android/server/UiModeManagerService;
    .local v145, uiMode:Lcom/android/server/UiModeManagerService;
    move-object/from16 v144, v145

    .line 776
    .end local v145           #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v144       #uiMode:Lcom/android/server/UiModeManagerService;
    :goto_31
    :try_start_47
    const-string v7, "SystemServer"

    const-string v9, "Backup Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 777
    const-string v7, "backup"

    new-instance v9, Lcom/android/server/BackupManagerService;

    invoke-direct {v9, v5}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_47
    .catch Ljava/lang/Throwable; {:try_start_47 .. :try_end_47} :catch_27

    .line 784
    :goto_32
    :try_start_48
    const-string v7, "SystemServer"

    const-string v9, "AppWidget Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 785
    new-instance v65, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v65

    invoke-direct {v0, v5}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_48
    .catch Ljava/lang/Throwable; {:try_start_48 .. :try_end_48} :catch_28

    .line 786
    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .local v65, appWidget:Lcom/android/server/AppWidgetService;
    :try_start_49
    const-string v7, "appwidget"

    move-object/from16 v0, v65

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 787
    new-instance v71, Lcom/android/server/CabcService;

    move-object/from16 v0, v71

    invoke-direct {v0, v5}, Lcom/android/server/CabcService;-><init>(Landroid/content/Context;)V
    :try_end_49
    .catch Ljava/lang/Throwable; {:try_start_49 .. :try_end_49} :catch_3d

    .line 788
    .end local v70           #cabcService:Lcom/android/server/CabcService;
    .local v71, cabcService:Lcom/android/server/CabcService;
    :try_start_4a
    const-string v7, "cabc"

    move-object/from16 v0, v71

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 789
    new-instance v132, Lcom/android/server/SreService;

    move-object/from16 v0, v132

    invoke-direct {v0, v5}, Lcom/android/server/SreService;-><init>(Landroid/content/Context;)V
    :try_end_4a
    .catch Ljava/lang/Throwable; {:try_start_4a .. :try_end_4a} :catch_3e

    .line 790
    .end local v131           #sreService:Lcom/android/server/SreService;
    .local v132, sreService:Lcom/android/server/SreService;
    :try_start_4b
    const-string v7, "sre"

    move-object/from16 v0, v132

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4b
    .catch Ljava/lang/Throwable; {:try_start_4b .. :try_end_4b} :catch_3f

    move-object/from16 v131, v132

    .end local v132           #sreService:Lcom/android/server/SreService;
    .restart local v131       #sreService:Lcom/android/server/SreService;
    move-object/from16 v70, v71

    .end local v71           #cabcService:Lcom/android/server/CabcService;
    .restart local v70       #cabcService:Lcom/android/server/CabcService;
    move-object/from16 v64, v65

    .line 796
    .end local v65           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    :goto_33
    :try_start_4c
    const-string v7, "SystemServer"

    const-string v9, "Recognition Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 797
    new-instance v123, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v123

    invoke-direct {v0, v5}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_4c
    .catch Ljava/lang/Throwable; {:try_start_4c .. :try_end_4c} :catch_29

    .end local v122           #recognition:Lcom/android/server/RecognitionManagerService;
    .local v123, recognition:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v122, v123

    .line 803
    .end local v123           #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v122       #recognition:Lcom/android/server/RecognitionManagerService;
    :goto_34
    :try_start_4d
    const-string v7, "SystemServer"

    const-string v9, "DiskStats Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 804
    const-string v7, "diskstats"

    new-instance v9, Lcom/android/server/DiskStatsService;

    invoke-direct {v9, v5}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_4d .. :try_end_4d} :catch_2a

    .line 810
    :goto_35
    :try_start_4e
    const-string v7, "SystemServer"

    const-string v9, "AtCmdFwd Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 811
    new-instance v66, Lcom/android/internal/atfwd/AtCmdFwdService;

    move-object/from16 v0, v66

    invoke-direct {v0, v5}, Lcom/android/internal/atfwd/AtCmdFwdService;-><init>(Landroid/content/Context;)V

    .line 812
    .local v66, atfwd:Lcom/android/internal/atfwd/AtCmdFwdService;
    const-string v7, "AtCmdFwd"

    move-object/from16 v0, v66

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4e
    .catch Ljava/lang/Throwable; {:try_start_4e .. :try_end_4e} :catch_2b

    .line 832
    .end local v66           #atfwd:Lcom/android/internal/atfwd/AtCmdFwdService;
    :goto_36
    :try_start_4f
    const-string v7, "SystemServer"

    const-string v9, "Oppo Expand Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 833
    new-instance v113, Lcom/android/server/oppo/OppoExService;

    move-object/from16 v0, v113

    move-object/from16 v1, v158

    invoke-direct {v0, v5, v1}, Lcom/android/server/oppo/OppoExService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V

    .line 834
    .local v113, oppoExService:Lcom/android/server/oppo/OppoExService;
    const-string v7, "OPPOExService"

    move-object/from16 v0, v113

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4f
    .catch Ljava/lang/Throwable; {:try_start_4f .. :try_end_4f} :catch_2c

    .line 845
    .end local v113           #oppoExService:Lcom/android/server/oppo/OppoExService;
    :goto_37
    :try_start_50
    const-string v7, "SystemServer"

    const-string v9, "SamplingProfiler Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 846
    const-string v7, "samplingprofiler"

    new-instance v9, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v9, v5}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_50
    .catch Ljava/lang/Throwable; {:try_start_50 .. :try_end_50} :catch_2d

    .line 853
    :goto_38
    :try_start_51
    const-string v7, "SystemServer"

    const-string v9, "NetworkTimeUpdateService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 854
    new-instance v110, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v110

    invoke-direct {v0, v5}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_51
    .catch Ljava/lang/Throwable; {:try_start_51 .. :try_end_51} :catch_2e

    .end local v109           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .local v110, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v109, v110

    .line 860
    .end local v110           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v109       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    :goto_39
    :try_start_52
    const-string v7, "SystemServer"

    const-string v9, "CommonTimeManagementService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 861
    new-instance v73, Lcom/android/server/CommonTimeManagementService;

    move-object/from16 v0, v73

    invoke-direct {v0, v5}, Lcom/android/server/CommonTimeManagementService;-><init>(Landroid/content/Context;)V
    :try_end_52
    .catch Ljava/lang/Throwable; {:try_start_52 .. :try_end_52} :catch_2f

    .line 862
    .end local v72           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .local v73, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :try_start_53
    const-string v7, "commontime_management"

    move-object/from16 v0, v73

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_53
    .catch Ljava/lang/Throwable; {:try_start_53 .. :try_end_53} :catch_3c

    move-object/from16 v72, v73

    .line 868
    .end local v73           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v72       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :goto_3a
    :try_start_54
    const-string v7, "SystemServer"

    const-string v9, "CertBlacklister"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 869
    new-instance v7, Lcom/android/server/CertBlacklister;

    invoke-direct {v7, v5}, Lcom/android/server/CertBlacklister;-><init>(Landroid/content/Context;)V
    :try_end_54
    .catch Ljava/lang/Throwable; {:try_start_54 .. :try_end_54} :catch_30

    .line 874
    :goto_3b
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v9, 0x1110040

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 877
    :try_start_55
    const-string v7, "SystemServer"

    const-string v9, "Dreams Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 879
    new-instance v87, Lcom/android/server/dreams/DreamManagerService;

    move-object/from16 v0, v87

    move-object/from16 v1, v21

    invoke-direct {v0, v5, v1}, Lcom/android/server/dreams/DreamManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V
    :try_end_55
    .catch Ljava/lang/Throwable; {:try_start_55 .. :try_end_55} :catch_31

    .line 880
    .end local v86           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .local v87, dreamy:Lcom/android/server/dreams/DreamManagerService;
    :try_start_56
    const-string v7, "dreams"

    move-object/from16 v0, v87

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_56
    .catch Ljava/lang/Throwable; {:try_start_56 .. :try_end_56} :catch_3b

    move-object/from16 v86, v87

    .line 894
    .end local v87           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v86       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    :cond_c
    :goto_3c
    invoke-static {v5}, Lcom/android/server/ServerThread$Injector;->registerServices(Landroid/content/Context;)V

    :goto_lewa_0
    const/16 v126, 0x0

    .line 905
    .local v126, safeMode:Z
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v7

    invoke-virtual {v7}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    .line 911
    :try_start_57
    invoke-virtual/range {v149 .. v149}, Lcom/android/server/VibratorService;->systemReady()V
    :try_end_57
    .catch Ljava/lang/Throwable; {:try_start_57 .. :try_end_57} :catch_32

    .line 917
    :goto_3d
    :try_start_58
    invoke-virtual/range {v100 .. v100}, Lcom/android/internal/widget/LockSettingsService;->systemReady()V
    :try_end_58
    .catch Ljava/lang/Throwable; {:try_start_58 .. :try_end_58} :catch_33

    .line 922
    :goto_3e
    if-eqz v81, :cond_d

    .line 924
    :try_start_59
    invoke-virtual/range {v81 .. v81}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_59
    .catch Ljava/lang/Throwable; {:try_start_59 .. :try_end_59} :catch_34

    .line 930
    :cond_d
    :goto_3f
    if-eqz v111, :cond_e

    .line 932
    :try_start_5a
    invoke-virtual/range {v111 .. v111}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_5a
    .catch Ljava/lang/Throwable; {:try_start_5a .. :try_end_5a} :catch_35

    .line 939
    :cond_e
    :goto_40
    :try_start_5b
    invoke-virtual/range {v158 .. v158}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_5b
    .catch Ljava/lang/Throwable; {:try_start_5b .. :try_end_5b} :catch_36

    .line 951
    :goto_41
    invoke-virtual/range {v158 .. v158}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v74

    .line 952
    .local v74, config:Landroid/content/res/Configuration;
    new-instance v102, Landroid/util/DisplayMetrics;

    invoke-direct/range {v102 .. v102}, Landroid/util/DisplayMetrics;-><init>()V

    .line 953
    .local v102, metrics:Landroid/util/DisplayMetrics;
    const-string v7, "window"

    invoke-virtual {v5, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v151

    check-cast v151, Landroid/view/WindowManager;

    .line 954
    .local v151, w:Landroid/view/WindowManager;
    invoke-interface/range {v151 .. v151}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    move-object/from16 v0, v102

    invoke-virtual {v7, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 955
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    move-object/from16 v0, v74

    move-object/from16 v1, v102

    invoke-virtual {v7, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 958
    :try_start_5c
    move-object/from16 v0, v141

    move-object/from16 v1, v86

    invoke-virtual {v4, v0, v1}, Lcom/android/server/power/PowerManagerService;->systemReady(Lcom/android/server/TwilightService;Lcom/android/server/dreams/DreamManagerService;)V
    :try_end_5c
    .catch Ljava/lang/Throwable; {:try_start_5c .. :try_end_5c} :catch_37

    .line 964
    :goto_42
    :try_start_5d
    invoke-interface/range {v114 .. v114}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_5d
    .catch Ljava/lang/Throwable; {:try_start_5d .. :try_end_5d} :catch_38

    .line 970
    :goto_43
    const/4 v7, 0x0

    :try_start_5e
    move/from16 v0, v24

    invoke-virtual {v10, v7, v0}, Lcom/android/server/display/DisplayManagerService;->systemReady(ZZ)V
    :try_end_5e
    .catch Ljava/lang/Throwable; {:try_start_5e .. :try_end_5e} :catch_39

    .line 976
    :goto_44
    invoke-static {v5}, Lcom/android/server/ServerThread$Injector;->registerReceivers(Landroid/content/Context;)V

    move-object/from16 v34, v5

    .line 977
    .local v34, contextF:Landroid/content/Context;
    move-object/from16 v35, v103

    .line 978
    .local v35, mountServiceF:Lcom/android/server/MountService;
    move-object/from16 v36, v8

    .line 979
    .local v36, batteryF:Lcom/android/server/BatteryService;
    move-object/from16 v37, v30

    .line 980
    .local v37, networkManagementF:Lcom/android/server/NetworkManagementService;
    move-object/from16 v38, v29

    .line 981
    .local v38, networkStatsF:Lcom/android/server/net/NetworkStatsService;
    move-object/from16 v39, v25

    .line 982
    .local v39, networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v40, v75

    .line 983
    .local v40, connectivityF:Lcom/android/server/ConnectivityService;
    move-object/from16 v41, v84

    .line 984
    .local v41, dockF:Lcom/android/server/DockObserver;
    move-object/from16 v42, v146

    .line 985
    .local v42, usbF:Lcom/android/server/usb/UsbService;
    move-object/from16 v53, v137

    .line 986
    .local v53, throttleF:Lcom/android/server/ThrottleService;
    move-object/from16 v43, v141

    .line 987
    .local v43, twilightF:Lcom/android/server/TwilightService;
    move-object/from16 v44, v144

    .line 988
    .local v44, uiModeF:Lcom/android/server/UiModeManagerService;
    move-object/from16 v46, v64

    .line 990
    .local v46, appWidgetF:Lcom/android/server/AppWidgetService;
    move-object/from16 v47, v131

    .line 992
    .local v47, sreServiceF:Lcom/android/server/SreService;
    move-object/from16 v48, v152

    .line 993
    .local v48, wallpaperF:Lcom/android/server/WallpaperManagerService;
    move-object/from16 v49, v92

    .line 994
    .local v49, immF:Lcom/android/server/InputMethodManagerService;
    move-object/from16 v45, v122

    .line 995
    .local v45, recognitionF:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v51, v98

    .line 996
    .local v51, locationF:Lcom/android/server/LocationManagerService;
    move-object/from16 v52, v78

    .line 997
    .local v52, countryDetectorF:Lcom/android/server/CountryDetectorService;
    move-object/from16 v54, v109

    .line 998
    .local v54, networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v55, v72

    .line 999
    .local v55, commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    move-object/from16 v56, v139

    .line 1000
    .local v56, textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    move-object/from16 v50, v133

    .line 1001
    .local v50, statusBarF:Lcom/android/server/StatusBarManagerService;
    move-object/from16 v57, v86

    .line 1002
    .local v57, dreamyF:Lcom/android/server/dreams/DreamManagerService;
    move-object/from16 v58, v19

    .line 1003
    .local v58, inputManagerF:Lcom/android/server/input/InputManagerService;
    move-object/from16 v59, v135

    .line 1004
    .local v59, telephonyRegistryF:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v60, v105

    .line 1011
    .local v60, msimTelephonyRegistryF:Lcom/android/server/MSimTelephonyRegistry;
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    new-instance v31, Lcom/android/server/ServerThread$3;

    move-object/from16 v32, p0

    invoke-direct/range {v31 .. v60}, Lcom/android/server/ServerThread$3;-><init>(Lcom/android/server/ServerThread;ZLandroid/content/Context;Lcom/android/server/MountService;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/TwilightService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;Lcom/android/server/SreService;Lcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/CommonTimeManagementService;Lcom/android/server/TextServicesManagerService;Lcom/android/server/dreams/DreamManagerService;Lcom/android/server/input/InputManagerService;Lcom/android/server/TelephonyRegistry;Lcom/android/server/MSimTelephonyRegistry;)V

    move-object/from16 v0, v31

    invoke-virtual {v7, v0}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 1147
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v7

    if-eqz v7, :cond_f

    .line 1148
    const-string v7, "SystemServer"

    const-string v9, "Enabled StrictMode for system server main thread."

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1151
    :cond_f
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 1152
    const-string v7, "SystemServer"

    const-string v9, "System ServerThread is exiting!"

    invoke-static {v7, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1153
    return-void

    .line 138
    .end local v4           #power:Lcom/android/server/power/PowerManagerService;
    .end local v5           #context:Landroid/content/Context;
    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v10           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v20           #uiHandler:Landroid/os/Handler;
    .end local v21           #wmHandler:Landroid/os/Handler;
    .end local v24           #onlyCore:Z
    .end local v25           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v29           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .end local v30           #networkManagement:Lcom/android/server/NetworkManagementService;
    .end local v33           #headless:Z
    .end local v34           #contextF:Landroid/content/Context;
    .end local v35           #mountServiceF:Lcom/android/server/MountService;
    .end local v36           #batteryF:Lcom/android/server/BatteryService;
    .end local v37           #networkManagementF:Lcom/android/server/NetworkManagementService;
    .end local v38           #networkStatsF:Lcom/android/server/net/NetworkStatsService;
    .end local v39           #networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v40           #connectivityF:Lcom/android/server/ConnectivityService;
    .end local v41           #dockF:Lcom/android/server/DockObserver;
    .end local v42           #usbF:Lcom/android/server/usb/UsbService;
    .end local v43           #twilightF:Lcom/android/server/TwilightService;
    .end local v44           #uiModeF:Lcom/android/server/UiModeManagerService;
    .end local v45           #recognitionF:Lcom/android/server/RecognitionManagerService;
    .end local v46           #appWidgetF:Lcom/android/server/AppWidgetService;
    .end local v47           #sreServiceF:Lcom/android/server/SreService;
    .end local v48           #wallpaperF:Lcom/android/server/WallpaperManagerService;
    .end local v49           #immF:Lcom/android/server/InputMethodManagerService;
    .end local v50           #statusBarF:Lcom/android/server/StatusBarManagerService;
    .end local v51           #locationF:Lcom/android/server/LocationManagerService;
    .end local v52           #countryDetectorF:Lcom/android/server/CountryDetectorService;
    .end local v53           #throttleF:Lcom/android/server/ThrottleService;
    .end local v54           #networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    .end local v55           #commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    .end local v56           #textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    .end local v57           #dreamyF:Lcom/android/server/dreams/DreamManagerService;
    .end local v58           #inputManagerF:Lcom/android/server/input/InputManagerService;
    .end local v59           #telephonyRegistryF:Lcom/android/server/TelephonyRegistry;
    .end local v60           #msimTelephonyRegistryF:Lcom/android/server/MSimTelephonyRegistry;
    .end local v61           #accountManager:Landroid/accounts/AccountManagerService;
    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v68           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .end local v70           #cabcService:Lcom/android/server/CabcService;
    .end local v72           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .end local v74           #config:Landroid/content/res/Configuration;
    .end local v75           #connectivity:Lcom/android/server/ConnectivityService;
    .end local v77           #contentService:Landroid/content/ContentService;
    .end local v78           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v81           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v84           #dock:Lcom/android/server/DockObserver;
    .end local v86           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .end local v89           #factoryTest:I
    .end local v90           #factoryTestStr:Ljava/lang/String;
    .end local v92           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v98           #location:Lcom/android/server/LocationManagerService;
    .end local v100           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v102           #metrics:Landroid/util/DisplayMetrics;
    .end local v103           #mountService:Lcom/android/server/MountService;
    .end local v105           #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .end local v109           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .end local v111           #notification:Lcom/android/server/NotificationManagerService;
    .end local v114           #pm:Landroid/content/pm/IPackageManager;
    .end local v122           #recognition:Lcom/android/server/RecognitionManagerService;
    .end local v124           #regulatory:Lcom/android/server/RegulatoryObserver;
    .end local v126           #safeMode:Z
    .end local v127           #serial:Lcom/android/server/SerialService;
    .end local v129           #serviceDiscovery:Lcom/android/server/NsdService;
    .end local v131           #sreService:Lcom/android/server/SreService;
    .end local v133           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v137           #throttle:Lcom/android/server/ThrottleService;
    .end local v139           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v141           #twilight:Lcom/android/server/TwilightService;
    .end local v143           #uiHandlerThread:Landroid/os/HandlerThread;
    .end local v144           #uiMode:Lcom/android/server/UiModeManagerService;
    .end local v146           #usb:Lcom/android/server/usb/UsbService;
    .end local v149           #vibrator:Lcom/android/server/VibratorService;
    .end local v151           #w:Landroid/view/WindowManager;
    .end local v152           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .end local v154           #wifi:Lcom/android/server/WifiService;
    .end local v156           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .end local v158           #wm:Lcom/android/server/wm/WindowManagerService;
    .end local v159           #wmHandlerThread:Landroid/os/HandlerThread;
    :cond_10
    const/16 v121, 0x0

    goto/16 :goto_0

    .line 144
    .restart local v121       #reboot:Z
    :cond_11
    const/16 v120, 0x0

    .restart local v120       #reason:Ljava/lang/String;
    goto/16 :goto_1

    .line 152
    .end local v120           #reason:Ljava/lang/String;
    .end local v121           #reboot:Z
    .restart local v90       #factoryTestStr:Ljava/lang/String;
    :cond_12
    invoke-static/range {v90 .. v90}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v89

    goto/16 :goto_2

    .line 287
    .restart local v4       #power:Lcom/android/server/power/PowerManagerService;
    .restart local v5       #context:Landroid/content/Context;
    .restart local v10       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v20       #uiHandler:Landroid/os/Handler;
    .restart local v21       #wmHandler:Landroid/os/Handler;
    .restart local v24       #onlyCore:Z
    .restart local v29       #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v30       #networkManagement:Lcom/android/server/NetworkManagementService;
    .restart local v33       #headless:Z
    .restart local v61       #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v68       #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v72       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v75       #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v77       #contentService:Landroid/content/ContentService;
    .restart local v80       #cryptState:Ljava/lang/String;
    .restart local v84       #dock:Lcom/android/server/DockObserver;
    .restart local v89       #factoryTest:I
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #lights:Lcom/android/server/LightsService;
    .restart local v103       #mountService:Lcom/android/server/MountService;
    .restart local v105       #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .restart local v107       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v109       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v114       #pm:Landroid/content/pm/IPackageManager;
    .restart local v116       #qcCon:Ljava/lang/Object;
    .restart local v122       #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v124       #regulatory:Lcom/android/server/RegulatoryObserver;
    .restart local v127       #serial:Lcom/android/server/SerialService;
    .restart local v129       #serviceDiscovery:Lcom/android/server/NsdService;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v137       #throttle:Lcom/android/server/ThrottleService;
    .restart local v141       #twilight:Lcom/android/server/TwilightService;
    .restart local v143       #uiHandlerThread:Landroid/os/HandlerThread;
    .restart local v144       #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v146       #usb:Lcom/android/server/usb/UsbService;
    .restart local v149       #vibrator:Lcom/android/server/VibratorService;
    .restart local v154       #wifi:Lcom/android/server/WifiService;
    .restart local v156       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v158       #wm:Lcom/android/server/wm/WindowManagerService;
    .restart local v159       #wmHandlerThread:Landroid/os/HandlerThread;
    :cond_13
    :try_start_5f
    const-string v7, "1"

    move-object/from16 v0, v80

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 288
    const-string v7, "SystemServer"

    const-string v9, "Device encrypted - only parsing core apps"

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    const/16 v24, 0x1

    goto/16 :goto_3

    .line 292
    :cond_14
    const/4 v7, 0x0

    goto/16 :goto_4

    .line 315
    .restart local v91       #firstBoot:Z
    :catch_0
    move-exception v88

    .line 316
    .local v88, e:Ljava/lang/Throwable;
    :goto_45
    const-string v7, "SystemServer"

    const-string v9, "Failure starting Account Manager"

    move-object/from16 v0, v88

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5f
    .catch Ljava/lang/RuntimeException; {:try_start_5f .. :try_end_5f} :catch_1

    goto/16 :goto_6

    .line 403
    .end local v80           #cryptState:Ljava/lang/String;
    .end local v88           #e:Ljava/lang/Throwable;
    .end local v91           #firstBoot:Z
    :catch_1
    move-exception v88

    move-object/from16 v135, v136

    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v15, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v97

    .end local v97           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    move-object/from16 v95, v96

    .line 404
    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .local v88, e:Ljava/lang/RuntimeException;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    :goto_46
    const-string v7, "System"

    const-string v9, "******************************************"

    invoke-static {v7, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    const-string v7, "System"

    const-string v9, "************ Failure starting core service"

    move-object/from16 v0, v88

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_b

    .line 320
    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v88           #e:Ljava/lang/RuntimeException;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v80       #cryptState:Ljava/lang/String;
    .restart local v91       #firstBoot:Z
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #lights:Lcom/android/server/LightsService;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :cond_15
    const/4 v7, 0x0

    goto/16 :goto_7

    .line 375
    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v67           #battery:Lcom/android/server/BatteryService;
    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v97           #lights:Lcom/android/server/LightsService;
    .end local v149           #vibrator:Lcom/android/server/VibratorService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v150       #vibrator:Lcom/android/server/VibratorService;
    :cond_16
    const/16 v22, 0x0

    goto/16 :goto_8

    :cond_17
    const/16 v23, 0x0

    goto/16 :goto_9

    .line 395
    :cond_18
    const/4 v7, 0x1

    move/from16 v0, v89

    if-ne v0, v7, :cond_19

    .line 396
    :try_start_60
    const-string v7, "SystemServer"

    const-string v9, "No Bluetooth Service (factory test)"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a

    .line 403
    :catch_2
    move-exception v88

    move-object/from16 v135, v136

    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v149, v150

    .end local v150           #vibrator:Lcom/android/server/VibratorService;
    .restart local v149       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto :goto_46

    .line 398
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v149           #vibrator:Lcom/android/server/VibratorService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v150       #vibrator:Lcom/android/server/VibratorService;
    :cond_19
    const-string v7, "SystemServer"

    const-string v9, "Bluetooth Manager Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 399
    new-instance v69, Lcom/android/server/BluetoothManagerService;

    move-object/from16 v0, v69

    invoke-direct {v0, v5}, Lcom/android/server/BluetoothManagerService;-><init>(Landroid/content/Context;)V
    :try_end_60
    .catch Ljava/lang/RuntimeException; {:try_start_60 .. :try_end_60} :catch_2

    .line 400
    .end local v68           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .local v69, bluetooth:Lcom/android/server/BluetoothManagerService;
    :try_start_61
    const-string v7, "bluetooth_manager"

    move-object/from16 v0, v69

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_61
    .catch Ljava/lang/RuntimeException; {:try_start_61 .. :try_end_61} :catch_5c

    move-object/from16 v68, v69

    .end local v69           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v68       #bluetooth:Lcom/android/server/BluetoothManagerService;
    goto/16 :goto_a

    .line 428
    .end local v80           #cryptState:Ljava/lang/String;
    .end local v91           #firstBoot:Z
    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v150           #vibrator:Lcom/android/server/VibratorService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v70       #cabcService:Lcom/android/server/CabcService;
    .restart local v78       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v81       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v86       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v92       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    .restart local v98       #location:Lcom/android/server/LocationManagerService;
    .restart local v100       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v111       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v131       #sreService:Lcom/android/server/SreService;
    .restart local v133       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v139       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v149       #vibrator:Lcom/android/server/VibratorService;
    .restart local v152       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_3
    move-exception v88

    .line 429
    .local v88, e:Ljava/lang/Throwable;
    :goto_47
    const-string v7, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .line 436
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_4
    move-exception v88

    .line 437
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_d

    .line 443
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_5
    move-exception v88

    .line 444
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_e

    .line 449
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_6
    move-exception v88

    .line 450
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_f

    .line 471
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_7
    move-exception v88

    .line 472
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_48
    const-string v7, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_11

    .line 480
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_8
    move-exception v88

    .line 481
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_49
    const-string v7, "starting LockSettingsService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_12

    .line 488
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_9
    move-exception v88

    .line 489
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_4a
    const-string v7, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_13

    .line 496
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_a
    move-exception v88

    .line 497
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_4b
    const-string v7, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_14

    .line 504
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_b
    move-exception v88

    .line 505
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_15

    .line 512
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_c
    move-exception v88

    .line 513
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_16

    .line 520
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_d
    move-exception v88

    .line 521
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_4c
    const-string v7, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_17

    .line 528
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_e
    move-exception v88

    .line 529
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_4d
    const-string v7, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_18

    .line 538
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_f
    move-exception v88

    move-object/from16 v25, v107

    .line 539
    .end local v107           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v25       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_4e
    const-string v7, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_19

    .line 546
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_10
    move-exception v88

    .line 547
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting RegulatoryObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1a

    .line 554
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_11
    move-exception v88

    .line 555
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_4f
    const-string v7, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1b

    .line 562
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_12
    move-exception v88

    .line 563
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_50
    const-string v7, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1c

    .line 582
    .end local v88           #e:Ljava/lang/Throwable;
    .restart local v148       #value:I
    :cond_1a
    :try_start_62
    const-string v7, "SystemServer"

    const-string v9, "Connectivity Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    new-instance v76, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v76

    move-object/from16 v1, v30

    move-object/from16 v2, v29

    move-object/from16 v3, v25

    invoke-direct {v0, v5, v1, v2, v3}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_62
    .catch Ljava/lang/Throwable; {:try_start_62 .. :try_end_62} :catch_13

    .end local v75           #connectivity:Lcom/android/server/ConnectivityService;
    .local v76, connectivity:Lcom/android/server/ConnectivityService;
    move-object/from16 v75, v76

    .end local v76           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v75       #connectivity:Lcom/android/server/ConnectivityService;
    goto/16 :goto_1d

    .line 593
    .end local v116           #qcCon:Ljava/lang/Object;
    .end local v148           #value:I
    :catch_13
    move-exception v88

    .line 594
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1e

    .line 602
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_14
    move-exception v88

    .line 603
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting Service Discovery Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1f

    .line 611
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_15
    move-exception v88

    .line 612
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_51
    const-string v7, "starting ThrottleService"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_20

    .line 619
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_16
    move-exception v88

    .line 620
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting UpdateLockService"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_21

    .line 635
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_17
    move-exception v88

    .line 636
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making Account Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_22

    .line 642
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_18
    move-exception v88

    .line 643
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making Content Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_23

    .line 651
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_19
    move-exception v88

    .line 652
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_52
    const-string v7, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_24

    .line 659
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_1a
    move-exception v88

    .line 660
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_25

    .line 667
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_1b
    move-exception v88

    .line 668
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_53
    const-string v7, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_26

    .line 675
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_1c
    move-exception v88

    .line 676
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_54
    const-string v7, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_27

    .line 683
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_1d
    move-exception v88

    .line 684
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_28

    .line 691
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_1e
    move-exception v88

    .line 692
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_29

    .line 703
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_1f
    move-exception v88

    .line 704
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_55
    const-string v7, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a

    .line 712
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_20
    move-exception v88

    .line 713
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2b

    .line 721
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_21
    move-exception v88

    .line 722
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2c

    .line 730
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_22
    move-exception v88

    .line 731
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting WiredAccessoryManager"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2d

    .line 747
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_23
    move-exception v88

    .line 748
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_56
    const-string v7, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2e

    .line 756
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_24
    move-exception v88

    .line 757
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_57
    const-string v7, "SystemServer"

    const-string v9, "Failure starting SerialService"

    move-object/from16 v0, v88

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2f

    .line 763
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_25
    move-exception v88

    .line 764
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting TwilightService"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_30

    .line 771
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_26
    move-exception v88

    .line 772
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_31

    .line 779
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_27
    move-exception v88

    .line 780
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "SystemServer"

    const-string v9, "Failure starting Backup Service"

    move-object/from16 v0, v88

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_32

    .line 791
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_28
    move-exception v88

    .line 792
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_58
    const-string v7, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_33

    .line 798
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_29
    move-exception v88

    .line 799
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_34

    .line 805
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_2a
    move-exception v88

    .line 806
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_35

    .line 813
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_2b
    move-exception v88

    .line 814
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting AtCmdFwd Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_36

    .line 835
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_2c
    move-exception v88

    .line 836
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "SystemServer"

    const-string v9, "Failure starting Oppo Service"

    move-object/from16 v0, v88

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_37

    .line 848
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_2d
    move-exception v88

    .line 849
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_38

    .line 855
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_2e
    move-exception v88

    .line 856
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_39

    .line 863
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_2f
    move-exception v88

    .line 864
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_59
    const-string v7, "starting CommonTimeManagementService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3a

    .line 870
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_30
    move-exception v88

    .line 871
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "starting CertBlacklister"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3b

    .line 881
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_31
    move-exception v88

    .line 882
    .restart local v88       #e:Ljava/lang/Throwable;
    :goto_5a
    const-string v7, "starting DreamManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3c

    .line 912
    .end local v88           #e:Ljava/lang/Throwable;
    .restart local v126       #safeMode:Z
    :catch_32
    move-exception v88

    .line 913
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making Vibrator Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3d

    .line 918
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_33
    move-exception v88

    .line 919
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making Lock Settings Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3e

    .line 925
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_34
    move-exception v88

    .line 926
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3f

    .line 933
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_35
    move-exception v88

    .line 934
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_40

    .line 940
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_36
    move-exception v88

    .line 941
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_41

    .line 959
    .end local v88           #e:Ljava/lang/Throwable;
    .restart local v74       #config:Landroid/content/res/Configuration;
    .restart local v102       #metrics:Landroid/util/DisplayMetrics;
    .restart local v151       #w:Landroid/view/WindowManager;
    :catch_37
    move-exception v88

    .line 960
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making Power Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_42

    .line 965
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_38
    move-exception v88

    .line 966
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_43

    .line 971
    .end local v88           #e:Ljava/lang/Throwable;
    :catch_39
    move-exception v88

    .line 972
    .restart local v88       #e:Ljava/lang/Throwable;
    const-string v7, "making Display Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v88

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_44

    .line 298
    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v25           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v70           #cabcService:Lcom/android/server/CabcService;
    .end local v74           #config:Landroid/content/res/Configuration;
    .end local v78           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v81           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v86           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .end local v88           #e:Ljava/lang/Throwable;
    .end local v92           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v98           #location:Lcom/android/server/LocationManagerService;
    .end local v100           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v102           #metrics:Landroid/util/DisplayMetrics;
    .end local v111           #notification:Lcom/android/server/NotificationManagerService;
    .end local v126           #safeMode:Z
    .end local v131           #sreService:Lcom/android/server/SreService;
    .end local v133           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v139           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v151           #w:Landroid/view/WindowManager;
    .end local v152           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v80       #cryptState:Ljava/lang/String;
    .restart local v91       #firstBoot:Z
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #lights:Lcom/android/server/LightsService;
    .restart local v107       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v116       #qcCon:Ljava/lang/Object;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_3a
    move-exception v7

    goto/16 :goto_5

    .line 881
    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v67           #battery:Lcom/android/server/BatteryService;
    .end local v80           #cryptState:Ljava/lang/String;
    .end local v91           #firstBoot:Z
    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .end local v97           #lights:Lcom/android/server/LightsService;
    .end local v107           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v116           #qcCon:Ljava/lang/Object;
    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v25       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v70       #cabcService:Lcom/android/server/CabcService;
    .restart local v78       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v81       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v87       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v92       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    .restart local v98       #location:Lcom/android/server/LocationManagerService;
    .restart local v100       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v111       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v131       #sreService:Lcom/android/server/SreService;
    .restart local v133       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v139       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v152       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_3b
    move-exception v88

    move-object/from16 v86, v87

    .end local v87           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v86       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    goto :goto_5a

    .line 863
    .end local v72           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v73       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :catch_3c
    move-exception v88

    move-object/from16 v72, v73

    .end local v73           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v72       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    goto/16 :goto_59

    .line 791
    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v65       #appWidget:Lcom/android/server/AppWidgetService;
    :catch_3d
    move-exception v88

    move-object/from16 v64, v65

    .end local v65           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_58

    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v70           #cabcService:Lcom/android/server/CabcService;
    .restart local v65       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v71       #cabcService:Lcom/android/server/CabcService;
    :catch_3e
    move-exception v88

    move-object/from16 v70, v71

    .end local v71           #cabcService:Lcom/android/server/CabcService;
    .restart local v70       #cabcService:Lcom/android/server/CabcService;
    move-object/from16 v64, v65

    .end local v65           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_58

    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v70           #cabcService:Lcom/android/server/CabcService;
    .end local v131           #sreService:Lcom/android/server/SreService;
    .restart local v65       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v71       #cabcService:Lcom/android/server/CabcService;
    .restart local v132       #sreService:Lcom/android/server/SreService;
    :catch_3f
    move-exception v88

    move-object/from16 v131, v132

    .end local v132           #sreService:Lcom/android/server/SreService;
    .restart local v131       #sreService:Lcom/android/server/SreService;
    move-object/from16 v70, v71

    .end local v71           #cabcService:Lcom/android/server/CabcService;
    .restart local v70       #cabcService:Lcom/android/server/CabcService;
    move-object/from16 v64, v65

    .end local v65           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_58

    .line 756
    .end local v127           #serial:Lcom/android/server/SerialService;
    .restart local v128       #serial:Lcom/android/server/SerialService;
    :catch_40
    move-exception v88

    move-object/from16 v127, v128

    .end local v128           #serial:Lcom/android/server/SerialService;
    .restart local v127       #serial:Lcom/android/server/SerialService;
    goto/16 :goto_57

    .line 747
    .end local v146           #usb:Lcom/android/server/usb/UsbService;
    .restart local v147       #usb:Lcom/android/server/usb/UsbService;
    :catch_41
    move-exception v88

    move-object/from16 v146, v147

    .end local v147           #usb:Lcom/android/server/usb/UsbService;
    .restart local v146       #usb:Lcom/android/server/usb/UsbService;
    goto/16 :goto_56

    .line 703
    .end local v152           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v153       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_42
    move-exception v88

    move-object/from16 v152, v153

    .end local v153           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v152       #wallpaper:Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_55

    .line 675
    .end local v78           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v79       #countryDetector:Lcom/android/server/CountryDetectorService;
    :catch_43
    move-exception v88

    move-object/from16 v78, v79

    .end local v79           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v78       #countryDetector:Lcom/android/server/CountryDetectorService;
    goto/16 :goto_54

    .line 667
    .end local v98           #location:Lcom/android/server/LocationManagerService;
    .restart local v99       #location:Lcom/android/server/LocationManagerService;
    :catch_44
    move-exception v88

    move-object/from16 v98, v99

    .end local v99           #location:Lcom/android/server/LocationManagerService;
    .restart local v98       #location:Lcom/android/server/LocationManagerService;
    goto/16 :goto_53

    .line 651
    .end local v111           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v112       #notification:Lcom/android/server/NotificationManagerService;
    :catch_45
    move-exception v88

    move-object/from16 v111, v112

    .end local v112           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v111       #notification:Lcom/android/server/NotificationManagerService;
    goto/16 :goto_52

    .line 611
    .end local v137           #throttle:Lcom/android/server/ThrottleService;
    .restart local v138       #throttle:Lcom/android/server/ThrottleService;
    :catch_46
    move-exception v88

    move-object/from16 v137, v138

    .end local v138           #throttle:Lcom/android/server/ThrottleService;
    .restart local v137       #throttle:Lcom/android/server/ThrottleService;
    goto/16 :goto_51

    .line 562
    .end local v154           #wifi:Lcom/android/server/WifiService;
    .restart local v116       #qcCon:Ljava/lang/Object;
    .restart local v155       #wifi:Lcom/android/server/WifiService;
    :catch_47
    move-exception v88

    move-object/from16 v154, v155

    .end local v155           #wifi:Lcom/android/server/WifiService;
    .restart local v154       #wifi:Lcom/android/server/WifiService;
    goto/16 :goto_50

    .line 554
    .end local v156           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v157       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :catch_48
    move-exception v88

    move-object/from16 v156, v157

    .end local v157           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v156       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    goto/16 :goto_4f

    .line 538
    :catch_49
    move-exception v88

    goto/16 :goto_4e

    .line 528
    .end local v25           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v29           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v107       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v108       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :catch_4a
    move-exception v88

    move-object/from16 v29, v108

    .end local v108           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v29       #networkStats:Lcom/android/server/net/NetworkStatsService;
    goto/16 :goto_4d

    .line 520
    .end local v139           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v140       #tsms:Lcom/android/server/TextServicesManagerService;
    :catch_4b
    move-exception v88

    move-object/from16 v139, v140

    .end local v140           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v139       #tsms:Lcom/android/server/TextServicesManagerService;
    goto/16 :goto_4c

    .line 496
    .end local v133           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v134       #statusBar:Lcom/android/server/StatusBarManagerService;
    :catch_4c
    move-exception v88

    move-object/from16 v133, v134

    .end local v134           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v133       #statusBar:Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_4b

    .line 488
    .end local v81           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v82       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :catch_4d
    move-exception v88

    move-object/from16 v81, v82

    .end local v82           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v81       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_4a

    .line 480
    .end local v100           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v101       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :catch_4e
    move-exception v88

    move-object/from16 v100, v101

    .end local v101           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v100       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    goto/16 :goto_49

    .line 471
    .end local v103           #mountService:Lcom/android/server/MountService;
    .restart local v104       #mountService:Lcom/android/server/MountService;
    :catch_4f
    move-exception v88

    move-object/from16 v103, v104

    .end local v104           #mountService:Lcom/android/server/MountService;
    .restart local v103       #mountService:Lcom/android/server/MountService;
    goto/16 :goto_48

    .line 458
    :catch_50
    move-exception v7

    goto/16 :goto_10

    .line 428
    .end local v92           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v93       #imm:Lcom/android/server/InputMethodManagerService;
    :catch_51
    move-exception v88

    move-object/from16 v92, v93

    .end local v93           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v92       #imm:Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_47

    .line 403
    .end local v4           #power:Lcom/android/server/power/PowerManagerService;
    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v10           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v70           #cabcService:Lcom/android/server/CabcService;
    .end local v78           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v81           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v86           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .end local v92           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v98           #location:Lcom/android/server/LocationManagerService;
    .end local v100           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v111           #notification:Lcom/android/server/NotificationManagerService;
    .end local v131           #sreService:Lcom/android/server/SreService;
    .end local v133           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v139           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v152           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v83       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v97       #lights:Lcom/android/server/LightsService;
    .restart local v115       #power:Lcom/android/server/power/PowerManagerService;
    :catch_52
    move-exception v88

    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v15, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v10, v83

    .end local v83           #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v10       #display:Lcom/android/server/display/DisplayManagerService;
    move-object/from16 v4, v115

    .end local v115           #power:Lcom/android/server/power/PowerManagerService;
    .restart local v4       #power:Lcom/android/server/power/PowerManagerService;
    move-object/from16 v6, v97

    .end local v97           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_46

    .end local v4           #power:Lcom/android/server/power/PowerManagerService;
    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v10           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v83       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #lights:Lcom/android/server/LightsService;
    .restart local v115       #power:Lcom/android/server/power/PowerManagerService;
    :catch_53
    move-exception v88

    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v15, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v10, v83

    .end local v83           #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v10       #display:Lcom/android/server/display/DisplayManagerService;
    move-object/from16 v4, v115

    .end local v115           #power:Lcom/android/server/power/PowerManagerService;
    .restart local v4       #power:Lcom/android/server/power/PowerManagerService;
    move-object/from16 v6, v97

    .end local v97           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_46

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v10           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v83       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #lights:Lcom/android/server/LightsService;
    :catch_54
    move-exception v88

    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v15, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v10, v83

    .end local v83           #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v10       #display:Lcom/android/server/display/DisplayManagerService;
    move-object/from16 v6, v97

    .end local v97           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_46

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #lights:Lcom/android/server/LightsService;
    :catch_55
    move-exception v88

    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v15, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v97

    .end local v97           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_46

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v105           #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #lights:Lcom/android/server/LightsService;
    .restart local v106       #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_56
    move-exception v88

    move-object/from16 v105, v106

    .end local v106           #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .restart local v105       #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    move-object/from16 v135, v136

    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v15, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v97

    .end local v97           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_46

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v61           #accountManager:Landroid/accounts/AccountManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v62       #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v80       #cryptState:Ljava/lang/String;
    .restart local v91       #firstBoot:Z
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #lights:Lcom/android/server/LightsService;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_57
    move-exception v88

    move-object/from16 v135, v136

    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v15, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v97

    .end local v97           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    move-object/from16 v61, v62

    .end local v62           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v61       #accountManager:Landroid/accounts/AccountManagerService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_46

    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_58
    move-exception v88

    move-object/from16 v135, v136

    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v15, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_46

    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_59
    move-exception v88

    move-object/from16 v135, v136

    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v15, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_46

    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v149           #vibrator:Lcom/android/server/VibratorService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v150       #vibrator:Lcom/android/server/VibratorService;
    :catch_5a
    move-exception v88

    move-object/from16 v135, v136

    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v15, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v149, v150

    .end local v150           #vibrator:Lcom/android/server/VibratorService;
    .restart local v149       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_46

    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v149           #vibrator:Lcom/android/server/VibratorService;
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v150       #vibrator:Lcom/android/server/VibratorService;
    :catch_5b
    move-exception v88

    move-object/from16 v135, v136

    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v19, v94

    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v149, v150

    .end local v150           #vibrator:Lcom/android/server/VibratorService;
    .restart local v149       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_46

    .end local v68           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v149           #vibrator:Lcom/android/server/VibratorService;
    .restart local v69       #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v150       #vibrator:Lcom/android/server/VibratorService;
    :catch_5c
    move-exception v88

    move-object/from16 v135, v136

    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v68, v69

    .end local v69           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v68       #bluetooth:Lcom/android/server/BluetoothManagerService;
    move-object/from16 v149, v150

    .end local v150           #vibrator:Lcom/android/server/VibratorService;
    .restart local v149       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v95, v96

    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_46

    .line 315
    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v15           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v19           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v61           #accountManager:Landroid/accounts/AccountManagerService;
    .end local v95           #installer:Lcom/android/server/pm/Installer;
    .end local v135           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v62       #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v94       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v96       #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #lights:Lcom/android/server/LightsService;
    .restart local v136       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_5d
    move-exception v88

    move-object/from16 v61, v62

    .end local v62           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v61       #accountManager:Landroid/accounts/AccountManagerService;
    goto/16 :goto_45

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v67           #battery:Lcom/android/server/BatteryService;
    .end local v80           #cryptState:Ljava/lang/String;
    .end local v91           #firstBoot:Z
    .end local v94           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v96           #installer:Lcom/android/server/pm/Installer;
    .end local v97           #lights:Lcom/android/server/LightsService;
    .end local v136           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    .restart local v15       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v19       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v70       #cabcService:Lcom/android/server/CabcService;
    .restart local v78       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v81       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v86       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v92       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v95       #installer:Lcom/android/server/pm/Installer;
    .restart local v98       #location:Lcom/android/server/LocationManagerService;
    .restart local v100       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v111       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v131       #sreService:Lcom/android/server/SreService;
    .restart local v133       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v135       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v139       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v152       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_1b
    move-object/from16 v25, v107

    .end local v107           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v25       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_lewa_0
.end method
