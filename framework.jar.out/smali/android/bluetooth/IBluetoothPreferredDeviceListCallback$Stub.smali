.class public abstract Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub;
.super Landroid/os/Binder;
.source "IBluetoothPreferredDeviceListCallback.java"

# interfaces
.implements Landroid/bluetooth/IBluetoothPreferredDeviceListCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/bluetooth/IBluetoothPreferredDeviceListCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "android.bluetooth.IBluetoothPreferredDeviceListCallback"

.field static final TRANSACTION_onAddDeviceToPreferredList:I = 0x1

.field static final TRANSACTION_onClearPreferredDeviceList:I = 0x3

.field static final TRANSACTION_onGattAutoConnect:I = 0x6

.field static final TRANSACTION_onGattAutoConnectCancel:I = 0x7

.field static final TRANSACTION_onGattCancelConnectToPreferredDeviceList:I = 0x5

.field static final TRANSACTION_onGattConnectToPreferredDeviceList:I = 0x4

.field static final TRANSACTION_onRemoveDeviceFromPreferredList:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 18
    const-string v0, "android.bluetooth.IBluetoothPreferredDeviceListCallback"

    invoke-virtual {p0, p0, v0}, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 19
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothPreferredDeviceListCallback;
    .locals 2
    .parameter "obj"

    .prologue
    .line 26
    if-nez p0, :cond_0

    .line 27
    const/4 v0, 0x0

    .line 33
    :goto_0
    return-object v0

    .line 29
    :cond_0
    const-string v1, "android.bluetooth.IBluetoothPreferredDeviceListCallback"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 30
    .local v0, iin:Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback;

    if-eqz v1, :cond_1

    .line 31
    check-cast v0, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback;

    goto :goto_0

    .line 33
    :cond_1
    new-instance v0, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub$Proxy;

    .end local v0           #iin:Landroid/os/IInterface;
    invoke-direct {v0, p0}, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    .line 37
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .parameter "code"
    .parameter "data"
    .parameter "reply"
    .parameter "flags"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 41
    sparse-switch p1, :sswitch_data_0

    .line 112
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    :goto_0
    return v1

    .line 45
    :sswitch_0
    const-string v2, "android.bluetooth.IBluetoothPreferredDeviceListCallback"

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 50
    :sswitch_1
    const-string v2, "android.bluetooth.IBluetoothPreferredDeviceListCallback"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 52
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 53
    .local v0, _arg0:I
    invoke-virtual {p0, v0}, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub;->onAddDeviceToPreferredList(I)V

    .line 54
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 59
    .end local v0           #_arg0:I
    :sswitch_2
    const-string v2, "android.bluetooth.IBluetoothPreferredDeviceListCallback"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 62
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub;->onRemoveDeviceFromPreferredList(I)V

    .line 63
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 68
    .end local v0           #_arg0:I
    :sswitch_3
    const-string v2, "android.bluetooth.IBluetoothPreferredDeviceListCallback"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 70
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 71
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub;->onClearPreferredDeviceList(I)V

    .line 72
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 77
    .end local v0           #_arg0:I
    :sswitch_4
    const-string v2, "android.bluetooth.IBluetoothPreferredDeviceListCallback"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 79
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 80
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub;->onGattConnectToPreferredDeviceList(I)V

    .line 81
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 86
    .end local v0           #_arg0:I
    :sswitch_5
    const-string v2, "android.bluetooth.IBluetoothPreferredDeviceListCallback"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 88
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 89
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub;->onGattCancelConnectToPreferredDeviceList(I)V

    .line 90
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 95
    .end local v0           #_arg0:I
    :sswitch_6
    const-string v2, "android.bluetooth.IBluetoothPreferredDeviceListCallback"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 97
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 98
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub;->onGattAutoConnect(I)V

    .line 99
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 104
    .end local v0           #_arg0:I
    :sswitch_7
    const-string v2, "android.bluetooth.IBluetoothPreferredDeviceListCallback"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 106
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 107
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Landroid/bluetooth/IBluetoothPreferredDeviceListCallback$Stub;->onGattAutoConnectCancel(I)V

    .line 108
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 41
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
