Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41976 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752431AbcEaK5i (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:38 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 14/31] staging: ks7010: remove unecessary typedef
Date: Tue, 31 May 2016 12:56:26 +0200
Message-Id: <1464692203-4180-15-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Let's simply specify the struct to keep in sync with kernel coding
style.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_config.c |   4 +-
 drivers/staging/ks7010/ks7010_sdio.c   |  44 ++++-----
 drivers/staging/ks7010/ks7010_sdio.h   |   2 +-
 drivers/staging/ks7010/ks_hostif.c     | 114 +++++++++++-----------
 drivers/staging/ks7010/ks_hostif.h     |  10 +-
 drivers/staging/ks7010/ks_wlan.h       |   4 +-
 drivers/staging/ks7010/ks_wlan_ioctl.h |   4 +-
 drivers/staging/ks7010/ks_wlan_net.c   | 168 ++++++++++++++++-----------------
 8 files changed, 175 insertions(+), 175 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_config.c b/drivers/staging/ks7010/ks7010_config.c
index 4b00d25cd8f575..48809bcc779739 100644
--- a/drivers/staging/ks7010/ks7010_config.c
+++ b/drivers/staging/ks7010/ks7010_config.c
@@ -87,7 +87,7 @@ void analyze_hex_wep_key(struct ks_wlan_parameter *param, int wep_key_index, cha
 }
 
 static
-int rate_set_configuration(ks_wlan_private *priv, char *value)
+int rate_set_configuration(struct ks_wlan_private *priv, char *value)
 {
 	int rc=0;
 
@@ -169,7 +169,7 @@ int rate_set_configuration(ks_wlan_private *priv, char *value)
 }
 
 #include <linux/firmware.h>
