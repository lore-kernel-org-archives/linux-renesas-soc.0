Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:61719 "EHLO
	relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S934943AbcHENiN (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 09:38:13 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: broonie@kernel.org
Cc: Chris Brandt <chris.brandt@renesas.com>, linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Palmer <danieruru@gmail.com>
Subject: [PATCH] spi: rspi: Increase accuracy of bit rate for RZ
Date: Fri,  5 Aug 2016 09:36:03 -0400
Message-Id: <1470404163-27427-1-git-send-email-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When you leave the clock divider at 0, 130kHz is the lowest you can go.
Also, by adjusting the clock divider you can get more accurate resolutions
for clock speeds lower than 16MHz. This patch uses the clock divider as
part of the bit rate setup.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/spi/spi-rspi.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 8188433..a816f07 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -295,14 +295,24 @@ static int rspi_set_config_register(struct rspi_data *rspi, int access_size)
 static int rspi_rz_set_config_register(struct rspi_data *rspi, int access_size)
 {
 	int spbr;
+	int div = 0;
+	unsigned long clksrc;
 
 	/* Sets output mode, MOSI signal, and (optionally) loopback */
 	rspi_write8(rspi, rspi->sppcr, RSPI_SPPCR);
 
+	clksrc = clk_get_rate(rspi->clk);
+	while (div < 3) {
+		if (rspi->max_speed_hz >= clksrc/4) /* 4=(CLK/2)/2 */
+			break;
+		div++;
+		clksrc /= 2;
+	}
+
 	/* Sets transfer bit rate */
-	spbr = DIV_ROUND_UP(clk_get_rate(rspi->clk),
-			    2 * rspi->max_speed_hz) - 1;
+	spbr = DIV_ROUND_UP(clksrc, 2 * rspi->max_speed_hz) - 1;
 	rspi_write8(rspi, clamp(spbr, 0, 255), RSPI_SPBR);
+	rspi->spcmd |= div << 2;
 
 	/* Disable dummy transmission, set byte access */
 	rspi_write8(rspi, SPDCR_SPLBYTE, RSPI_SPDCR);
-- 
1.9.1
