Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:42003 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751745AbcEaK56 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:58 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 26/31] staging: ks7010: remove supported card table with one element
Date: Tue, 31 May 2016 12:56:38 +0200
Message-Id: <1464692203-4180-27-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

There is only this card supported, no need to iterate over the table.
The resulting firmware filename wasn't used anyway, but came from the
config file or hardcoded default.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_sdio.c | 31 ++-----------------------------
 drivers/staging/ks7010/ks7010_sdio.h |  2 --
 2 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index ed4d579300ad96..8e8476b52cedbc 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -35,19 +35,6 @@ static const struct sdio_device_id if_sdio_ids[] = {
 	{ /* all zero */ }
 };
 
-struct ks_sdio_model {
-	int model;
-	const char *firmware;
-};
-
-static struct ks_sdio_model ks_sdio_models[] = {
-	{
-		/* ks7010 */
-		.model = 0x10,
-		.firmware = "ks7010sd.rom",
-	},
-};
-
 static int ks7910_sdio_probe(struct sdio_func *function,
 			     const struct sdio_device_id *device);
 static void ks7910_sdio_remove(struct sdio_func *function);
@@ -996,7 +983,7 @@ static int ks7910_sdio_probe(struct sdio_func *func,
 	struct ks_sdio_card *card;
 	struct net_device *netdev;
 	unsigned char rw_data;
-	int i = 0, ret;
+	int ret;
 
 	DPRINTK(5, "ks7910_sdio_probe()\n");
 
@@ -1009,22 +996,8 @@ static int ks7910_sdio_probe(struct sdio_func *func,
 		return -ENOMEM;
 
 	card->func = func;
-	card->model = 0x10;
 	spin_lock_init(&card->lock);
 
-	/* select model */
-	for (i = 0; i < ARRAY_SIZE(ks_sdio_models); i++) {
-		if (card->model == ks_sdio_models[i].model)
-			break;
-	}
-
-	if (i == ARRAY_SIZE(ks_sdio_models)) {
-		DPRINTK(5, "unkown card model 0x%x\n", card->model);
-		goto error;
-	}
-
-	card->firmware = ks_sdio_models[i].firmware;
-
 	/*** Initialize  SDIO ***/
 	sdio_claim_host(func);
 
@@ -1172,7 +1145,7 @@ static int ks7910_sdio_probe(struct sdio_func *func,
 	sdio_release_host(func);
 	sdio_set_drvdata(func, NULL);
 	kfree(card);
- error:
+
 	return -ENODEV;
 }
 
diff --git a/drivers/staging/ks7010/ks7010_sdio.h b/drivers/staging/ks7010/ks7010_sdio.h
index aea3727caf483b..2d7be5dae157c7 100644
--- a/drivers/staging/ks7010/ks7010_sdio.h
+++ b/drivers/staging/ks7010/ks7010_sdio.h
@@ -109,8 +109,6 @@ struct ks_sdio_packet {
 struct ks_sdio_card {
 	struct sdio_func *func;
 	struct ks_wlan_private *priv;
-	int model;
-	const char *firmware;
 	spinlock_t lock;
 };
 
-- 
2.8.1
