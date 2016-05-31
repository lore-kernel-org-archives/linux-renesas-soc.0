Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:42000 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751498AbcEaK55 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:57 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 25/31] staging: ks7010: indent ks7010_sdio.c
Date: Tue, 31 May 2016 12:56:37 +0200
Message-Id: <1464692203-4180-26-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Unlike the previous patches which are plain indent outcomes, this has
some manual fixups to be not overly strict with the 80 char limit.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_sdio.c | 807 ++++++++++++++++++++---------------
 1 file changed, 460 insertions(+), 347 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index fb9f0b533d867e..ed4d579300ad96 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -30,31 +30,32 @@
 static int reg_net = 0;
 
 static const struct sdio_device_id if_sdio_ids[] = {
-	{ SDIO_DEVICE(SDIO_VENDOR_ID_KS_CODE_A, SDIO_DEVICE_ID_KS_7010) },
-	{ SDIO_DEVICE(SDIO_VENDOR_ID_KS_CODE_B, SDIO_DEVICE_ID_KS_7010) },
+	{SDIO_DEVICE(SDIO_VENDOR_ID_KS_CODE_A, SDIO_DEVICE_ID_KS_7010)},
+	{SDIO_DEVICE(SDIO_VENDOR_ID_KS_CODE_B, SDIO_DEVICE_ID_KS_7010)},
 	{ /* all zero */ }
 };
 
 struct ks_sdio_model {
-        int model;
-        const char *firmware;
+	int model;
+	const char *firmware;
 };
 
 static struct ks_sdio_model ks_sdio_models[] = {
-        {
-                /* ks7010 */
-                .model = 0x10,
-                .firmware = "ks7010sd.rom",
-        },
+	{
+		/* ks7010 */
+		.model = 0x10,
+		.firmware = "ks7010sd.rom",
+	},
 };
 
-static int ks7910_sdio_probe(struct sdio_func *function, const struct sdio_device_id *device);
+static int ks7910_sdio_probe(struct sdio_func *function,
+			     const struct sdio_device_id *device);
 static void ks7910_sdio_remove(struct sdio_func *function);
 static void ks7010_rw_function(struct work_struct *work);
-static int ks7010_sdio_read( struct ks_wlan_private *priv, unsigned int address,
-			     unsigned char *buffer, int length );
-static int ks7010_sdio_write( struct ks_wlan_private *priv, unsigned int address,
-			      unsigned char *buffer, int length );
+static int ks7010_sdio_read(struct ks_wlan_private *priv, unsigned int address,
+			    unsigned char *buffer, int length);
+static int ks7010_sdio_write(struct ks_wlan_private *priv, unsigned int address,
+			     unsigned char *buffer, int length);
 /* macro */
 
 #define inc_txqhead(priv) \
@@ -79,25 +80,25 @@ void ks_wlan_hw_sleep_doze_request(struct ks_wlan_private *priv)
 	DPRINTK(4, "\n");
 
 	/* clear request */
-	atomic_set(&priv->sleepstatus.doze_request,0);
+	atomic_set(&priv->sleepstatus.doze_request, 0);
 
