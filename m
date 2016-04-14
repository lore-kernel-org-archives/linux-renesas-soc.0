Return-Path: <SRS0+Xik1=QJ=vger.kernel.org=linux-renesas-soc-owner@vergenet.net>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34844 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932799AbcDNQSI (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 14 Apr 2016 12:18:08 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: hans.verkuil@cisco.com, niklas.soderlund@ragnatech.se
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com,
	ian.molton@codethink.co.uk, lars@metafoo.de,
	william.towle@codethink.co.uk,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	Rob Taylor <rob.taylor@codethink.co.uk>
Subject: [PATCH v3 4/7] media: rcar-vin: pad-aware driver initialisation
Date: Thu, 14 Apr 2016 18:17:47 +0200
Message-Id: <1460650670-20849-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1460650670-20849-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1460650670-20849-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>
Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/4] arm64: dts: r8a7795: Don't disable referenced optional clocks
Date: Wed, 27 Apr 2016 14:06:46 +1000
Message-Id: <9f33a8a9e1b7dbb0b91a58af958d1c301a6fab1a.1461723181.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1461723181.git.horms+renesas@verge.net.au>
References: <cover.1461723181.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add detection of source pad number for drivers aware of the media controller
API, so that rcar-vin can create device nodes to support modern drivers such
as adv7604.c (for HDMI on Lager) and the converted adv7180.c (for composite)
underneath.

Building rcar_vin gains a dependency on CONFIG_MEDIA_CONTROLLER, in
line with requirements for building the drivers associated with it.

Signed-off-by: William Towle <william.towle@codethink.co.uk>
Signed-off-by: Rob Taylor <rob.taylor@codethink.co.uk>
[uli: adapted to rcar-vin rewrite]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 16 ++++++++++++++++
 drivers/media/platform/rcar-vin/rcar-vin.h  |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 43aec3c..d8d5f3a 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -659,6 +659,9 @@ int rvin_v4l2_probe(struct rvin_dev *vin)
 	struct v4l2_mbus_framefmt *mf = &fmt.format;
 	struct video_device *vdev = &vin->vdev;
 	struct v4l2_subdev *sd = vin_to_sd(vin);
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	int pad_idx;
+#endif
 	int ret;
 
 	v4l2_set_subdev_hostdata(sd, vin);
@@ -701,6 +704,19 @@ int rvin_v4l2_probe(struct rvin_dev *vin)
 	vdev->lock = &vin->lock;
 	vdev->ctrl_handler = &vin->ctrl_handler;
 
+	vin->src_pad_idx = 0;
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	for (pad_idx = 0; pad_idx < sd->entity.num_pads; pad_idx++)
+		if (sd->entity.pads[pad_idx].flags
+				== MEDIA_PAD_FL_SOURCE)
+			break;
+	if (pad_idx >= sd->entity.num_pads)
+		return -EINVAL;
+
+	vin->src_pad_idx = pad_idx;
+#endif
+	fmt.pad = vin->src_pad_idx;
+
 	/* Try to improve our guess of a reasonable window format */
 	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
 	if (ret) {
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 01c5086..959f5da 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -87,6 +87,7 @@ struct rvin_graph_entity {
  *
  * @vdev:		V4L2 video device associated with VIN
  * @v4l2_dev:		V4L2 device
+ * @src_pad_idx:	source pad index for media controller drivers
  * @ctrl_handler:	V4L2 control handler
  * @notifier:		V4L2 asynchronous subdevs notifier
  * @entity:		entity in the DT for subdevice
@@ -118,6 +119,7 @@ struct rvin_dev {
 
 	struct video_device vdev;
 	struct v4l2_device v4l2_dev;
+	int src_pad_idx;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_async_notifier notifier;
 	struct rvin_graph_entity entity;
-- 
2.7.4

From: Geert Uytterhoeven <geert+renesas@glider.be>

clk_get() on a disabled clock node will return -EPROBE_DEFER, which can
cause drivers to be deferred forever if such clocks are referenced in
their devices' clocks properties.

Update the various disabled external clock nodes to default to a
frequency of 0, but don't disable them, to prevent this.

Reported-by: Jürg Billeter <j@bitron.ch>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 78c02937697e..8d8de245a845 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -394,6 +394,7 @@
 };
 
 &pcie_bus_clk {
+	clock-frequency = <100000000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 11f9971a8543..7cb2d72e7378 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -120,7 +120,6 @@
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
-		status = "disabled";
 	};
 
 	/* External SCIF clock - to be overridden by boards that provide it */
@@ -128,15 +127,13 @@
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
-		status = "disabled";
 	};
 
 	/* External PCIe clock - can be overridden by the board */
 	pcie_bus_clk: pcie_bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <100000000>;
-		status = "disabled";
+		clock-frequency = <0>;
 	};
 
 	soc {
-- 
2.7.0.rc3.207.g0ac5344
