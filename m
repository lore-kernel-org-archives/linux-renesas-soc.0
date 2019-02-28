Return-Path: <SRS0=CNOd=RD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC2BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 11:05:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0806221850
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 11:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731126AbfB1LFR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Feb 2019 06:05:17 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:44074 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731073AbfB1LFR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Feb 2019 06:05:17 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id iB5F1z00R3XaVaC06B5FBD; Thu, 28 Feb 2019 12:05:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gzJV5-0007Tm-2D; Thu, 28 Feb 2019 12:05:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gzJV5-0000UP-0R; Thu, 28 Feb 2019 12:05:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: sh-msiof: Restrict bits per word to 8/16/24/32 on R-Car Gen2/3
Date:   Thu, 28 Feb 2019 12:05:13 +0100
Message-Id: <20190228110513.1833-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While the MSIOF variants in older SuperH and SH/R-Mobile SoCs support
bits-per-word values in the full range 8..32, the variants present in
R-Car Gen2 and Gen3 SoCs are restricted to 8, 16, 24, or 32.

Obtain the value from family-specific sh_msiof_chipdata to fix this.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on SH-Mobile AG5 with 12 bits per word.

 drivers/spi/spi-sh-msiof.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 6e83368874839d09..48535e95102c9b08 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -32,6 +32,7 @@
 #include <asm/unaligned.h>
 
 struct sh_msiof_chipdata {
+	u32 bits_per_word_mask;
 	u16 tx_fifo_size;
 	u16 rx_fifo_size;
 	u16 ctlr_flags;
@@ -1072,6 +1073,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
 }
 
 static const struct sh_msiof_chipdata sh_data = {
+	.bits_per_word_mask = SPI_BPW_RANGE_MASK(8, 32),
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
 	.ctlr_flags = 0,
@@ -1079,6 +1081,8 @@ static const struct sh_msiof_chipdata sh_data = {
 };
 
 static const struct sh_msiof_chipdata rcar_gen2_data = {
+	.bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
+			      SPI_BPW_MASK(24) | SPI_BPW_MASK(32),
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
 	.ctlr_flags = SPI_CONTROLLER_MUST_TX,
@@ -1086,6 +1090,8 @@ static const struct sh_msiof_chipdata rcar_gen2_data = {
 };
 
 static const struct sh_msiof_chipdata rcar_gen3_data = {
+	.bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
+			      SPI_BPW_MASK(24) | SPI_BPW_MASK(32),
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
 	.ctlr_flags = SPI_CONTROLLER_MUST_TX,
@@ -1410,7 +1416,7 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	ctlr->setup = sh_msiof_spi_setup;
 	ctlr->prepare_message = sh_msiof_prepare_message;
 	ctlr->slave_abort = sh_msiof_slave_abort;
-	ctlr->bits_per_word_mask = SPI_BPW_RANGE_MASK(8, 32);
+	ctlr->bits_per_word_mask = chipdata->bits_per_word_mask;
 	ctlr->auto_runtime_pm = true;
 	ctlr->transfer_one = sh_msiof_transfer_one;
 
-- 
2.17.1

