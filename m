Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:56708 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752040AbeENToF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 May 2018 15:44:05 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: rcar-gen3: Fix grammar in static pin comments
Date: Mon, 14 May 2018 21:44:02 +0200
Message-Id: <1526327042-31055-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The comment block explaining the rationale for static pins contains
grammar errors.  It appeared first in the pin control driver for R-Car
H3 ES1.x, and spread to R-Car M3-W, H3 ES2.0, and M3-N later.

Fix the grammar in all copies at once.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.18.

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 6 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 6 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 6 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 82a1c411c952a63e..a6c5d50557e676de 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -1432,10 +1432,10 @@ static const u16 pinmux_data[] = {
 
 /*
  * Static pins can not be muxed between different functions but
- * still needs a mark entry in the pinmux list. Add each static
+ * still need mark entries in the pinmux list. Add each static
  * pin to the list without an associated function. The sh-pfc
- * core will do the right thing and skip trying to mux then pin
- * while still applying configuration to it
+ * core will do the right thing and skip trying to mux the pin
+ * while still applying configuration to it.
  */
 #define FM(x)	PINMUX_DATA(x##_MARK, 0),
 	PINMUX_STATIC
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 34626898f757a13a..4f55b1562ad4878a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1493,10 +1493,10 @@ static const u16 pinmux_data[] = {
 
 /*
  * Static pins can not be muxed between different functions but
- * still needs a mark entry in the pinmux list. Add each static
+ * still need mark entries in the pinmux list. Add each static
  * pin to the list without an associated function. The sh-pfc
- * core will do the right thing and skip trying to mux then pin
- * while still applying configuration to it
+ * core will do the right thing and skip trying to mux the pin
+ * while still applying configuration to it.
  */
 #define FM(x)	PINMUX_DATA(x##_MARK, 0),
 	PINMUX_STATIC
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 764afa13a8c63658..3ea133cfb241a3df 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1499,10 +1499,10 @@ static const u16 pinmux_data[] = {
 
 /*
  * Static pins can not be muxed between different functions but
- * still needs a mark entry in the pinmux list. Add each static
+ * still need mark entries in the pinmux list. Add each static
  * pin to the list without an associated function. The sh-pfc
- * core will do the right thing and skip trying to mux then pin
- * while still applying configuration to it
+ * core will do the right thing and skip trying to mux the pin
+ * while still applying configuration to it.
  */
 #define FM(x)   PINMUX_DATA(x##_MARK, 0),
 	PINMUX_STATIC
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 4d944e3c73e91b61..5caecb6a844180ee 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -1501,10 +1501,10 @@ static const u16 pinmux_data[] = {
 
 /*
  * Static pins can not be muxed between different functions but
- * still needs a mark entry in the pinmux list. Add each static
+ * still need mark entries in the pinmux list. Add each static
  * pin to the list without an associated function. The sh-pfc
- * core will do the right thing and skip trying to mux then pin
- * while still applying configuration to it
+ * core will do the right thing and skip trying to mux the pin
+ * while still applying configuration to it.
  */
 #define FM(x)   PINMUX_DATA(x##_MARK, 0),
 	PINMUX_STATIC
-- 
2.7.4
