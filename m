Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41954 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751385AbcEaK5Z (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:25 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 03/31] staging: ks7010: remove custom firmware loader
Date: Tue, 31 May 2016 12:56:15 +0200
Message-Id: <1464692203-4180-4-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

FW_LOADER works fine, no need for a open coded fallback.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/Kconfig         |  1 +
 drivers/staging/ks7010/ks7010_config.c | 62 ----------------------------------
 drivers/staging/ks7010/ks7010_sdio.c   | 56 ------------------------------
 drivers/staging/ks7010/ks7010_sdio.h   |  5 ---
 4 files changed, 1 insertion(+), 123 deletions(-)

diff --git a/drivers/staging/ks7010/Kconfig b/drivers/staging/ks7010/Kconfig
index dfd4eed539bebc..0b9217674d5b54 100644
--- a/drivers/staging/ks7010/Kconfig
+++ b/drivers/staging/ks7010/Kconfig
@@ -3,6 +3,7 @@ config KS7010
 	depends on MMC && WIRELESS
 	select WIRELESS_EXT
 	select WEXT_PRIV
+	select FW_LOADER
 	help
 	  This is a driver for KeyStream KS7010 based SDIO WIFI cards. It is
 	  found on at least later Spectec SDW-821 (FCC-ID "S2Y-WLAN-11G-K" only,
diff --git a/drivers/staging/ks7010/ks7010_config.c b/drivers/staging/ks7010/ks7010_config.c
index e8a42077a4b381..7d33070b3428e7 100644
--- a/drivers/staging/ks7010/ks7010_config.c
+++ b/drivers/staging/ks7010/ks7010_config.c
@@ -169,11 +169,7 @@ int rate_set_configuration(ks_wlan_private *priv, char *value)
 	return rc;
 }
 
-#ifndef NO_FIRMWARE_CLASS
 #include <linux/firmware.h>
