Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40087 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387580AbeKFHBX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 02:01:23 -0500
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mmc: renesas_sdhi: Whitelist R8A77990 SDHI
Date: Mon,  5 Nov 2018 22:39:35 +0100
Message-Id: <20181105213935.11572-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Whitelist R8A77990 E3 SoC in the SDHI driver. The SDHI core
present in the SoC is an 8tap variant of the Gen3 SDHI core.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index b6f54102bfdd..ede7eec9b9aa 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -304,6 +304,7 @@ static const struct soc_device_attribute soc_whitelist[] = {
 	{ .soc_id = "r8a77965" },
 	{ .soc_id = "r8a77970" },
 	{ .soc_id = "r8a77980" },
+	{ .soc_id = "r8a77990" },
 	{ .soc_id = "r8a77995" },
 	{ /* sentinel */ }
 };
-- 
2.18.0
