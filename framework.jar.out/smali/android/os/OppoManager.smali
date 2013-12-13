.class public final Landroid/os/OppoManager;
.super Ljava/lang/Object;
.source "OppoManager.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final LOG_LOCATION:Ljava/lang/String; = "/storage/custom_log"

.field private static final MAX_LOG_SIZE:J = 0x800000L

.field public static final RAW_ID_BREAK_DOWN:I = 0x138e

.field public static final RAW_ID_MAX:I = 0x1770

.field public static final RAW_ID_MIN:I = 0x1389

.field public static final RAW_ID_SHUTDOWN:I = 0x138d

.field public static final TAG:Ljava/lang/String; = "OppoManager"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyFile(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 11
    .parameter "oldPath"
    .parameter "newPath"
    .parameter "changemode"

    .prologue
    const/4 v10, -0x1

    .line 154
    const-string v7, "OppoManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "start  copy file from"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    const/4 v2, 0x0

    .line 157
    .local v2, bytesum:I
    const/4 v1, 0x0

    .line 158
    .local v1, byteread:I
    :try_start_0
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 159
    .local v6, oldfile:Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 161
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 162
    .local v5, inStream:Ljava/io/FileInputStream;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 163
    .local v4, fs:Ljava/io/FileOutputStream;
    const/16 v7, 0x1000

    new-array v0, v7, [B

    .line 165
    .local v0, buffer:[B
    :goto_0
    invoke-virtual {v5, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v1

    if-eq v1, v10, :cond_1

    .line 167
    add-int/2addr v2, v1

    .line 168
    const/4 v7, 0x0

    invoke-virtual {v4, v0, v7, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 177
    .end local v0           #buffer:[B
    .end local v4           #fs:Ljava/io/FileOutputStream;
    .end local v5           #inStream:Ljava/io/FileInputStream;
    .end local v6           #oldfile:Ljava/io/File;
    :catch_0
    move-exception v3

    .line 179
    .local v3, e:Ljava/lang/Exception;
    const-string v7, "OppoManager"

    const-string v8, "Failed copy file"

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .end local v3           #e:Ljava/lang/Exception;
    :cond_0
    :goto_1
    return-void

    .line 170
    .restart local v0       #buffer:[B
    .restart local v4       #fs:Ljava/io/FileOutputStream;
    .restart local v5       #inStream:Ljava/io/FileInputStream;
    .restart local v6       #oldfile:Ljava/io/File;
    :cond_1
    :try_start_1
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    .line 171
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 173
    if-eqz p2, :cond_2

    .line 174
    const/16 v7, 0x1a4

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-static {p1, v7, v8, v9}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    .line 175
    :cond_2
    const-string v7, "OppoManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "end  copy file from"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public static copyFilesToSdCard(Ljava/lang/String;)V
    .locals 10
    .parameter "newPath"

    .prologue
    .line 248
    :try_start_0
    new-instance v8, Ljava/io/File;

    const-string v9, "/storage/custom_log"

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 249
    .local v1, children:[Ljava/io/File;
    if-eqz v1, :cond_0

    array-length v8, v1

    if-eqz v8, :cond_0

    .line 251
    move-object v0, v1

    .local v0, arr$:[Ljava/io/File;
    array-length v7, v0

    .local v7, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    :goto_0
    if-ge v6, v7, :cond_0

    aget-object v3, v0, v6

    .line 253
    .local v3, f:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 254
    .local v5, filepath:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    .line 255
    .local v4, filename:Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-static {v5, v8, v9}, Landroid/os/OppoManager;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 258
    .end local v0           #arr$:[Ljava/io/File;
    .end local v1           #children:[Ljava/io/File;
    .end local v3           #f:Ljava/io/File;
    .end local v4           #filename:Ljava/lang/String;
    .end local v5           #filepath:Ljava/lang/String;
    .end local v6           #i$:I
    .end local v7           #len$:I
    :catch_0
    move-exception v2

    .line 259
    .local v2, e:Ljava/lang/Exception;
    const-string v8, "OppoManager"

    const-string v9, " copyFilesToSdCard IOException"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 262
    .end local v2           #e:Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method public static dumpShutdownMsg()V
    .locals 10

    .prologue
    .line 47
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .local v4, sb:Ljava/lang/StringBuilder;
    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string/jumbo v7, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v5, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 49
    .local v5, sf:Ljava/text/SimpleDateFormat;
    const-string/jumbo v7, "ro.build.kernel.id"

    const-string v8, ""

    invoke-static {v7, v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 50
    .local v2, kid:Ljava/lang/String;
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    const-string v7, "\n"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "kernel id["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "]\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    new-instance v6, Ljava/lang/Throwable;

    invoke-direct {v6}, Ljava/lang/Throwable;-><init>()V

    .line 54
    .local v6, t:Ljava/lang/Throwable;
    invoke-virtual {v6}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .line 55
    .local v0, e:[Ljava/lang/StackTraceElement;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v7, v0

    if-ge v1, v7, :cond_0

    .line 57
    aget-object v7, v0, v1

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    aget-object v7, v0, v1

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    const-string v7, "\n"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 62
    .local v3, msg:Ljava/lang/String;
    const-string v7, "OppoManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "shutdown stack trace ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    return-void
.end method

.method public static getDirSize(Ljava/io/File;)J
    .locals 10
    .parameter "file"

    .prologue
    .line 128
    const-string v7, "OppoManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getDirSize "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 132
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    const-string v8, "lost+found"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 133
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 134
    .local v1, children:[Ljava/io/File;
    const-wide/16 v5, 0x0

    .line 135
    .local v5, size:J
    move-object v0, v1

    .local v0, arr$:[Ljava/io/File;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v2, v0, v3

    .line 137
    .local v2, f:Ljava/io/File;
    invoke-static {v2}, Landroid/os/OppoManager;->getDirSize(Ljava/io/File;)J

    move-result-wide v7

    add-long/2addr v5, v7

    .line 138
    const-string v7, "OppoManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "size += getDirSize"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 142
    .end local v0           #arr$:[Ljava/io/File;
    .end local v1           #children:[Ljava/io/File;
    .end local v2           #f:Ljava/io/File;
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v5           #size:J
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v5

    .line 143
    .restart local v5       #size:J
    const-string v7, "OppoManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "is file, file"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "; size="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    .end local v5           #size:J
    :cond_1
    :goto_1
    return-wide v5

    .line 147
    :cond_2
    const-string v7, "OppoManager"

    const-string v8, "file or dir is not exist,please check the path!"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    const-wide/16 v5, 0x0

    goto :goto_1
.end method

.method public static readCriticalData()I
    .locals 17

    .prologue
    .line 203
    const/4 v4, 0x0

    .line 204
    .local v4, fw:Ljava/io/FileWriter;
    const/4 v0, 0x0

    .line 205
    .local v0, bw:Ljava/io/BufferedWriter;
    const/4 v8, 0x0

    .line 207
    .local v8, reader:Ljava/io/BufferedReader;
    const-string v13, "OppoManager"

    const-string/jumbo v14, "read PanicTimes!"

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    const-string v10, "/storage/custom_log/panic.txt"

    .line 209
    .local v10, recordFileName:Ljava/lang/String;
    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 210
    .local v11, recordfile:Ljava/io/File;
    const/4 v7, 0x0

    .line 212
    .local v7, panictimes:I
    :try_start_0
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v13

    if-nez v13, :cond_0

    .line 214
    invoke-virtual {v11}, Ljava/io/File;->createNewFile()Z

    .line 216
    const-string v13, "OppoManager"

    const-string v14, "create new files!!"

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0x1a4

    const/4 v15, -0x1

    const/16 v16, -0x1

    invoke-static/range {v13 .. v16}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    .line 219
    new-instance v5, Ljava/io/FileWriter;

    invoke-direct {v5, v11}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    .end local v4           #fw:Ljava/io/FileWriter;
    .local v5, fw:Ljava/io/FileWriter;
    :try_start_1
    new-instance v1, Ljava/io/BufferedWriter;

    invoke-direct {v1, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 221
    .end local v0           #bw:Ljava/io/BufferedWriter;
    .local v1, bw:Ljava/io/BufferedWriter;
    :try_start_2
    const-string v13, "0"

    invoke-virtual {v1, v13}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 222
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-object v0, v1

    .end local v1           #bw:Ljava/io/BufferedWriter;
    .restart local v0       #bw:Ljava/io/BufferedWriter;
    move-object v4, v5

    .line 224
    .end local v5           #fw:Ljava/io/FileWriter;
    .restart local v4       #fw:Ljava/io/FileWriter;
    :cond_0
    :try_start_3
    new-instance v9, Ljava/io/BufferedReader;

    new-instance v13, Ljava/io/FileReader;

    invoke-direct {v13, v11}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v9, v13}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 225
    .end local v8           #reader:Ljava/io/BufferedReader;
    .local v9, reader:Ljava/io/BufferedReader;
    const/4 v12, 0x0

    .line 226
    .local v12, tempString:Ljava/lang/String;
    :try_start_4
    const-string v2, ""

    .line 227
    .local v2, contexts:Ljava/lang/String;
    const/4 v6, 0x1

    .line 229
    .local v6, line:I
    :goto_0
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_1

    .line 231
    const-string v13, "OppoManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "line "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ": "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 233
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 235
    :cond_1
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V

    .line 236
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v13

    if-eqz v13, :cond_2

    .line 237
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    move-result v7

    :cond_2
    move-object v8, v9

    .line 242
    .end local v2           #contexts:Ljava/lang/String;
    .end local v6           #line:I
    .end local v9           #reader:Ljava/io/BufferedReader;
    .end local v12           #tempString:Ljava/lang/String;
    .restart local v8       #reader:Ljava/io/BufferedReader;
    :goto_1
    const-string v13, "OppoManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "panictimes =  "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    return v7

    .line 238
    :catch_0
    move-exception v3

    .line 239
    .local v3, e:Ljava/io/IOException;
    :goto_2
    const-string v13, "OppoManager"

    const-string v14, " read Panic Times IOException"

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 238
    .end local v3           #e:Ljava/io/IOException;
    .end local v4           #fw:Ljava/io/FileWriter;
    .restart local v5       #fw:Ljava/io/FileWriter;
    :catch_1
    move-exception v3

    move-object v4, v5

    .end local v5           #fw:Ljava/io/FileWriter;
    .restart local v4       #fw:Ljava/io/FileWriter;
    goto :goto_2

    .end local v0           #bw:Ljava/io/BufferedWriter;
    .end local v4           #fw:Ljava/io/FileWriter;
    .restart local v1       #bw:Ljava/io/BufferedWriter;
    .restart local v5       #fw:Ljava/io/FileWriter;
    :catch_2
    move-exception v3

    move-object v0, v1

    .end local v1           #bw:Ljava/io/BufferedWriter;
    .restart local v0       #bw:Ljava/io/BufferedWriter;
    move-object v4, v5

    .end local v5           #fw:Ljava/io/FileWriter;
    .restart local v4       #fw:Ljava/io/FileWriter;
    goto :goto_2

    .end local v8           #reader:Ljava/io/BufferedReader;
    .restart local v9       #reader:Ljava/io/BufferedReader;
    .restart local v12       #tempString:Ljava/lang/String;
    :catch_3
    move-exception v3

    move-object v8, v9

    .end local v9           #reader:Ljava/io/BufferedReader;
    .restart local v8       #reader:Ljava/io/BufferedReader;
    goto :goto_2
.end method

.method public static readRawPartition(II)Ljava/lang/String;
    .locals 1
    .parameter "id"
    .parameter "size"

    .prologue
    .line 68
    const/4 v0, 0x0

    .line 69
    .local v0, res:Ljava/lang/String;
    return-object v0
.end method

.method private static recordPanicTimes(Ljava/lang/String;)I
    .locals 10
    .parameter "bootreason"

    .prologue
    .line 185
    const/4 v3, 0x0

    .line 186
    .local v3, fw:Ljava/io/FileWriter;
    const/4 v0, 0x0

    .line 187
    .local v0, bw:Ljava/io/BufferedWriter;
    invoke-static {}, Landroid/os/OppoManager;->readCriticalData()I

    move-result v8

    add-int/lit8 v5, v8, 0x1

    .line 188
    .local v5, panictimes:I
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    .line 189
    .local v7, temp:Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    const-string v8, "/storage/custom_log/panic.txt"

    invoke-direct {v6, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 191
    .local v6, recordfile:Ljava/io/File;
    :try_start_0
    new-instance v4, Ljava/io/FileWriter;

    invoke-direct {v4, v6}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    .end local v3           #fw:Ljava/io/FileWriter;
    .local v4, fw:Ljava/io/FileWriter;
    :try_start_1
    new-instance v1, Ljava/io/BufferedWriter;

    invoke-direct {v1, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 193
    .end local v0           #bw:Ljava/io/BufferedWriter;
    .local v1, bw:Ljava/io/BufferedWriter;
    :try_start_2
    invoke-virtual {v1, v7}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 194
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-object v0, v1

    .end local v1           #bw:Ljava/io/BufferedWriter;
    .restart local v0       #bw:Ljava/io/BufferedWriter;
    move-object v3, v4

    .line 199
    .end local v4           #fw:Ljava/io/FileWriter;
    .restart local v3       #fw:Ljava/io/FileWriter;
    :goto_0
    return v5

    .line 195
    :catch_0
    move-exception v2

    .line 196
    .local v2, e:Ljava/io/IOException;
    :goto_1
    const-string v8, "OppoManager"

    const-string v9, " recordPanicTimes IOException"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 195
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #fw:Ljava/io/FileWriter;
    .restart local v4       #fw:Ljava/io/FileWriter;
    :catch_1
    move-exception v2

    move-object v3, v4

    .end local v4           #fw:Ljava/io/FileWriter;
    .restart local v3       #fw:Ljava/io/FileWriter;
    goto :goto_1

    .end local v0           #bw:Ljava/io/BufferedWriter;
    .end local v3           #fw:Ljava/io/FileWriter;
    .restart local v1       #bw:Ljava/io/BufferedWriter;
    .restart local v4       #fw:Ljava/io/FileWriter;
    :catch_2
    move-exception v2

    move-object v0, v1

    .end local v1           #bw:Ljava/io/BufferedWriter;
    .restart local v0       #bw:Ljava/io/BufferedWriter;
    move-object v3, v4

    .end local v4           #fw:Ljava/io/FileWriter;
    .restart local v3       #fw:Ljava/io/FileWriter;
    goto :goto_1
.end method

.method public static writeRawPartition(ILjava/lang/String;)I
    .locals 1
    .parameter "id"
    .parameter "content"

    .prologue
    .line 73
    const/4 v0, -0x1

    .line 74
    .local v0, res:I
    return v0
.end method

.method public static writetoPartition(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 31
    .parameter
    .parameter "bootreason"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, files:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v27, "OppoManager"

    const-string/jumbo v28, "start writetoPartition"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    invoke-static/range {p1 .. p1}, Landroid/os/OppoManager;->recordPanicTimes(Ljava/lang/String;)I

    move-result v26

    .line 84
    .local v26, times:I
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_3

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 86
    .local v11, file_temp:Ljava/lang/String;
    const-string v27, "/"

    move-object/from16 v0, v27

    invoke-virtual {v11, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v19

    .line 87
    .local v19, lastbackslash:I
    move/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    .line 88
    .local v13, filename:Ljava/lang/String;
    const-string v27, "OppoManager"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "file_temp  = "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "; filename = "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "/storage/custom_log"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "_"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 90
    .local v24, newPath:Ljava/lang/String;
    const-string v27, "OppoManager"

    const-string v28, "before copy file"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 93
    .local v10, file:Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v27

    if-eqz v27, :cond_2

    .line 95
    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v22

    .line 96
    .local v22, length:J
    new-instance v27, Ljava/io/File;

    const-string v28, "/storage/custom_log"

    invoke-direct/range {v27 .. v28}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static/range {v27 .. v27}, Landroid/os/OppoManager;->getDirSize(Ljava/io/File;)J

    move-result-wide v3

    .line 97
    .local v3, backupPositionSize:J
    const/16 v8, 0x14

    .line 98
    .local v8, deletepercentage:I
    add-long v27, v22, v3

    const-wide/32 v29, 0x800000

    cmp-long v27, v27, v29

    if-lez v27, :cond_2

    .line 100
    const-string v27, "OppoManager"

    const-string v28, "log is full, we need delete some old logs"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    add-long v27, v22, v3

    const-wide/32 v29, 0x800000

    sub-long v6, v27, v29

    .line 102
    .local v6, deleteSpace:J
    const/4 v15, 0x0

    .line 103
    .local v15, hasdeleted:I
    :goto_1
    int-to-long v0, v15

    move-wide/from16 v27, v0

    cmp-long v27, v27, v6

    if-gez v27, :cond_2

    const/16 v27, 0x64

    move/from16 v0, v27

    if-ge v8, v0, :cond_2

    .line 105
    mul-int v27, v26, v8

    div-int/lit8 v25, v27, 0x64

    .line 106
    .local v25, oldfiles:I
    new-instance v27, Ljava/io/File;

    const-string v28, "/storage/custom_log"

    invoke-direct/range {v27 .. v28}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v27 .. v27}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    .line 107
    .local v5, children:[Ljava/io/File;
    move-object v2, v5

    .local v2, arr$:[Ljava/io/File;
    array-length v0, v2

    move/from16 v21, v0

    .local v21, len$:I
    const/16 v17, 0x0

    .local v17, i$:I
    :goto_2
    move/from16 v0, v17

    move/from16 v1, v21

    if-ge v0, v1, :cond_1

    aget-object v9, v2, v17

    .line 109
    .local v9, f:Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    .line 110
    .local v14, filepath:Ljava/lang/String;
    const-string v27, "_"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v20

    .line 111
    .local v20, lastunderscode:I
    move/from16 v0, v20

    invoke-virtual {v14, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    .line 112
    .local v12, filelistnumber:Ljava/lang/String;
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Integer;->intValue()I

    move-result v18

    .line 113
    .local v18, ifilelistnumber:I
    move/from16 v0, v18

    move/from16 v1, v25

    if-ge v0, v1, :cond_0

    .line 115
    int-to-long v0, v15

    move-wide/from16 v27, v0

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v29

    add-long v27, v27, v29

    move-wide/from16 v0, v27

    long-to-int v15, v0

    .line 116
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 107
    :cond_0
    add-int/lit8 v17, v17, 0x1

    goto :goto_2

    .line 119
    .end local v9           #f:Ljava/io/File;
    .end local v12           #filelistnumber:Ljava/lang/String;
    .end local v14           #filepath:Ljava/lang/String;
    .end local v18           #ifilelistnumber:I
    .end local v20           #lastunderscode:I
    :cond_1
    add-int/lit8 v8, v8, 0x14

    .line 120
    goto :goto_1

    .line 123
    .end local v2           #arr$:[Ljava/io/File;
    .end local v3           #backupPositionSize:J
    .end local v5           #children:[Ljava/io/File;
    .end local v6           #deleteSpace:J
    .end local v8           #deletepercentage:I
    .end local v15           #hasdeleted:I
    .end local v17           #i$:I
    .end local v21           #len$:I
    .end local v22           #length:J
    .end local v25           #oldfiles:I
    :cond_2
    const/16 v27, 0x1

    move-object/from16 v0, v24

    move/from16 v1, v27

    invoke-static {v11, v0, v1}, Landroid/os/OppoManager;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 125
    .end local v10           #file:Ljava/io/File;
    .end local v11           #file_temp:Ljava/lang/String;
    .end local v13           #filename:Ljava/lang/String;
    .end local v19           #lastbackslash:I
    .end local v24           #newPath:Ljava/lang/String;
    :cond_3
    return-void
.end method
