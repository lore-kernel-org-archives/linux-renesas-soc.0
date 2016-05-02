Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:33994 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755003AbcEBU0I (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 2 May 2016 16:26:08 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-mmc@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [RFC 1/4] mmc: sh_mobile_sdhi: make clk_update function more compact
Date: Mon,  2 May 2016 22:25:39 +0200
Message-Id: <1462220742-4426-2-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1462220742-4426-1-git-send-email-wsa@the-dreams.de>
References: <1462220742-4426-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Save a few lines, the codebase is large enough.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/sh_mobile_sdhi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sh_mobile_sdhi.c b/drivers/mmc/host/sh_mobile_sdhi.c
index f8ea3d1d6de382..6857e4ba724415 100644
--- a/drivers/mmc/host/sh_mobile_sdhi.c
+++ b/drivers/mmc/host/sh_mobile_sdhi.c
@@ -165,12 +165,9 @@ static unsigned int sh_mobile_sdhi_clk_update(struct tmio_mmc_host *host,
 					      unsigned int new_clock)
 {
 	struct sh_mobile_sdhi *priv = host_to_priv(host);
-	unsigned int freq, best_freq, diff_min, diff;
+	unsigned int freq, diff, best_freq = 0, diff_min = ~0;
 	int i;
 
-	diff_min = ~0;
-	best_freq = 0;
-
 	/*
 	 * We want the bus clock to be as close as possible to, but no
 	 * greater than, new_clock.  As we can divide by 1 << i for
-- 
2.6.2
