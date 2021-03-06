.class Lcom/android/internal/policy/impl/OppoGlobalActions;
.super Ljava/lang/Object;
.source "OppoGlobalActions.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/OppoGlobalActions$PowerOffFrame;,
        Lcom/android/internal/policy/impl/OppoGlobalActions$SilentModeTriStateAction;,
        Lcom/android/internal/policy/impl/OppoGlobalActions$SilentModeToggleAction;,
        Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;,
        Lcom/android/internal/policy/impl/OppoGlobalActions$SinglePressAction;,
        Lcom/android/internal/policy/impl/OppoGlobalActions$Action;,
        Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;
    }
.end annotation


# static fields
.field private static final DIALOG_DISMISS_DELAY:I = 0x12c

.field private static final MESSAGE_AIRPLANE_MODE:I = 0x5

.field private static final MESSAGE_DISMISS:I = 0x0

.field private static final MESSAGE_NETDATA_MODE:I = 0x7

.field private static final MESSAGE_REFRESH:I = 0x1

.field private static final MESSAGE_SHOW:I = 0x2

.field private static final MESSAGE_SILENT_MODE:I = 0x4

.field private static final MESSAGE_UPDATE_ALL_ICON:I = 0x3

.field private static final MESSAGE_WIFI_MODE:I = 0x6

.field private static final SHOW_SILENT_TOGGLE:Z = true

.field private static final TAG:Ljava/lang/String; = "OppoGlobalActions"

.field private static airplane_status:Z

.field private static isFirstCreated:Z

.field private static mConnectivityManager:Landroid/net/ConnectivityManager;

.field private static mWifiManager:Landroid/net/wifi/WifiManager;

.field private static netdatas_status:Z

.field private static ringmode_status:Z

.field private static wifi_status:Z


# instance fields
.field private mAdapter:Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;

.field private mAirplaneModeObserver:Landroid/database/ContentObserver;

.field private mAirplaneModeOn:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;

.field private mAirplaneState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

.field private final mAudioManager:Landroid/media/AudioManager;

.field private mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private final mContext:Landroid/content/Context;

.field public mCr:Landroid/content/ContentResolver;

.field private mDeviceProvisioned:Z

.field private mDialog:Landroid/app/AlertDialog;

.field private mHandler:Landroid/os/Handler;

.field private mHasTelephony:Z

.field private mHasVibrator:Z

.field private mIWindowManager:Landroid/view/IWindowManager;

.field private mIsWaitingForEcmExit:Z

.field private mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/policy/impl/OppoGlobalActions$Action;",
            ">;"
        }
    .end annotation
.end field

.field private mKeyguardShowing:Z

.field private mMobileDataObserver:Landroid/database/ContentObserver;

.field mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private mRingerModeReceiver:Landroid/content/BroadcastReceiver;

.field private mSilentModeAction:Lcom/android/internal/policy/impl/OppoGlobalActions$Action;

.field private final mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

