Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:34490 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbeKSUpG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 15:45:06 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77995: Remove unused PINMUX_IPSR_{MSEL2,PHYS}()
Date: Mon, 19 Nov 2018 11:21:52 +0100
Message-Id: <20181119102152.5144-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The PINMUX_IPSR_MSEL2() and PINMUX_IPSR_PHYS() macros are unused, and
will conflict with generic macros that are to be added.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.21, before "pinctrl: sh-pfc: Add physical
pin multiplexing helper macros".

 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 9484eaa8522aec6f..e457539a61c55bb9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -468,12 +468,6 @@ enum {
 #undef FM
 };
 
-#define PINMUX_IPSR_MSEL2(ipsr, fn, msel1, msel2) \
-	PINMUX_DATA(fn##_MARK, FN_##msel1, FN_##msel2, FN_##fn, FN_##ipsr)
-
-#define PINMUX_IPSR_PHYS(ipsr, fn, msel) \
-	PINMUX_DATA(fn##_MARK, FN_##msel)
-
 static const u16 pinmux_data[] = {
 	PINMUX_DATA_GP_ALL(),
 
-- 
2.17.1
