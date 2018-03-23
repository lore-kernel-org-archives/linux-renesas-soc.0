Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:49814 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751790AbeCWJJu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 05:09:50 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] pinctrl: sh-pfc: r8a7796: Fix comment for MSIOF3 SS2_E pin
Date: Fri, 23 Mar 2018 10:09:42 +0100
Message-Id: <1521796182-24791-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521796182-24791-1-git-send-email-geert+renesas@glider.be>
References: <1521796182-24791-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 4bc5b1f820c1f241..764afa13a8c63658 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -3122,7 +3122,7 @@ static const unsigned int msiof3_ss1_e_mux[] = {
 	MSIOF3_SS1_E_MARK,
 };
 static const unsigned int msiof3_ss2_e_pins[] = {
-	/* SS1 */
+	/* SS2 */
 	RCAR_GP_PIN(2, 0),
 };
 static const unsigned int msiof3_ss2_e_mux[] = {
-- 
2.7.4
