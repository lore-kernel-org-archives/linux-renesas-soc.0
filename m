Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:35331 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727546AbeKAI1O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:27:14 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] clk: renesas: rcar-gen3: add documentation for SD clocks
Date: Thu,  1 Nov 2018 00:25:17 +0100
Message-Id: <20181031232518.2490-2-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Document the known use cases of the different clock settings. This is
useful as different SoC and ES versions uses different settings to do
the same thing as there are more then one combination to achieve the
same SDn clock speed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 628b63b85d3f09c5..ff56ac6134111c38 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -233,13 +233,13 @@ struct sd_clock {
  *                     sd_srcfc   sd_fc   div
  * stp_hck   stp_ck    (div)      (div)     = sd_srcfc x sd_fc
  *-------------------------------------------------------------------
- *  0         0         0 (1)      1 (4)      4
- *  0         0         1 (2)      1 (4)      8
- *  1         0         2 (4)      1 (4)     16
- *  1         0         3 (8)      1 (4)     32
+ *  0         0         0 (1)      1 (4)      4 : SDR104 / HS200 / HS400 (8 TAP)
+ *  0         0         1 (2)      1 (4)      8 : SDR50
+ *  1         0         2 (4)      1 (4)     16 : HS / SDR25
+ *  1         0         3 (8)      1 (4)     32 : NS / SDR12
  *  1         0         4 (16)     1 (4)     64
  *  0         0         0 (1)      0 (2)      2
- *  0         0         1 (2)      0 (2)      4
+ *  0         0         1 (2)      0 (2)      4 : SDR104 / HS200 / HS400 (4 TAP)
  *  1         0         2 (4)      0 (2)      8
  *  1         0         3 (8)      0 (2)     16
  *  1         0         4 (16)     0 (2)     32
-- 
2.19.1
