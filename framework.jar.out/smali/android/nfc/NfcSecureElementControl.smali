.class public final Landroid/nfc/NfcSecureElementControl;
.super Ljava/lang/Object;
.source "NfcSecureElementControl.java"


# static fields
.field public static final ALL_SE_ID:Ljava/lang/String; = "com.nxp.all_se.ID"

.field public static final ALL_SE_ID_TYPE:I = 0x3

.field public static final NONE_SE_ID:Ljava/lang/String; = "com.nxp.none_se.ID"

.field public static final SMART_MX_ID:Ljava/lang/String; = "com.nxp.smart_mx.ID"

.field public static final SMART_MX_ID_TYPE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "NfcSecureElementControl"

.field public static final UICC_ID:Ljava/lang/String; = "com.nxp.uicc.ID"

.field public static final UICC_ID_TYPE:I = 0x2


# instance fields
.field private sService:Landroid/nfc/INfcSecureElementControl;


# direct methods
.method public constructor <init>(Landroid/nfc/INfcSecureElementControl;)V
    .locals 0
    .parameter "mSecureElementService"

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    .line 64
    return-void
.end method


# virtual methods
.method public activeSwp(Ljava/lang/String;)V
    .locals 4
    .parameter "pkg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-virtual {p0, p1}, Landroid/nfc/NfcSecureElementControl;->getDefaultSelectedSecureElement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 155
    .local v1, seID:Ljava/lang/String;
    const-string v2, "com.nxp.all_se.ID"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "com.nxp.uicc.ID"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    .line 156
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "UICC is not selected"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 160
    :cond_0
    :try_start_0
    iget-object v2, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v2, p1}, Landroid/nfc/INfcSecureElementControl;->activeSwp(Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    return-void

    .line 161
    :catch_0
    move-exception v0

    .line 162
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "NfcSecureElementControl"

    const-string v3, "activeSwp failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 163
    new-instance v2, Ljava/io/IOException;

    const-string v3, "activeSwp failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public deSelectedSecureElement(Ljava/lang/String;)V
    .locals 3
    .parameter "pkg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    :try_start_0
    iget-object v1, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v1, p1}, Landroid/nfc/INfcSecureElementControl;->deselectSecureElement(Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    return-void

    .line 206
    :catch_0
    move-exception v0

    .line 207
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "NfcSecureElementControl"

    const-string v2, "deselectSecureElement failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 208
    new-instance v1, Ljava/io/IOException;

    const-string v2, "deselectSecureElement failed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getAvailableSecureElementList(Ljava/lang/String;)[Ljava/lang/String;
    .locals 7
    .parameter "pkg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 262
    const/4 v2, 0x0

    .line 265
    .local v2, list:[I
    :try_start_0
    iget-object v5, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v5, p1}, Landroid/nfc/INfcSecureElementControl;->getSecureElementList(Ljava/lang/String;)[I

    move-result-object v2

    .line 266
    array-length v3, v2

    .line 268
    .local v3, listSize:I
    new-array v4, v3, [Ljava/lang/String;

    .line 269
    .local v4, listStrArray:[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v3, :cond_3

    .line 270
    aget v5, v2, v1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    .line 271
    const-string v5, "com.nxp.smart_mx.ID"

    aput-object v5, v4, v1

    .line 269
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 272
    :cond_0
    aget v5, v2, v1

    const/4 v6, 0x2

    if-ne v5, v6, :cond_1

    .line 273
    const-string v5, "com.nxp.uicc.ID"

    aput-object v5, v4, v1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 282
    .end local v1           #i:I
    .end local v3           #listSize:I
    .end local v4           #listStrArray:[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 283
    .local v0, e:Landroid/os/RemoteException;
    const-string v5, "NfcSecureElementControl"

    const-string v6, "deselectSecureElement failed"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 284
    new-instance v5, Ljava/io/IOException;

    const-string v6, "deselectSecureElement failed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 274
    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v1       #i:I
    .restart local v3       #listSize:I
    .restart local v4       #listStrArray:[Ljava/lang/String;
    :cond_1
    :try_start_1
    aget v5, v2, v1

    const/4 v6, 0x3

    if-ne v5, v6, :cond_2

    .line 275
    const-string v5, "com.nxp.all_se.ID"

    aput-object v5, v4, v1

    goto :goto_1

    .line 277
    :cond_2
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Get Secure Element failed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 281
    :cond_3
    return-object v4
.end method

.method public getDefaultSelectedSecureElement(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "pkg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 176
    const/4 v1, 0x0

    .line 180
    .local v1, seID:I
    :try_start_0
    iget-object v2, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v2, p1}, Landroid/nfc/INfcSecureElementControl;->getSelectedSecureElement(Ljava/lang/String;)I

    move-result v1

    .line 181
    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 182
    const-string v2, "com.nxp.uicc.ID"

    .line 188
    :goto_0
    return-object v2

    .line 183
    :cond_0
    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 184
    const-string v2, "com.nxp.smart_mx.ID"

    goto :goto_0

    .line 185
    :cond_1
    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    .line 186
    const-string v2, "com.nxp.all_se.ID"

    goto :goto_0

    .line 188
    :cond_2
    const-string v2, "com.nxp.none_se.ID"
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 190
    :catch_0
    move-exception v0

    .line 191
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "NfcSecureElementControl"

    const-string v3, "getSelectedSecureElement failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 192
    new-instance v2, Ljava/io/IOException;

    const-string v3, "getSelectedSecureElement failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public selectDefaultSecureElement(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "pkg"
    .parameter "seId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    const/4 v2, 0x0

    .line 78
    .local v2, seID:I
    const/4 v4, 0x0

    .line 80
    .local v4, seSelected:Z
    const-string v5, "com.nxp.uicc.ID"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 81
    const/4 v2, 0x2

    .line 94
    :goto_0
    :try_start_0
    iget-object v5, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v5, p1}, Landroid/nfc/INfcSecureElementControl;->getSelectedSecureElement(Ljava/lang/String;)I

    move-result v5

    if-eq v5, v2, :cond_0

    .line 95
    iget-object v5, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v5, p1}, Landroid/nfc/INfcSecureElementControl;->deselectSecureElement(Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    :cond_0
    :try_start_1
    iget-object v5, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v5, p1}, Landroid/nfc/INfcSecureElementControl;->getSecureElementList(Ljava/lang/String;)[I

    move-result-object v3

    .line 107
    .local v3, seList:[I
    array-length v5, v3

    if-eqz v5, :cond_6

    .line 109
    const-string v5, "com.nxp.all_se.ID"

    invoke-virtual {p2, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_5

    .line 110
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v5, v3

    if-ge v1, v5, :cond_6

    .line 111
    aget v5, v3, v1

    if-ne v5, v2, :cond_1

    .line 113
    iget-object v5, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v5, p1, v2}, Landroid/nfc/INfcSecureElementControl;->selectSecureElement(Ljava/lang/String;I)I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 114
    const/4 v4, 0x1

    .line 110
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 82
    .end local v1           #i:I
    .end local v3           #seList:[I
    :cond_2
    const-string v5, "com.nxp.smart_mx.ID"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 83
    const/4 v2, 0x1

    goto :goto_0

    .line 84
    :cond_3
    const-string v5, "com.nxp.all_se.ID"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 85
    const/4 v2, 0x3

    goto :goto_0

    .line 87
    :cond_4
    const-string v5, "NfcSecureElementControl"

    const-string/jumbo v6, "selectDefaultSecureElement: wrong Secure Element ID"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    new-instance v5, Ljava/io/IOException;

    const-string/jumbo v6, "selectDefaultSecureElement failed: Wronf Secure Element ID"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, e:Landroid/os/RemoteException;
    const-string v5, "NfcSecureElementControl"

    const-string/jumbo v6, "selectDefaultSecureElement: getSelectedSecureElement failed"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Failure in deselecting the selected Secure Element"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 119
    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v3       #seList:[I
    :cond_5
    :try_start_2
    iget-object v5, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v5, p1, v2}, Landroid/nfc/INfcSecureElementControl;->selectSecureElement(Ljava/lang/String;I)I

    .line 120
    const/4 v4, 0x1

    .line 126
    :cond_6
    if-nez v4, :cond_7

    .line 127
    const-string v5, "com.nxp.uicc.ID"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 128
    iget-object v5, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v5, v2}, Landroid/nfc/INfcSecureElementControl;->storeSePreference(I)V

    .line 129
    new-instance v5, Ljava/io/IOException;

    const-string v6, "UICC not detected"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    .line 138
    .end local v3           #seList:[I
    :catch_1
    move-exception v0

    .line 139
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v5, "NfcSecureElementControl"

    const-string/jumbo v6, "selectUiccCardEmulation: getSecureElementList failed"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 141
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_7
    return-void

    .line 130
    .restart local v3       #seList:[I
    :cond_8
    :try_start_3
    const-string v5, "com.nxp.smart_mx.ID"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 131
    iget-object v5, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v5, v2}, Landroid/nfc/INfcSecureElementControl;->storeSePreference(I)V

    .line 132
    new-instance v5, Ljava/io/IOException;

    const-string v6, "SMART_MX not detected"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 133
    :cond_9
    const-string v5, "com.nxp.all_se.ID"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 134
    iget-object v5, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v5, v2}, Landroid/nfc/INfcSecureElementControl;->storeSePreference(I)V

    .line 135
    new-instance v5, Ljava/io/IOException;

    const-string v6, "ALL_SE not detected"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1
