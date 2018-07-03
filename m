Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:25702 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933530AbeGCPTv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 11:19:51 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] pinctrl: sh-pfc: r8a77970: remove SH_PFC_PIN_CFG_DRIVE_STRENGTH flag
Date: Tue,  3 Jul 2018 17:18:42 +0200
Message-Id: <20180703151842.28750-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The datasheet does not document any registers to control drive strength,
and no drive strength registers are for this reason described for this
SoC. The flags indicating that drive strength can be controlled are
however set for some pins in the driver.

This leads to a NULL pointer dereference when the sh-pfc core tries to
access the struct describing the drive strength registers, for example
when reading the sysfs file pinconf-pins.

Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins.

Fixes: b92ac66a1819602b ("pinctrl: sh-pfc: Add R8A77970 PFC support")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---

* Changes since v1
- Fix spelling in commit message.
- Add fixes tag.
- Collect review tags.
---
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index b02caf31671186d9..eeb58b3bbc9a0cef 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -21,15 +21,13 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CFG_FLAGS SH_PFC_PIN_CFG_DRIVE_STRENGTH
-
 #define CPU_ALL_PORT(fn, sfx)						\
-	PORT_GP_CFG_22(0, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
-	PORT_GP_CFG_28(1, fn, sfx, CFG_FLAGS),				\
-	PORT_GP_CFG_17(2, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
-	PORT_GP_CFG_17(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
-	PORT_GP_CFG_6(4,  fn, sfx, CFG_FLAGS),				\
-	PORT_GP_CFG_15(5, fn, sfx, CFG_FLAGS)
+	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
+	PORT_GP_28(1, fn, sfx),						\
+	PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
+	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
+	PORT_GP_6(4,  fn, sfx),						\
+	PORT_GP_15(5, fn, sfx)
 /*
  * F_() : just information
  * FM() : macro for FN_xxx / xxx_MARK
-- 
2.17.0
