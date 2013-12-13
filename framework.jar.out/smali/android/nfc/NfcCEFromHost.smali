.class public final Landroid/nfc/NfcCEFromHost;
.super Ljava/lang/Object;
.source "NfcCEFromHost.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "NfcCEFromHost"


# instance fields
.field private mService:Landroid/nfc/INfcCEFromHost;


# direct methods
.method public constructor <init>(Landroid/nfc/INfcCEFromHost;)V
    .locals 0
    .parameter "mCEFromHostService"

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Landroid/nfc/NfcCEFromHost;->mService:Landroid/nfc/INfcCEFromHost;

    .line 38
    return-void
.end method


# virtual methods
.method public receiveCEFromHost(Ljava/lang/String;)[B
    .locals 4
    .parameter "pkg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    :try_start_0
    iget-object v2, p0, Landroid/nfc/NfcCEFromHost;->mService:Landroid/nfc/INfcCEFromHost;

    invoke-interface {v2, p1}, Landroid/nfc/INfcCEFromHost;->receiveCEFromHost(Ljava/lang/String;)[B

    move-result-object v1

    .line 106
    .local v1, response:[B
    if-nez v1, :cond_0

    .line 107
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Receive APDU failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .end local v1           #response:[B
    :catch_0
    move-exception v0

    .line 111
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "NfcCEFromHost"

    const-string v3, "RemoteException in receiveCEFromHost(): "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 112
    new-instance v2, Ljava/io/IOException;

    const-string v3, "RemoteException in receiveCEFromHost()"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 109
    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v1       #response:[B
    :cond_0
    return-object v1
.end method

.method public resetCEFromHostType(Ljava/lang/String;)V
    .locals 3
    .parameter "pkg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    :try_start_0
    iget-object v1, p0, Landroid/nfc/NfcCEFromHost;->mService:Landroid/nfc/INfcCEFromHost;

    invoke-interface {v1, p1}, Landroid/nfc/INfcCEFromHost;->resetCEFromHostType(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    return-void

    .line 89
    :catch_0
    move-exception v0

    .line 90
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "NfcCEFromHost"

    const-string v2, "RemoteException in resetCEFromHostType(): "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 91
    new-instance v1, Ljava/io/IOException;

    const-string v2, "RemoteException in resetCEFromHostType()"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public sendCEFromHost(Ljava/lang/String;[B)Z
    .locals 4
    .parameter "pkg"
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    :try_start_0
    iget-object v2, p0, Landroid/nfc/NfcCEFromHost;->mService:Landroid/nfc/INfcCEFromHost;

    invoke-interface {v2, p1, p2}, Landroid/nfc/INfcCEFromHost;->sendCEFromHost(Ljava/lang/String;[B)Z

    move-result v1

    .line 128
    .local v1, response:Z
    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 129
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Send APDU failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .end local v1           #response:Z
    :catch_0
    move-exception v0

    .line 133
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "NfcCEFromHost"

    const-string v3, "RemoteException in sendCEFromHost(): "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 134
    new-instance v2, Ljava/io/IOException;

    const-string v3, "RemoteException in sendCEFromHost()"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 131
    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v1       #response:Z
    :cond_0
    return v1
.end method

.method public setCEFromHostTypeA(Ljava/lang/String;B[B[B)Z
    .locals 4
    .parameter "pkg"
    .parameter "sak"
    .parameter "atqa"
    .parameter "app_data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    :try_start_0
    iget-object v2, p0, Landroid/nfc/NfcCEFromHost;->mService:Landroid/nfc/INfcCEFromHost;

    invoke-interface {v2, p1, p2, p3, p4}, Landroid/nfc/INfcCEFromHost;->setCEFromHostTypeA(Ljava/lang/String;B[B[B)Z

    move-result v1

    .line 49
    .local v1, status:Z
    if-eqz v1, :cond_0

    .line 50
    return v1

    .line 52
    :cond_0
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Unable to Enable Host Card Emulation"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .end local v1           #status:Z
    :catch_0
    move-exception v0

    .line 55
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "NfcCEFromHost"

    const-string v3, "RemoteException in setCEFromHostTypeA(): "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    new-instance v2, Ljava/io/IOException;

    const-string v3, "RemoteException in setCEFromHostTypeA()"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public setCEFromHostTypeB(Ljava/lang/String;[B[BI)Z
    .locals 4
    .parameter "pkg"
    .parameter "atqb"
    .parameter "hi_layer_resp"
    .parameter "afi"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    :try_start_0
    iget-object v2, p0, Landroid/nfc/NfcCEFromHost;->mService:Landroid/nfc/INfcCEFromHost;

    invoke-interface {v2, p1, p2, p3, p4}, Landroid/nfc/INfcCEFromHost;->setCEFromHostTypeB(Ljava/lang/String;[B[BI)Z

    move-result v1

    .line 69
    .local v1, status:Z
    if-eqz v1, :cond_0

    .line 70
    return v1

    .line 72
    :cond_0
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Unable to Enable Host Card Emulation"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .end local v1           #status:Z
    :catch_0
    move-exception v0

    .line 75
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "NfcCEFromHost"

    const-string v3, "RemoteException in setCEFromHostTypeB(): "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 76
    new-instance v2, Ljava/io/IOException;

    const-string v3, "RemoteException in setCEFromHostTypeB()"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
