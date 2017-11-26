Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:40318 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751719AbdKZAYT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Nov 2017 19:24:19 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: enable support for r8a77970
Date: Sun, 26 Nov 2017 01:23:48 +0100
Message-Id: <20171126002348.20561-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the SoC specific information for Renesas r8a77970.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/rcar_vin.txt         |  1 +
 drivers/media/platform/rcar-vin/rcar-core.c        | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

Hi,

I plan to include this patch in the next version of the series for Gen3 
support. But to enable who wish to start working with VIN on V3M I
send it out now as a separate patch as the big Gen3 series is waiting 
for -rc1 to be available before being re-posted.

Regards,
Niklas

diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
index 17e0d642320fa90d..276af4b4b47703f6 100644
--- a/Documentation/devicetree/bindings/media/rcar_vin.txt
+++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
@@ -19,6 +19,7 @@ on Gen3 to a CSI-2 receiver.
    - "renesas,vin-r8a7794" for the R8A7794 device
    - "renesas,vin-r8a7795" for the R8A7795 device
    - "renesas,vin-r8a7796" for the R8A7796 device
+   - "renesas,vin-r8a77970" for the R8A77970 device
    - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 compatible device.
 
    When compatible with the generic version nodes must list the
diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index e042cb12229d23d6..a13bc8325a1d1309 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1149,6 +1149,42 @@ static const struct rvin_info rcar_info_r8a7796 = {
 	},
 };
 
+static const struct rvin_info rcar_info_r8a77970 = {
+	.chip = RCAR_GEN3,
+	.use_mc = true,
+	.max_width = 4096,
+	.max_height = 4096,
+
+	.num_chsels = 5,
+	.chsels = {
+		{
+			{ .csi = RVIN_CSI40, .chan = 0 },
+			{ .csi = RVIN_NC, .chan = 0 },
+			{ .csi = RVIN_NC, .chan = 0 },
+			{ .csi = RVIN_CSI40, .chan = 0 },
+			{ .csi = RVIN_NC, .chan = 0 },
+		}, {
+			{ .csi = RVIN_NC, .chan = 0 },
+			{ .csi = RVIN_NC, .chan = 0 },
+			{ .csi = RVIN_CSI40, .chan = 0 },
+			{ .csi = RVIN_CSI40, .chan = 1 },
+			{ .csi = RVIN_NC, .chan = 0 },
+		}, {
+			{ .csi = RVIN_NC, .chan = 0 },
+			{ .csi = RVIN_CSI40, .chan = 0 },
+			{ .csi = RVIN_NC, .chan = 0 },
+			{ .csi = RVIN_CSI40, .chan = 2 },
+			{ .csi = RVIN_NC, .chan = 0 },
+		}, {
+			{ .csi = RVIN_CSI40, .chan = 1 },
+			{ .csi = RVIN_NC, .chan = 0 },
+			{ .csi = RVIN_NC, .chan = 0 },
+			{ .csi = RVIN_CSI40, .chan = 3 },
+			{ .csi = RVIN_NC, .chan = 0 },
+		},
+	},
+};
+
 static const struct of_device_id rvin_of_id_table[] = {
 	{
 		.compatible = "renesas,vin-r8a7778",
@@ -1186,6 +1222,10 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.compatible = "renesas,vin-r8a7796",
 		.data = &rcar_info_r8a7796,
 	},
+	{
+		.compatible = "renesas,vin-r8a77970",
+		.data = &rcar_info_r8a77970,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, rvin_of_id_table);
-- 
2.15.0
