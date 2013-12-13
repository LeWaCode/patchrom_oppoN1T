.class public Lcom/android/internal/telephony/OppoGsmAlphabet;
.super Ljava/lang/Object;
.source "OppoGsmAlphabet.java"


# annotations
.annotation build Landroid/annotation/OppoHook;
    level = .enum Landroid/annotation/OppoHook$OppoHookType;->NEW_CLASS:Landroid/annotation/OppoHook$OppoHookType;
    note = "constant define from QCOM"
    property = .enum Landroid/annotation/OppoHook$OppoRomType;->ROM:Landroid/annotation/OppoHook$OppoRomType;
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GSM"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static containChinese(Ljava/lang/String;)Z
    .locals 6
    .parameter "strName"

    .prologue
    const/4 v4, 0x0

    .line 127
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 141
    :cond_0
    :goto_0
    return v4

    .line 131
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 132
    .local v1, ch:[C
    array-length v3, v1

    .line 134
    .local v3, length:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-ge v2, v3, :cond_0

    .line 135
    aget-char v0, v1, v2

    .line 136
    .local v0, c:C
    invoke-static {v0}, Lcom/android/internal/telephony/OppoGsmAlphabet;->isChinese(C)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 137
    const/4 v4, 0x1

    goto :goto_0

    .line 134
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static countGsmSeptets(Ljava/lang/CharSequence;ZI)I
    .locals 4
    .parameter "s"
    .parameter "throwsException"
    .parameter "rfu"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/EncodeException;
        }
    .end annotation

    .prologue
    .line 96
    const/4 v0, 0x0

    .line 97
    .local v0, charIndex:I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 98
    .local v2, sz:I
    const/4 v1, 0x0

    .line 100
    .local v1, count:I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 102
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3, p1}, Lcom/android/internal/telephony/GsmAlphabet;->countGsmSeptets(CZ)I

    move-result v3

    add-int/2addr v1, v3

    .line 103
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 106
    :cond_0
    return v1
.end method

