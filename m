Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41960 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751498AbcEaK51 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:27 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 06/31] staging: ks7010: avoid workqueue races
Date: Tue, 31 May 2016 12:56:18 +0200
Message-Id: <1464692203-4180-7-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

My Spectec SDW823 card oopsed when it was already inserted during boot.
When debugging this, I noticed that the card init was done in a seperate
workqueue which was only activated once in probe. After removing the
workqueue and calling the card init directly from probe, the OOPS went
away. It turned out this is the same OOPS which happened when removing
the card, so this seems possible now. Note: There is still a
not-understood card-removed event during boot, but at least it doesn't
crash anymore and the card will be re-probed right away.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/TODO          |  1 -
 drivers/staging/ks7010/ks7010_sdio.c | 28 ++--------------------------
 drivers/staging/ks7010/ks7010_sdio.h |  2 --
 3 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/ks7010/TODO b/drivers/staging/ks7010/TODO
index 390e821efc0bcf..5cbb4ca999747e 100644
--- a/drivers/staging/ks7010/TODO
+++ b/drivers/staging/ks7010/TODO
@@ -28,7 +28,6 @@ Now the TODOs:
   should understand the change you submit.
 - drop using a config file and use an upstream technique for configuration
 - fix the 'card removal' event when card is inserted when booting
-- driver crashes when removing the card
 - check what other upstream wireless mechanisms can be used instead of the
   custom ones here
 
diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 9300658c4aed8d..5b78522fad1ec1 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -817,14 +817,8 @@ static int ks79xx_upload_firmware(ks_wlan_private *priv, struct ks_sdio_card *ca
 	return rc;
 }
 
-static void card_init_task(struct work_struct *work)
+static void ks7010_card_init(struct ks_wlan_private *priv)
 {
-	struct hw_info_t *hw;
-	struct ks_wlan_private *priv;
-
-	hw = container_of(work, struct hw_info_t, init_task);
-	priv = container_of(hw, struct ks_wlan_private, ks_wlan_hw);
-
 	DPRINTK(5,"\ncard_init_task()\n");
 
 	/* init_waitqueue_head(&priv->confirm_wait); */
@@ -1052,23 +1046,11 @@ static int ks7910_sdio_probe(struct sdio_func *func, const struct sdio_device_id
 		goto error_free_read_buf;
 	}
 
-	priv->ks_wlan_hw.ks7010sdio_init = create_singlethread_workqueue("ks7010sdio_init");
-	if(!priv->ks_wlan_hw.ks7010sdio_init){
-		DPRINTK(1, "create_workqueue failed !!\n");
-		goto error_free_sdio_wq;
-	}
-
-	INIT_WORK(&priv->ks_wlan_hw.init_task, card_init_task);
 	INIT_DELAYED_WORK(&priv->ks_wlan_hw.rw_wq, ks7010_rw_function);
-
-	queue_work(priv->ks_wlan_hw.ks7010sdio_init, &priv->ks_wlan_hw.init_task);
+	ks7010_card_init(priv);
 
 	return 0;
 
-error_free_sdio_wq:
-	flush_workqueue(priv->ks_wlan_hw.ks7010sdio_wq);
-	destroy_workqueue(priv->ks_wlan_hw.ks7010sdio_wq);
-	priv->ks_wlan_hw.ks7010sdio_wq = NULL;
 error_free_read_buf:
 	kfree(priv->ks_wlan_hw.read_buf);
 	priv->ks_wlan_hw.read_buf = NULL;
@@ -1139,12 +1121,6 @@ static void ks7910_sdio_remove(struct sdio_func *func)
 		}
 		DPRINTK(1, "destroy_workqueue(priv->ks_wlan_hw.ks7010sdio_wq);\n");
 
-		if(priv->ks_wlan_hw.ks7010sdio_init){
-			flush_workqueue(priv->ks_wlan_hw.ks7010sdio_init);
-			destroy_workqueue(priv->ks_wlan_hw.ks7010sdio_init);
-		}
-		DPRINTK(1, "destroy_workqueue(priv->ks_wlan_hw.ks7010sdio_init);\n");
-
 		hostif_exit(priv);
 		DPRINTK(1, "hostif_exit\n");
 
diff --git a/drivers/staging/ks7010/ks7010_sdio.h b/drivers/staging/ks7010/ks7010_sdio.h
index 5bf01abbf2ab6c..93823837f19e65 100644
--- a/drivers/staging/ks7010/ks7010_sdio.h
+++ b/drivers/staging/ks7010/ks7010_sdio.h
@@ -96,8 +96,6 @@ struct hw_info_t {
 	struct ks_sdio_card *sdio_card;	
 	struct completion ks7010_sdio_wait;
 	struct workqueue_struct *ks7010sdio_wq;
-	struct workqueue_struct *ks7010sdio_init;
-	struct work_struct init_task;
 	struct delayed_work rw_wq;
 	unsigned char	*read_buf;
 	struct tasklet_struct rx_bh_task;
-- 
2.8.1
