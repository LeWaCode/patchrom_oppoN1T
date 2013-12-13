.class public final Landroid/nfc/NfcSecureElementExtras;
.super Ljava/lang/Object;
.source "NfcSecureElementExtras.java"


# static fields
.field public static final ALL_SE_ID:Ljava/lang/String; = "com.nxp.all_se.ID"

.field public static final ALL_SE_ID_TYPE:I = 0x3

.field public static final CE_HOST_ID:Ljava/lang/String; = "com.nxp.host_se.ID"

.field public static final NONE_SE_ID:Ljava/lang/String; = "com.nxp.none_se.ID"

.field public static final SMART_MX_ID:Ljava/lang/String; = "com.nxp.smart_mx.ID"

.field public static final SMART_MX_ID_TYPE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "NfcSecureElementExtras"

.field public static final UICC_ID:Ljava/lang/String; = "com.nxp.uicc.ID"

.field public static final UICC_ID_TYPE:I = 0x2


# instance fields
.field private mSecureElementControl:Landroid/nfc/NfcSecureElementControl;

.field private mService:Landroid/nfc/INfcAdapterExtras;


# direct methods
.method public constructor <init>(Landroid/nfc/INfcAdapterExtras;Landroid/nfc/NfcSecureElementControl;)V
    .locals 0
    .parameter "secureElementService"
    .parameter "secureElementControl"

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Landroid/nfc/NfcSecureElementExtras;->mService:Landroid/nfc/INfcAdapterExtras;

    .line 70
    iput-object p2, p0, Landroid/nfc/NfcSecureElementExtras;->mSecureElementControl:Landroid/nfc/NfcSecureElementControl;

    .line 71
    return-void
.end method


