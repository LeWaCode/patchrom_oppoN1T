.class Landroid/bluetooth/BluetoothGattService$ServiceHelper;
.super Landroid/bluetooth/IBluetoothGattService$Stub;
.source "BluetoothGattService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/bluetooth/BluetoothGattService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ServiceHelper"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/bluetooth/BluetoothGattService;


# direct methods
.method private constructor <init>(Landroid/bluetooth/BluetoothGattService;)V
    .locals 0
    .parameter

    .prologue
    .line 431
    iput-object p1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    invoke-direct {p0}, Landroid/bluetooth/IBluetoothGattService$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/bluetooth/BluetoothGattService;Landroid/bluetooth/BluetoothGattService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 431
    invoke-direct {p0, p1}, Landroid/bluetooth/BluetoothGattService$ServiceHelper;-><init>(Landroid/bluetooth/BluetoothGattService;)V

    return-void
.end method

.method private setDiscoveryState(I)V
    .locals 3
    .parameter "state"

    .prologue
    .line 434
    const-string v0, "BluetoothGattService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discovery State "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->discoveryState:I
    invoke-static {v2}, Landroid/bluetooth/BluetoothGattService;->access$200(Landroid/bluetooth/BluetoothGattService;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 435
    iget-object v0, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #setter for: Landroid/bluetooth/BluetoothGattService;->discoveryState:I
    invoke-static {v0, p1}, Landroid/bluetooth/BluetoothGattService;->access$202(Landroid/bluetooth/BluetoothGattService;I)I

    .line 436
    return-void
.end method


# virtual methods
.method public declared-synchronized deregisterCharacteristicsWatcher()Z
    .locals 4

    .prologue
    .line 685
    monitor-enter p0

    :try_start_0
    const-string v1, "BluetoothGattService"

    const-string v2, "deregisterCharacteristicsWatcher: "

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 687
    :try_start_1
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mService:Landroid/bluetooth/IBluetooth;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$500(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetooth;

    move-result-object v1

    iget-object v2, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mObjPath:Ljava/lang/String;
    invoke-static {v2}, Landroid/bluetooth/BluetoothGattService;->access$300(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mServiceId:I
    invoke-static {v3}, Landroid/bluetooth/BluetoothGattService;->access$400(Landroid/bluetooth/BluetoothGattService;)I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/bluetooth/IBluetooth;->deregisterCharacteristicsWatcher(Ljava/lang/String;I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    .line 689
    :goto_0
    monitor-exit p0

    return v1

    .line 688
    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    :try_start_2
    const-string v1, "BluetoothGattService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 689
    const/4 v1, 0x0

    goto :goto_0

    .line 685
    .end local v0           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public discoveryDone()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 439
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->discoveryState:I
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$200(Landroid/bluetooth/BluetoothGattService;)I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public doDiscovery()Z
    .locals 5

    .prologue
    const/4 v4, 0x2

    .line 447
    const-string v1, "BluetoothGattService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "doDiscovery "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mObjPath:Ljava/lang/String;
    invoke-static {v3}, Landroid/bluetooth/BluetoothGattService;->access$300(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->discoveryState:I
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$200(Landroid/bluetooth/BluetoothGattService;)I

    move-result v1

    if-ne v1, v4, :cond_0

    .line 450
    const-string v1, "BluetoothGattService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Characteristic discovery is already in progress for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mObjPath:Ljava/lang/String;
    invoke-static {v3}, Landroid/bluetooth/BluetoothGattService;->access$300(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    const/4 v1, 0x1

    .line 460
    :goto_0
    return v1

    .line 454
    :cond_0
    invoke-direct {p0, v4}, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->setDiscoveryState(I)V

    .line 457
    :try_start_0
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mService:Landroid/bluetooth/IBluetooth;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$500(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetooth;

    move-result-object v1

    iget-object v2, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mObjPath:Ljava/lang/String;
    invoke-static {v2}, Landroid/bluetooth/BluetoothGattService;->access$300(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mServiceId:I
    invoke-static {v3}, Landroid/bluetooth/BluetoothGattService;->access$400(Landroid/bluetooth/BluetoothGattService;)I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/bluetooth/IBluetooth;->discoverCharacteristics(Ljava/lang/String;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 458
    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "BluetoothGattService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 460
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public declared-synchronized fetchCharValue(Ljava/lang/String;)Z
    .locals 3
    .parameter "path"

    .prologue
    .line 664
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mService:Landroid/bluetooth/IBluetooth;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$500(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetooth;

    move-result-object v1

    iget-object v2, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mServiceId:I
    invoke-static {v2}, Landroid/bluetooth/BluetoothGattService;->access$400(Landroid/bluetooth/BluetoothGattService;)I

    move-result v2

    invoke-interface {v1, p1, v2}, Landroid/bluetooth/IBluetooth;->updateCharacteristicValue(Ljava/lang/String;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 667
    :goto_0
    monitor-exit p0

    return v1

    .line 665
    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    :try_start_1
    const-string v1, "BluetoothGattService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 667
    const/4 v1, 0x0

    goto :goto_0

    .line 664
    .end local v0           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized gattConnect(BBIIIIIIIII)Z
    .locals 17
    .parameter "prohibitRemoteChg"
    .parameter "filterPolicy"
    .parameter "scanInterval"
    .parameter "scanWindow"
    .parameter "intervalMin"
    .parameter "intervalMax"
    .parameter "latency"
    .parameter "superVisionTimeout"
    .parameter "minCeLen"
    .parameter "maxCeLen"
    .parameter "connTimeout"

    .prologue
    .line 553
    monitor-enter p0

    :try_start_0
    const-string v1, "BluetoothGattService"

    const-string v2, "gattConnect"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 555
    :try_start_1
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mService:Landroid/bluetooth/IBluetooth;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$500(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetooth;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mDevice:Landroid/bluetooth/BluetoothDevice;
    invoke-static {v2}, Landroid/bluetooth/BluetoothGattService;->access$600(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mObjPath:Ljava/lang/String;
    invoke-static {v3}, Landroid/bluetooth/BluetoothGattService;->access$300(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v3

    move/from16 v4, p1

    move/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    move/from16 v12, p9

    move/from16 v13, p10

    move/from16 v14, p11

    invoke-interface/range {v1 .. v14}, Landroid/bluetooth/IBluetooth;->gattConnect(Ljava/lang/String;Ljava/lang/String;BBIIIIIIIII)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v16

    .line 558
    .local v16, result:I
    if-eqz v16, :cond_0

    .line 559
    const/4 v1, 0x0

    .line 563
    .end local v16           #result:I
    :goto_0
    monitor-exit p0

    return v1

    .line 560
    .restart local v16       #result:I
    :cond_0
    const/4 v1, 0x1

    goto :goto_0

    .line 561
    .end local v16           #result:I
    :catch_0
    move-exception v15

    .local v15, e:Landroid/os/RemoteException;
    :try_start_2
    const-string v1, "BluetoothGattService"

    const-string v2, ""

    invoke-static {v1, v2, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 563
    const/4 v1, 0x0

    goto :goto_0

    .line 553
    .end local v15           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized gattConnectCancel()Z
    .locals 4

    .prologue
    .line 567
    monitor-enter p0

    :try_start_0
    const-string v1, "BluetoothGattService"

    const-string v2, "gattConnectCancel"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 569
    :try_start_1
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mService:Landroid/bluetooth/IBluetooth;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$500(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetooth;

    move-result-object v1

    iget-object v2, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mDevice:Landroid/bluetooth/BluetoothDevice;
    invoke-static {v2}, Landroid/bluetooth/BluetoothGattService;->access$600(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mObjPath:Ljava/lang/String;
    invoke-static {v3}, Landroid/bluetooth/BluetoothGattService;->access$300(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/bluetooth/IBluetooth;->gattConnectCancel(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    .line 572
    :goto_0
    monitor-exit p0

    return v1

    .line 570
    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    :try_start_2
    const-string v1, "BluetoothGattService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 572
    const/4 v1, 0x0

    goto :goto_0

    .line 567
    .end local v0           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized onCharacteristicValueUpdated(Ljava/lang/String;Z)V
    .locals 4
    .parameter "path"
    .parameter "result"

    .prologue
    .line 637
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mClosed:Z
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$900(Landroid/bluetooth/BluetoothGattService;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_1

    .line 660
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 640
    :cond_1
    if-eqz p2, :cond_2

    .line 641
    :try_start_1
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #calls: Landroid/bluetooth/BluetoothGattService;->updateCharacteristicPropertyCache(Ljava/lang/String;)V
    invoke-static {v1, p1}, Landroid/bluetooth/BluetoothGattService;->access$1300(Landroid/bluetooth/BluetoothGattService;Ljava/lang/String;)V

    .line 644
    :cond_2
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mUpdateCharacteristicsTracker:Ljava/util/ArrayList;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$800(Landroid/bluetooth/BluetoothGattService;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 645
    const-string v1, "BluetoothGattService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Char path present in update tracker: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 646
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mUpdateCharacteristicsTracker:Ljava/util/ArrayList;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$800(Landroid/bluetooth/BluetoothGattService;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 647
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mUpdateCharacteristicsTracker:Ljava/util/ArrayList;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$800(Landroid/bluetooth/BluetoothGattService;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->discoveryState:I
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$200(Landroid/bluetooth/BluetoothGattService;)I

    move-result v1

    if-nez v1, :cond_0

    .line 649
    const-string v1, "BluetoothGattService"

    const-string/jumbo v2, "retrieved char Paths from the cache and updated value"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 650
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothGattService;->getCharacteristicPaths()[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->onCharacteristicsDiscovered([Ljava/lang/String;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 637
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 655
    :cond_3
    :try_start_2
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->profileCallback:Landroid/bluetooth/IBluetoothGattProfile;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$1200(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetoothGattProfile;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v1

    if-eqz v1, :cond_0

    .line 657
    :try_start_3
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->profileCallback:Landroid/bluetooth/IBluetoothGattProfile;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$1200(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetoothGattProfile;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Landroid/bluetooth/IBluetoothGattProfile;->onUpdateCharacteristicValueResult(Ljava/lang/String;Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 658
    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    :try_start_4
    const-string v1, "BluetoothGattService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized onCharacteristicsDiscovered([Ljava/lang/String;Z)V
    .locals 7
    .parameter "paths"
    .parameter "result"

    .prologue
    .line 505
    monitor-enter p0

    :try_start_0
    const-string v4, "BluetoothGattService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "onCharacteristicsDiscovered: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mClosed:Z
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$900(Landroid/bluetooth/BluetoothGattService;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-eqz v4, :cond_0

    .line 541
    :goto_0
    monitor-exit p0

    return-void

    .line 510
    :cond_0
    if-eqz p1, :cond_2

    .line 512
    :try_start_1
    array-length v0, p1

    .line 514
    .local v0, count:I
    const-string v4, "BluetoothGattService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovered  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " characteristics for service "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mObjPath:Ljava/lang/String;
    invoke-static {v6}, Landroid/bluetooth/BluetoothGattService;->access$300(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ( "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mName:Ljava/lang/String;
    invoke-static {v6}, Landroid/bluetooth/BluetoothGattService;->access$1000(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " )"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #setter for: Landroid/bluetooth/BluetoothGattService;->characteristicPaths:[Ljava/lang/String;
    invoke-static {v4, p1}, Landroid/bluetooth/BluetoothGattService;->access$702(Landroid/bluetooth/BluetoothGattService;[Ljava/lang/String;)[Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 518
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-ge v2, v0, :cond_2

    .line 520
    const/4 v3, 0x0

    .line 523
    .local v3, properties:[Ljava/lang/String;
    :try_start_2
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mService:Landroid/bluetooth/IBluetooth;
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$500(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetooth;

    move-result-object v4

    aget-object v5, p1, v2

    invoke-interface {v4, v5}, Landroid/bluetooth/IBluetooth;->getCharacteristicProperties(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v3

    .line 526
    :goto_2
    if-eqz v3, :cond_1

    .line 527
    :try_start_3
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    aget-object v5, p1, v2

    #calls: Landroid/bluetooth/BluetoothGattService;->addCharacteristicProperties(Ljava/lang/String;[Ljava/lang/String;)V
    invoke-static {v4, v5, v3}, Landroid/bluetooth/BluetoothGattService;->access$1100(Landroid/bluetooth/BluetoothGattService;Ljava/lang/String;[Ljava/lang/String;)V

    .line 518
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 524
    :catch_0
    move-exception v1

    .local v1, e:Landroid/os/RemoteException;
    const-string v4, "BluetoothGattService"

    const-string v5, ""

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 505
    .end local v0           #count:I
    .end local v1           #e:Landroid/os/RemoteException;
    .end local v2           #i:I
    .end local v3           #properties:[Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 532
    :cond_2
    const/4 v4, 0x1

    :try_start_4
    invoke-direct {p0, v4}, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->setDiscoveryState(I)V

    .line 534
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->profileCallback:Landroid/bluetooth/IBluetoothGattProfile;
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$1200(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetoothGattProfile;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v4

    if-eqz v4, :cond_3

    .line 536
    :try_start_5
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->profileCallback:Landroid/bluetooth/IBluetoothGattProfile;
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$1200(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetoothGattProfile;

    move-result-object v4

    iget-object v5, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mObjPath:Ljava/lang/String;
    invoke-static {v5}, Landroid/bluetooth/BluetoothGattService;->access$300(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, p2}, Landroid/bluetooth/IBluetoothGattProfile;->onDiscoverCharacteristicsResult(Ljava/lang/String;Z)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 540
    :cond_3
    :goto_3
    :try_start_6
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    goto/16 :goto_0

    .line 537
    :catch_1
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    const-string v4, "BluetoothGattService"

    const-string v5, ""

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3
.end method

.method public declared-synchronized onSetCharacteristicProperty(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 4
    .parameter "path"
    .parameter "property"
    .parameter "result"

    .prologue
    .line 577
    monitor-enter p0

    :try_start_0
    const-string v1, "BluetoothGattService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onSetCharacteristicProperty: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " property "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " result "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 578
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mClosed:Z
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$900(Landroid/bluetooth/BluetoothGattService;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_1

    .line 603
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 581
    :cond_1
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 584
    :try_start_1
    const-string v1, "Value"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-eqz v1, :cond_3

    .line 586
    if-eqz p3, :cond_2

    .line 587
    :try_start_2
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #calls: Landroid/bluetooth/BluetoothGattService;->updateCharacteristicPropertyCache(Ljava/lang/String;)V
    invoke-static {v1, p1}, Landroid/bluetooth/BluetoothGattService;->access$1300(Landroid/bluetooth/BluetoothGattService;Ljava/lang/String;)V

    .line 589
    :cond_2
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->profileCallback:Landroid/bluetooth/IBluetoothGattProfile;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$1200(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetoothGattProfile;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 590
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->profileCallback:Landroid/bluetooth/IBluetoothGattProfile;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$1200(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetoothGattProfile;

    move-result-object v1

    invoke-interface {v1, p1, p3}, Landroid/bluetooth/IBluetoothGattProfile;->onSetCharacteristicValueResult(Ljava/lang/String;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    .line 593
    :cond_3
    :goto_1
    :try_start_3
    const-string v1, "ClientConfiguration"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    .line 595
    if-eqz p3, :cond_4

    .line 596
    :try_start_4
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #calls: Landroid/bluetooth/BluetoothGattService;->updateCharacteristicPropertyCache(Ljava/lang/String;)V
    invoke-static {v1, p1}, Landroid/bluetooth/BluetoothGattService;->access$1300(Landroid/bluetooth/BluetoothGattService;Ljava/lang/String;)V

    .line 598
    :cond_4
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->profileCallback:Landroid/bluetooth/IBluetoothGattProfile;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$1200(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetoothGattProfile;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 599
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->profileCallback:Landroid/bluetooth/IBluetoothGattProfile;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$1200(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetoothGattProfile;

    move-result-object v1

    invoke-interface {v1, p1, p3}, Landroid/bluetooth/IBluetoothGattProfile;->onSetCharacteristicCliConfResult(Ljava/lang/String;Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    .line 600
    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    :try_start_5
    const-string v1, "BluetoothGattService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0

    .line 577
    .end local v0           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 591
    :catch_1
    move-exception v0

    .restart local v0       #e:Landroid/os/RemoteException;
    :try_start_6
    const-string v1, "BluetoothGattService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_1
.end method

.method public declared-synchronized onValueChanged(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "path"
    .parameter "value"

    .prologue
    .line 607
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mClosed:Z
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$900(Landroid/bluetooth/BluetoothGattService;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_1

    .line 622
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 610
    :cond_1
    if-eqz p1, :cond_0

    .line 613
    :try_start_1
    const-string v1, "BluetoothGattService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "WatcherValueChanged = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->profileCallback:Landroid/bluetooth/IBluetoothGattProfile;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$1200(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetoothGattProfile;

    move-result-object v1

    if-nez v1, :cond_2

    .line 616
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->deregisterCharacteristicsWatcher()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 607
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 620
    :cond_2
    :try_start_2
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->profileCallback:Landroid/bluetooth/IBluetoothGattProfile;
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$1200(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetoothGattProfile;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Landroid/bluetooth/IBluetoothGattProfile;->onValueChanged(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 621
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    :try_start_3
    const-string v1, "BluetoothGattService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized registerCharacteristicsWatcher()Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    .line 671
    monitor-enter p0

    :try_start_0
    const-string v2, "BluetoothGattService"

    const-string/jumbo v3, "registerCharacteristicsWatcher: "

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 674
    :try_start_1
    iget-object v2, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mService:Landroid/bluetooth/IBluetooth;
    invoke-static {v2}, Landroid/bluetooth/BluetoothGattService;->access$500(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetooth;

    move-result-object v2

    iget-object v3, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mObjPath:Ljava/lang/String;
    invoke-static {v3}, Landroid/bluetooth/BluetoothGattService;->access$300(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mServiceId:I
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$400(Landroid/bluetooth/BluetoothGattService;)I

    move-result v4

    invoke-interface {v2, v3, p0, v4}, Landroid/bluetooth/IBluetooth;->registerCharacteristicsWatcher(Ljava/lang/String;Landroid/bluetooth/IBluetoothGattService;I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v2

    if-ne v2, v1, :cond_0

    .line 681
    :goto_0
    monitor-exit p0

    return v1

    .line 679
    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    :try_start_2
    const-string v1, "BluetoothGattService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 681
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 671
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setCharacteristicProperty(Ljava/lang/String;Ljava/lang/String;[BZ)Z
    .locals 7
    .parameter "path"
    .parameter "key"
    .parameter "value"
    .parameter "reliable"

    .prologue
    .line 626
    monitor-enter p0

    :try_start_0
    const-string v0, "BluetoothGattService"

    const-string/jumbo v1, "setCharacteristicProperty"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 628
    :try_start_1
    iget-object v0, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mService:Landroid/bluetooth/IBluetooth;
    invoke-static {v0}, Landroid/bluetooth/BluetoothGattService;->access$500(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetooth;

    move-result-object v0

    iget-object v1, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mServiceId:I
    invoke-static {v1}, Landroid/bluetooth/BluetoothGattService;->access$400(Landroid/bluetooth/BluetoothGattService;)I

    move-result v5

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-interface/range {v0 .. v5}, Landroid/bluetooth/IBluetooth;->setCharacteristicProperty(Ljava/lang/String;Ljava/lang/String;[BZI)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v0

    .line 631
    :goto_0
    monitor-exit p0

    return v0

    .line 629
    :catch_0
    move-exception v6

    .local v6, e:Landroid/os/RemoteException;
    :try_start_2
    const-string v0, "BluetoothGattService"

    const-string v1, ""

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 631
    const/4 v0, 0x0

    goto :goto_0

    .line 626
    .end local v6           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public startRemoteGattService()V
    .locals 7

    .prologue
    .line 465
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->setDiscoveryState(I)V

    .line 468
    :try_start_0
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mService:Landroid/bluetooth/IBluetooth;
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$500(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetooth;

    move-result-object v4

    iget-object v5, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mObjPath:Ljava/lang/String;
    invoke-static {v5}, Landroid/bluetooth/BluetoothGattService;->access$300(Landroid/bluetooth/BluetoothGattService;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, p0}, Landroid/bluetooth/IBluetooth;->startRemoteGattService(Ljava/lang/String;Landroid/bluetooth/IBluetoothGattService;)I

    move-result v2

    .line 469
    .local v2, servId:I
    if-ltz v2, :cond_0

    .line 470
    const-string v4, "BluetoothGattService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Received service id :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #setter for: Landroid/bluetooth/BluetoothGattService;->mServiceId:I
    invoke-static {v4, v2}, Landroid/bluetooth/BluetoothGattService;->access$402(Landroid/bluetooth/BluetoothGattService;I)I

    .line 477
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mService:Landroid/bluetooth/IBluetooth;
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$500(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/IBluetooth;

    move-result-object v4

    iget-object v5, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mDevice:Landroid/bluetooth/BluetoothDevice;
    invoke-static {v5}, Landroid/bluetooth/BluetoothGattService;->access$600(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v5

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/bluetooth/IBluetooth;->getBondState(Ljava/lang/String;)I

    move-result v3

    .line 478
    .local v3, state:I
    const-string v4, "BluetoothGattService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bond state of remote device : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mDevice:Landroid/bluetooth/BluetoothDevice;
    invoke-static {v6}, Landroid/bluetooth/BluetoothGattService;->access$600(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v6

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 479
    const/16 v4, 0xc

    if-ne v3, v4, :cond_3

    .line 480
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    iget-object v5, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothGattService;->getCharacteristicPaths()[Ljava/lang/String;

    move-result-object v5

    #setter for: Landroid/bluetooth/BluetoothGattService;->characteristicPaths:[Ljava/lang/String;
    invoke-static {v4, v5}, Landroid/bluetooth/BluetoothGattService;->access$702(Landroid/bluetooth/BluetoothGattService;[Ljava/lang/String;)[Ljava/lang/String;

    .line 481
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->characteristicPaths:[Ljava/lang/String;
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$700(Landroid/bluetooth/BluetoothGattService;)[Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 483
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->characteristicPaths:[Ljava/lang/String;
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$700(Landroid/bluetooth/BluetoothGattService;)[Ljava/lang/String;

    move-result-object v4

    array-length v4, v4

    if-ge v1, v4, :cond_1

    .line 484
    const-string v4, "BluetoothGattService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Update value for characteristics path : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->characteristicPaths:[Ljava/lang/String;
    invoke-static {v6}, Landroid/bluetooth/BluetoothGattService;->access$700(Landroid/bluetooth/BluetoothGattService;)[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 487
    :try_start_1
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mHelper:Landroid/bluetooth/BluetoothGattService$ServiceHelper;
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$100(Landroid/bluetooth/BluetoothGattService;)Landroid/bluetooth/BluetoothGattService$ServiceHelper;

    move-result-object v4

    iget-object v5, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->characteristicPaths:[Ljava/lang/String;
    invoke-static {v5}, Landroid/bluetooth/BluetoothGattService;->access$700(Landroid/bluetooth/BluetoothGattService;)[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->fetchCharValue(Ljava/lang/String;)Z

    .line 488
    iget-object v4, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->mUpdateCharacteristicsTracker:Ljava/util/ArrayList;
    invoke-static {v4}, Landroid/bluetooth/BluetoothGattService;->access$800(Landroid/bluetooth/BluetoothGattService;)Ljava/util/ArrayList;

    move-result-object v4

    iget-object v5, p0, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->this$0:Landroid/bluetooth/BluetoothGattService;

    #getter for: Landroid/bluetooth/BluetoothGattService;->characteristicPaths:[Ljava/lang/String;
    invoke-static {v5}, Landroid/bluetooth/BluetoothGattService;->access$700(Landroid/bluetooth/BluetoothGattService;)[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 483
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 473
    .end local v1           #i:I
    .end local v3           #state:I
    :cond_0
    :try_start_2
    const-string v4, "BluetoothGattService"

    const-string v5, "Error while starting remote gatt service"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 501
    .end local v2           #servId:I
    :cond_1
    :goto_2
    return-void

    .line 489
    .restart local v1       #i:I
    .restart local v2       #servId:I
    .restart local v3       #state:I
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    const-string v4, "BluetoothGattService"

    const-string v5, ""

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 500
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #i:I
    .end local v2           #servId:I
    .end local v3           #state:I
    :catch_1
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    const-string v4, "BluetoothGattService"

    const-string v5, ""

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 493
    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v2       #servId:I
    .restart local v3       #state:I
    :cond_2
    :try_start_3
    const-string v4, "BluetoothGattService"

    const-string v5, "doDiscovery for bonded device"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->doDiscovery()Z

    goto :goto_2

    .line 497
    :cond_3
    const-string v4, "BluetoothGattService"

    const-string v5, "doDiscovery as device is not bonded"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothGattService$ServiceHelper;->doDiscovery()Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2
.end method

.method public declared-synchronized waitDiscoveryDone()V
    .locals 3

    .prologue
    .line 695
    monitor-enter p0

    const-wide/32 v1, 0xea60

    :try_start_0
    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 699
    :goto_0
    monitor-exit p0

    return-void

    .line 696
    :catch_0
    move-exception v0

    .line 697
    .local v0, e:Ljava/lang/InterruptedException;
    :try_start_1
    const-string v1, "BluetoothGattService"

    const-string v2, "Characteristics discovery takes too long"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 695
    .end local v0           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
