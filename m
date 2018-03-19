Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:38414 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935400AbeCSQh3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 12:37:29 -0400
Received: by mail-wr0-f196.google.com with SMTP id l8so19281893wrg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 09:37:28 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com, kbingham@kernel.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 2/3] pinctrl: sh-pfc: r8a7796: correct VIN4 18-bit pins
Date: Mon, 19 Mar 2018 17:37:19 +0100
Message-Id: <1521477440-1047-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1521477440-1047-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521477440-1047-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

RGB666 has a pin assignment that differs from the other formats.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index e6fff55..7a26392 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -4022,48 +4022,48 @@ static const unsigned int vin4_data16_b_mux[] = {
 	VI4_DATA14_MARK, VI4_DATA15_MARK,
 };
 static const unsigned int vin4_data18_a_pins[] = {
-	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
 	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
 	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
 	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
 	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
 	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
 	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
 };
 static const unsigned int vin4_data18_a_mux[] = {
-	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
 	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
 	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
 	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
 	VI4_DATA10_MARK, VI4_DATA11_MARK,
 	VI4_DATA12_MARK, VI4_DATA13_MARK,
 	VI4_DATA14_MARK, VI4_DATA15_MARK,
-	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
 static const unsigned int vin4_data18_b_pins[] = {
-	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
 	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
 	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
 	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
 	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
 	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
 	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
 };
 static const unsigned int vin4_data18_b_mux[] = {
-	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
 	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
 	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
 	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
 	VI4_DATA10_MARK, VI4_DATA11_MARK,
 	VI4_DATA12_MARK, VI4_DATA13_MARK,
 	VI4_DATA14_MARK, VI4_DATA15_MARK,
-	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
 static const unsigned int vin4_data20_a_pins[] = {
 	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-- 
2.7.4
