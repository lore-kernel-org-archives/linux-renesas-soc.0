Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from condef-03.nifty.com ([202.248.20.68]:20896 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753730AbdKXQhc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Nov 2017 11:37:32 -0500
Received: from conuserg-11.nifty.com ([10.126.8.74])by condef-03.nifty.com with ESMTP id vAOGQ6hC013753
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Nov 2017 01:26:10 +0900
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Simon Horman <simon.horman@netronome.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 15/22] mmc: tmio: change bus_shift to unsigned int
Date: Sat, 25 Nov 2017 01:24:50 +0900
Message-Id: <1511540697-27387-16-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1511540697-27387-1-git-send-email-yamada.masahiro@socionext.com>
References: <1511540697-27387-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sane values for bus_shift are:
   0 - for 16 bit bus
   1 - for 32 bit bus
   2 - for 64 bit bus

"unsigned long" is too much.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mmc/host/tmio_mmc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 9f083dc..27894474 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -139,7 +139,7 @@ struct tmio_mmc_host {
 	struct scatterlist      *sg_orig;
 	unsigned int            sg_len;
 	unsigned int            sg_off;
-	unsigned long		bus_shift;
+	unsigned int		bus_shift;
 
 	struct platform_device *pdev;
 	struct tmio_mmc_data *pdata;
-- 
2.7.4
