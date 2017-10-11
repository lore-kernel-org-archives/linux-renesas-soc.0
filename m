Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:52078 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755487AbdJKAI1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 20:08:27 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC] mmc: tmio: fix tuning for stubborn cards
Date: Wed, 11 Oct 2017 02:08:14 +0200
Message-Id: <20171011000814.21055-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The commit 43b0b361b0170030 ("mmc: tmio: always get number of taps")
changed the behavior of the tuning. Before the commit the SCC was only
enabled for the first tuning attempt (host->init_tuning(host)), if that
failed the hardware where reset and tuning retried. In the second
attempt the SCC where never configured and tuning would succeed for some
stubborn cards. This patch restore this behavior which allows a troubled
card I have to be used.

Without this patch:
sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
sh_mobile_sdhi ee100000.sd: Tuning procedure failed
mmc0: tuning execution failed: -110
mmc0: error -110 whilst initialising SD card
sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
sh_mobile_sdhi ee100000.sd: Tuning procedure failed
mmc0: tuning execution failed: -110
mmc0: error -110 whilst initialising SD card

With this patch:
sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
sh_mobile_sdhi ee100000.sd: Tuning procedure with SCC enabled failed, retry with SCC disabled
mmc0: new ultra high speed SDR50 SDHC card at address aaaa
mmcblk0: mmc0:aaaa SU04G 3.69 GiB
 mmcblk0: p1 p2

Fixes: 43b0b361b0170030 ("mmc: tmio: always get number of taps")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/tmio_mmc_core.c | 50 ++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 17 deletions(-)

Hi Wolfram,

I'm pretty sure this is not a proper fix for the underlying problem, but 
at least it restores the previous behavior and get the card working. I 
mostly post this RFC to share my findings and so we have some code to 
try and help us figure out what really is happening here.

// Niklas

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 12cf8288d6635eaf..e7e6a0f3f2610301 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -819,10 +819,35 @@ static void tmio_mmc_hw_reset(struct mmc_host *mmc)
 		host->hw_reset(host);
 }
 
+static int __tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	unsigned int i;
+	int ret;
+
+	bitmap_zero(host->taps, host->tap_num * 2);
+
+	/* Issue CMD19 twice for each tap */
+	for (i = 0; i < 2 * host->tap_num; i++) {
+		if (host->prepare_tuning)
+			host->prepare_tuning(host, i % host->tap_num);
+
+		ret = mmc_send_tuning(mmc, opcode, NULL);
+		if (ret && ret != -EILSEQ)
+			return ret;
+		if (ret == 0)
+			set_bit(i, host->taps);
+
+		mdelay(1);
+	}
+
+	return host->select_tuning(host);
+}
+
 static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
-	int i, ret = 0;
+	int ret = 0;
 
 	if (!host->init_tuning || !host->select_tuning)
 		/* Tuning is not supported */
@@ -839,24 +864,15 @@ static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 		goto out;
 	}
 
-	bitmap_zero(host->taps, host->tap_num * 2);
-
-	/* Issue CMD19 twice for each tap */
-	for (i = 0; i < 2 * host->tap_num; i++) {
-		if (host->prepare_tuning)
-			host->prepare_tuning(host, i % host->tap_num);
-
-		ret = mmc_send_tuning(mmc, opcode, NULL);
-		if (ret && ret != -EILSEQ)
-			goto out;
-		if (ret == 0)
-			set_bit(i, host->taps);
-
-		mdelay(1);
+	ret = __tmio_mmc_execute_tuning(mmc, opcode);
+	if (ret) {
+		/* Tuning failed with SCC enabled, reset hardware and retry */
+		dev_info(&host->pdev->dev,
+			 "Tuning procedure with SCC enabled failed, retry with SCC disabled\n");
+		host->hw_reset(host);
+		ret = __tmio_mmc_execute_tuning(mmc, opcode);
 	}
 
-	ret = host->select_tuning(host);
-
 out:
 	if (ret < 0) {
 		dev_warn(&host->pdev->dev, "Tuning procedure failed\n");
-- 
2.14.2
