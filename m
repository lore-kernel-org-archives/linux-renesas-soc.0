Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54248 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751733AbdJIIhb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 04:37:31 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/2] pinctrl: sh-pfc: r8a7795: fix trivial typo in comment
Date: Mon,  9 Oct 2017 10:37:24 +0200
Message-Id: <20171009083725.6474-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since V1 for both patches:
	* corrected authorship email address (sorry for the noise!)

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 8fc5d659e2dc01..8ca59b35595068 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1508,7 +1508,7 @@ static const u16 pinmux_data[] = {
 };
 
 /*
- * R8A7795 has 8 banks with 32 PGIOS in each => 256 GPIOs.
+ * R8A7795 has 8 banks with 32 GPIOs IN EACH => 256 GPIOs.
  * Physical layout rows: A - AW, cols: 1 - 39.
  */
 #define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
-- 
2.11.0