-	if( atomic_read(&priv->sleepstatus.status) == 0){
+	if (atomic_read(&priv->sleepstatus.status) == 0) {
 		rw_data = GCR_B_DOZE;
-		retval = ks7010_sdio_write(priv, GCR_B, &rw_data, sizeof(rw_data));
-		if(retval){
+		retval =
+		    ks7010_sdio_write(priv, GCR_B, &rw_data, sizeof(rw_data));
+		if (retval) {
 			DPRINTK(1, " error : GCR_B=%02X\n", rw_data);
 			goto out;
 		}
 		DPRINTK(4, "PMG SET!! : GCR_B=%02X\n", rw_data);
-		DPRINTK(3,"sleep_mode=SLP_SLEEP\n");
+		DPRINTK(3, "sleep_mode=SLP_SLEEP\n");
 		atomic_set(&priv->sleepstatus.status, 1);
- 		priv->last_doze = jiffies;
-	}
-	else{
-		DPRINTK(1,"sleep_mode=%d\n",priv->sleep_mode);
+		priv->last_doze = jiffies;
+	} else {
+		DPRINTK(1, "sleep_mode=%d\n", priv->sleep_mode);
 	}
 
-out:
+ out:
 	priv->sleep_mode = atomic_read(&priv->sleepstatus.status);
 	return;
 }
@@ -110,110 +111,126 @@ void ks_wlan_hw_sleep_wakeup_request(struct ks_wlan_private *priv)
 	DPRINTK(4, "\n");
 
 	/* clear request */
-	atomic_set(&priv->sleepstatus.wakeup_request,0);
+	atomic_set(&priv->sleepstatus.wakeup_request, 0);
 
-	if( atomic_read(&priv->sleepstatus.status) == 1){
+	if (atomic_read(&priv->sleepstatus.status) == 1) {
 		rw_data = WAKEUP_REQ;
-		retval = ks7010_sdio_write(priv, WAKEUP, &rw_data, sizeof(rw_data));
-		if(retval){
+		retval =
+		    ks7010_sdio_write(priv, WAKEUP, &rw_data, sizeof(rw_data));
+		if (retval) {
 			DPRINTK(1, " error : WAKEUP=%02X\n", rw_data);
 			goto out;
 		}
 		DPRINTK(4, "wake up : WAKEUP=%02X\n", rw_data);
 		atomic_set(&priv->sleepstatus.status, 0);
- 		priv->last_wakeup = jiffies;
+		priv->last_wakeup = jiffies;
 		++priv->wakeup_count;
-	}
-	else{
-		DPRINTK(1,"sleep_mode=%d\n",priv->sleep_mode);
+	} else {
+		DPRINTK(1, "sleep_mode=%d\n", priv->sleep_mode);
 	}
 
-out:
+ out:
 	priv->sleep_mode = atomic_read(&priv->sleepstatus.status);
 	return;
 }
 
-
 void ks_wlan_hw_wakeup_request(struct ks_wlan_private *priv)
 {
 	unsigned char rw_data;
 	int retval;
 
 	DPRINTK(4, "\n");
-	if(atomic_read(&priv->psstatus.status)==PS_SNOOZE){
+	if (atomic_read(&priv->psstatus.status) == PS_SNOOZE) {
 		rw_data = WAKEUP_REQ;
-		retval = ks7010_sdio_write(priv, WAKEUP, &rw_data, sizeof(rw_data));
-		if(retval){
+		retval =
+		    ks7010_sdio_write(priv, WAKEUP, &rw_data, sizeof(rw_data));
+		if (retval) {
 			DPRINTK(1, " error : WAKEUP=%02X\n", rw_data);
 		}
 		DPRINTK(4, "wake up : WAKEUP=%02X\n", rw_data);
- 		priv->last_wakeup = jiffies;
+		priv->last_wakeup = jiffies;
 		++priv->wakeup_count;
-	}
-	else{
-		DPRINTK(1,"psstatus=%d\n",atomic_read(&priv->psstatus.status));
+	} else {
+		DPRINTK(1, "psstatus=%d\n",
+			atomic_read(&priv->psstatus.status));
 	}
 }
 
 int _ks_wlan_hw_power_save(struct ks_wlan_private *priv)
 {
-	int rc=0;
+	int rc = 0;
 	unsigned char rw_data;
 	int retval;
 
-	if(priv->reg.powermgt == POWMGT_ACTIVE_MODE)
+	if (priv->reg.powermgt == POWMGT_ACTIVE_MODE)
 		return rc;
 
-	if(priv->reg.operation_mode == MODE_INFRASTRUCTURE &&
-	   (priv->connect_status & CONNECT_STATUS_MASK)== CONNECT_STATUS){
+	if (priv->reg.operation_mode == MODE_INFRASTRUCTURE &&
+	    (priv->connect_status & CONNECT_STATUS_MASK) == CONNECT_STATUS) {
 
 		//DPRINTK(1,"psstatus.status=%d\n",atomic_read(&priv->psstatus.status));
-	if (priv->dev_state == DEVICE_STATE_SLEEP) {
-		switch(atomic_read(&priv->psstatus.status)){
-		case PS_SNOOZE: /* 4 */
-			break;
-		default:
-			DPRINTK(5,"\n\
-				psstatus.status=%d\n\
-				psstatus.confirm_wait=%d\n\
-				psstatus.snooze_guard=%d\n\
-				cnt_txqbody=%d\n",
-				atomic_read(&priv->psstatus.status),
-				atomic_read(&priv->psstatus.confirm_wait),
-				atomic_read(&priv->psstatus.snooze_guard),
-				cnt_txqbody(priv));
-
-			if(!atomic_read(&priv->psstatus.confirm_wait)&&
-			   !atomic_read(&priv->psstatus.snooze_guard)&&
-			   !cnt_txqbody(priv)){
-				retval = ks7010_sdio_read(priv, INT_PENDING, &rw_data, sizeof(rw_data));
-				if(retval){
-					DPRINTK(1, " error : INT_PENDING=%02X\n", rw_data);
-					queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 1);
-					break;
-				}
-				if(!rw_data){
-					rw_data = GCR_B_DOZE;
-					retval = ks7010_sdio_write(priv, GCR_B, &rw_data, sizeof(rw_data));
-					if(retval){
-						DPRINTK(1, " error : GCR_B=%02X\n", rw_data);
-						queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 1);
+		if (priv->dev_state == DEVICE_STATE_SLEEP) {
+			switch (atomic_read(&priv->psstatus.status)) {
+			case PS_SNOOZE:	/* 4 */
+				break;
+			default:
+				DPRINTK(5, "\npsstatus.status=%d\npsstatus.confirm_wait=%d\npsstatus.snooze_guard=%d\ncnt_txqbody=%d\n",
+					atomic_read(&priv->psstatus.status),
+					atomic_read(&priv->psstatus.confirm_wait),
+					atomic_read(&priv->psstatus.snooze_guard),
+					cnt_txqbody(priv));
+
+				if (!atomic_read(&priv->psstatus.confirm_wait)
+				    && !atomic_read(&priv->psstatus.snooze_guard)
+				    && !cnt_txqbody(priv)) {
+					retval =
+					    ks7010_sdio_read(priv, INT_PENDING,
+							     &rw_data,
+							     sizeof(rw_data));
+					if (retval) {
+						DPRINTK(1,
+							" error : INT_PENDING=%02X\n",
+							rw_data);
+						queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
+								   &priv->ks_wlan_hw.rw_wq, 1);
 						break;
 					}
-					DPRINTK(4, "PMG SET!! : GCR_B=%02X\n", rw_data);
-					atomic_set(&priv->psstatus.status, PS_SNOOZE);
-					DPRINTK(3,"psstatus.status=PS_SNOOZE\n");
-				}
-				else{
-					queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 1);
+					if (!rw_data) {
+						rw_data = GCR_B_DOZE;
+						retval =
+						    ks7010_sdio_write(priv,
+								      GCR_B,
+								      &rw_data,
+								      sizeof(rw_data));
+						if (retval) {
+							DPRINTK(1,
+								" error : GCR_B=%02X\n",
+								rw_data);
+							queue_delayed_work
+							    (priv->ks_wlan_hw.ks7010sdio_wq,
+							     &priv->ks_wlan_hw.rw_wq, 1);
+							break;
+						}
+						DPRINTK(4,
+							"PMG SET!! : GCR_B=%02X\n",
+							rw_data);
+						atomic_set(&priv->psstatus.
+							   status, PS_SNOOZE);
+						DPRINTK(3,
+							"psstatus.status=PS_SNOOZE\n");
+					} else {
+						queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
+								   &priv->ks_wlan_hw.rw_wq, 1);
+					}
+				} else {
+					queue_delayed_work(priv->ks_wlan_hw.
+							   ks7010sdio_wq,
+							   &priv->ks_wlan_hw.rw_wq,
+							   0);
 				}
+				break;
 			}
-			else{
-				queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 0);
-			}
-			break;
 		}
-	}
 
 	}
 
@@ -222,7 +239,8 @@ int _ks_wlan_hw_power_save(struct ks_wlan_private *priv)
 
 int ks_wlan_hw_power_save(struct ks_wlan_private *priv)
 {
-	queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 1);
+	queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
+			   &priv->ks_wlan_hw.rw_wq, 1);
 	return 0;
 }
 
@@ -234,16 +252,16 @@ static int ks7010_sdio_read(struct ks_wlan_private *priv, unsigned int address,
 
 	card = priv->ks_wlan_hw.sdio_card;
 
-	if (length == 1) /* CMD52 */
+	if (length == 1)	/* CMD52 */
 		*buffer = sdio_readb(card->func, address, &rc);
-	else /* CMD53 multi-block transfer */
+	else	/* CMD53 multi-block transfer */
 		rc = sdio_memcpy_fromio(card->func, buffer, address, length);
 
-	if(rc != 0){
+	if (rc != 0) {
 		printk("sdio error erorr=%d size=%d\n", rc, length);
 		++priv->sdio_error_count;
-	}else{
-		priv->sdio_error_count=0;
+	} else {
+		priv->sdio_error_count = 0;
 	}
 
 	return rc;
@@ -257,40 +275,42 @@ static int ks7010_sdio_write(struct ks_wlan_private *priv, unsigned int address,
 
 	card = priv->ks_wlan_hw.sdio_card;
 
-	if (length == 1) /* CMD52 */
-		sdio_writeb(card->func, *buffer, (unsigned int) address,  &rc);
-	else 		 /* CMD53 */
-		rc = sdio_memcpy_toio(card->func, (unsigned int) address, buffer, length);
+	if (length == 1)	/* CMD52 */
+		sdio_writeb(card->func, *buffer, (unsigned int)address, &rc);
+	else	/* CMD53 */
+		rc = sdio_memcpy_toio(card->func, (unsigned int)address, buffer,
+				      length);
 
-	if(rc != 0){
+	if (rc != 0) {
 		printk("sdio error erorr=%d size=%d\n", rc, length);
 		++priv->sdio_error_count;
-	}else{
-		priv->sdio_error_count=0;
+	} else {
+		priv->sdio_error_count = 0;
 	}
 
 	return rc;
 }
 
-static int enqueue_txdev(struct ks_wlan_private *priv, unsigned char *p, unsigned long size,
-		  void (*complete_handler)(void *arg1, void *arg2),
-		  void *arg1, void *arg2 )
+static int enqueue_txdev(struct ks_wlan_private *priv, unsigned char *p,
+			 unsigned long size,
+			 void (*complete_handler) (void *arg1, void *arg2),
+			 void *arg1, void *arg2)
 {
 	struct tx_device_buffer *sp;
 
 	if (priv->dev_state < DEVICE_STATE_BOOT) {
 		kfree(p);
 		if (complete_handler != NULL)
-			(*complete_handler)(arg1, arg2);
+			(*complete_handler) (arg1, arg2);
 		return 1;
 	}
 
-	if ((TX_DEVICE_BUFF_SIZE - 1) <=  cnt_txqbody(priv)) {
+	if ((TX_DEVICE_BUFF_SIZE - 1) <= cnt_txqbody(priv)) {
 		/* in case of buffer overflow */
-		DPRINTK(1,"tx buffer overflow\n");
+		DPRINTK(1, "tx buffer overflow\n");
 		kfree(p);
 		if (complete_handler != NULL)
-			(*complete_handler)(arg1, arg2);
+			(*complete_handler) (arg1, arg2);
 		return 1;
 	}
 
@@ -306,29 +326,31 @@ static int enqueue_txdev(struct ks_wlan_private *priv, unsigned char *p, unsigne
 }
 
 /* write data */
-static int write_to_device(struct ks_wlan_private *priv, unsigned char *buffer, unsigned long size )
+static int write_to_device(struct ks_wlan_private *priv, unsigned char *buffer,
+			   unsigned long size)
 {
-	int rc,retval;
+	int rc, retval;
 	unsigned char rw_data;
 	struct hostif_hdr *hdr;
 	hdr = (struct hostif_hdr *)buffer;
-	rc=0;
+	rc = 0;
 
-	DPRINTK(4,"size=%d\n", hdr->size);
-	if(hdr->event < HIF_DATA_REQ || HIF_REQ_MAX < hdr->event){
-		DPRINTK(1,"unknown event=%04X\n",hdr->event);
+	DPRINTK(4, "size=%d\n", hdr->size);
+	if (hdr->event < HIF_DATA_REQ || HIF_REQ_MAX < hdr->event) {
+		DPRINTK(1, "unknown event=%04X\n", hdr->event);
 		return 0;
 	}
 
 	retval = ks7010_sdio_write(priv, DATA_WINDOW, buffer, size);
-	if(retval){
+	if (retval) {
 		DPRINTK(1, " write error : retval=%d\n", retval);
 		return -4;
 	}
 
 	rw_data = WRITE_STATUS_BUSY;
-	retval = ks7010_sdio_write(priv, WRITE_STATUS, &rw_data, sizeof(rw_data));
-	if(retval){
+	retval =
+	    ks7010_sdio_write(priv, WRITE_STATUS, &rw_data, sizeof(rw_data));
+	if (retval) {
 		DPRINTK(1, " error : WRITE_STATUS=%02X\n", rw_data);
 		return -3;
 	}
@@ -339,74 +361,80 @@ static int write_to_device(struct ks_wlan_private *priv, unsigned char *buffer,
 static void tx_device_task(void *dev)
 {
 	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev;
-	struct tx_device_buffer	*sp;
+	struct tx_device_buffer *sp;
 	int rc = 0;
 
 	DPRINTK(4, "\n");
-	if(cnt_txqbody(priv)>0 && atomic_read(&priv->psstatus.status) != PS_SNOOZE){
+	if (cnt_txqbody(priv) > 0
+	    && atomic_read(&priv->psstatus.status) != PS_SNOOZE) {
 		sp = &priv->tx_dev.tx_dev_buff[priv->tx_dev.qhead];
-		if(priv->dev_state >= DEVICE_STATE_BOOT){
+		if (priv->dev_state >= DEVICE_STATE_BOOT) {
 			rc = write_to_device(priv, sp->sendp, sp->size);
-			if(rc){
-				DPRINTK(1, "write_to_device error !!(%d)\n", rc);
-				queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 1);
+			if (rc) {
+				DPRINTK(1, "write_to_device error !!(%d)\n",
+					rc);
+				queue_delayed_work(priv->ks_wlan_hw.
+						   ks7010sdio_wq,
+						   &priv->ks_wlan_hw.rw_wq, 1);
 				return;
 			}
 
 		}
-		kfree(sp->sendp); /* allocated memory free */
-		if(sp->complete_handler != NULL) /* TX Complete */
-			(*sp->complete_handler)(sp->arg1, sp->arg2);
+		kfree(sp->sendp);	/* allocated memory free */
+		if (sp->complete_handler != NULL)	/* TX Complete */
+			(*sp->complete_handler) (sp->arg1, sp->arg2);
 		inc_txqhead(priv);
 
-		if(cnt_txqbody(priv)>0){
-			queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 0);
+		if (cnt_txqbody(priv) > 0) {
+			queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
+					   &priv->ks_wlan_hw.rw_wq, 0);
 		}
 	}
 	return;
 }
 
-int ks_wlan_hw_tx( struct ks_wlan_private *priv, void *p, unsigned long size,
-		   void (*complete_handler)(void *arg1, void *arg2),
-		   void *arg1, void *arg2 )
+int ks_wlan_hw_tx(struct ks_wlan_private *priv, void *p, unsigned long size,
+		  void (*complete_handler) (void *arg1, void *arg2),
+		  void *arg1, void *arg2)
 {
-	int result=0;
+	int result = 0;
 	struct hostif_hdr *hdr;
 	hdr = (struct hostif_hdr *)p;
 
-	if(hdr->event < HIF_DATA_REQ || HIF_REQ_MAX < hdr->event){
-		DPRINTK(1,"unknown event=%04X\n",hdr->event);
+	if (hdr->event < HIF_DATA_REQ || HIF_REQ_MAX < hdr->event) {
+		DPRINTK(1, "unknown event=%04X\n", hdr->event);
 		return 0;
 	}
 
 	/* add event to hostt buffer */
 	priv->hostt.buff[priv->hostt.qtail] = hdr->event;
-        priv->hostt.qtail = (priv->hostt.qtail + 1) % SME_EVENT_BUFF_SIZE;
+	priv->hostt.qtail = (priv->hostt.qtail + 1) % SME_EVENT_BUFF_SIZE;
 
-	DPRINTK(4, "event=%04X\n",hdr->event);
+	DPRINTK(4, "event=%04X\n", hdr->event);
 	spin_lock(&priv->tx_dev.tx_dev_lock);
 	result = enqueue_txdev(priv, p, size, complete_handler, arg1, arg2);
 	spin_unlock(&priv->tx_dev.tx_dev_lock);
 
-	if(cnt_txqbody(priv)>0){
-		queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 0);
+	if (cnt_txqbody(priv) > 0) {
+		queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
+				   &priv->ks_wlan_hw.rw_wq, 0);
 	}
 	return result;
 }
 
 static void rx_event_task(unsigned long dev)
 {
-        struct ks_wlan_private *priv = (struct ks_wlan_private *)dev;
-	struct rx_device_buffer	*rp;
+	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev;
+	struct rx_device_buffer *rp;
 
-	DPRINTK(4,"\n");
+	DPRINTK(4, "\n");
 
-	if(cnt_rxqbody(priv) > 0 && priv->dev_state >= DEVICE_STATE_BOOT){
+	if (cnt_rxqbody(priv) > 0 && priv->dev_state >= DEVICE_STATE_BOOT) {
 		rp = &priv->rx_dev.rx_dev_buff[priv->rx_dev.qhead];
 		hostif_receive(priv, rp->data, rp->size);
 		inc_rxqhead(priv);
 
-		if(cnt_rxqbody(priv) > 0){
+		if (cnt_rxqbody(priv) > 0) {
 			tasklet_schedule(&priv->ks_wlan_hw.rx_bh_task);
 		}
 	}
@@ -420,35 +448,40 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
 	int retval;
 	struct rx_device_buffer *rx_buffer;
 	struct hostif_hdr *hdr;
-	unsigned char	read_status;
-	unsigned short event=0;
+	unsigned char read_status;
+	unsigned short event = 0;
 
-	DPRINTK(4,"\n");
+	DPRINTK(4, "\n");
 
 	/* receive data */
-	if (cnt_rxqbody(priv) >= (RX_DEVICE_BUFF_SIZE-1)) {
+	if (cnt_rxqbody(priv) >= (RX_DEVICE_BUFF_SIZE - 1)) {
 		/* in case of buffer overflow */
-		DPRINTK(1,"rx buffer overflow \n");
+		DPRINTK(1, "rx buffer overflow \n");
 		goto error_out;
 	}
 	rx_buffer = &priv->rx_dev.rx_dev_buff[priv->rx_dev.qtail];
 
-	retval = ks7010_sdio_read(priv, DATA_WINDOW, &rx_buffer->data[0], hif_align_size(size));
-	if(retval){
+	retval =
+	    ks7010_sdio_read(priv, DATA_WINDOW, &rx_buffer->data[0],
+			     hif_align_size(size));
+	if (retval) {
 		goto error_out;
 	}
 
 	/* length check */
-	if(size > 2046 || size == 0){
+	if (size > 2046 || size == 0) {
 #ifdef KS_WLAN_DEBUG
 		if (KS_WLAN_DEBUG > 5)
-			print_hex_dump_bytes("INVALID DATA dump: ", DUMP_PREFIX_OFFSET,
+			print_hex_dump_bytes("INVALID DATA dump: ",
+					     DUMP_PREFIX_OFFSET,
 					     rx_buffer->data, 32);
 #endif
 		/* rx_status update */
 		read_status = READ_STATUS_IDLE;
-		retval = ks7010_sdio_write(priv, READ_STATUS, &read_status, sizeof(read_status));
-		if(retval){
+		retval =
+		    ks7010_sdio_write(priv, READ_STATUS, &read_status,
+				      sizeof(read_status));
+		if (retval) {
 			DPRINTK(1, " error : READ_STATUS=%02X\n", read_status);
 		}
 		goto error_out;
@@ -461,14 +494,16 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
 
 	/* read status update */
 	read_status = READ_STATUS_IDLE;
-	retval = ks7010_sdio_write(priv, READ_STATUS, &read_status, sizeof(read_status));
-	if(retval){
+	retval =
+	    ks7010_sdio_write(priv, READ_STATUS, &read_status,
+			      sizeof(read_status));
+	if (retval) {
 		DPRINTK(1, " error : READ_STATUS=%02X\n", read_status);
 	}
 	DPRINTK(4, "READ_STATUS=%02X\n", read_status);
 
-	if(atomic_read(&priv->psstatus.confirm_wait)){
-		if(IS_HIF_CONF(event)){
+	if (atomic_read(&priv->psstatus.confirm_wait)) {
+		if (IS_HIF_CONF(event)) {
 			DPRINTK(4, "IS_HIF_CONF true !!\n");
 			atomic_dec(&priv->psstatus.confirm_wait);
 		}
@@ -477,7 +512,7 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
 	/* rx_event_task((void *)priv); */
 	tasklet_schedule(&priv->ks_wlan_hw.rx_bh_task);
 
-error_out:
+ error_out:
 	return;
 }
 
@@ -491,71 +526,74 @@ static void ks7010_rw_function(struct work_struct *work)
 	hw = container_of(work, struct hw_info_t, rw_wq.work);
 	priv = container_of(hw, struct ks_wlan_private, ks_wlan_hw);
 
-	DPRINTK(4,"\n");
-
+	DPRINTK(4, "\n");
 
- 	/* wiat after DOZE */
- 	if(time_after(priv->last_doze + ((30*HZ)/1000), jiffies )){
- 		DPRINTK(4, "wait after DOZE \n");
-		queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 1);
+	/* wiat after DOZE */
+	if (time_after(priv->last_doze + ((30 * HZ) / 1000), jiffies)) {
+		DPRINTK(4, "wait after DOZE \n");
+		queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
+				   &priv->ks_wlan_hw.rw_wq, 1);
 		return;
 	}
 
 	/* wiat after WAKEUP */
-	while(time_after(priv->last_wakeup + ((30*HZ)/1000), jiffies )){
+	while (time_after(priv->last_wakeup + ((30 * HZ) / 1000), jiffies)) {
 		DPRINTK(4, "wait after WAKEUP \n");
 /*		queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq,
 		(priv->last_wakeup + ((30*HZ)/1000) - jiffies));*/
-		printk("wake: %lu %lu\n", priv->last_wakeup + (30* HZ)/1000, jiffies);
+		printk("wake: %lu %lu\n", priv->last_wakeup + (30 * HZ) / 1000,
+		       jiffies);
 		msleep(30);
 	}
 
 	sdio_claim_host(priv->ks_wlan_hw.sdio_card->func);
 
 	/* power save wakeup */
-	if(atomic_read(&priv->psstatus.status)==PS_SNOOZE){
-		if(cnt_txqbody(priv)>0){
+	if (atomic_read(&priv->psstatus.status) == PS_SNOOZE) {
+		if (cnt_txqbody(priv) > 0) {
 			ks_wlan_hw_wakeup_request(priv);
-			queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 1);
+			queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
+					   &priv->ks_wlan_hw.rw_wq, 1);
 		}
 		goto err_out;
 	}
 
 	/* sleep mode doze */
-	if(atomic_read(&priv->sleepstatus.doze_request)==1){
+	if (atomic_read(&priv->sleepstatus.doze_request) == 1) {
 		ks_wlan_hw_sleep_doze_request(priv);
 		goto err_out;
 	}
 	/* sleep mode wakeup */
-	if(atomic_read(&priv->sleepstatus.wakeup_request)==1){
+	if (atomic_read(&priv->sleepstatus.wakeup_request) == 1) {
 		ks_wlan_hw_sleep_wakeup_request(priv);
 		goto err_out;
 	}
 
 	/* read (WriteStatus/ReadDataSize FN1:00_0014) */
-	retval = ks7010_sdio_read(priv, WSTATUS_RSIZE, &rw_data, sizeof(rw_data));
-	if(retval){
-		DPRINTK(1, " error : WSTATUS_RSIZE=%02X psstatus=%d\n", rw_data,atomic_read(&priv->psstatus.status));
+	retval =
+	    ks7010_sdio_read(priv, WSTATUS_RSIZE, &rw_data, sizeof(rw_data));
+	if (retval) {
+		DPRINTK(1, " error : WSTATUS_RSIZE=%02X psstatus=%d\n", rw_data,
+			atomic_read(&priv->psstatus.status));
 		goto err_out;
 	}
 	DPRINTK(4, "WSTATUS_RSIZE=%02X\n", rw_data);
 
-	if(rw_data&RSIZE_MASK){ /* Read schedule */
-		ks_wlan_hw_rx((void *)priv, (uint16_t)(((rw_data&RSIZE_MASK)<<4)));
+	if (rw_data & RSIZE_MASK) {	/* Read schedule */
+		ks_wlan_hw_rx((void *)priv,
+			      (uint16_t) (((rw_data & RSIZE_MASK) << 4)));
 	}
-	if((rw_data&WSTATUS_MASK)){
+	if ((rw_data & WSTATUS_MASK)) {
 		tx_device_task((void *)priv);
 	}
 	_ks_wlan_hw_power_save(priv);
 
-err_out:
+ err_out:
 	sdio_release_host(priv->ks_wlan_hw.sdio_card->func);
 
 	return;
 }
 
-
-
 static void ks_sdio_interrupt(struct sdio_func *func)
 {
 	int retval;
@@ -567,10 +605,12 @@ static void ks_sdio_interrupt(struct sdio_func *func)
 	priv = card->priv;
 	DPRINTK(4, "\n");
 
-	if(priv->dev_state >= DEVICE_STATE_BOOT){
-		retval = ks7010_sdio_read(priv, INT_PENDING, &status, sizeof(status));
-		if(retval){
-			DPRINTK(1, "read INT_PENDING Failed!!(%d)\n",retval);
+	if (priv->dev_state >= DEVICE_STATE_BOOT) {
+		retval =
+		    ks7010_sdio_read(priv, INT_PENDING, &status,
+				     sizeof(status));
+		if (retval) {
+			DPRINTK(1, "read INT_PENDING Failed!!(%d)\n", retval);
 			goto intr_out;
 		}
 		DPRINTK(4, "INT_PENDING=%02X\n", rw_data);
@@ -580,70 +620,89 @@ static void ks_sdio_interrupt(struct sdio_func *func)
 		/* read (General Communication B register) */
 		/* bit5 -> Write Status Idle */
 		/* bit2 -> Read Status Busy  */
-		if(status&INT_GCR_B || atomic_read(&priv->psstatus.status)==PS_SNOOZE){
-			retval = ks7010_sdio_read(priv, GCR_B, &rw_data, sizeof(rw_data));
-			if(retval){
+		if (status & INT_GCR_B
+		    || atomic_read(&priv->psstatus.status) == PS_SNOOZE) {
+			retval =
+			    ks7010_sdio_read(priv, GCR_B, &rw_data,
+					     sizeof(rw_data));
+			if (retval) {
 				DPRINTK(1, " error : GCR_B=%02X\n", rw_data);
 				goto intr_out;
 			}
 			/* DPRINTK(1, "GCR_B=%02X\n", rw_data); */
-			if(rw_data == GCR_B_ACTIVE){
-				if(atomic_read(&priv->psstatus.status)==PS_SNOOZE){
-					atomic_set(&priv->psstatus.status, PS_WAKEUP);
-					priv->wakeup_count=0;
+			if (rw_data == GCR_B_ACTIVE) {
+				if (atomic_read(&priv->psstatus.status) ==
+				    PS_SNOOZE) {
+					atomic_set(&priv->psstatus.status,
+						   PS_WAKEUP);
+					priv->wakeup_count = 0;
 				}
 				complete(&priv->psstatus.wakeup_wait);
 			}
 
-
 		}
 
-		do{
+		do {
 			/* read (WriteStatus/ReadDataSize FN1:00_0014) */
-			retval = ks7010_sdio_read(priv, WSTATUS_RSIZE, &rw_data, sizeof(rw_data));
-			if(retval){
-				DPRINTK(1, " error : WSTATUS_RSIZE=%02X\n", rw_data);
+			retval =
+			    ks7010_sdio_read(priv, WSTATUS_RSIZE, &rw_data,
+					     sizeof(rw_data));
+			if (retval) {
+				DPRINTK(1, " error : WSTATUS_RSIZE=%02X\n",
+					rw_data);
 				goto intr_out;
 			}
 			DPRINTK(4, "WSTATUS_RSIZE=%02X\n", rw_data);
-			rsize=rw_data&RSIZE_MASK;
-			if(rsize){ /* Read schedule */
-				ks_wlan_hw_rx((void *)priv, (uint16_t)(((rsize)<<4)));
+			rsize = rw_data & RSIZE_MASK;
+			if (rsize) {	/* Read schedule */
+				ks_wlan_hw_rx((void *)priv,
+					      (uint16_t) (((rsize) << 4)));
 			}
-			if(rw_data&WSTATUS_MASK){
+			if (rw_data & WSTATUS_MASK) {
 #if 0
-				if(status&INT_WRITE_STATUS && !cnt_txqbody(priv)){
+				if (status & INT_WRITE_STATUS
+				    && !cnt_txqbody(priv)) {
 					/* dummy write for interrupt clear */
-					rw_data =0;
-					retval = ks7010_sdio_write(priv, DATA_WINDOW, &rw_data, sizeof(rw_data));
+					rw_data = 0;
+					retval =
+					    ks7010_sdio_write(priv, DATA_WINDOW,
+							      &rw_data,
+							      sizeof(rw_data));
 					if (retval) {
-						DPRINTK(1, "write DATA_WINDOW Failed!!(%d)\n",retval);
+						DPRINTK(1,
+							"write DATA_WINDOW Failed!!(%d)\n",
+							retval);
 					}
 					status &= ~INT_WRITE_STATUS;
-				}
-				else{
+				} else {
 #endif
-					if(atomic_read(&priv->psstatus.status)==PS_SNOOZE){
-						if(cnt_txqbody(priv)){
+					if (atomic_read(&priv->psstatus.status) == PS_SNOOZE) {
+						if (cnt_txqbody(priv)) {
 							ks_wlan_hw_wakeup_request(priv);
-							queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq, &priv->ks_wlan_hw.rw_wq, 1);
+							queue_delayed_work
+							    (priv->ks_wlan_hw.
+							     ks7010sdio_wq,
+							     &priv->ks_wlan_hw.
+							     rw_wq, 1);
 							return;
 						}
-					}
-					else{
+					} else {
 						tx_device_task((void *)priv);
 					}
-//				}
+#if 0
+				}
+#endif
 			}
-		}while(rsize);
+		} while (rsize);
 	}
 
-intr_out:
-	queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,&priv->ks_wlan_hw.rw_wq, 0);
+ intr_out:
+	queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
+			   &priv->ks_wlan_hw.rw_wq, 0);
 	return;
 }
 
-static int trx_device_init( struct ks_wlan_private *priv )
+static int trx_device_init(struct ks_wlan_private *priv)
 {
 	/* initialize values (tx) */
 	priv->tx_dev.qtail = priv->tx_dev.qhead = 0;
@@ -655,21 +714,22 @@ static int trx_device_init( struct ks_wlan_private *priv )
 	spin_lock_init(&priv->tx_dev.tx_dev_lock);
 	spin_lock_init(&priv->rx_dev.rx_dev_lock);
 
-	tasklet_init(&priv->ks_wlan_hw.rx_bh_task, rx_event_task, (unsigned long)priv);
+	tasklet_init(&priv->ks_wlan_hw.rx_bh_task, rx_event_task,
+		     (unsigned long)priv);
 
 	return 0;
 }
 
-static void trx_device_exit( struct ks_wlan_private *priv )
+static void trx_device_exit(struct ks_wlan_private *priv)
 {
-	struct tx_device_buffer	*sp;
+	struct tx_device_buffer *sp;
 
 	/* tx buffer clear */
-	while (cnt_txqbody(priv)>0) {
+	while (cnt_txqbody(priv) > 0) {
 		sp = &priv->tx_dev.tx_dev_buff[priv->tx_dev.qhead];
-		kfree(sp->sendp); /* allocated memory free */
-		if (sp->complete_handler != NULL) /* TX Complete */
-			(*sp->complete_handler)(sp->arg1, sp->arg2);
+		kfree(sp->sendp);	/* allocated memory free */
+		if (sp->complete_handler != NULL)	/* TX Complete */
+			(*sp->complete_handler) (sp->arg1, sp->arg2);
 		inc_txqhead(priv);
 	}
 
@@ -677,24 +737,35 @@ static void trx_device_exit( struct ks_wlan_private *priv )
 
 	return;
 }
+
 static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
 {
-	int rc=0;
+	int rc = 0;
 	int retval;
 	unsigned char *data_buf;
 	data_buf = NULL;
 
 	data_buf = kmalloc(sizeof(u32), GFP_KERNEL);
-	if(!data_buf){ rc = 1; goto error_out; }
+	if (!data_buf) {
+		rc = 1;
+		goto error_out;
+	}
 
 	memcpy(data_buf, &index, sizeof(index));
 	retval = ks7010_sdio_write(priv, WRITE_INDEX, data_buf, sizeof(index));
-	if(retval){ rc = 2; goto error_out; }
+	if (retval) {
+		rc = 2;
+		goto error_out;
+	}
 
 	retval = ks7010_sdio_write(priv, READ_INDEX, data_buf, sizeof(index));
-	if(retval){ rc = 3; goto error_out; }
-error_out:
-	if(data_buf) kfree(data_buf);
+	if (retval) {
+		rc = 3;
+		goto error_out;
+	}
+ error_out:
+	if (data_buf)
+		kfree(data_buf);
 	return rc;
 }
 
@@ -702,30 +773,41 @@ error_out:
 static int ks7010_sdio_data_compare(struct ks_wlan_private *priv, u32 address,
 				    unsigned char *data, unsigned int size)
 {
-	int rc=0;
+	int rc = 0;
 	int retval;
 	unsigned char *read_buf;
 	read_buf = NULL;
 	read_buf = kmalloc(ROM_BUFF_SIZE, GFP_KERNEL);
-	if(!read_buf){ rc = 1; goto error_out; }
+	if (!read_buf) {
+		rc = 1;
+		goto error_out;
+	}
 	retval = ks7010_sdio_read(priv, address, read_buf, size);
-	if(retval){ rc = 2; goto error_out; }
+	if (retval) {
+		rc = 2;
+		goto error_out;
+	}
 	retval = memcmp(data, read_buf, size);
 
-	if(retval){
-		DPRINTK(0, "data compare error (%d) \n",retval); rc = 3; goto error_out;
+	if (retval) {
+		DPRINTK(0, "data compare error (%d) \n", retval);
+		rc = 3;
+		goto error_out;
 	}
-error_out:
-	if(read_buf) kfree(read_buf);
+ error_out:
+	if (read_buf)
+		kfree(read_buf);
 	return rc;
 }
+
 #include <linux/firmware.h>
-static int ks79xx_upload_firmware(struct ks_wlan_private *priv, struct ks_sdio_card *card)
+static int ks79xx_upload_firmware(struct ks_wlan_private *priv,
+				  struct ks_sdio_card *card)
 {
-	unsigned int	size, offset,  n = 0;
-	unsigned char	*rom_buf;
-	unsigned char rw_data =0;
-	int retval, rc=0;
+	unsigned int size, offset, n = 0;
+	unsigned char *rom_buf;
+	unsigned char rw_data = 0;
+	int retval, rc = 0;
 	int length;
 	const struct firmware *fw_entry = NULL;
 
@@ -733,76 +815,99 @@ static int ks79xx_upload_firmware(struct ks_wlan_private *priv, struct ks_sdio_c
 
 	/* buffer allocate */
 	rom_buf = kmalloc(ROM_BUFF_SIZE, GFP_KERNEL);
-	if(!rom_buf){ rc = 3; goto error_out0; }
-
+	if (!rom_buf) {
+		rc = 3;
+		goto error_out0;
+	}
 
 	sdio_claim_host(card->func);
 
 	/* Firmware running ? */
 	retval = ks7010_sdio_read(priv, GCR_A, &rw_data, sizeof(rw_data));
-	if(rw_data == GCR_A_RUN){
-		DPRINTK( 0, "MAC firmware running ...\n");
+	if (rw_data == GCR_A_RUN) {
+		DPRINTK(0, "MAC firmware running ...\n");
 		rc = 0;
 		goto error_out0;
 	}
 
-	if(request_firmware(&fw_entry, priv->reg.rom_file, &priv->ks_wlan_hw.sdio_card->func->dev)!=0){
-		DPRINTK(1,"error request_firmware() file=%s\n", priv->reg.rom_file);
+	if (request_firmware
+	    (&fw_entry, priv->reg.rom_file,
+	     &priv->ks_wlan_hw.sdio_card->func->dev) != 0) {
+		DPRINTK(1, "error request_firmware() file=%s\n",
+			priv->reg.rom_file);
 		return 1;
 	}
-	DPRINTK(4,"success request_firmware() file=%s size=%zu\n", priv->reg.rom_file, fw_entry->size);
+	DPRINTK(4, "success request_firmware() file=%s size=%zu\n",
+		priv->reg.rom_file, fw_entry->size);
 	length = fw_entry->size;
 
 	/* Load Program */
 	n = 0;
-        do {
-		if(length >= ROM_BUFF_SIZE){
+	do {
+		if (length >= ROM_BUFF_SIZE) {
 			size = ROM_BUFF_SIZE;
 			length = length - ROM_BUFF_SIZE;
+		} else {
+			size = length;
+			length = 0;
 		}
-		else{
-			size=length;
-			length=0;
-		}
-		DPRINTK(4, "size = %d\n",size);
-		if(size == 0) break;
-		memcpy(rom_buf,fw_entry->data+n,size);
+		DPRINTK(4, "size = %d\n", size);
+		if (size == 0)
+			break;
+		memcpy(rom_buf, fw_entry->data + n, size);
 		/* Update write index */
 		offset = n;
-		retval = ks7010_sdio_update_index(priv, KS7010_IRAM_ADDRESS+offset);
-		if(retval){ rc = 6; goto error_out1; }
+		retval =
+		    ks7010_sdio_update_index(priv,
+					     KS7010_IRAM_ADDRESS + offset);
+		if (retval) {
+			rc = 6;
+			goto error_out1;
+		}
 
 		/* Write data */
 		retval = ks7010_sdio_write(priv, DATA_WINDOW, rom_buf, size);
-		if(retval){ rc = 8; goto error_out1; }
+		if (retval) {
+			rc = 8;
+			goto error_out1;
+		}
 
 		/* compare */
-		retval = ks7010_sdio_data_compare(priv, DATA_WINDOW, rom_buf, size);
-		if(retval){ rc = 9; goto error_out1; }
+		retval =
+		    ks7010_sdio_data_compare(priv, DATA_WINDOW, rom_buf, size);
+		if (retval) {
+			rc = 9;
+			goto error_out1;
+		}
 		n += size;
 
-       }while(size);
+	} while (size);
 
 	/* Remap request */
 	rw_data = GCR_A_REMAP;
 	retval = ks7010_sdio_write(priv, GCR_A, &rw_data, sizeof(rw_data));
-	if(retval){
+	if (retval) {
 		rc = 11;
 		goto error_out1;
 	}
-	DPRINTK( 4, " REMAP Request : GCR_A=%02X\n", rw_data);
+	DPRINTK(4, " REMAP Request : GCR_A=%02X\n", rw_data);
 
 	/* Firmware running check */
 	for (n = 0; n < 50; ++n) {
-		mdelay(10);/* wait_ms(10); */
-		retval = ks7010_sdio_read(priv, GCR_A, &rw_data, sizeof(rw_data));
-		if(retval){ rc = 11; goto error_out1; }
-		if(rw_data == GCR_A_RUN) break;
+		mdelay(10);	/* wait_ms(10); */
+		retval =
+		    ks7010_sdio_read(priv, GCR_A, &rw_data, sizeof(rw_data));
+		if (retval) {
+			rc = 11;
+			goto error_out1;
+		}
+		if (rw_data == GCR_A_RUN)
+			break;
 	}
-	DPRINTK(4, "firmware wakeup (%d)!!!!\n",n);
+	DPRINTK(4, "firmware wakeup (%d)!!!!\n", n);
 	if ((50) <= n) {
 		DPRINTK(1, "firmware can't start\n");
-                rc = 12;
+		rc = 12;
 		goto error_out1;
 	}
 
@@ -812,30 +917,31 @@ static int ks79xx_upload_firmware(struct ks_wlan_private *priv, struct ks_sdio_c
 	release_firmware(fw_entry);
  error_out0:
 	sdio_release_host(card->func);
-	if(rom_buf)
+	if (rom_buf)
 		kfree(rom_buf);
 	return rc;
 }
 
 static void ks7010_card_init(struct ks_wlan_private *priv)
 {
-	DPRINTK(5,"\ncard_init_task()\n");
+	DPRINTK(5, "\ncard_init_task()\n");
 
 	/* init_waitqueue_head(&priv->confirm_wait); */
 	init_completion(&priv->confirm_wait);
 
-	DPRINTK(5,"init_completion()\n");
+	DPRINTK(5, "init_completion()\n");
 
 	/* get mac address & firmware version */
 	hostif_sme_enqueue(priv, SME_START);
 
-	DPRINTK(5,"hostif_sme_enqueu()\n");
+	DPRINTK(5, "hostif_sme_enqueu()\n");
 
-	if(!wait_for_completion_interruptible_timeout(&priv->confirm_wait,5*HZ)){
-		DPRINTK(1,"wait time out!! SME_START\n");
+	if (!wait_for_completion_interruptible_timeout
+	    (&priv->confirm_wait, 5 * HZ)) {
+		DPRINTK(1, "wait time out!! SME_START\n");
 	}
 
-	if(priv->mac_address_valid && priv->version_size){
+	if (priv->mac_address_valid && priv->version_size) {
 		priv->dev_state = DEVICE_STATE_PREINIT;
 	}
 
@@ -858,57 +964,56 @@ static void ks7010_card_init(struct ks_wlan_private *priv)
 	hostif_sme_enqueue(priv, SME_MODE_SET_REQUEST);
 	hostif_sme_enqueue(priv, SME_START_REQUEST);
 
-	if(!wait_for_completion_interruptible_timeout(&priv->confirm_wait,5*HZ)){
-		DPRINTK(1,"wait time out!! wireless parameter set\n");
+	if (!wait_for_completion_interruptible_timeout
+	    (&priv->confirm_wait, 5 * HZ)) {
+		DPRINTK(1, "wait time out!! wireless parameter set\n");
 	}
 
-	if(priv->dev_state >= DEVICE_STATE_PREINIT){
+	if (priv->dev_state >= DEVICE_STATE_PREINIT) {
 		DPRINTK(1, "DEVICE READY!!\n");
 		priv->dev_state = DEVICE_STATE_READY;
-		reg_net = register_netdev (priv->net_dev);
-		DPRINTK(3, "register_netdev=%d\n",reg_net);
-	}
-	else {
-		DPRINTK(1, "dev_state=%d\n",priv->dev_state);
+		reg_net = register_netdev(priv->net_dev);
+		DPRINTK(3, "register_netdev=%d\n", reg_net);
+	} else {
+		DPRINTK(1, "dev_state=%d\n", priv->dev_state);
 	}
 }
 
 static struct sdio_driver ks7010_sdio_driver = {
-	.name		= "ks7910_sdio",
-	.id_table	= if_sdio_ids,
-	.probe		= ks7910_sdio_probe,
-	.remove		= ks7910_sdio_remove,
+	.name = "ks7910_sdio",
+	.id_table = if_sdio_ids,
+	.probe = ks7910_sdio_probe,
+	.remove = ks7910_sdio_remove,
 };
 
-
 extern int ks_wlan_net_start(struct net_device *dev);
 extern int ks_wlan_net_stop(struct net_device *dev);
 
-static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id *device)
+static int ks7910_sdio_probe(struct sdio_func *func,
+			     const struct sdio_device_id *device)
 {
 	struct ks_wlan_private *priv;
 	struct ks_sdio_card *card;
 	struct net_device *netdev;
 	unsigned char rw_data;
-	int i=0, ret;
+	int i = 0, ret;
 
 	DPRINTK(5, "ks7910_sdio_probe()\n");
 
 	priv = NULL;
-	netdev=NULL;
-
+	netdev = NULL;
 
 	/* initilize ks_sdio_card */
 	card = kzalloc(sizeof(struct ks_sdio_card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
 
-	card->func  = func;
+	card->func = func;
 	card->model = 0x10;
 	spin_lock_init(&card->lock);
 
 	/* select model */
-	for (i = 0;i < ARRAY_SIZE(ks_sdio_models);i++) {
+	for (i = 0; i < ARRAY_SIZE(ks_sdio_models); i++) {
 		if (card->model == ks_sdio_models[i].model)
 			break;
 	}
@@ -920,7 +1025,6 @@ static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id
 
 	card->firmware = ks_sdio_models[i].firmware;
 
-
 	/*** Initialize  SDIO ***/
 	sdio_claim_host(func);
 
@@ -929,7 +1033,8 @@ static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id
 
 	/* function blocksize set */
 	ret = sdio_set_block_size(func, KS7010_IO_BLOCK_SIZE);
-	DPRINTK(5, "multi_block=%d sdio_set_block_size()=%d %d\n", func->card->cccr.multi_block, func->cur_blksize,  ret);
+	DPRINTK(5, "multi_block=%d sdio_set_block_size()=%d %d\n",
+		func->card->cccr.multi_block, func->cur_blksize, ret);
 
 	/* Allocate the slot current */
 
@@ -940,10 +1045,10 @@ static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id
 		goto error_free_card;
 
 	/* interrupt disable */
-	sdio_writeb(func, 0, INT_ENABLE,  &ret);
+	sdio_writeb(func, 0, INT_ENABLE, &ret);
 	if (ret)
 		goto error_free_card;
-	sdio_writeb(func, 0xff, INT_PENDING,  &ret);
+	sdio_writeb(func, 0xff, INT_PENDING, &ret);
 	if (ret)
 		goto error_disable_func;
 
@@ -957,18 +1062,16 @@ static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id
 	sdio_set_drvdata(func, card);
 
 	DPRINTK(5, "class = 0x%X, vendor = 0x%X, "
-		"device = 0x%X\n",
-		func->class, func->vendor, func->device);
-
+		"device = 0x%X\n", func->class, func->vendor, func->device);
 
 	/* private memory allocate */
 	netdev = alloc_etherdev(sizeof(*priv));
 	if (netdev == NULL) {
-		printk (KERN_ERR "ks79xx : Unable to alloc new net device\n");
+		printk(KERN_ERR "ks79xx : Unable to alloc new net device\n");
 		goto error_release_irq;
 	}
 	if (dev_alloc_name(netdev, netdev->name) < 0) {
-		printk (KERN_ERR "ks79xx :  Couldn't get name!\n");
+		printk(KERN_ERR "ks79xx :  Couldn't get name!\n");
 		goto error_free_netdev;
 	}
 
@@ -982,7 +1085,7 @@ static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id
 	init_completion(&priv->ks_wlan_hw.ks7010_sdio_wait);
 	priv->ks_wlan_hw.read_buf = NULL;
 	priv->ks_wlan_hw.read_buf = kmalloc(RX_DATA_SIZE, GFP_KERNEL);
-	if(!priv->ks_wlan_hw.read_buf){
+	if (!priv->ks_wlan_hw.read_buf) {
 		goto error_free_netdev;
 	}
 	priv->dev_state = DEVICE_STATE_PREBOOT;
@@ -995,25 +1098,29 @@ static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id
 	memset(&priv->wstats, 0, sizeof(priv->wstats));
 
 	/* sleep mode */
-	atomic_set(&priv->sleepstatus.doze_request,0);
-	atomic_set(&priv->sleepstatus.wakeup_request,0);
-	atomic_set(&priv->sleepstatus.wakeup_request,0);
+	atomic_set(&priv->sleepstatus.doze_request, 0);
+	atomic_set(&priv->sleepstatus.wakeup_request, 0);
+	atomic_set(&priv->sleepstatus.wakeup_request, 0);
 
 	trx_device_init(priv);
 	hostif_init(priv);
-        ks_wlan_net_start(netdev);
+	ks_wlan_net_start(netdev);
 
 	/* Read config file */
 	ret = ks_wlan_read_config_file(priv);
 	if (ret) {
-		printk(KERN_ERR "ks79xx: read configuration file failed !! retern code = %d\n", ret);
+		printk(KERN_ERR
+		       "ks79xx: read configuration file failed !! retern code = %d\n",
+		       ret);
 		goto error_free_read_buf;
 	}
 
 	/* Upload firmware */
-	ret = ks79xx_upload_firmware(priv, card); /* firmware load */
-	if(ret){
-		printk(KERN_ERR "ks79xx: firmware load failed !! retern code = %d\n", ret);
+	ret = ks79xx_upload_firmware(priv, card);	/* firmware load */
+	if (ret) {
+		printk(KERN_ERR
+		       "ks79xx: firmware load failed !! retern code = %d\n",
+		       ret);
 		goto error_free_read_buf;
 	}
 
@@ -1023,25 +1130,24 @@ static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id
 	sdio_claim_host(func);
 	ret = ks7010_sdio_write(priv, INT_PENDING, &rw_data, sizeof(rw_data));
 	sdio_release_host(func);
-	if(ret){
+	if (ret) {
 		DPRINTK(1, " error : INT_PENDING=%02X\n", rw_data);
 	}
 	DPRINTK(4, " clear Interrupt : INT_PENDING=%02X\n", rw_data);
 
-
 	/* enable ks7010sdio interrupt (INT_GCR_B|INT_READ_STATUS|INT_WRITE_STATUS) */
-	rw_data = (INT_GCR_B|INT_READ_STATUS|INT_WRITE_STATUS);
+	rw_data = (INT_GCR_B | INT_READ_STATUS | INT_WRITE_STATUS);
 	sdio_claim_host(func);
 	ret = ks7010_sdio_write(priv, INT_ENABLE, &rw_data, sizeof(rw_data));
 	sdio_release_host(func);
-	if(ret){
+	if (ret) {
 		DPRINTK(1, " error : INT_ENABLE=%02X\n", rw_data);
 	}
 	DPRINTK(4, " enable Interrupt : INT_ENABLE=%02X\n", rw_data);
 	priv->dev_state = DEVICE_STATE_BOOT;
 
 	priv->ks_wlan_hw.ks7010sdio_wq = create_workqueue("ks7010sdio_wq");
-	if(!priv->ks_wlan_hw.ks7010sdio_wq){
+	if (!priv->ks_wlan_hw.ks7010sdio_wq) {
 		DPRINTK(1, "create_workqueue failed !!\n");
 		goto error_free_read_buf;
 	}
@@ -1051,22 +1157,22 @@ static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id
 
 	return 0;
 
-error_free_read_buf:
+ error_free_read_buf:
 	kfree(priv->ks_wlan_hw.read_buf);
 	priv->ks_wlan_hw.read_buf = NULL;
-error_free_netdev:
+ error_free_netdev:
 	free_netdev(priv->net_dev);
 	card->priv = NULL;
-error_release_irq:
+ error_release_irq:
 	sdio_claim_host(func);
 	sdio_release_irq(func);
-error_disable_func:
+ error_disable_func:
 	sdio_disable_func(func);
-error_free_card:
+ error_free_card:
 	sdio_release_host(func);
 	sdio_set_drvdata(func, NULL);
 	kfree(card);
-error:
+ error:
 	return -ENODEV;
 }
 
@@ -1080,56 +1186,62 @@ static void ks7910_sdio_remove(struct sdio_func *func)
 
 	card = sdio_get_drvdata(func);
 
-	if(card == NULL)
+	if (card == NULL)
 		return;
 
 	DPRINTK(1, "priv = card->priv\n");
 	priv = card->priv;
 	netdev = priv->net_dev;
-	if(priv){
+	if (priv) {
 		ks_wlan_net_stop(netdev);
 		DPRINTK(1, "ks_wlan_net_stop\n");
 
 		/* interrupt disable */
 		sdio_claim_host(func);
-		sdio_writeb(func, 0, INT_ENABLE,  &ret);
-		sdio_writeb(func, 0xff, INT_PENDING,  &ret);
+		sdio_writeb(func, 0, INT_ENABLE, &ret);
+		sdio_writeb(func, 0xff, INT_PENDING, &ret);
 		sdio_release_host(func);
 		DPRINTK(1, "interrupt disable\n");
 
 		/* send stop request to MAC */
 		{
 			struct hostif_stop_request_t *pp;
-			pp = (struct hostif_stop_request_t *)kzalloc(hif_align_size(sizeof(*pp)), GFP_KERNEL );
-			if (pp==NULL) {
-				DPRINTK(3,"allocate memory failed..\n");
-				return; /* to do goto ni suru*/
+			pp = (struct hostif_stop_request_t *)
+			    kzalloc(hif_align_size(sizeof(*pp)), GFP_KERNEL);
+			if (pp == NULL) {
+				DPRINTK(3, "allocate memory failed..\n");
+				return;	/* to do goto ni suru */
 			}
-			pp->header.size	= cpu_to_le16((uint16_t)(sizeof(*pp)-sizeof(pp->header.size)));
-			pp->header.event = cpu_to_le16((uint16_t)HIF_STOP_REQ);
+			pp->header.size =
+			    cpu_to_le16((uint16_t)
+					(sizeof(*pp) -
+					 sizeof(pp->header.size)));
+			pp->header.event = cpu_to_le16((uint16_t) HIF_STOP_REQ);
 
 			sdio_claim_host(func);
-			write_to_device(priv, (unsigned char *) pp, hif_align_size(sizeof(*pp)));
+			write_to_device(priv, (unsigned char *)pp,
+					hif_align_size(sizeof(*pp)));
 			sdio_release_host(func);
 			kfree(pp);
 		}
 		DPRINTK(1, "STOP Req\n");
 
-		if(priv->ks_wlan_hw.ks7010sdio_wq){
+		if (priv->ks_wlan_hw.ks7010sdio_wq) {
 			flush_workqueue(priv->ks_wlan_hw.ks7010sdio_wq);
 			destroy_workqueue(priv->ks_wlan_hw.ks7010sdio_wq);
 		}
-		DPRINTK(1, "destroy_workqueue(priv->ks_wlan_hw.ks7010sdio_wq);\n");
+		DPRINTK(1,
+			"destroy_workqueue(priv->ks_wlan_hw.ks7010sdio_wq);\n");
 
 		hostif_exit(priv);
 		DPRINTK(1, "hostif_exit\n");
 
-		if(!reg_net)
+		if (!reg_net)
 			unregister_netdev(netdev);
 		DPRINTK(1, "unregister_netdev\n");
 
 		trx_device_exit(priv);
-		if(priv->ks_wlan_hw.read_buf){
+		if (priv->ks_wlan_hw.read_buf) {
 			kfree(priv->ks_wlan_hw.read_buf);
 		}
 		free_netdev(priv->net_dev);
@@ -1148,26 +1260,27 @@ static void ks7910_sdio_remove(struct sdio_func *func)
 	kfree(card);
 	DPRINTK(1, "kfree()\n");
 
-
-	DPRINTK(5," Bye !!\n");
+	DPRINTK(5, " Bye !!\n");
 	return;
 }
 
-static int __init ks7010_sdio_init( void )
+static int __init ks7010_sdio_init(void)
 {
 	int status;
 
 	/* register with bus driver core */
 	status = sdio_register_driver(&ks7010_sdio_driver);
-	if(status != 0){
-		DPRINTK(1,"ks79xx_sdio : failed to register with bus driver, %d\n", status );
+	if (status != 0) {
+		DPRINTK(1,
+			"ks79xx_sdio : failed to register with bus driver, %d\n",
+			status);
 	}
 	return status;
 }
 
-static void __exit ks7010_sdio_exit( void )
+static void __exit ks7010_sdio_exit(void)
 {
-	DPRINTK(5," \n");
+	DPRINTK(5, " \n");
 	sdio_unregister_driver(&ks7010_sdio_driver);
 	return;
 }
-- 
2.8.1