-int ks_wlan_read_config_file(ks_wlan_private *priv)
+int ks_wlan_read_config_file(struct ks_wlan_private *priv)
 {
 	struct {
 		const int key_len;
diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 50364909449aec..fb9f0b533d867e 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -51,9 +51,9 @@ static struct ks_sdio_model ks_sdio_models[] = {
 static int ks7910_sdio_probe(struct sdio_func *function, const struct sdio_device_id *device);
 static void ks7910_sdio_remove(struct sdio_func *function);
 static void ks7010_rw_function(struct work_struct *work);
-static int ks7010_sdio_read( ks_wlan_private *priv, unsigned int address,
+static int ks7010_sdio_read( struct ks_wlan_private *priv, unsigned int address,
 			     unsigned char *buffer, int length );
-static int ks7010_sdio_write( ks_wlan_private *priv, unsigned int address,
+static int ks7010_sdio_write( struct ks_wlan_private *priv, unsigned int address,
 			      unsigned char *buffer, int length );
 /* macro */
 
@@ -71,7 +71,7 @@ static int ks7010_sdio_write( ks_wlan_private *priv, unsigned int address,
 #define cnt_rxqbody(priv) \
         (((priv->rx_dev.qtail + RX_DEVICE_BUFF_SIZE) - (priv->rx_dev.qhead)) % RX_DEVICE_BUFF_SIZE )
 
-void ks_wlan_hw_sleep_doze_request(ks_wlan_private *priv)
+void ks_wlan_hw_sleep_doze_request(struct ks_wlan_private *priv)
 {
 	unsigned char rw_data;
 	int retval;
@@ -102,7 +102,7 @@ out:
 	return;
 }
 
-void ks_wlan_hw_sleep_wakeup_request(ks_wlan_private *priv)
+void ks_wlan_hw_sleep_wakeup_request(struct ks_wlan_private *priv)
 {
 	unsigned char rw_data;
 	int retval;
@@ -134,7 +134,7 @@ out:
 }
 
 
-void ks_wlan_hw_wakeup_request(ks_wlan_private *priv)
+void ks_wlan_hw_wakeup_request(struct ks_wlan_private *priv)
 {
 	unsigned char rw_data;
 	int retval;
@@ -155,7 +155,7 @@ void ks_wlan_hw_wakeup_request(ks_wlan_private *priv)
 	}
 }
 
-int _ks_wlan_hw_power_save(ks_wlan_private *priv)
+int _ks_wlan_hw_power_save(struct ks_wlan_private *priv)
 {
 	int rc=0;
 	unsigned char rw_data;
@@ -220,13 +220,13 @@ int _ks_wlan_hw_power_save(ks_wlan_private *priv)
 	return rc;
 }
 
-int ks_wlan_hw_power_save(ks_wlan_private *priv)
+int ks_wlan_hw_power_save(struct ks_wlan_private *priv)
 {
 	queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 1);
 	return 0;
 }
 
-static int ks7010_sdio_read(ks_wlan_private *priv, unsigned int address,
+static int ks7010_sdio_read(struct ks_wlan_private *priv, unsigned int address,
 			    unsigned char *buffer, int length)
 {
 	int rc = -1;
@@ -249,7 +249,7 @@ static int ks7010_sdio_read(ks_wlan_private *priv, unsigned int address,
 	return rc;
 }
 
-static int ks7010_sdio_write(ks_wlan_private *priv, unsigned int address,
+static int ks7010_sdio_write(struct ks_wlan_private *priv, unsigned int address,
 			     unsigned char *buffer, int length)
 {
 	int rc = -1;
@@ -272,7 +272,7 @@ static int ks7010_sdio_write(ks_wlan_private *priv, unsigned int address,
 	return rc;
 }
 
-static int enqueue_txdev(ks_wlan_private *priv, unsigned char *p, unsigned long size,
+static int enqueue_txdev(struct ks_wlan_private *priv, unsigned char *p, unsigned long size,
 		  void (*complete_handler)(void *arg1, void *arg2),
 		  void *arg1, void *arg2 )
 {
@@ -306,7 +306,7 @@ static int enqueue_txdev(ks_wlan_private *priv, unsigned char *p, unsigned long
 }
 
 /* write data */
-static int write_to_device(ks_wlan_private *priv, unsigned char *buffer, unsigned long size )
+static int write_to_device(struct ks_wlan_private *priv, unsigned char *buffer, unsigned long size )
 {
 	int rc,retval;
 	unsigned char rw_data;
@@ -338,7 +338,7 @@ static int write_to_device(ks_wlan_private *priv, unsigned char *buffer, unsigne
 
 static void tx_device_task(void *dev)
 {
-	ks_wlan_private	*priv = (ks_wlan_private *)dev;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev;
 	struct tx_device_buffer	*sp;
 	int rc = 0;
 
@@ -366,7 +366,7 @@ static void tx_device_task(void *dev)
 	return;
 }
 
-int ks_wlan_hw_tx( ks_wlan_private *priv, void *p, unsigned long size,
+int ks_wlan_hw_tx( struct ks_wlan_private *priv, void *p, unsigned long size,
 		   void (*complete_handler)(void *arg1, void *arg2),
 		   void *arg1, void *arg2 )
 {
@@ -396,7 +396,7 @@ int ks_wlan_hw_tx( ks_wlan_private *priv, void *p, unsigned long size,
 
 static void rx_event_task(unsigned long dev)
 {
-        ks_wlan_private *priv = (ks_wlan_private *)dev;
+        struct ks_wlan_private *priv = (struct ks_wlan_private *)dev;
 	struct rx_device_buffer	*rp;
 
 	DPRINTK(4,"\n");
@@ -416,7 +416,7 @@ static void rx_event_task(unsigned long dev)
 
 static void ks_wlan_hw_rx(void *dev, uint16_t size)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev;
 	int retval;
 	struct rx_device_buffer *rx_buffer;
 	struct hostif_hdr *hdr;
@@ -560,7 +560,7 @@ static void ks_sdio_interrupt(struct sdio_func *func)
 {
 	int retval;
 	struct ks_sdio_card *card;
-	ks_wlan_private *priv;
+	struct ks_wlan_private *priv;
 	unsigned char status, rsize, rw_data;
 
 	card = sdio_get_drvdata(func);
@@ -643,7 +643,7 @@ intr_out:
 	return;
 }
 
-static int trx_device_init( ks_wlan_private *priv )
+static int trx_device_init( struct ks_wlan_private *priv )
 {
 	/* initialize values (tx) */
 	priv->tx_dev.qtail = priv->tx_dev.qhead = 0;
@@ -660,7 +660,7 @@ static int trx_device_init( ks_wlan_private *priv )
 	return 0;
 }
 
-static void trx_device_exit( ks_wlan_private *priv )
+static void trx_device_exit( struct ks_wlan_private *priv )
 {
 	struct tx_device_buffer	*sp;
 
@@ -677,7 +677,7 @@ static void trx_device_exit( ks_wlan_private *priv )
 
 	return;
 }
-static int ks7010_sdio_update_index(ks_wlan_private *priv, u32 index)
+static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
 {
 	int rc=0;
 	int retval;
@@ -699,7 +699,7 @@ error_out:
 }
 
 #define ROM_BUFF_SIZE (64*1024)
-static int ks7010_sdio_data_compare(ks_wlan_private *priv, u32 address,
+static int ks7010_sdio_data_compare(struct ks_wlan_private *priv, u32 address,
 				    unsigned char *data, unsigned int size)
 {
 	int rc=0;
@@ -720,7 +720,7 @@ error_out:
 	return rc;
 }
 #include <linux/firmware.h>
-static int ks79xx_upload_firmware(ks_wlan_private *priv, struct ks_sdio_card *card)
+static int ks79xx_upload_firmware(struct ks_wlan_private *priv, struct ks_sdio_card *card)
 {
 	unsigned int	size, offset,  n = 0;
 	unsigned char	*rom_buf;
@@ -886,7 +886,7 @@ extern int ks_wlan_net_stop(struct net_device *dev);
 
 static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id *device)
 {
-	ks_wlan_private *priv;
+	struct ks_wlan_private *priv;
 	struct ks_sdio_card *card;
 	struct net_device *netdev;
 	unsigned char rw_data;
diff --git a/drivers/staging/ks7010/ks7010_sdio.h b/drivers/staging/ks7010/ks7010_sdio.h
index 93823837f19e65..1d16673e5dae02 100644
--- a/drivers/staging/ks7010/ks7010_sdio.h
+++ b/drivers/staging/ks7010/ks7010_sdio.h
@@ -110,7 +110,7 @@ struct ks_sdio_packet {
 
 struct ks_sdio_card {
 	struct sdio_func	*func;
-	struct ks_wlan_private	*priv;
+	struct ks_wlan_private *priv;
 	int			model;
 	const char		*firmware;
         spinlock_t              lock;
diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index b0a0a53d3a00bf..497b8aaf6daef8 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -23,13 +23,13 @@
 /* Include Wireless Extension definition and check version */
 #include <net/iw_handler.h>	/* New driver API */
 
-extern int ks_wlan_hw_tx(ks_wlan_private *priv, void *p, unsigned long size,
+extern int ks_wlan_hw_tx(struct ks_wlan_private *priv, void *p, unsigned long size,
 			 void (*complete_handler)(void *arg1, void *arg2),
 			 void *arg1, void *arg2 );
 extern void send_packet_complete(void *, void *);
 
-extern void ks_wlan_hw_wakeup_request(ks_wlan_private *priv);
-extern int ks_wlan_hw_power_save(ks_wlan_private *priv);
+extern void ks_wlan_hw_wakeup_request(struct ks_wlan_private *priv);
+extern int ks_wlan_hw_power_save(struct ks_wlan_private *priv);
 
 /* macro */
 #define inc_smeqhead(priv) \
@@ -42,7 +42,7 @@ extern int ks_wlan_hw_power_save(ks_wlan_private *priv);
 #define KS_WLAN_MEM_FLAG (GFP_ATOMIC)
 
 static
-inline u8 get_BYTE(ks_wlan_private *priv)
+inline u8 get_BYTE(struct ks_wlan_private *priv)
 {
 	u8 data;
 	data = *(priv->rxp)++;
@@ -52,7 +52,7 @@ inline u8 get_BYTE(ks_wlan_private *priv)
 }
 
 static
-inline u16 get_WORD(ks_wlan_private *priv)
+inline u16 get_WORD(struct ks_wlan_private *priv)
 {
 	u16 data;
 	data  = (get_BYTE(priv) & 0xff);
@@ -61,7 +61,7 @@ inline u16 get_WORD(ks_wlan_private *priv)
 }
 
 static
-inline u32 get_DWORD(ks_wlan_private *priv)
+inline u32 get_DWORD(struct ks_wlan_private *priv)
 {
 	u32 data;
 	data  = (get_BYTE(priv) & 0xff);
@@ -73,7 +73,7 @@ inline u32 get_DWORD(ks_wlan_private *priv)
 
 void ks_wlan_hw_wakeup_task(struct work_struct *work)
 {
-	ks_wlan_private *priv = container_of(work, struct ks_wlan_private, ks_wlan_wakeup_task);
+	struct ks_wlan_private *priv = container_of(work, struct ks_wlan_private, ks_wlan_wakeup_task);
 	int ps_status = atomic_read(&priv->psstatus.status);
 
 	if(ps_status==PS_SNOOZE){
@@ -96,7 +96,7 @@ void ks_wlan_hw_wakeup_task(struct work_struct *work)
 }
 
 static
-int ks_wlan_do_power_save(ks_wlan_private *priv)
+int ks_wlan_do_power_save(struct ks_wlan_private *priv)
 {
 	int rc=0;
 
@@ -112,7 +112,7 @@ int ks_wlan_do_power_save(ks_wlan_private *priv)
 }
 
 static
-int get_current_ap(ks_wlan_private *priv, struct link_ap_info_t *ap_info)
+int get_current_ap(struct ks_wlan_private *priv, struct link_ap_info_t *ap_info)
 {
 	struct local_ap_t *ap;
 	union iwreq_data wrqu;
@@ -213,7 +213,7 @@ int get_current_ap(ks_wlan_private *priv, struct link_ap_info_t *ap_info)
 }
 
 static
-int get_ap_information(ks_wlan_private *priv, struct ap_info_t *ap_info, struct local_ap_t *ap)
+int get_ap_information(struct ks_wlan_private *priv, struct ap_info_t *ap_info, struct local_ap_t *ap)
 {
 	unsigned char *bp;
 	int bsize,offset;
@@ -312,7 +312,7 @@ int get_ap_information(ks_wlan_private *priv, struct ap_info_t *ap_info, struct
 }
 
 static
-void hostif_data_indication(ks_wlan_private *priv)
+void hostif_data_indication(struct ks_wlan_private *priv)
 {
 	unsigned int	rx_ind_size;	/* indicate data size */
 	struct sk_buff *skb;
@@ -491,7 +491,7 @@ void hostif_data_indication(ks_wlan_private *priv)
 }
 
 static
-void hostif_mib_get_confirm(ks_wlan_private *priv)
+void hostif_mib_get_confirm(struct ks_wlan_private *priv)
 {
 	struct net_device *dev=priv->net_dev;
 	uint32_t	mib_status;
@@ -570,7 +570,7 @@ void hostif_mib_get_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_mib_set_confirm(ks_wlan_private *priv)
+void hostif_mib_set_confirm(struct ks_wlan_private *priv)
 {
 	uint32_t	mib_status;	/* +04 MIB Status */
 	uint32_t	mib_attribute;	/* +08 MIB attribute */
@@ -691,7 +691,7 @@ void hostif_mib_set_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_power_mngmt_confirm(ks_wlan_private *priv)
+void hostif_power_mngmt_confirm(struct ks_wlan_private *priv)
 {
 	DPRINTK(3,"\n");
 
@@ -707,7 +707,7 @@ void hostif_power_mngmt_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_sleep_confirm(ks_wlan_private *priv)
+void hostif_sleep_confirm(struct ks_wlan_private *priv)
 {
 	DPRINTK(3,"\n");
 
@@ -716,7 +716,7 @@ void hostif_sleep_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_start_confirm(ks_wlan_private *priv)
+void hostif_start_confirm(struct ks_wlan_private *priv)
 {
 #ifdef  WPS
        union iwreq_data        wrqu;
@@ -734,7 +734,7 @@ void hostif_start_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_connect_indication(ks_wlan_private *priv)
+void hostif_connect_indication(struct ks_wlan_private *priv)
 {
 	unsigned short connect_code;
 	unsigned int tmp=0;
@@ -789,7 +789,7 @@ void hostif_connect_indication(ks_wlan_private *priv)
 }
 
 static
-void hostif_scan_indication(ks_wlan_private *priv)
+void hostif_scan_indication(struct ks_wlan_private *priv)
 {
 	int i;
 	struct ap_info_t *ap_info;
@@ -820,7 +820,7 @@ void hostif_scan_indication(ks_wlan_private *priv)
 }
 
 static
-void hostif_stop_confirm(ks_wlan_private *priv)
+void hostif_stop_confirm(struct ks_wlan_private *priv)
 {
 	unsigned int tmp=0;
 	unsigned int old_status=priv->connect_status;
@@ -856,7 +856,7 @@ void hostif_stop_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_ps_adhoc_set_confirm(ks_wlan_private *priv)
+void hostif_ps_adhoc_set_confirm(struct ks_wlan_private *priv)
 {
 	DPRINTK(3,"\n");
 	priv->infra_status = 0; /* infrastructure mode cancel */
@@ -865,7 +865,7 @@ void hostif_ps_adhoc_set_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_infrastructure_set_confirm(ks_wlan_private *priv)
+void hostif_infrastructure_set_confirm(struct ks_wlan_private *priv)
 {
 	uint16_t result_code;
 	DPRINTK(3,"\n");
@@ -876,7 +876,7 @@ void hostif_infrastructure_set_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_adhoc_set_confirm(ks_wlan_private *priv)
+void hostif_adhoc_set_confirm(struct ks_wlan_private *priv)
 {
 	DPRINTK(3,"\n");
 	priv->infra_status = 1; /* infrastructure mode set */
@@ -884,7 +884,7 @@ void hostif_adhoc_set_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_associate_indication(ks_wlan_private *priv)
+void hostif_associate_indication(struct ks_wlan_private *priv)
 {
 	struct association_request_t *assoc_req;
 	struct association_response_t *assoc_resp;
@@ -928,7 +928,7 @@ void hostif_associate_indication(ks_wlan_private *priv)
 }
 
 static
-void hostif_bss_scan_confirm(ks_wlan_private *priv)
+void hostif_bss_scan_confirm(struct ks_wlan_private *priv)
 {
 	unsigned int result_code;
 	struct net_device *dev = priv->net_dev;
@@ -947,7 +947,7 @@ void hostif_bss_scan_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_phy_information_confirm(ks_wlan_private *priv)
+void hostif_phy_information_confirm(struct ks_wlan_private *priv)
 {
 	struct iw_statistics *wstats = &priv->wstats;
 	unsigned char rssi,signal,noise;
@@ -983,7 +983,7 @@ void hostif_phy_information_confirm(ks_wlan_private *priv)
 }
 
 static
-void hostif_mic_failure_confirm(ks_wlan_private *priv)
+void hostif_mic_failure_confirm(struct ks_wlan_private *priv)
 {
 	DPRINTK(3,"mic_failure=%u\n",priv->wpa.mic_failure.failure);
 	hostif_sme_enqueue(priv, SME_MIC_FAILURE_CONFIRM);
@@ -991,7 +991,7 @@ void hostif_mic_failure_confirm(ks_wlan_private *priv)
 
 
 static
-void hostif_event_check(ks_wlan_private *priv)
+void hostif_event_check(struct ks_wlan_private *priv)
 {
 	unsigned short event;
 
@@ -1065,7 +1065,7 @@ void hostif_event_check(ks_wlan_private *priv)
 
 #define CHECK_ALINE(size) (size%4 ? (size+(4-(size%4))):size)
 
-int hostif_data_request(ks_wlan_private *priv, struct sk_buff *packet)
+int hostif_data_request(struct ks_wlan_private *priv, struct sk_buff *packet)
 {
 	unsigned int		packet_len=0;
 
@@ -1231,7 +1231,7 @@ int hostif_data_request(ks_wlan_private *priv, struct sk_buff *packet)
                                       } }while(0)
 
 static
-void hostif_mib_get_request( ks_wlan_private *priv, unsigned long mib_attribute)
+void hostif_mib_get_request( struct ks_wlan_private *priv, unsigned long mib_attribute)
 {
 	struct hostif_mib_get_request_t *pp;
 
@@ -1253,7 +1253,7 @@ void hostif_mib_get_request( ks_wlan_private *priv, unsigned long mib_attribute)
 }
 
 static
-void hostif_mib_set_request( ks_wlan_private *priv, unsigned long mib_attribute,
+void hostif_mib_set_request( struct ks_wlan_private *priv, unsigned long mib_attribute,
 			     unsigned short size, unsigned short type,
 			     void *vp )
 {
@@ -1286,7 +1286,7 @@ void hostif_mib_set_request( ks_wlan_private *priv, unsigned long mib_attribute,
 }
 
 static
-void hostif_start_request( ks_wlan_private *priv, unsigned char mode )
+void hostif_start_request( struct ks_wlan_private *priv, unsigned char mode )
 {
 	struct hostif_start_request_t *pp;
 
@@ -1311,7 +1311,7 @@ void hostif_start_request( ks_wlan_private *priv, unsigned char mode )
 }
 
 static
-void hostif_ps_adhoc_set_request(ks_wlan_private *priv)
+void hostif_ps_adhoc_set_request(struct ks_wlan_private *priv)
 {
 	struct hostif_ps_adhoc_set_request_t *pp;
 	uint16_t capability;
@@ -1352,7 +1352,7 @@ void hostif_ps_adhoc_set_request(ks_wlan_private *priv)
 }
 
 static
-void hostif_infrastructure_set_request(ks_wlan_private *priv)
+void hostif_infrastructure_set_request(struct ks_wlan_private *priv)
 {
 	struct hostif_infrastructure_set_request_t *pp;
 	uint16_t capability;
@@ -1415,7 +1415,7 @@ void hostif_infrastructure_set_request(ks_wlan_private *priv)
 	ks_wlan_hw_tx( priv, pp, hif_align_size(sizeof(*pp)),NULL, NULL, NULL);
 }
 
-void hostif_infrastructure_set2_request(ks_wlan_private *priv)
+void hostif_infrastructure_set2_request(struct ks_wlan_private *priv)
 {
 	struct hostif_infrastructure_set2_request_t *pp;
 	uint16_t capability;
@@ -1481,7 +1481,7 @@ void hostif_infrastructure_set2_request(ks_wlan_private *priv)
 }
 
 static
-void hostif_adhoc_set_request(ks_wlan_private *priv)
+void hostif_adhoc_set_request(struct ks_wlan_private *priv)
 {
 	struct hostif_adhoc_set_request_t *pp;
 	uint16_t capability;
@@ -1524,7 +1524,7 @@ void hostif_adhoc_set_request(ks_wlan_private *priv)
 }
 
 static
-void hostif_adhoc_set2_request(ks_wlan_private *priv)
+void hostif_adhoc_set2_request(struct ks_wlan_private *priv)
 {
 	struct hostif_adhoc_set2_request_t *pp;
 	uint16_t capability;
@@ -1570,7 +1570,7 @@ void hostif_adhoc_set2_request(ks_wlan_private *priv)
 }
 
 static
-void hostif_stop_request( ks_wlan_private *priv )
+void hostif_stop_request( struct ks_wlan_private *priv )
 {
 	struct hostif_stop_request_t *pp;
 
@@ -1591,7 +1591,7 @@ void hostif_stop_request( ks_wlan_private *priv )
 }
 
 static
-void hostif_phy_information_request( ks_wlan_private *priv )
+void hostif_phy_information_request( struct ks_wlan_private *priv )
 {
 	struct hostif_phy_information_request_t *pp;
 
@@ -1619,7 +1619,7 @@ void hostif_phy_information_request( ks_wlan_private *priv )
 }
 
 static
-void hostif_power_mngmt_request( ks_wlan_private *priv, unsigned long mode,
+void hostif_power_mngmt_request( struct ks_wlan_private *priv, unsigned long mode,
 				 unsigned long wake_up, unsigned long receiveDTIMs )
 {
 	struct hostif_power_mngmt_request_t *pp;
@@ -1643,7 +1643,7 @@ void hostif_power_mngmt_request( ks_wlan_private *priv, unsigned long mode,
 }
 
 static
-void hostif_sleep_request( ks_wlan_private *priv, unsigned long mode)
+void hostif_sleep_request( struct ks_wlan_private *priv, unsigned long mode)
 {
 	struct hostif_sleep_request_t *pp;
 
@@ -1673,7 +1673,7 @@ void hostif_sleep_request( ks_wlan_private *priv, unsigned long mode)
 
 
 static
-void hostif_bss_scan_request( ks_wlan_private *priv, unsigned long scan_type , uint8_t *scan_ssid, uint8_t scan_ssid_len)
+void hostif_bss_scan_request( struct ks_wlan_private *priv, unsigned long scan_type , uint8_t *scan_ssid, uint8_t scan_ssid_len)
 {
 	struct hostif_bss_scan_request_t *pp;
 
@@ -1727,7 +1727,7 @@ void hostif_bss_scan_request( ks_wlan_private *priv, unsigned long scan_type , u
 }
 
 static
-void hostif_mic_failure_request( ks_wlan_private *priv, unsigned short failure_count,
+void hostif_mic_failure_request( struct ks_wlan_private *priv, unsigned short failure_count,
 				 unsigned short timer )
 {
 	struct hostif_mic_failure_request_t *pp;
@@ -1750,7 +1750,7 @@ void hostif_mic_failure_request( ks_wlan_private *priv, unsigned short failure_c
 }
 
 /* Device I/O Recieve indicate */
-static void devio_rec_ind(ks_wlan_private *priv, unsigned char *p, unsigned int size)
+static void devio_rec_ind(struct ks_wlan_private *priv, unsigned char *p, unsigned int size)
 {
 	if (priv->device_open_status) {
 		spin_lock(&priv->dev_read_lock); /* request spin lock */
@@ -1772,7 +1772,7 @@ static void devio_rec_ind(ks_wlan_private *priv, unsigned char *p, unsigned int
 	}
 }
 
-void hostif_receive( ks_wlan_private *priv, unsigned char *p, unsigned int size )
+void hostif_receive( struct ks_wlan_private *priv, unsigned char *p, unsigned int size )
 {
 	DPRINTK(4,"\n");
 
@@ -1788,7 +1788,7 @@ void hostif_receive( ks_wlan_private *priv, unsigned char *p, unsigned int size
 
 
 static
-void hostif_sme_set_wep(ks_wlan_private *priv, int type)
+void hostif_sme_set_wep(struct ks_wlan_private *priv, int type)
 {
 	uint32_t val;
 	switch(type){
@@ -1844,7 +1844,7 @@ struct rsn_mode_t {
 } __attribute__((packed));
 
 static
-void hostif_sme_set_rsn(ks_wlan_private *priv, int type)
+void hostif_sme_set_rsn(struct ks_wlan_private *priv, int type)
 {
 	struct wpa_suite_t wpa_suite;
 	struct rsn_mode_t rsn_mode;
@@ -1991,7 +1991,7 @@ void hostif_sme_set_rsn(ks_wlan_private *priv, int type)
 }
 
 static
-void hostif_sme_mode_setup(ks_wlan_private *priv)
+void hostif_sme_mode_setup(struct ks_wlan_private *priv)
 {
 	unsigned char rate_size;
 	unsigned char rate_octet[RATE_SET_MAX_SIZE];
@@ -2097,7 +2097,7 @@ void hostif_sme_mode_setup(ks_wlan_private *priv)
 }
 
 static
-void hostif_sme_multicast_set(ks_wlan_private *priv)
+void hostif_sme_multicast_set(struct ks_wlan_private *priv)
 {
 
         struct net_device *dev = priv->net_dev;
@@ -2146,7 +2146,7 @@ void hostif_sme_multicast_set(ks_wlan_private *priv)
 }
 
 static
-void hostif_sme_powermgt_set(ks_wlan_private *priv)
+void hostif_sme_powermgt_set(struct ks_wlan_private *priv)
 {
 	unsigned long mode,wake_up,receiveDTIMs ;
 
@@ -2191,7 +2191,7 @@ void hostif_sme_powermgt_set(ks_wlan_private *priv)
 }
 
 static
-void hostif_sme_sleep_set(ks_wlan_private *priv)
+void hostif_sme_sleep_set(struct ks_wlan_private *priv)
 {
 	DPRINTK(3,"\n");
 	switch(priv->sleep_mode){
@@ -2209,7 +2209,7 @@ void hostif_sme_sleep_set(ks_wlan_private *priv)
 }
 
 static
-void hostif_sme_set_key(ks_wlan_private *priv, int type)
+void hostif_sme_set_key(struct ks_wlan_private *priv, int type)
 {
 	uint32_t val;
 	switch(type){
@@ -2265,7 +2265,7 @@ void hostif_sme_set_key(ks_wlan_private *priv, int type)
 }
 
 static
-void hostif_sme_set_pmksa(ks_wlan_private *priv)
+void hostif_sme_set_pmksa(struct ks_wlan_private *priv)
 {
 	struct pmk_cache_t {
 		uint16_t size;
@@ -2296,7 +2296,7 @@ void hostif_sme_set_pmksa(ks_wlan_private *priv)
 
 /* execute sme */
 static
-void hostif_sme_execute(ks_wlan_private *priv, int event)
+void hostif_sme_execute(struct ks_wlan_private *priv, int event)
 {
 	uint32_t val;
 
@@ -2459,7 +2459,7 @@ void hostif_sme_execute(ks_wlan_private *priv, int event)
 static
 void hostif_sme_task( unsigned long dev )
 {
-	ks_wlan_private	*priv = (ks_wlan_private *)dev;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev;
 
 	DPRINTK(3,"\n");
 
@@ -2475,7 +2475,7 @@ void hostif_sme_task( unsigned long dev )
 }
 
 /* send to Station Management Entity module */
-void hostif_sme_enqueue(ks_wlan_private *priv, unsigned short event)
+void hostif_sme_enqueue(struct ks_wlan_private *priv, unsigned short event)
 {
 	DPRINTK(3,"\n");
 
@@ -2500,7 +2500,7 @@ void hostif_sme_enqueue(ks_wlan_private *priv, unsigned short event)
 
 }
 
-int hostif_init( ks_wlan_private *priv )
+int hostif_init( struct ks_wlan_private *priv )
 {
 	int rc=0;
 	int i;
@@ -2555,7 +2555,7 @@ int hostif_init( ks_wlan_private *priv )
 	return rc;
 }
 
-void hostif_exit( ks_wlan_private *priv )
+void hostif_exit( struct ks_wlan_private *priv )
 {
 	tasklet_kill(&priv->sme_task);
 	return;
diff --git a/drivers/staging/ks7010/ks_hostif.h b/drivers/staging/ks7010/ks_hostif.h
index 24ebf1ded78e44..c333ce1a4baa6e 100644
--- a/drivers/staging/ks7010/ks_hostif.h
+++ b/drivers/staging/ks7010/ks_hostif.h
@@ -623,11 +623,11 @@ enum {
 #include "ks_wlan.h"
 
 /* function prototype */
-extern int hostif_data_request( ks_wlan_private *priv, struct sk_buff *packet );
-extern void hostif_receive( ks_wlan_private *priv, unsigned char *p, unsigned int size );
-extern void hostif_sme_enqueue(ks_wlan_private *priv, uint16_t event);
-extern int hostif_init( ks_wlan_private *priv );
-extern void hostif_exit( ks_wlan_private *priv );
+extern int hostif_data_request( struct ks_wlan_private *priv, struct sk_buff *packet );
+extern void hostif_receive( struct ks_wlan_private *priv, unsigned char *p, unsigned int size );
+extern void hostif_sme_enqueue(struct ks_wlan_private *priv, uint16_t event);
+extern int hostif_init( struct ks_wlan_private *priv );
+extern void hostif_exit( struct ks_wlan_private *priv );
 
 static
 inline int hif_align_size(int size)
diff --git a/drivers/staging/ks7010/ks_wlan.h b/drivers/staging/ks7010/ks_wlan.h
index c460741c6606ee..58e3a5a6b44472 100644
--- a/drivers/staging/ks7010/ks_wlan.h
+++ b/drivers/staging/ks7010/ks_wlan.h
@@ -414,7 +414,7 @@ struct wps_status_t {
 };
 #endif /* WPS */
 
-typedef struct ks_wlan_private{
+struct ks_wlan_private {
 
 	struct hw_info_t ks_wlan_hw;  /* hardware information */
 
@@ -505,7 +505,7 @@ typedef struct ks_wlan_private{
 	uint   sdio_error_count;  /* SDIO error */
 	uint   wakeup_count;      /* for detect wakeup loop */
 	
-} ks_wlan_private; 
+};
 
 
 
diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
index e27f8fb5d8eeb2..e7469f7338f7af 100644
--- a/drivers/staging/ks7010/ks_wlan_ioctl.h
+++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
@@ -61,8 +61,8 @@
 #include "ks_wlan.h"
 #include <linux/netdevice.h>
 
-extern int ks_wlan_read_config_file(ks_wlan_private *priv);
-extern int ks_wlan_setup_parameter(ks_wlan_private *priv, unsigned int commit_flag);
+extern int ks_wlan_read_config_file(struct ks_wlan_private *priv);
+extern int ks_wlan_setup_parameter(struct ks_wlan_private *priv, unsigned int commit_flag);
 
 #endif /* __KERNEL__ */
 
diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 1da2768ea9f31b..ec5c452f367262 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -73,7 +73,7 @@ static const struct iw_handler_def	ks_wlan_handler_def;
 /*
  *	function prototypes
  */
-extern int ks_wlan_hw_tx(ks_wlan_private *priv, void *p, unsigned long size,
+extern int ks_wlan_hw_tx(struct ks_wlan_private *priv, void *p, unsigned long size,
 			void (*complete_handler)(void *arg1, void *arg2),
 			void *arg1,
 			void *arg2 );
@@ -89,7 +89,7 @@ static int ks_wlan_netdev_ioctl(struct net_device *dev, struct ifreq *rq, int cm
 static atomic_t update_phyinfo;
 static struct timer_list update_phyinfo_timer;
 static
-int ks_wlan_update_phy_information(ks_wlan_private *priv)
+int ks_wlan_update_phy_information(struct ks_wlan_private *priv)
 {
 		struct iw_statistics *wstats = &priv->wstats;
 
@@ -126,7 +126,7 @@ void ks_wlan_update_phyinfo_timeout(unsigned long ptr)
 	atomic_set(&update_phyinfo,0);
 }
 
-int ks_wlan_setup_parameter(ks_wlan_private *priv, unsigned int commit_flag)
+int ks_wlan_setup_parameter(struct ks_wlan_private *priv, unsigned int commit_flag)
 {
 	DPRINTK(2,"\n");
 
@@ -183,7 +183,7 @@ int ks_wlan_setup_parameter(ks_wlan_private *priv, unsigned int commit_flag)
 static int ks_wlan_get_name(struct net_device *dev, struct iw_request_info *info,
 				char *cwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *) netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *) netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -208,7 +208,7 @@ static int ks_wlan_get_name(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_set_freq(struct net_device *dev, struct iw_request_info *info,
 				struct iw_freq *fwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	int rc = -EINPROGRESS;		/* Call commit handler */
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -250,7 +250,7 @@ static int ks_wlan_set_freq(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_get_freq(struct net_device *dev, struct iw_request_info *info,
 				struct iw_freq *fwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	int f;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -271,7 +271,7 @@ static int ks_wlan_get_freq(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_set_essid(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	size_t len;
 
 	DPRINTK(2," %d\n", dwrq->flags);
@@ -326,7 +326,7 @@ static int ks_wlan_set_essid(struct net_device *dev, struct iw_request_info *inf
 static int ks_wlan_get_essid(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -366,7 +366,7 @@ static int ks_wlan_get_essid(struct net_device *dev, struct iw_request_info *inf
 static int ks_wlan_set_wap(struct net_device *dev, struct iw_request_info *info,
 			   struct sockaddr *ap_addr, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	DPRINTK(2,"\n");
 
@@ -402,7 +402,7 @@ static int ks_wlan_set_wap(struct net_device *dev, struct iw_request_info *info,
 static int ks_wlan_get_wap(struct net_device *dev, struct iw_request_info *info,
 			   struct sockaddr *awrq, char *extra)
 {
-		ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+		struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -423,7 +423,7 @@ static int ks_wlan_get_wap(struct net_device *dev, struct iw_request_info *info,
 static int ks_wlan_set_nick(struct net_device *dev, struct iw_request_info *info,
 				struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -442,7 +442,7 @@ static int ks_wlan_set_nick(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_get_nick(struct net_device *dev, struct iw_request_info *info,
 				struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -458,7 +458,7 @@ static int ks_wlan_get_nick(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_set_rate(struct net_device *dev, struct iw_request_info *info,
 				struct iw_param *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	int i = 0;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -609,7 +609,7 @@ static int ks_wlan_set_rate(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_get_rate(struct net_device *dev, struct iw_request_info *info,
 				struct iw_param *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	DPRINTK(2, "in_interrupt = %ld update_phyinfo = %d\n",
 		in_interrupt(),atomic_read(&update_phyinfo));
@@ -633,7 +633,7 @@ static int ks_wlan_get_rate(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_set_rts(struct net_device *dev, struct iw_request_info *info,
 			   struct iw_param *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	int rthr = vwrq->value;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -654,7 +654,7 @@ static int ks_wlan_set_rts(struct net_device *dev, struct iw_request_info *info,
 static int ks_wlan_get_rts(struct net_device *dev, struct iw_request_info *info,
 			   struct iw_param *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -670,7 +670,7 @@ static int ks_wlan_get_rts(struct net_device *dev, struct iw_request_info *info,
 static int ks_wlan_set_frag(struct net_device *dev, struct iw_request_info *info,
 				struct iw_param *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	int fthr = vwrq->value;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -692,7 +692,7 @@ static int ks_wlan_set_frag(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_get_frag(struct net_device *dev, struct iw_request_info *info,
 				struct iw_param *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -708,7 +708,7 @@ static int ks_wlan_get_frag(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_set_mode(struct net_device *dev, struct iw_request_info *info,
 				__u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	DPRINTK(2,"mode=%d\n",*uwrq);
 
@@ -740,7 +740,7 @@ static int ks_wlan_set_mode(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_get_mode(struct net_device *dev, struct iw_request_info *info,
 				__u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -764,7 +764,7 @@ static int ks_wlan_get_mode(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_set_encode(struct net_device *dev, struct iw_request_info *info,
 				  struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	wep_key_t key;
 	int index = (dwrq->flags & IW_ENCODE_INDEX);
@@ -878,7 +878,7 @@ static int ks_wlan_set_encode(struct net_device *dev, struct iw_request_info *in
 static int ks_wlan_get_encode(struct net_device *dev, struct iw_request_info *info,
 				  struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	char zeros[16];
 	int index = (dwrq->flags & IW_ENCODE_INDEX) - 1;
 
@@ -974,7 +974,7 @@ static int ks_wlan_get_retry(struct net_device *dev, struct iw_request_info *inf
 static int ks_wlan_get_range(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	struct iw_range *range = (struct iw_range *) extra;
 	int i,k;
 
@@ -1105,7 +1105,7 @@ static int ks_wlan_get_range(struct net_device *dev, struct iw_request_info *inf
 static int ks_wlan_set_power(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_param *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	short enabled;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -1136,7 +1136,7 @@ static int ks_wlan_set_power(struct net_device *dev, struct iw_request_info *inf
 static int ks_wlan_get_power(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_param *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -1153,7 +1153,7 @@ static int ks_wlan_get_power(struct net_device *dev, struct iw_request_info *inf
 static int ks_wlan_get_iwstats(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_quality *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -1194,7 +1194,7 @@ static int ks_wlan_get_sens(struct net_device *dev, struct iw_request_info *info
 static int ks_wlan_get_aplist(struct net_device *dev, struct iw_request_info *info,
 				  struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	struct sockaddr *address = (struct sockaddr *) extra;
 	struct iw_quality qual[LOCAL_APLIST_MAX];
 
@@ -1225,7 +1225,7 @@ static int ks_wlan_get_aplist(struct net_device *dev, struct iw_request_info *in
 static int ks_wlan_set_scan(struct net_device *dev, struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	struct iw_scan_req *req = NULL;
 	DPRINTK(2,"\n");
 
@@ -1257,7 +1257,7 @@ static int ks_wlan_set_scan(struct net_device *dev, struct iw_request_info *info
 static inline char *ks_wlan_translate_scan(struct net_device *dev, struct iw_request_info *info, char *current_ev,
 					   char *end_buf, struct local_ap_t *ap)
 {
-	/* ks_wlan_private *priv = (ks_wlan_private *)dev->priv; */
+	/* struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv; */
 	struct iw_event	iwe;		/* Temporary buffer */
 	u16 capabilities;
 	char *current_val;	/* For rates */
@@ -1393,7 +1393,7 @@ static inline char *ks_wlan_translate_scan(struct net_device *dev, struct iw_req
 static int ks_wlan_get_scan(struct net_device *dev, struct iw_request_info *info,
 				struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	int i;
 	char *current_ev = extra;
 	DPRINTK(2,"\n");
@@ -1448,7 +1448,7 @@ DPRINTK(2,"aplist 0\n");
 static int ks_wlan_config_commit(struct net_device *dev, struct iw_request_info *info,
 				 void *zwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (!priv->need_commit)
 		return 0;
@@ -1463,7 +1463,7 @@ static int ks_wlan_config_commit(struct net_device *dev, struct iw_request_info
 static int ks_wlan_set_genie(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	DPRINTK(2, "\n");
 
@@ -1478,7 +1478,7 @@ static int ks_wlan_set_genie(struct net_device *dev, struct iw_request_info *inf
 static int ks_wlan_set_auth_mode(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_param *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	int index = (vwrq->flags & IW_AUTH_INDEX);
 	int value = vwrq->value;
 
@@ -1614,7 +1614,7 @@ static int ks_wlan_set_auth_mode(struct net_device *dev, struct iw_request_info
 static int ks_wlan_get_auth_mode(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_param *vwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	int index = (vwrq->flags & IW_AUTH_INDEX);
 	DPRINTK(2,"index=%d\n",index);
 
@@ -1655,7 +1655,7 @@ static int ks_wlan_get_auth_mode(struct net_device *dev, struct iw_request_info
 static int ks_wlan_set_encode_ext(struct net_device *dev, struct iw_request_info *info,
 				  struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	struct iw_encode_ext *enc;
 	int index = dwrq->flags & IW_ENCODE_INDEX;
 	unsigned int commit=0;
@@ -1761,12 +1761,12 @@ static int ks_wlan_set_encode_ext(struct net_device *dev, struct iw_request_info
 static int ks_wlan_get_encode_ext(struct net_device *dev, struct iw_request_info *info,
 				  struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
 	/*  WPA (not used ?? wpa_supplicant)
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 	struct iw_encode_ext *enc;
 	enc = (struct iw_encode_ext *)extra;
 	int index = dwrq->flags & IW_ENCODE_INDEX;
@@ -1779,7 +1779,7 @@ static int ks_wlan_get_encode_ext(struct net_device *dev, struct iw_request_info
 static int ks_wlan_set_pmksa(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	struct iw_pmksa *pmksa ;
 	int i;
 	struct pmk_t *pmk;
@@ -1874,7 +1874,7 @@ static int ks_wlan_set_pmksa(struct net_device *dev, struct iw_request_info *inf
 static struct iw_statistics *ks_get_wireless_stats(struct net_device *dev)
 {
 
-	ks_wlan_private *priv = (ks_wlan_private *) netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *) netdev_priv(dev);
 		struct iw_statistics *wstats = &priv->wstats;
 
 	if(!atomic_read(&update_phyinfo)){
@@ -1901,7 +1901,7 @@ static struct iw_statistics *ks_get_wireless_stats(struct net_device *dev)
 static int ks_wlan_set_stop_request(struct net_device *dev, struct iw_request_info *info,
 				    __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	DPRINTK(2,"\n");
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -1919,7 +1919,7 @@ static int ks_wlan_set_stop_request(struct net_device *dev, struct iw_request_in
 static int ks_wlan_set_mlme(struct net_device *dev, struct iw_request_info *info,
 				  struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	struct iw_mlme *mlme = (struct iw_mlme *)extra;
 	__u32 mode;
 
@@ -1955,7 +1955,7 @@ static int ks_wlan_get_driver_version(struct net_device *dev, struct iw_request_
 static int ks_wlan_get_firmware_version(struct net_device *dev, struct iw_request_info *info,
 					struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	strcpy(extra, &(priv->firmware_version[0]));
 	dwrq->length = priv->version_size+1;
 	return 0;
@@ -1967,7 +1967,7 @@ static int ks_wlan_get_firmware_version(struct net_device *dev, struct iw_reques
 static int ks_wlan_set_detach(struct net_device *dev, struct iw_request_info *info,
 				  __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -1988,7 +1988,7 @@ static int ks_wlan_set_detach(struct net_device *dev, struct iw_request_info *in
 static int ks_wlan_get_detach(struct net_device *dev, struct iw_request_info *info,
 				  __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2001,7 +2001,7 @@ static int ks_wlan_get_detach(struct net_device *dev, struct iw_request_info *in
 static int ks_wlan_get_connect(struct net_device *dev, struct iw_request_info *info,
 				   __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2015,7 +2015,7 @@ static int ks_wlan_get_connect(struct net_device *dev, struct iw_request_info *i
 static int ks_wlan_set_preamble(struct net_device *dev, struct iw_request_info *info,
 				__u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2036,7 +2036,7 @@ static int ks_wlan_set_preamble(struct net_device *dev, struct iw_request_info *
 static int ks_wlan_get_preamble(struct net_device *dev, struct iw_request_info *info,
 				__u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2049,7 +2049,7 @@ static int ks_wlan_get_preamble(struct net_device *dev, struct iw_request_info *
 static int ks_wlan_set_powermgt(struct net_device *dev, struct iw_request_info *info,
 				__u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2078,7 +2078,7 @@ static int ks_wlan_set_powermgt(struct net_device *dev, struct iw_request_info *
 static int ks_wlan_get_powermgt(struct net_device *dev, struct iw_request_info *info,
 				__u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2091,7 +2091,7 @@ static int ks_wlan_get_powermgt(struct net_device *dev, struct iw_request_info *
 static int ks_wlan_set_scan_type(struct net_device *dev, struct iw_request_info *info,
 				 __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2110,7 +2110,7 @@ static int ks_wlan_set_scan_type(struct net_device *dev, struct iw_request_info
 static int ks_wlan_get_scan_type(struct net_device *dev, struct iw_request_info *info,
 				 __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2123,7 +2123,7 @@ static int ks_wlan_get_scan_type(struct net_device *dev, struct iw_request_info
 static int ks_wlan_data_write(struct net_device *dev, struct iw_request_info *info,
 				  struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 	unsigned char *wbuff = NULL;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -2144,7 +2144,7 @@ static int ks_wlan_data_write(struct net_device *dev, struct iw_request_info *in
 static int ks_wlan_data_read(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 	unsigned short read_length;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -2200,7 +2200,7 @@ static int ks_wlan_data_read(struct net_device *dev, struct iw_request_info *inf
 static int ks_wlan_get_wep_ascii(struct net_device *dev, struct iw_request_info *info,
 				 struct iw_point *dwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 	int i,j,len=0;
 	char tmp[WEP_ASCII_BUFF_SIZE];
 
@@ -2242,7 +2242,7 @@ static int ks_wlan_get_wep_ascii(struct net_device *dev, struct iw_request_info
 static int ks_wlan_set_beacon_lost(struct net_device *dev, struct iw_request_info *info,
 				   __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2265,7 +2265,7 @@ static int ks_wlan_set_beacon_lost(struct net_device *dev, struct iw_request_inf
 static int ks_wlan_get_beacon_lost(struct net_device *dev, struct iw_request_info *info,
 				   __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2278,7 +2278,7 @@ static int ks_wlan_get_beacon_lost(struct net_device *dev, struct iw_request_inf
 static int ks_wlan_set_phy_type(struct net_device *dev, struct iw_request_info *info,
 				__u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2300,7 +2300,7 @@ static int ks_wlan_set_phy_type(struct net_device *dev, struct iw_request_info *
 static int ks_wlan_get_phy_type(struct net_device *dev, struct iw_request_info *info,
 				__u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2313,7 +2313,7 @@ static int ks_wlan_get_phy_type(struct net_device *dev, struct iw_request_info *
 static int ks_wlan_set_cts_mode(struct net_device *dev, struct iw_request_info *info,
 				__u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2337,7 +2337,7 @@ static int ks_wlan_set_cts_mode(struct net_device *dev, struct iw_request_info *
 static int ks_wlan_get_cts_mode(struct net_device *dev, struct iw_request_info *info,
 				__u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2351,7 +2351,7 @@ static int ks_wlan_set_sleep_mode(struct net_device *dev,
 				     struct iw_request_info *info,
 				     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	DPRINTK(2,"\n");
 
@@ -2379,7 +2379,7 @@ static int ks_wlan_get_sleep_mode(struct net_device *dev,
 				     struct iw_request_info *info,
 				     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	DPRINTK(2, "GET_SLEEP_MODE %d\n", priv->sleep_mode);
 	*uwrq = priv->sleep_mode;
@@ -2393,7 +2393,7 @@ static int ks_wlan_get_sleep_mode(struct net_device *dev,
 static int ks_wlan_set_phy_information_timer(struct net_device *dev, struct iw_request_info *info,
 					     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2412,7 +2412,7 @@ static int ks_wlan_set_phy_information_timer(struct net_device *dev, struct iw_r
 static int ks_wlan_get_phy_information_timer(struct net_device *dev, struct iw_request_info *info,
 					     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2427,7 +2427,7 @@ static int ks_wlan_get_phy_information_timer(struct net_device *dev, struct iw_r
 static int ks_wlan_set_wps_enable(struct net_device *dev, struct iw_request_info *info,
 				  __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	DPRINTK(2,"\n");
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -2446,7 +2446,7 @@ static int ks_wlan_set_wps_enable(struct net_device *dev, struct iw_request_info
 static int ks_wlan_get_wps_enable(struct net_device *dev, struct iw_request_info *info,
 				  __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 	DPRINTK(2,"\n");
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -2464,7 +2464,7 @@ static int ks_wlan_set_wps_probe_req(struct net_device *dev,
 {
 	uint8_t *p = extra;
 	unsigned char len;
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	DPRINTK(2,"\n");
 
@@ -2498,7 +2498,7 @@ static int ks_wlan_get_wps_probe_req(struct net_device *dev,
 				     struct iw_request_info *info,
 				     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 	DPRINTK(2,"\n");
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
@@ -2513,7 +2513,7 @@ static int ks_wlan_get_wps_probe_req(struct net_device *dev,
 static int ks_wlan_set_tx_gain(struct net_device *dev, struct iw_request_info *info,
 					     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2537,7 +2537,7 @@ static int ks_wlan_set_tx_gain(struct net_device *dev, struct iw_request_info *i
 static int ks_wlan_get_tx_gain(struct net_device *dev, struct iw_request_info *info,
 					     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2551,7 +2551,7 @@ static int ks_wlan_get_tx_gain(struct net_device *dev, struct iw_request_info *i
 static int ks_wlan_set_rx_gain(struct net_device *dev, struct iw_request_info *info,
 					     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2574,7 +2574,7 @@ static int ks_wlan_set_rx_gain(struct net_device *dev, struct iw_request_info *i
 static int ks_wlan_get_rx_gain(struct net_device *dev, struct iw_request_info *info,
 					     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2588,7 +2588,7 @@ static int ks_wlan_get_rx_gain(struct net_device *dev, struct iw_request_info *i
 static int ks_wlan_set_region(struct net_device *dev, struct iw_request_info *info,
 					     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)dev->priv;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev->priv;
 
 	if (priv->sleep_mode == SLP_SLEEP){ return -EPERM; }  /* for SLEEP MODE */
 
@@ -2607,7 +2607,7 @@ static int ks_wlan_set_region(struct net_device *dev, struct iw_request_info *in
 static int ks_wlan_get_eeprom_cksum(struct net_device *dev, struct iw_request_info *info,
 					     __u32 *uwrq, char *extra)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	*uwrq = priv->eeprom_checksum;
 	return 0;
@@ -2732,7 +2732,7 @@ static int ks_wlan_hostt(struct net_device *dev, struct iw_request_info *info,
 					     __u32 *uwrq, char *extra)
 {
 	int i,event;
-	ks_wlan_private *priv = (ks_wlan_private *)netdev_priv(dev);
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)netdev_priv(dev);
 
 	for(i = 63; i >= 0; i--){
 		event =	priv->hostt.buff[(priv->hostt.qtail -1 -i)%SME_EVENT_BUFF_SIZE] ;
@@ -2924,7 +2924,7 @@ static int ks_wlan_netdev_ioctl(struct net_device *dev, struct ifreq *rq, int cm
 static
 struct net_device_stats *ks_wlan_get_stats(struct net_device *dev)
 {
-	ks_wlan_private *priv = netdev_priv(dev);
+	struct ks_wlan_private *priv = netdev_priv(dev);
 
 	if (priv->dev_state < DEVICE_STATE_READY) {
 				return NULL; /* not finished initialize */
@@ -2936,7 +2936,7 @@ struct net_device_stats *ks_wlan_get_stats(struct net_device *dev)
 static
 int ks_wlan_set_mac_address(struct net_device *dev, void *addr)
 {
-	ks_wlan_private *priv = netdev_priv(dev);
+	struct ks_wlan_private *priv = netdev_priv(dev);
 	struct sockaddr *mac_addr=(struct sockaddr *)addr;
 	if (netif_running(dev))
 		return -EBUSY;
@@ -2955,7 +2955,7 @@ int ks_wlan_set_mac_address(struct net_device *dev, void *addr)
 static
 void ks_wlan_tx_timeout(struct net_device *dev)
 {
-		ks_wlan_private *priv = netdev_priv(dev);
+		struct ks_wlan_private *priv = netdev_priv(dev);
 
 	DPRINTK(1,"head(%d) tail(%d)!!\n",priv->tx_dev.qhead, priv->tx_dev.qtail);
 	if(!netif_queue_stopped(dev)){
@@ -2970,7 +2970,7 @@ void ks_wlan_tx_timeout(struct net_device *dev)
 static
 int ks_wlan_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	ks_wlan_private *priv = netdev_priv(dev);
+	struct ks_wlan_private *priv = netdev_priv(dev);
 	int rc = 0;
 
 	DPRINTK(3,"in_interrupt()=%ld\n",in_interrupt());
@@ -3000,7 +3000,7 @@ int ks_wlan_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 void send_packet_complete(void *arg1, void *arg2)
 {
-	ks_wlan_private *priv = (ks_wlan_private *)arg1;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)arg1;
 	struct sk_buff *packet = (struct sk_buff *)arg2;
 
 		DPRINTK(3,"\n");
@@ -3023,7 +3023,7 @@ void send_packet_complete(void *arg1, void *arg2)
 static
 void ks_wlan_set_multicast_list(struct net_device *dev)
 {
-	ks_wlan_private *priv = netdev_priv(dev);
+	struct ks_wlan_private *priv = netdev_priv(dev);
 
 	DPRINTK(4,"\n");
 	if (priv->dev_state < DEVICE_STATE_READY) {
@@ -3037,7 +3037,7 @@ void ks_wlan_set_multicast_list(struct net_device *dev)
 static
 int ks_wlan_open(struct net_device *dev)
 {
-	ks_wlan_private *priv = netdev_priv(dev);
+	struct ks_wlan_private *priv = netdev_priv(dev);
 
 	priv->cur_rx = 0;
 
@@ -3082,7 +3082,7 @@ static const struct net_device_ops ks_wlan_netdev_ops = {
 
 int ks_wlan_net_start(struct net_device *dev)
 {
-	ks_wlan_private *priv;
+	struct ks_wlan_private *priv;
 	/* int rc; */
 
 	priv = netdev_priv(dev);
@@ -3121,7 +3121,7 @@ int ks_wlan_net_start(struct net_device *dev)
 
 int ks_wlan_net_stop(struct net_device *dev)
 {
-	ks_wlan_private *priv = netdev_priv(dev);
+	struct ks_wlan_private *priv = netdev_priv(dev);
 
 	int ret = 0;
 	priv->device_open_status = 0;
-- 
2.8.1
