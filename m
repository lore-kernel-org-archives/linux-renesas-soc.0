Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:47546 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750957AbdGLN2Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 09:28:24 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2] mmc: tmio-mmc: fix bad pointer math
Date: Wed, 12 Jul 2017 06:27:01 -0700
Message-Id: <20170712132701.69983-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The existing code gives an incorrect pointer value.
The buffer pointer 'buf' was of type unsigned short *, and 'count' was a
number in bytes. A cast of buf should have been used.

However,instead of casting, just change the code to use u32 pointers.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 8185e51f358a: ("mmc: tmio-mmc: add support for 32bit data port")
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * Use u32 pointers instead of casting
---
 drivers/mmc/host/tmio_mmc_core.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 77e7b56a9099..e4e35b6e2db5 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -415,30 +415,31 @@ static void tmio_mmc_transfer_data(struct tmio_mmc_host *host,
 	 * Transfer the data
 	 */
 	if (host->pdata->flags & TMIO_MMC_32BIT_DATA_PORT) {
-		u8 data[4] = { };
+		u32 data = 0;
+		u32 *buf32 = (u32 *)buf;
 
 		if (is_read)
-			sd_ctrl_read32_rep(host, CTL_SD_DATA_PORT, (u32 *)buf,
+			sd_ctrl_read32_rep(host, CTL_SD_DATA_PORT, buf32,
 					   count >> 2);
 		else
-			sd_ctrl_write32_rep(host, CTL_SD_DATA_PORT, (u32 *)buf,
+			sd_ctrl_write32_rep(host, CTL_SD_DATA_PORT, buf32,
 					    count >> 2);
 
 		/* if count was multiple of 4 */
 		if (!(count & 0x3))
 			return;
 
-		buf8 = (u8 *)(buf + (count >> 2));
+		buf32 += count >> 2;
 		count %= 4;
 
 		if (is_read) {
 			sd_ctrl_read32_rep(host, CTL_SD_DATA_PORT,
-					   (u32 *)data, 1);
-			memcpy(buf8, data, count);
+					   &data, 1);
+			memcpy(buf32, &data, count);
 		} else {
-			memcpy(data, buf8, count);
+			memcpy(&data, buf32, count);
 			sd_ctrl_write32_rep(host, CTL_SD_DATA_PORT,
-					    (u32 *)data, 1);
+					    &data, 1);
 		}
 
 		return;
-- 
2.13.0