-#else
-#define MAX_CONFIG_FILE_SIZE (1024*10)
-#endif
 int ks_wlan_read_config_file(ks_wlan_private *priv)
 {
 	struct {
@@ -206,18 +202,9 @@ int ks_wlan_read_config_file(ks_wlan_private *priv)
 		{0,"",""},
 	};
 
-#ifndef NO_FIRMWARE_CLASS
 	const struct firmware *fw_entry;
 	struct device *dev = NULL;
 	int retval;
-#else
-	struct file     *srcf;
-	int nr_read ;
-	int retval;
-	char *cfg_buf=NULL;
-	int orgfsuid, orgfsgid;
-	mm_segment_t orgfs;
-#endif
 	char cfg_file[]=CFG_FILE;
 	char *cur_p, *end_p;
 	char wk_buff[256], *wk_p;
@@ -267,7 +254,6 @@ int ks_wlan_read_config_file(ks_wlan_private *priv)
 	priv->reg.tx_rate = TX_RATE_FULL_AUTO;
 	priv->reg.rate_set.size = 12;
 
-#ifndef NO_FIRMWARE_CLASS
 	dev = &priv->ks_wlan_hw.sdio_card->func->dev;
 	if((retval = request_firmware(&fw_entry, cfg_file, dev)) !=0 ){
 		DPRINTK(1, "error request_firmware() file=%s ret=%d\n", cfg_file, retval);
@@ -277,46 +263,6 @@ int ks_wlan_read_config_file(ks_wlan_private *priv)
 	DPRINTK(4, "success request_firmware() file=%s size=%d\n", cfg_file, fw_entry->size);
 	cur_p = fw_entry->data;
 	end_p = cur_p + fw_entry->size;
-#else
-	orgfsuid=current->fsuid;
-	orgfsgid=current->fsgid;
-	orgfs=get_fs();
-	set_fs(KERNEL_DS);
-
-	srcf = filp_open(cfg_file, O_RDONLY, 0);
-	if (IS_ERR(srcf)) {
-		printk(KERN_ERR "error %ld opening %s\n", -PTR_ERR(srcf),cfg_file);
-		goto no_config_file;
-	}
-
-		if (!(srcf->f_op && srcf->f_op->read)) {
-				printk(KERN_ERR "%s does not have a read method\n", cfg_file);
-		goto no_config_file;
-		}
-
-	cfg_buf = (char *)kzalloc(MAX_CONFIG_FILE_SIZE, GFP_ATOMIC);
-		if (!cfg_buf) {
-				printk(KERN_ERR "%s does not read : out of memory \n", cfg_file);
-		goto no_config_file;
-		}
-
-		nr_read = srcf->f_op->read(srcf, (unsigned char *)cfg_buf, MAX_CONFIG_FILE_SIZE, &srcf->f_pos);
-
-	DPRINTK(1, "read retval=%d  file=%s\n", nr_read, priv->reg.cfg_file);
-	retval=filp_close(srcf ,NULL);
-	if (retval)
-		DPRINTK(1, "error %d closing %s\n", -retval,priv->reg.cfg_file);
-
-		if (nr_read < 1) {
-				printk(KERN_ERR "%s does not read : file is empty  num=%d\n", cfg_file, nr_read);
-		goto no_config_file;
-		}else if(nr_read > MAX_CONFIG_FILE_SIZE){
-				printk(KERN_ERR "%s does not read : file is too big \n", cfg_file);
-		goto no_config_file;
-	}
-	cur_p = cfg_buf;
-	end_p = cur_p + nr_read;
-#endif
 	*end_p = '\0';
 
 	while (cur_p < end_p) {
@@ -524,15 +470,7 @@ int ks_wlan_read_config_file(ks_wlan_private *priv)
 		}
 
 	}
-#ifndef NO_FIRMWARE_CLASS
 	release_firmware(fw_entry);
-#else
-no_config_file:
-	kfree(cfg_buf);
-	set_fs(orgfs);
-	current->fsuid=orgfsuid;
-	current->fsgid=orgfsgid;
-#endif
 
 	DPRINTK(3,"\n    operation_mode = %d\n    channel = %d\n    ssid = %s\n    tx_rate = %d\n \
    preamble = %d\n    powermgt = %d\n    scan_type = %d\n    beacon_lost_count = %d\n    rts = %d\n \
diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 7cc49a4ccac549..9300658c4aed8d 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -56,10 +56,6 @@ static int ks7010_sdio_read( ks_wlan_private *priv, unsigned int address,
 			     unsigned char *buffer, int length );
 static int ks7010_sdio_write( ks_wlan_private *priv, unsigned int address,
 			      unsigned char *buffer, int length );
-#ifdef NO_FIRMWARE_CLASS
-static char *romfile = ROM_FILE;
-module_param(romfile, charp, S_IRUGO);
-#endif
 /* macro */
 
 #define inc_txqhead(priv) \
@@ -723,23 +719,15 @@ error_out:
 	if(read_buf) kfree(read_buf);
 	return rc;
 }
-#ifndef NO_FIRMWARE_CLASS
 #include <linux/firmware.h>