.field private powerOffFrame:Lcom/android/internal/policy/impl/OppoGlobalActions$Action;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 101
    sput-object v1, Lcom/android/internal/policy/impl/OppoGlobalActions;->mConnectivityManager:Landroid/net/ConnectivityManager;

    .line 102
    sput-object v1, Lcom/android/internal/policy/impl/OppoGlobalActions;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 104
    sput-boolean v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->isFirstCreated:Z

    .line 105
    sput-boolean v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->ringmode_status:Z

    .line 106
    sput-boolean v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->airplane_status:Z

    .line 107
    sput-boolean v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->wifi_status:Z

    .line 108
    sput-boolean v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->netdatas_status:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/WindowManagerPolicy$WindowManagerFuncs;)V
    .locals 8
    .parameter "context"
    .parameter "windowManagerFuncs"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mCr:Landroid/content/ContentResolver;

    .line 113
    iput-boolean v5, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mKeyguardShowing:Z

    .line 114
    iput-boolean v5, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDeviceProvisioned:Z

    .line 115
    sget-object v3, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;->Off:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    iput-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    .line 116
    iput-boolean v5, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mIsWaitingForEcmExit:Z

    .line 1044
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$4;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/OppoGlobalActions$4;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 1088
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$5;

    new-instance v6, Landroid/os/Handler;

    invoke-direct {v6}, Landroid/os/Handler;-><init>()V

    invoke-direct {v3, p0, v6}, Lcom/android/internal/policy/impl/OppoGlobalActions$5;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;Landroid/os/Handler;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mMobileDataObserver:Landroid/database/ContentObserver;

    .line 1102
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$6;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/OppoGlobalActions$6;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 1113
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$7;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/OppoGlobalActions$7;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mRingerModeReceiver:Landroid/content/BroadcastReceiver;

    .line 1122
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$8;

    new-instance v6, Landroid/os/Handler;

    invoke-direct {v6}, Landroid/os/Handler;-><init>()V

    invoke-direct {v3, p0, v6}, Lcom/android/internal/policy/impl/OppoGlobalActions$8;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;Landroid/os/Handler;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneModeObserver:Landroid/database/ContentObserver;

    .line 1145
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$9;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/OppoGlobalActions$9;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHandler:Landroid/os/Handler;

    .line 126
    iput-object p1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    .line 127
    iput-object p2, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

    .line 128
    iget-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    const-string v6, "audio"

    invoke-virtual {v3, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/media/AudioManager;

    iput-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAudioManager:Landroid/media/AudioManager;

    .line 132
    iget-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mCr:Landroid/content/ContentResolver;

    .line 133
    iget-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    const-string v6, "wifi"

    invoke-virtual {v3, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/WifiManager;

    sput-object v3, Lcom/android/internal/policy/impl/OppoGlobalActions;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 137
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 138
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 139
    const-string v3, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 140
    const-string v3, "android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 144
    const-string v3, "android.media.RINGER_MODE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 145
    const-string v3, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 148
    iget-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 151
    const-string v3, "phone"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 153
    .local v1, telephonyManager:Landroid/telephony/TelephonyManager;
    iget-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    invoke-virtual {v1, v3, v4}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 154
    iget-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v6, "airplane_mode_on"

    invoke-static {v6}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    iget-object v7, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneModeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v6, v4, v7}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 157
    iget-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v6, "mobile_data"

    invoke-static {v6}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    iget-object v7, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mMobileDataObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v6, v5, v7}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 159
    const-string v3, "connectivity"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/ConnectivityManager;

    sput-object v3, Lcom/android/internal/policy/impl/OppoGlobalActions;->mConnectivityManager:Landroid/net/ConnectivityManager;

    .line 161
    sget-object v3, Lcom/android/internal/policy/impl/OppoGlobalActions;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v3, v5}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHasTelephony:Z

    .line 162
    iget-object v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    const-string v6, "vibrator"

    invoke-virtual {v3, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Vibrator;

    .line 163
    .local v2, vibrator:Landroid/os/Vibrator;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v4

    :goto_0
    iput-boolean v3, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHasVibrator:Z

    .line 164
    return-void

    :cond_0
    move v3, v5

    .line 163
    goto :goto_0
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/OppoGlobalActions;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHasTelephony:Z

    return v0
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/OppoGlobalActions;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mIsWaitingForEcmExit:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/android/internal/policy/impl/OppoGlobalActions;)Landroid/media/AudioManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAudioManager:Landroid/media/AudioManager;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/internal/policy/impl/OppoGlobalActions;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mIsWaitingForEcmExit:Z

    return p1
.end method

.method static synthetic access$1100()Z
    .locals 1

    .prologue
    .line 81
    sget-boolean v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->isFirstCreated:Z

    return v0
.end method

