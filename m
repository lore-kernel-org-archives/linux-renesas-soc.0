Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:36548 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935277AbcISMto (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 08:49:44 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Dirk Behme <dirk.behme@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 3/6] mmc: rtsx_usb: use new macro for R1 without CRC
Date: Mon, 19 Sep 2016 14:49:18 +0200
Message-Id: <20160919124921.8172-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20160919124921.8172-1-wsa+renesas@sang-engineering.com>
References: <20160919124921.8172-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index 6c71fc9f76c7ec..4106295527b9d0 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -324,7 +324,7 @@ static void sd_send_cmd_get_rsp(struct rtsx_usb_sdmmc *host,
 	case MMC_RSP_R1:
 		rsp_type = SD_RSP_TYPE_R1;
 		break;
-	case MMC_RSP_R1 & ~MMC_RSP_CRC:
+	case MMC_RSP_R1_NO_CRC:
 		rsp_type = SD_RSP_TYPE_R1 | SD_NO_CHECK_CRC7;
 		break;
 	case MMC_RSP_R1B:
-- 
2.9.3
