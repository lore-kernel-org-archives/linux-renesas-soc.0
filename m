Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <damm+renesas@opensource.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 4/7] clocksource: sh_cmt: Remove support for "renesas,cmt-32*"
Date: Mon, 18 Sep 2017 15:46:44 +0200
Message-Id: <1505742407-31576-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
References: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Remove driver matching support for the unused "renesas,cmt-32" and
"renesas,cmt-32-fast" compatible values, cfr. commit 203bb3479958c48a
("devicetree: bindings: Remove unused 32-bit CMT bindings").

As this removes the last user of SH_CMT_32BIT_FAST, all support for this
variant is removed from the driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/clocksource/sh_cmt.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 45af436483f39cb0..8546736e3bc8e961 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -66,7 +66,6 @@ struct sh_cmt_device;
 enum sh_cmt_model {
 	SH_CMT_16BIT,
 	SH_CMT_32BIT,
-	SH_CMT_32BIT_FAST,
 	SH_CMT_48BIT,
 	SH_CMT0_RCAR_GEN2,
 	SH_CMT1_RCAR_GEN2,
@@ -203,16 +202,6 @@ static const struct sh_cmt_info sh_cmt_info[] = {
 		.read_count = sh_cmt_read32,
 		.write_count = sh_cmt_write32,
 	},
-	[SH_CMT_32BIT_FAST] = {
-		.model = SH_CMT_32BIT_FAST,
-		.width = 32,
-		.overflow_bit = SH_CMT32_CMCSR_CMF,
-		.clear_bits = ~(SH_CMT32_CMCSR_CMF | SH_CMT32_CMCSR_OVF),
-		.read_control = sh_cmt_read16,
-		.write_control = sh_cmt_write16,
-		.read_count = sh_cmt_read32,
-		.write_count = sh_cmt_write32,
-	},
 	[SH_CMT_48BIT] = {
 		.model = SH_CMT_48BIT,
 		.channels_mask = 0x3f,
@@ -890,13 +879,6 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
 	case SH_CMT_48BIT:
 		ch->ioctrl = cmt->mapbase + 0x10 + ch->hwidx * 0x10;
 		break;
-	case SH_CMT_32BIT_FAST:
-		/*
-		 * The 32-bit "fast" timer has a single channel at hwidx 5 but
-		 * is located at offset 0x40 instead of 0x60 for some reason.
-		 */
-		ch->ioctrl = cmt->mapbase + 0x40;
-		break;
 	case SH_CMT0_RCAR_GEN2:
 	case SH_CMT1_RCAR_GEN2:
 		ch->iostart = cmt->mapbase + ch->hwidx * 0x100;
@@ -952,8 +934,6 @@ static const struct platform_device_id sh_cmt_id_table[] = {
 MODULE_DEVICE_TABLE(platform, sh_cmt_id_table);
 
 static const struct of_device_id sh_cmt_of_table[] __maybe_unused = {
-	{ .compatible = "renesas,cmt-32", .data = &sh_cmt_info[SH_CMT_32BIT] },
-	{ .compatible = "renesas,cmt-32-fast", .data = &sh_cmt_info[SH_CMT_32BIT_FAST] },
 	{ .compatible = "renesas,cmt-48", .data = &sh_cmt_info[SH_CMT_48BIT] },
 	{ .compatible = "renesas,cmt-48-gen2", .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2] },
 	{ .compatible = "renesas,rcar-gen2-cmt0", .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2] },
-- 
2.7.4
