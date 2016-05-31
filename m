Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41981 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752243AbcEaK5k (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:40 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 17/31] staging: ks7010: indent ks7010_sdio.h
Date: Tue, 31 May 2016 12:56:29 +0200
Message-Id: <1464692203-4180-18-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_sdio.h | 64 +++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.h b/drivers/staging/ks7010/ks7010_sdio.h
index 1d16673e5dae02..aea3727caf483b 100644
--- a/drivers/staging/ks7010/ks7010_sdio.h
+++ b/drivers/staging/ks7010/ks7010_sdio.h
@@ -21,7 +21,7 @@
 #define DEVICE_ALIGNMENT 32
 
 /*  SDIO KeyStream vendor and device */
-#define SDIO_VENDOR_ID_KS_CODE_A	0x005b 
+#define SDIO_VENDOR_ID_KS_CODE_A	0x005b
 #define SDIO_VENDOR_ID_KS_CODE_B	0x0023
 #define SDIO_DEVICE_ID_KS_7010		0x7910
 
@@ -48,8 +48,8 @@
  * for network packet (less than 2048 bytes data)
  */
 #define WSTATUS_RSIZE		0x000014
-#define WSTATUS_MASK		0x80 /* Write Status Register value */
-#define RSIZE_MASK		0x7F /* Read Data Size Register value [10:4] */
+#define WSTATUS_MASK		0x80	/* Write Status Register value */
+#define RSIZE_MASK		0x7F	/* Read Data Size Register value [10:4] */
 
 /* ARM to SD interrupt Enable */
 #define INT_ENABLE		0x000020
@@ -88,52 +88,48 @@
 
 #define KS7010_IRAM_ADDRESS	0x06000000
 
-
 /* 
  * struct define
  */
 struct hw_info_t {
-	struct ks_sdio_card *sdio_card;	
+	struct ks_sdio_card *sdio_card;
 	struct completion ks7010_sdio_wait;
 	struct workqueue_struct *ks7010sdio_wq;
 	struct delayed_work rw_wq;
-	unsigned char	*read_buf;
+	unsigned char *read_buf;
 	struct tasklet_struct rx_bh_task;
 };
 
 struct ks_sdio_packet {
-        struct ks_sdio_packet   *next;
-        u16                     nb;
-        u8                      buffer[0] __attribute__((aligned(4)));
+	struct ks_sdio_packet *next;
+	u16 nb;
+	u8 buffer[0] __attribute__ ((aligned(4)));
 };
 
-
 struct ks_sdio_card {
-	struct sdio_func	*func;
+	struct sdio_func *func;
 	struct ks_wlan_private *priv;
-	int			model;
-	const char		*firmware;
-        spinlock_t              lock;
+	int model;
+	const char *firmware;
+	spinlock_t lock;
 };
 
-
-
 /* Tx Device struct */
-#define	TX_DEVICE_BUFF_SIZE	1024 
+#define	TX_DEVICE_BUFF_SIZE	1024
 
 struct tx_device_buffer {
-        unsigned char *sendp;		/* pointer of send req data */
-        unsigned int  size;
-	void	(*complete_handler)(void *arg1, void *arg2);
-	void	*arg1;
-	void	*arg2;
+	unsigned char *sendp;	/* pointer of send req data */
+	unsigned int size;
+	void (*complete_handler) (void *arg1, void *arg2);
+	void *arg1;
+	void *arg2;
 };
 
-struct tx_device{
-        struct tx_device_buffer tx_dev_buff[TX_DEVICE_BUFF_SIZE];
-        unsigned int	qhead; /* tx buffer queue first pointer */
-        unsigned int	qtail; /* tx buffer queue last pointer */
-        spinlock_t  tx_dev_lock;
+struct tx_device {
+	struct tx_device_buffer tx_dev_buff[TX_DEVICE_BUFF_SIZE];
+	unsigned int qhead;	/* tx buffer queue first pointer */
+	unsigned int qtail;	/* tx buffer queue last pointer */
+	spinlock_t tx_dev_lock;
 };
 
 /* Rx Device struct */
@@ -141,15 +137,15 @@ struct tx_device{
 #define	RX_DEVICE_BUFF_SIZE	32
 
 struct rx_device_buffer {
-       unsigned char	data[RX_DATA_SIZE];
-       unsigned int	size;
+	unsigned char data[RX_DATA_SIZE];
+	unsigned int size;
 };
 
-struct rx_device{
-        struct rx_device_buffer rx_dev_buff[RX_DEVICE_BUFF_SIZE];
-        unsigned int	qhead; /* rx buffer queue first pointer */
-	unsigned int	qtail; /* rx buffer queue last pointer */
-	spinlock_t  rx_dev_lock;
+struct rx_device {
+	struct rx_device_buffer rx_dev_buff[RX_DEVICE_BUFF_SIZE];
+	unsigned int qhead;	/* rx buffer queue first pointer */
+	unsigned int qtail;	/* rx buffer queue last pointer */
+	spinlock_t rx_dev_lock;
 };
 #define	ROM_FILE "ks7010sd.rom"
 #define	CFG_FILE "ks79xx.cfg"
-- 
2.8.1