-#endif
 static int ks79xx_upload_firmware(ks_wlan_private *priv, struct ks_sdio_card *card)
 {
 	unsigned int	size, offset,  n = 0;
 	unsigned char	*rom_buf;
 	unsigned char rw_data =0;
 	int retval, rc=0;
-#ifndef NO_FIRMWARE_CLASS
 	int length;
 	const struct firmware *fw_entry = NULL;
-#else
-	int orgfsuid, orgfsgid;
-	struct file     *srcf;
-	mm_segment_t orgfs;
-#endif
 
 	rom_buf = NULL;
 
@@ -758,38 +746,16 @@ static int ks79xx_upload_firmware(ks_wlan_private *priv, struct ks_sdio_card *ca
 		goto error_out0;
 	}
 
-#ifndef NO_FIRMWARE_CLASS
 	if(request_firmware(&fw_entry, priv->reg.rom_file, &priv->ks_wlan_hw.sdio_card->func->dev)!=0){
 		DPRINTK(1,"error request_firmware() file=%s\n", priv->reg.rom_file);
 		return 1;
 	}
 	DPRINTK(4,"success request_firmware() file=%s size=%d\n", priv->reg.rom_file, fw_entry->size);
 	length = fw_entry->size;
-#else
-	orgfsuid=current->fsuid;
-	orgfsgid=current->fsgid;
-	current->fsuid=current->fsgid=0;
-	orgfs=get_fs();
-	set_fs(KERNEL_DS);
-
-	srcf = filp_open(romfile, O_RDONLY, 0);
-	if (IS_ERR(srcf)) {
-		DPRINTK(1, "error %ld opening %s\n", -PTR_ERR(srcf),romfile);
-		rc = 1;
-		goto error_out1;
-	}
-
-        if (!(srcf->f_op && srcf->f_op->read)) {
-                DPRINTK(1, "%s does not have a read method\n", romfile);
-                rc = 2;
-                goto error_out2;
-        }
-#endif
 
 	/* Load Program */
 	n = 0;
         do {
-#ifndef NO_FIRMWARE_CLASS
 		if(length >= ROM_BUFF_SIZE){
 			size = ROM_BUFF_SIZE;
 			length = length - ROM_BUFF_SIZE;
@@ -801,16 +767,6 @@ static int ks79xx_upload_firmware(ks_wlan_private *priv, struct ks_sdio_card *ca
 		DPRINTK(4, "size = %d\n",size);
 		if(size == 0) break;
 		memcpy(rom_buf,fw_entry->data+n,size);
-#else
-		/* The object must have a read method */
-		size = srcf->f_op->read(srcf, rom_buf, ROM_BUFF_SIZE, &srcf->f_pos);
-		if (size < 0) {
-			DPRINTK(1, "Read %s error %d\n", priv->reg.rom_file, -retval);
-			rc = 5;
-			goto error_out2;
-		}
-		else if (size == 0) break;
-#endif
 		/* Update write index */
 		offset = n;
 		retval = ks7010_sdio_update_index(priv, KS7010_IRAM_ADDRESS+offset);
@@ -852,20 +808,8 @@ static int ks79xx_upload_firmware(ks_wlan_private *priv, struct ks_sdio_card *ca
 
 	rc = 0;
 
-#ifdef NO_FIRMWARE_CLASS
- error_out2:
-	retval=filp_close(srcf ,NULL);
-	if (retval)
-		DPRINTK(1, "error %d closing %s\n", -retval,priv->reg.rom_file);
-
- error_out1:
-	set_fs(orgfs);
-	current->fsuid=orgfsuid;
-	current->fsgid=orgfsgid;
-#else
  error_out1:
 	release_firmware(fw_entry);
-#endif
  error_out0:
 	sdio_release_host(card->func);
 	if(rom_buf)
diff --git a/drivers/staging/ks7010/ks7010_sdio.h b/drivers/staging/ks7010/ks7010_sdio.h
index 3af742f1b79f93..5bf01abbf2ab6c 100644
--- a/drivers/staging/ks7010/ks7010_sdio.h
+++ b/drivers/staging/ks7010/ks7010_sdio.h
@@ -153,13 +153,8 @@ struct rx_device{
 	unsigned int	qtail; /* rx buffer queue last pointer */
 	spinlock_t  rx_dev_lock;
 };
-#ifndef NO_FIRMWARE_CLASS
 #define	ROM_FILE "ks7010sd.rom"
 #define	CFG_FILE "ks79xx.cfg"
-#else
-#define	ROM_FILE "/lib/firmware/ks7010sd.rom"
-#define	CFG_FILE "/lib/firmware/ks79xx.cfg"
-#endif
 #define	KS_WLAN_DRIVER_VERSION_INFO  "ks7010 sdio linux 007"
 
 #endif /* _KS7010_SDIO_H */
-- 
2.8.1
