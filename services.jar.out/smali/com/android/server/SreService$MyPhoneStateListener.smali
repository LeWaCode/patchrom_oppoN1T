.class Lcom/android/server/SreService$MyPhoneStateListener;
.super Landroid/telephony/PhoneStateListener;
.source "SreService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/SreService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyPhoneStateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/SreService;


# direct methods
.method constructor <init>(Lcom/android/server/SreService;)V
    .locals 0
    .parameter

    .prologue
    .line 242
    iput-object p1, p0, Lcom/android/server/SreService$MyPhoneStateListener;->this$0:Lcom/android/server/SreService;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 2
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    const/4 v1, 0x0

    .line 246
    packed-switch p1, :pswitch_data_0

    .line 276
    :goto_0
    return-void

    .line 252
    :pswitch_0
    iget-object v0, p0, Lcom/android/server/SreService$MyPhoneStateListener;->this$0:Lcom/android/server/SreService;

    #calls: Lcom/android/server/SreService;->registerSreLightSensorListenr()V
    invoke-static {v0}, Lcom/android/server/SreService;->access$500(Lcom/android/server/SreService;)V

    .line 254
    iget-object v0, p0, Lcom/android/server/SreService$MyPhoneStateListener;->this$0:Lcom/android/server/SreService;

    const/4 v1, 0x1

    #setter for: Lcom/android/server/SreService;->mShouldListenerWhenScreenOn:Z
    invoke-static {v0, v1}, Lcom/android/server/SreService;->access$402(Lcom/android/server/SreService;Z)Z

    goto :goto_0

    .line 260
    :pswitch_1
    iget-object v0, p0, Lcom/android/server/SreService$MyPhoneStateListener;->this$0:Lcom/android/server/SreService;

    #calls: Lcom/android/server/SreService;->unRegisterSreLightSensorListenr()V
    invoke-static {v0}, Lcom/android/server/SreService;->access$200(Lcom/android/server/SreService;)V

    .line 262
    iget-object v0, p0, Lcom/android/server/SreService$MyPhoneStateListener;->this$0:Lcom/android/server/SreService;

    #setter for: Lcom/android/server/SreService;->mShouldListenerWhenScreenOn:Z
    invoke-static {v0, v1}, Lcom/android/server/SreService;->access$402(Lcom/android/server/SreService;Z)Z

    goto :goto_0

    .line 268
    :pswitch_2
    iget-object v0, p0, Lcom/android/server/SreService$MyPhoneStateListener;->this$0:Lcom/android/server/SreService;

    #calls: Lcom/android/server/SreService;->unRegisterSreLightSensorListenr()V
    invoke-static {v0}, Lcom/android/server/SreService;->access$200(Lcom/android/server/SreService;)V

    .line 270
    iget-object v0, p0, Lcom/android/server/SreService$MyPhoneStateListener;->this$0:Lcom/android/server/SreService;

    #setter for: Lcom/android/server/SreService;->mShouldListenerWhenScreenOn:Z
    invoke-static {v0, v1}, Lcom/android/server/SreService;->access$402(Lcom/android/server/SreService;Z)Z

    goto :goto_0

    .line 246
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