# virtual methods
.method public authenticate(Ljava/lang/String;[B)V
    .locals 3
    .parameter "pkg"
    .parameter "token"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    :try_start_0
    iget-object v1, p0, Landroid/nfc/NfcSecureElementExtras;->mService:Landroid/nfc/INfcAdapterExtras;

    invoke-interface {v1, p1, p2}, Landroid/nfc/INfcAdapterExtras;->authenticate(Ljava/lang/String;[B)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    return-void

    .line 190
    :catch_0
    move-exception v0

    .line 191
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "NfcSecureElementExtras"

    const-string v2, "RemoteException in authenticate(): "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 192
    new-instance v1, Ljava/io/IOException;

    const-string v2, "RemoteException in authenticate()"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public close(Ljava/lang/String;Landroid/os/IBinder;)Landroid/os/Bundle;
    .locals 3
    .parameter "pkg"
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    :try_start_0
    iget-object v1, p0, Landroid/nfc/NfcSecureElementExtras;->mService:Landroid/nfc/INfcAdapterExtras;

    invoke-interface {v1, p1, p2}, Landroid/nfc/INfcAdapterExtras;->close(Ljava/lang/String;Landroid/os/IBinder;)Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "NfcSecureElementExtras"

    const-string v2, "RemoteException in close(): "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 111
    new-instance v1, Ljava/io/IOException;

    const-string v2, "RemoteException in close()"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getCardEmulationRoute(Ljava/lang/String;)I
    .locals 3
    .parameter "pkg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    :try_start_0
    iget-object v1, p0, Landroid/nfc/NfcSecureElementExtras;->mService:Landroid/nfc/INfcAdapterExtras;

    invoke-interface {v1, p1}, Landroid/nfc/INfcAdapterExtras;->getCardEmulationRoute(Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 151
    :catch_0
    move-exception v0

    .line 152
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "NfcSecureElementExtras"

    const-string v2, "RemoteException in getCardEmulationRoute(): "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 153
    new-instance v1, Ljava/io/IOException;

    const-string v2, "RemoteException in getCardEmulationRoute()"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getSecureElementTechList(Ljava/lang/String;)[I
    .locals 3
    .parameter "pkg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 212
    :try_start_0
    iget-object v1, p0, Landroid/nfc/NfcSecureElementExtras;->mService:Landroid/nfc/INfcAdapterExtras;

    invoke-interface {v1, p1}, Landroid/nfc/INfcAdapterExtras;->getSecureElementTechList(Ljava/lang/String;)[I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 213
    :catch_0
    move-exception v0

    .line 214
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "NfcSecureElementExtras"

    const-string v2, "RemoteException in getSecureElementTechList(): "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 215
    new-instance v1, Ljava/io/IOException;

    const-string v2, "RemoteException in getSecureElementTechList()"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getSecureElementUid(Ljava/lang/String;)[B
    .locals 4
    .parameter "pkg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    const/4 v1, 0x0

    .line 232
    .local v1, uid:[B
    :try_start_0
    iget-object v2, p0, Landroid/nfc/NfcSecureElementExtras;->mService:Landroid/nfc/INfcAdapterExtras;

    invoke-interface {v2, p1}, Landroid/nfc/INfcAdapterExtras;->getSecureElementUid(Ljava/lang/String;)[B

    move-result-object v1

    .line 234
    if-nez v1, :cond_0

    .line 235
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Get Secure Element UID failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    :catch_0
    move-exception v0

    .line 239
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "NfcSecureElementExtras"

    const-string v3, "RemoteException in getSecureElementUid(): "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 240
    new-instance v2, Ljava/io/IOException;

    const-string v3, "RemoteException in getSecureElementUid()"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 237
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_0
    return-object v1
.end method

.method public open(Ljava/lang/String;Landroid/os/IBinder;)Landroid/os/Bundle;
    .locals 3
    .parameter "pkg"
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    :try_start_0
    iget-object v1, p0, Landroid/nfc/NfcSecureElementExtras;->mService:Landroid/nfc/INfcAdapterExtras;

    invoke-interface {v1, p1, p2}, Landroid/nfc/INfcAdapterExtras;->open(Ljava/lang/String;Landroid/os/IBinder;)Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "NfcSecureElementExtras"

    const-string v2, "RemoteException in open(): "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 90
    new-instance v1, Ljava/io/IOException;

    const-string v2, "RemoteException in open()"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setCardEmulationRoute(Ljava/lang/String;I)V
    .locals 3
    .parameter "pkg"
    .parameter "route"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 169
    :try_start_0
    iget-object v1, p0, Landroid/nfc/NfcSecureElementExtras;->mService:Landroid/nfc/INfcAdapterExtras;

    invoke-interface {v1, p1, p2}, Landroid/nfc/INfcAdapterExtras;->setCardEmulationRoute(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    return-void

    .line 170
    :catch_0
    move-exception v0

    .line 171
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "NfcSecureElementExtras"

    const-string v2, "RemoteException in setCardEmulationRoute(): "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 172
    new-instance v1, Ljava/io/IOException;

    const-string v2, "RemoteException in setCardEmulationRoute()"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method setCardEmulationRouteEx(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 4
    .parameter "pkg"
    .parameter "seID"
    .parameter "powerState"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    const-string v2, "NfcSecureElementExtras"

    const-string/jumbo v3, "setCardEmulationRouteEx - start"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    const/4 v1, 0x0

    .line 252
    .local v1, state:Z
    :try_start_0
    const-string v2, "com.nxp.smart_mx.ID"

    invoke-virtual {p2, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_1

    .line 253
    iget-object v2, p0, Landroid/nfc/NfcSecureElementExtras;->mSecureElementControl:Landroid/nfc/NfcSecureElementControl;

    const-string v3, "com.nxp.smart_mx.ID"

    invoke-virtual {v2, p1, v3}, Landroid/nfc/NfcSecureElementControl;->selectDefaultSecureElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    const/4 v1, 0x1

    .line 276
    :cond_0
    :goto_0
    return-void

    .line 255
    :cond_1
    const-string v2, "com.nxp.uicc.ID"

    invoke-virtual {p2, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_2

    .line 256
    iget-object v2, p0, Landroid/nfc/NfcSecureElementExtras;->mSecureElementControl:Landroid/nfc/NfcSecureElementControl;

    const-string v3, "com.nxp.uicc.ID"

    invoke-virtual {v2, p1, v3}, Landroid/nfc/NfcSecureElementControl;->selectDefaultSecureElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    const/4 v1, 0x1

    goto :goto_0

    .line 258
    :cond_2
    const-string v2, "com.nxp.all_se.ID"

    invoke-virtual {p2, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_3

    .line 259
    iget-object v2, p0, Landroid/nfc/NfcSecureElementExtras;->mSecureElementControl:Landroid/nfc/NfcSecureElementControl;

    const-string v3, "com.nxp.all_se.ID"

    invoke-virtual {v2, p1, v3}, Landroid/nfc/NfcSecureElementControl;->selectDefaultSecureElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    const/4 v1, 0x1

    .line 262
    iget-object v2, p0, Landroid/nfc/NfcSecureElementExtras;->mSecureElementControl:Landroid/nfc/NfcSecureElementControl;

    invoke-virtual {v2, p1, v1}, Landroid/nfc/NfcSecureElementControl;->setDefaultSecureElementState(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 270
    :catch_0
    move-exception v0

    .line 271
    .local v0, e:Ljava/io/IOException;
    const-string v2, "NfcSecureElementExtras"

    const-string v3, "Exception in setCardEmulationRouteEx(): "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 272
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Exception in setCardEmulationRouteEx()"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 263
    .end local v0           #e:Ljava/io/IOException;
    :cond_3
    :try_start_1
    const-string v2, "com.nxp.none_se.ID"

    invoke-virtual {p2, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_4

    .line 264
    iget-object v2, p0, Landroid/nfc/NfcSecureElementExtras;->mSecureElementControl:Landroid/nfc/NfcSecureElementControl;

    invoke-virtual {v2, p1}, Landroid/nfc/NfcSecureElementControl;->deSelectedSecureElement(Ljava/lang/String;)V

    .line 265
    const/4 v1, 0x0

    goto :goto_0

    .line 266
    :cond_4
    const-string v2, "com.nxp.host_se.ID"

    invoke-virtual {p2, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0
.end method

.method public transceive(Ljava/lang/String;[B)Landroid/os/Bundle;
    .locals 3
    .parameter "pkg"
    .parameter "data_in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    :try_start_0
    iget-object v1, p0, Landroid/nfc/NfcSecureElementExtras;->mService:Landroid/nfc/INfcAdapterExtras;

    invoke-interface {v1, p1, p2}, Landroid/nfc/INfcAdapterExtras;->transceive(Ljava/lang/String;[B)Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 131
    :catch_0
    move-exception v0

    .line 132
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "NfcSecureElementExtras"

    const-string v2, "RemoteException in transceive(): "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 133
    new-instance v1, Ljava/io/IOException;

    const-string v2, "RemoteException in transceive()"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
