.class Lcom/android/server/SreService$1;
.super Ljava/lang/Object;
.source "SreService.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/SreService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/SreService;


# direct methods
.method constructor <init>(Lcom/android/server/SreService;)V
    .locals 0
    .parameter

    .prologue
    .line 117
    iput-object p1, p0, Lcom/android/server/SreService$1;->this$0:Lcom/android/server/SreService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .parameter "sensor"
    .parameter "accuracy"

    .prologue
    .line 137
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 7
    .parameter "event"

    .prologue
    const/4 v6, 0x0

    .line 119
    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v3, v6

    float-to-int v0, v3

    .line 120
    .local v0, light:I
    const-string v3, "SreService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onSensorChanged===============current light ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    const-string v3, "persist.sys.sre_flag"

    invoke-static {v3, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v3

    if-lez v3, :cond_0

    .line 122
    const-string v3, "persist.sys.sre_value"

    const/16 v4, 0x7d00

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 123
    .local v1, threshold:I
    const/4 v2, 0x0

    .line 124
    .local v2, value:I
    if-le v0, v1, :cond_1

    .line 125
    const/4 v2, 0x3

    .line 129
    :goto_0
    iget-object v3, p0, Lcom/android/server/SreService$1;->this$0:Lcom/android/server/SreService;

    #getter for: Lcom/android/server/SreService;->mValue:I
    invoke-static {v3}, Lcom/android/server/SreService;->access$000(Lcom/android/server/SreService;)I

    move-result v3

    if-eq v3, v2, :cond_0

    .line 130
    iget-object v3, p0, Lcom/android/server/SreService$1;->this$0:Lcom/android/server/SreService;

    #setter for: Lcom/android/server/SreService;->mValue:I
    invoke-static {v3, v2}, Lcom/android/server/SreService;->access$002(Lcom/android/server/SreService;I)I

    .line 131
    iget-object v3, p0, Lcom/android/server/SreService$1;->this$0:Lcom/android/server/SreService;

    iget-object v4, p0, Lcom/android/server/SreService$1;->this$0:Lcom/android/server/SreService;

    #getter for: Lcom/android/server/SreService;->mValue:I
    invoke-static {v4}, Lcom/android/server/SreService;->access$000(Lcom/android/server/SreService;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/android/server/SreService;->writeSreNode(Ljava/lang/String;)Z
    invoke-static {v3, v4}, Lcom/android/server/SreService;->access$100(Lcom/android/server/SreService;Ljava/lang/String;)Z

    .line 134
    .end local v1           #threshold:I
    .end local v2           #value:I
    :cond_0
    return-void

    .line 127
    .restart local v1       #threshold:I
    .restart local v2       #value:I
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method