.end method

.method public setDefaultSecureElementState(Ljava/lang/String;Z)V
    .locals 4
    .parameter "pkg"
    .parameter "state"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    const/4 v1, 0x0

    .line 223
    .local v1, seID:I
    :try_start_0
    iget-object v2, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    invoke-interface {v2, p1}, Landroid/nfc/INfcSecureElementControl;->getSelectedSecureElement(Ljava/lang/String;)I

    move-result v1

    .line 226
    if-nez v1, :cond_0

    .line 227
    new-instance v2, Ljava/io/IOException;

    const-string v3, "No Secure Element selected"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 247
    :catch_0
    move-exception v0

    .line 248
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "NfcSecureElementControl"

    const-string v3, "getSelectedSecureElement failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 249
    new-instance v2, Ljava/io/IOException;

    const-string v3, "getSelectedSecureElement failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 230
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_0
    if-eqz p2, :cond_1

    .line 233
    :try_start_1
    iget-object v2, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    const/4 v3, 0x1

    invoke-interface {v2, p1, v3}, Landroid/nfc/INfcSecureElementControl;->setSecureElementState(Ljava/lang/String;Z)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 251
    :goto_0
    return-void

    .line 234
    :catch_1
    move-exception v0

    .line 235
    .restart local v0       #e:Landroid/os/RemoteException;
    :try_start_2
    const-string v2, "NfcSecureElementControl"

    const-string v3, "Enable card emulation failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 236
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Enable card emulation failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    .line 241
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_1
    :try_start_3
    iget-object v2, p0, Landroid/nfc/NfcSecureElementControl;->sService:Landroid/nfc/INfcSecureElementControl;

    const/4 v3, 0x0

    invoke-interface {v2, p1, v3}, Landroid/nfc/INfcSecureElementControl;->setSecureElementState(Ljava/lang/String;Z)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 242
    :catch_2
    move-exception v0

    .line 243
    .restart local v0       #e:Landroid/os/RemoteException;
    :try_start_4
    const-string v2, "NfcSecureElementControl"

    const-string v3, "Disable card emulation failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 244
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Disable card emulation failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_0
.end method