.method static synthetic access$1102(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    sput-boolean p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->isFirstCreated:Z

    return p0
.end method

.method static synthetic access$1200()Z
    .locals 1

    .prologue
    .line 81
    sget-boolean v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->ringmode_status:Z

    return v0
.end method

.method static synthetic access$1202(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    sput-boolean p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->ringmode_status:Z

    return p0
.end method

.method static synthetic access$1300()Z
    .locals 1

    .prologue
    .line 81
    sget-boolean v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->airplane_status:Z

    return v0
.end method

.method static synthetic access$1302(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    sput-boolean p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->airplane_status:Z

    return p0
.end method

.method static synthetic access$1400()Landroid/net/wifi/WifiManager;
    .locals 1

    .prologue
    .line 81
    sget-object v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object v0
.end method

.method static synthetic access$1402(Landroid/net/wifi/WifiManager;)Landroid/net/wifi/WifiManager;
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    sput-object p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object p0
.end method

.method static synthetic access$1500()Z
    .locals 1

    .prologue
    .line 81
    sget-boolean v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->wifi_status:Z

    return v0
.end method

.method static synthetic access$1502(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    sput-boolean p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->wifi_status:Z

    return p0
.end method

.method static synthetic access$1600()Landroid/net/ConnectivityManager;
    .locals 1

    .prologue
    .line 81
    sget-object v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mConnectivityManager:Landroid/net/ConnectivityManager;

    return-object v0
.end method

.method static synthetic access$1602(Landroid/net/ConnectivityManager;)Landroid/net/ConnectivityManager;
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    sput-object p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mConnectivityManager:Landroid/net/ConnectivityManager;

    return-object p0
.end method

.method static synthetic access$1700()Z
    .locals 1

    .prologue
    .line 81
    sget-boolean v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->netdatas_status:Z

    return v0
.end method

.method static synthetic access$1702(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    sput-boolean p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->netdatas_status:Z

    return p0
.end method

.method static synthetic access$1800(Lcom/android/internal/policy/impl/OppoGlobalActions;)Landroid/view/WindowManagerPolicy$WindowManagerFuncs;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/android/internal/policy/impl/OppoGlobalActions;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/OppoGlobalActions;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/android/internal/policy/impl/OppoGlobalActions;)Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneModeOn:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/android/internal/policy/impl/OppoGlobalActions;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/android/internal/policy/impl/OppoGlobalActions;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/android/internal/policy/impl/OppoGlobalActions;->refreshSilentMode()V

    return-void
.end method

.method static synthetic access$2300(Lcom/android/internal/policy/impl/OppoGlobalActions;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/android/internal/policy/impl/OppoGlobalActions;->handleShow()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/OppoGlobalActions;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/OppoGlobalActions;->changeAirplaneModeSystemSetting(Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/OppoGlobalActions;)Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    return-object v0
.end method

.method static synthetic access$402(Lcom/android/internal/policy/impl/OppoGlobalActions;Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;)Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    iput-object p1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/internal/policy/impl/OppoGlobalActions;)Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAdapter:Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/internal/policy/impl/OppoGlobalActions;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/internal/policy/impl/OppoGlobalActions;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mKeyguardShowing:Z

    return v0
.end method

.method static synthetic access$900(Lcom/android/internal/policy/impl/OppoGlobalActions;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDeviceProvisioned:Z

    return v0
.end method

.method private changeAirplaneModeSystemSetting(Z)V
    .locals 4
    .parameter "on"

    .prologue
    .line 1195
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_on"

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1199
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1200
    .local v0, intent:Landroid/content/Intent;
    const/high16 v1, 0x2000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1201
    const-string v1, "state"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1202
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1203
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHasTelephony:Z

    if-nez v1, :cond_0

    .line 1204
    if-eqz p1, :cond_2

    sget-object v1, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;->On:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    :goto_1
    iput-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    .line 1206
    :cond_0
    return-void

    .line 1195
    .end local v0           #intent:Landroid/content/Intent;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 1204
    .restart local v0       #intent:Landroid/content/Intent;
    :cond_2
    sget-object v1, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;->Off:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    goto :goto_1
.end method

.method private createDialog()Landroid/app/AlertDialog;
    .locals 21

    .prologue
    .line 198
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHasVibrator:Z

    if-nez v3, :cond_0

    .line 199
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$SilentModeToggleAction;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/android/internal/policy/impl/OppoGlobalActions$SilentModeToggleAction;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mSilentModeAction:Lcom/android/internal/policy/impl/OppoGlobalActions$Action;

    .line 203
    :goto_0
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$1;

    const v5, 0x10802db

    const v6, 0x10802dc

    const v7, 0x10400ef

    const v8, 0x10400f0

    const v9, 0x10400f1

    move-object/from16 v4, p0

    invoke-direct/range {v3 .. v9}, Lcom/android/internal/policy/impl/OppoGlobalActions$1;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;IIIII)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneModeOn:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;

    .line 245
    invoke-direct/range {p0 .. p0}, Lcom/android/internal/policy/impl/OppoGlobalActions;->onAirplaneModeChanged()V

    .line 247
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mItems:Ljava/util/ArrayList;

    .line 250
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$PowerOffFrame;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAudioManager:Landroid/media/AudioManager;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v4, v5, v6}, Lcom/android/internal/policy/impl/OppoGlobalActions$PowerOffFrame;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;Landroid/content/Context;Landroid/media/AudioManager;Landroid/os/Handler;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->powerOffFrame:Lcom/android/internal/policy/impl/OppoGlobalActions$Action;

    .line 251
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->powerOffFrame:Lcom/android/internal/policy/impl/OppoGlobalActions$Action;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 287
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mSilentModeAction:Lcom/android/internal/policy/impl/OppoGlobalActions$Action;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 290
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    const-string v4, "user"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/UserManager;

    invoke-virtual {v3}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v19

    .line 291
    .local v19, users:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_6

    .line 294
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/app/IActivityManager;->getCurrentUser()Landroid/content/pm/UserInfo;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v11

    .line 298
    .local v11, currentUser:Landroid/content/pm/UserInfo;
    :goto_1
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/content/pm/UserInfo;

    .line 299
    .local v18, user:Landroid/content/pm/UserInfo;
    if-nez v11, :cond_2

    move-object/from16 v0, v18

    iget v3, v0, Landroid/content/pm/UserInfo;->id:I

    if-nez v3, :cond_1

    const/4 v14, 0x1

    .line 301
    .local v14, isCurrentUser:Z
    :goto_3
    new-instance v17, Lcom/android/internal/policy/impl/OppoGlobalActions$2;

    const v4, 0x1080326

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    iget-object v3, v0, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    if-eqz v3, :cond_4

    move-object/from16 v0, v18

    iget-object v3, v0, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    :goto_4
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz v14, :cond_5

    const-string v3, " \u2714"

    :goto_5
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v4, v3, v2}, Lcom/android/internal/policy/impl/OppoGlobalActions$2;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;ILjava/lang/CharSequence;Landroid/content/pm/UserInfo;)V

    .line 322
    .local v17, switchToUser:Lcom/android/internal/policy/impl/OppoGlobalActions$SinglePressAction;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mItems:Ljava/util/ArrayList;

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 201
    .end local v11           #currentUser:Landroid/content/pm/UserInfo;
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v14           #isCurrentUser:Z
    .end local v17           #switchToUser:Lcom/android/internal/policy/impl/OppoGlobalActions$SinglePressAction;
    .end local v18           #user:Landroid/content/pm/UserInfo;
    .end local v19           #users:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :cond_0
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$SilentModeTriStateAction;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAudioManager:Landroid/media/AudioManager;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHandler:Landroid/os/Handler;

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/policy/impl/OppoGlobalActions$SilentModeTriStateAction;-><init>(Landroid/content/Context;Landroid/media/AudioManager;Landroid/os/Handler;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mSilentModeAction:Lcom/android/internal/policy/impl/OppoGlobalActions$Action;

    goto/16 :goto_0

    .line 295
    .restart local v19       #users:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :catch_0
    move-exception v16

    .line 296
    .local v16, re:Landroid/os/RemoteException;
    const/4 v11, 0x0

    .restart local v11       #currentUser:Landroid/content/pm/UserInfo;
    goto :goto_1

    .line 299
    .end local v16           #re:Landroid/os/RemoteException;
    .restart local v13       #i$:Ljava/util/Iterator;
    .restart local v18       #user:Landroid/content/pm/UserInfo;
    :cond_1
    const/4 v14, 0x0

    goto :goto_3

    :cond_2
    iget v3, v11, Landroid/content/pm/UserInfo;->id:I

    move-object/from16 v0, v18

    iget v4, v0, Landroid/content/pm/UserInfo;->id:I

    if-ne v3, v4, :cond_3

    const/4 v14, 0x1

    goto :goto_3

    :cond_3
    const/4 v14, 0x0

    goto :goto_3

    .line 301
    .restart local v14       #isCurrentUser:Z
    :cond_4
    const-string v3, "Primary"

    goto :goto_4

    :cond_5
    const-string v3, ""

    goto :goto_5

    .line 326
    .end local v11           #currentUser:Landroid/content/pm/UserInfo;
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v14           #isCurrentUser:Z
    .end local v18           #user:Landroid/content/pm/UserInfo;
    :cond_6
    new-instance v3, Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v4}, Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;Lcom/android/internal/policy/impl/OppoGlobalActions$1;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAdapter:Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;

    .line 332
    new-instance v10, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    const v4, 0x1030384

    invoke-direct {v10, v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 335
    .local v10, ab:Landroid/app/AlertDialog$Builder;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAdapter:Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;

    move-object/from16 v0, p0

    invoke-virtual {v10, v3, v0}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setInverseBackgroundForced(Z)Landroid/app/AlertDialog$Builder;

    .line 338
    invoke-virtual {v10}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v12

    .line 339
    .local v12, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v12}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v3

    new-instance v4, Lcom/android/internal/policy/impl/OppoGlobalActions$3;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/android/internal/policy/impl/OppoGlobalActions$3;-><init>(Lcom/android/internal/policy/impl/OppoGlobalActions;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 347
    invoke-virtual {v12}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v20

    .line 348
    .local v20, window:Landroid/view/Window;
    const/16 v3, 0x7d8

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Landroid/view/Window;->setType(I)V

    .line 352
    invoke-virtual/range {v20 .. v20}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v15

    .line 353
    .local v15, params:Landroid/view/WindowManager$LayoutParams;
    const/high16 v3, 0x1

    iput v3, v15, Landroid/view/WindowManager$LayoutParams;->systemUiVisibility:I

    .line 354
    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 359
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 360
    invoke-virtual {v12}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v3

    check-cast v3, Lcom/oppo/widget/OppoListView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/oppo/widget/OppoListView;->setSpringEnabled(Z)V

    .line 361
    invoke-virtual {v12}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 362
    invoke-virtual {v12}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v3

    const/16 v4, -0xd

    const/4 v5, 0x0

    const/16 v6, -0xd

    const/4 v7, 0x0

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 365
    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 367
    return-object v12
.end method

.method private getWindowManager()Landroid/view/IWindowManager;
    .locals 2

    .prologue
    .line 1209
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mIWindowManager:Landroid/view/IWindowManager;

    if-nez v1, :cond_0

    .line 1210
    const-string v1, "window"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 1211
    .local v0, b:Landroid/os/IBinder;
    invoke-static {v0}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mIWindowManager:Landroid/view/IWindowManager;

    .line 1213
    .end local v0           #b:Landroid/os/IBinder;
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mIWindowManager:Landroid/view/IWindowManager;

    return-object v1
.end method

.method private handleShow()V
    .locals 2

    .prologue
    .line 184
    invoke-direct {p0}, Lcom/android/internal/policy/impl/OppoGlobalActions;->createDialog()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDialog:Landroid/app/AlertDialog;

    .line 185
    invoke-direct {p0}, Lcom/android/internal/policy/impl/OppoGlobalActions;->prepareDialog()V

    .line 187
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 188
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/high16 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 190
    return-void
.end method

.method private onAirplaneModeChanged()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1181
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHasTelephony:Z

    if-eqz v2, :cond_0

    .line 1189
    :goto_0
    return-void

    .line 1183
    :cond_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_on"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_1

    .line 1187
    .local v0, airplaneModeOn:Z
    :goto_1
    if-eqz v0, :cond_2

    sget-object v1, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;->On:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    :goto_2
    iput-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    .line 1188
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneModeOn:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;

    iget-object v2, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;->updateState(Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;)V

    goto :goto_0

    .end local v0           #airplaneModeOn:Z
    :cond_1
    move v0, v1

    .line 1183
    goto :goto_1

    .line 1187
    .restart local v0       #airplaneModeOn:Z
    :cond_2
    sget-object v1, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;->Off:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    goto :goto_2
.end method

.method private prepareDialog()V
    .locals 2

    .prologue
    .line 376
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneModeOn:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;

    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAirplaneState:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;->updateState(Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;)V

    .line 378
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mKeyguardShowing:Z

    if-eqz v0, :cond_0

    .line 379
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x7d9

    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 390
    :goto_0
    return-void

    .line 381
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x7d8

    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    goto :goto_0
.end method

.method private refreshSilentMode()V
    .locals 3

    .prologue
    .line 393
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHasVibrator:Z

    if-nez v1, :cond_0

    .line 394
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v1}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    const/4 v0, 0x1

    .line 396
    .local v0, silentModeOn:Z
    :goto_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mSilentModeAction:Lcom/android/internal/policy/impl/OppoGlobalActions$Action;

    check-cast v1, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;

    if-eqz v0, :cond_2

    sget-object v2, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;->On:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    :goto_1
    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction;->updateState(Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;)V

    .line 399
    .end local v0           #silentModeOn:Z
    :cond_0
    return-void

    .line 394
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 396
    .restart local v0       #silentModeOn:Z
    :cond_2
    sget-object v2, Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;->Off:Lcom/android/internal/policy/impl/OppoGlobalActions$ToggleAction$State;

    goto :goto_1
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 413
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAdapter:Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;

    invoke-virtual {v0, p2}, Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;->getItem(I)Lcom/android/internal/policy/impl/OppoGlobalActions$Action;

    move-result-object v0

    instance-of v0, v0, Lcom/android/internal/policy/impl/OppoGlobalActions$SilentModeTriStateAction;

    if-nez v0, :cond_0

    .line 414
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 416
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mAdapter:Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;

    invoke-virtual {v0, p2}, Lcom/android/internal/policy/impl/OppoGlobalActions$MyAdapter;->getItem(I)Lcom/android/internal/policy/impl/OppoGlobalActions$Action;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/OppoGlobalActions$Action;->onPress()V

    .line 417
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0
    .parameter "dialog"

    .prologue
    .line 409
    return-void
.end method

.method public showDialog(ZZ)V
    .locals 2
    .parameter "keyguardShowing"
    .parameter "isDeviceProvisioned"

    .prologue
    .line 171
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mKeyguardShowing:Z

    .line 172
    iput-boolean p2, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDeviceProvisioned:Z

    .line 173
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 175
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mDialog:Landroid/app/AlertDialog;

    .line 177
    iget-object v0, p0, Lcom/android/internal/policy/impl/OppoGlobalActions;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 181
    :goto_0
    return-void

    .line 179
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/policy/impl/OppoGlobalActions;->handleShow()V

    goto :goto_0
.end method
