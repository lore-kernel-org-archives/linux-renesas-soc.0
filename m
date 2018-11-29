Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:48069 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbeK2Lok (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 06:44:40 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/2] clk: renesas: rcar-gen3: add documentation for SD clocks
Date: Thu, 29 Nov 2018 01:39:48 +0100
Message-Id: <20181129003949.19984-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se>
References: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the known use cases of the different clock settings. This is
useful as different SoC and ES versions uses different settings to do
the same thing as there are more then one combination to achieve the
same SDn clock speed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index f6335357c85505df..bca6c7f51de18db7 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -232,13 +232,13 @@ struct sd_clock {
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