.method public static enableEncodeTo0x81(Ljava/lang/String;)Z
    .locals 2
    .parameter "s"

    .prologue
    .line 205
    const/4 v0, 0x0

    .line 207
    .local v0, ret:Z
    invoke-static {p0}, Lcom/android/internal/telephony/OppoGsmAlphabet;->containChinese(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 208
    const/4 v0, 0x0

    .line 215
    :cond_0
    :goto_0
    return v0

    .line 209
    :cond_1
    invoke-static {p0}, Lcom/android/internal/telephony/OppoGsmAlphabet;->isThai(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 210
    const/4 v0, 0x1

    goto :goto_0

    .line 211
    :cond_2
    invoke-static {p0}, Lcom/android/internal/telephony/OppoGsmAlphabet;->isRussian(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 212
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static encodeTo0x81(Ljava/lang/String;)[B
    .locals 12
    .parameter "src"

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 219
    const/4 v0, 0x0

    .line 220
    .local v0, b0x81:[B
    const/4 v2, 0x0

    .line 221
    .local v2, bytes:[B
    const/4 v1, 0x0

    .line 222
    .local v1, base:B
    const/4 v3, 0x0

    .line 223
    .local v3, data:B
    const/4 v6, 0x0

    .line 224
    .local v6, len:I
    const/4 v7, 0x0

    .line 226
    .local v7, offset:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 227
    add-int/lit8 v9, v6, 0x3

    new-array v0, v9, [B

    .line 230
    const/16 v9, -0x7f

    aput-byte v9, v0, v11

    .line 233
    int-to-byte v9, v6

    aput-byte v9, v0, v10

    .line 235
    const/4 v7, 0x3

    .line 236
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    if-ge v5, v6, :cond_2

    .line 238
    add-int/lit8 v9, v5, 0x1

    invoke-virtual {p0, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 241
    .local v8, temp:Ljava/lang/String;
    :try_start_0
    const-string/jumbo v9, "utf-16be"

    invoke-virtual {v8, v9}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 248
    invoke-static {v8}, Lcom/android/internal/telephony/OppoGsmAlphabet;->isEnglish(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 253
    if-nez v1, :cond_0

    .line 254
    aget-byte v9, v2, v11

    shl-int/lit8 v9, v9, 0x1

    int-to-byte v1, v9

    .line 255
    const/4 v9, 0x2

    aput-byte v1, v0, v9

    .line 259
    :cond_0
    aget-byte v3, v2, v10

    .line 260
    and-int/lit16 v9, v3, 0x80

    if-nez v9, :cond_1

    .line 261
    or-int/lit16 v9, v3, 0x80

    int-to-byte v3, v9

    .line 269
    :cond_1
    :goto_1
    add-int v9, v7, v5

    aput-byte v3, v0, v9

    .line 236
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 243
    :catch_0
    move-exception v4

    .line 244
    .local v4, e:Ljava/io/UnsupportedEncodingException;
    const-string v9, "GSM"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "encodeTo0x81() : unsurport encoding of "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 245
    const/4 v0, 0x0

    .line 272
    .end local v0           #b0x81:[B
    .end local v4           #e:Ljava/io/UnsupportedEncodingException;
    .end local v8           #temp:Ljava/lang/String;
    :cond_2
    return-object v0

    .line 266
    .restart local v0       #b0x81:[B
    .restart local v8       #temp:Ljava/lang/String;
    :cond_3
    aget-byte v3, v2, v10

    goto :goto_1
.end method

.method public static isChinese(C)Z
    .locals 3
    .parameter "c"

    .prologue
    .line 110
    const/4 v0, 0x0

    .line 112
    .local v0, ret:Z
    invoke-static {p0}, Ljava/lang/Character$UnicodeBlock;->of(C)Ljava/lang/Character$UnicodeBlock;

    move-result-object v1

    .line 113
    .local v1, ub:Ljava/lang/Character$UnicodeBlock;
    sget-object v2, Ljava/lang/Character$UnicodeBlock;->CJK_UNIFIED_IDEOGRAPHS:Ljava/lang/Character$UnicodeBlock;

    if-eq v1, v2, :cond_0

    sget-object v2, Ljava/lang/Character$UnicodeBlock;->CJK_COMPATIBILITY_IDEOGRAPHS:Ljava/lang/Character$UnicodeBlock;

    if-eq v1, v2, :cond_0

    sget-object v2, Ljava/lang/Character$UnicodeBlock;->CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A:Ljava/lang/Character$UnicodeBlock;

    if-eq v1, v2, :cond_0

    sget-object v2, Ljava/lang/Character$UnicodeBlock;->GENERAL_PUNCTUATION:Ljava/lang/Character$UnicodeBlock;

    if-eq v1, v2, :cond_0

    sget-object v2, Ljava/lang/Character$UnicodeBlock;->CJK_SYMBOLS_AND_PUNCTUATION:Ljava/lang/Character$UnicodeBlock;

    if-eq v1, v2, :cond_0

    sget-object v2, Ljava/lang/Character$UnicodeBlock;->HALFWIDTH_AND_FULLWIDTH_FORMS:Ljava/lang/Character$UnicodeBlock;

    if-ne v1, v2, :cond_1

    .line 119
    :cond_0
    const/4 v0, 0x1

    .line 122
    :cond_1
    return v0
.end method

.method public static isEnglish(Ljava/lang/String;)Z
    .locals 5
    .parameter "s"

    .prologue
    .line 145
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 147
    .local v3, sz:I
    const/4 v2, 0x1

    .line 148
    .local v2, ret:Z
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v3, :cond_1

    .line 150
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 151
    .local v0, c:C
    const/16 v4, 0x21

    if-lt v0, v4, :cond_0

    const/16 v4, 0x7e

    if-gt v0, v4, :cond_0

    .line 148
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 154
    :cond_0
    const/4 v2, 0x0

    .line 159
    .end local v0           #c:C
    :cond_1
    return v2
.end method

.method public static isRussian(Ljava/lang/String;)Z
    .locals 6
    .parameter "s"

    .prologue
    .line 184
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 186
    .local v4, sz:I
    const/4 v3, 0x1

    .line 187
    .local v3, ret:Z
    const/4 v1, 0x0

    .line 188
    .local v1, hasRussian:Z
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v4, :cond_2

    .line 190
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 191
    .local v0, c:C
    const/16 v5, 0x21

    if-lt v0, v5, :cond_0

    const/16 v5, 0x7e

    if-gt v0, v5, :cond_0

    .line 188
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 193
    :cond_0
    const/16 v5, 0x400

    if-lt v0, v5, :cond_1

    const/16 v5, 0x4ff

    if-gt v0, v5, :cond_1

    .line 194
    const/4 v1, 0x1

    goto :goto_1

    .line 196
    :cond_1
    const/4 v3, 0x0

    .line 201
    .end local v0           #c:C
    :cond_2
    if-eqz v3, :cond_3

    if-eqz v1, :cond_3

    const/4 v5, 0x1

    :goto_2
    return v5

    :cond_3
    const/4 v5, 0x0

    goto :goto_2
.end method

.method public static isThai(Ljava/lang/String;)Z
    .locals 6
    .parameter "s"

    .prologue
    .line 163
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 165
    .local v4, sz:I
    const/4 v3, 0x1

    .line 166
    .local v3, ret:Z
    const/4 v1, 0x0

    .line 167
    .local v1, hasThai:Z
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v4, :cond_2

    .line 169
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 170
    .local v0, c:C
    const/16 v5, 0x21

    if-lt v0, v5, :cond_0

    const/16 v5, 0x7e

    if-gt v0, v5, :cond_0

    .line 167
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 172
    :cond_0
    const/16 v5, 0xe01

    if-lt v0, v5, :cond_1

    const/16 v5, 0xe59

    if-gt v0, v5, :cond_1

    .line 173
    const/4 v1, 0x1

    goto :goto_1

    .line 175
    :cond_1
    const/4 v3, 0x0

    .line 180
    .end local v0           #c:C
    :cond_2
    if-eqz v3, :cond_3

    if-eqz v1, :cond_3

    const/4 v5, 0x1

    :goto_2
    return v5

    :cond_3
    const/4 v5, 0x0

    goto :goto_2
.end method

.method public static stringToGsm8BitOrUCSPackedForADN(Ljava/lang/String;)[B
    .locals 9
    .parameter "s"

    .prologue
    const/4 v5, 0x0

    .line 47
    if-nez p0, :cond_0

    move-object v2, v5

    .line 84
    :goto_0
    return-object v2

    .line 54
    :cond_0
    const/4 v6, 0x1

    const/4 v7, 0x1

    :try_start_0
    invoke-static {p0, v6, v7}, Lcom/android/internal/telephony/OppoGsmAlphabet;->countGsmSeptets(Ljava/lang/CharSequence;ZI)I

    move-result v3

    .line 56
    .local v3, septets:I
    new-array v2, v3, [B

    .line 58
    .local v2, ret:[B
    const/4 v6, 0x0

    array-length v7, v2

    invoke-static {p0, v2, v6, v7}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm8BitUnpackedField(Ljava/lang/String;[BII)V
    :try_end_0
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 61
    .end local v2           #ret:[B
    .end local v3           #septets:I
    :catch_0
    move-exception v0

    .line 65
    .local v0, e:Lcom/android/internal/telephony/EncodeException;
    :try_start_1
    invoke-static {p0}, Lcom/android/internal/telephony/OppoGsmAlphabet;->enableEncodeTo0x81(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 66
    invoke-static {p0}, Lcom/android/internal/telephony/OppoGsmAlphabet;->encodeTo0x81(Ljava/lang/String;)[B

    move-result-object v2

    .restart local v2       #ret:[B
    goto :goto_0

    .line 68
    .end local v2           #ret:[B
    :cond_1
    const-string/jumbo v6, "utf-16be"

    invoke-virtual {p0, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 70
    .local v4, temp:[B
    array-length v6, v4

    add-int/lit8 v6, v6, 0x1

    new-array v2, v6, [B

    .line 72
    .restart local v2       #ret:[B
    const/4 v6, 0x0

    const/16 v7, -0x80

    aput-byte v7, v2, v6

    .line 74
    const/4 v6, 0x0

    const/4 v7, 0x1

    array-length v8, v4

    invoke-static {v4, v6, v2, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 78
    .end local v2           #ret:[B
    .end local v4           #temp:[B
    :catch_1
    move-exception v1

    .line 80
    .local v1, ex:Ljava/io/UnsupportedEncodingException;
    const-string v6, "GSM"

    const-string/jumbo v7, "unsurport encoding."

    invoke-static {v6, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v2, v5

    .line 81
    goto :goto_0
.end method
