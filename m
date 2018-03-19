Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:40016 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935649AbeCSQha (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 12:37:30 -0400
Received: by mail-wm0-f67.google.com with SMTP id t6so17036621wmt.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 09:37:30 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com, kbingham@kernel.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/3] pinctrl: sh-pfc: r8a77995: correct VIN4 18-bit pins
Date: Mon, 19 Mar 2018 17:37:20 +0100
Message-Id: <1521477440-1047-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521477440-1047-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521477440-1047-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

RGB666 has a pin assignment that differs from the other formats.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 27b9417..62bab9f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -1690,26 +1690,26 @@ static const unsigned int vin4_data16_mux[] = {
 	VI4_DATA14_MARK, VI4_DATA15_MARK,
 };
 static const unsigned int vin4_data18_pins[] = {
-	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
 	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
 	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
 	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
 	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
 	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
 	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
-	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
+	RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
+	RCAR_GP_PIN(2, 21), RCAR_GP_PIN(2, 22),
+	RCAR_GP_PIN(2, 23), RCAR_GP_PIN(2, 24),
 };
 static const unsigned int vin4_data18_mux[] = {
-	VI4_DATA0_MARK, VI4_DATA1_MARK,
 	VI4_DATA2_MARK, VI4_DATA3_MARK,
 	VI4_DATA4_MARK, VI4_DATA5_MARK,
 	VI4_DATA6_MARK, VI4_DATA7_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
 	VI4_DATA10_MARK, VI4_DATA11_MARK,
 	VI4_DATA12_MARK, VI4_DATA13_MARK,
 	VI4_DATA14_MARK, VI4_DATA15_MARK,
-	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
 static const unsigned int vin4_data20_pins[] = {
 	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
-- 
2.7.4
