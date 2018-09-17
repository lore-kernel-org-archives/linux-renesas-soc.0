Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:35622 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728394AbeIQUuR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 16:50:17 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, horms@verge.net.au,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT v2 0/8] arm64: dts: renesas: Ebisu: Add HDMI and CVBS input
Date: Mon, 17 Sep 2018 18:22:42 +0300
Message-ID: <9985380.QnDFkEV7fi@avalon>
In-Reply-To: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patches.

On Wednesday, 5 September 2018 18:29:37 EEST Jacopo Mondi wrote:
> Hello renesas list,
>    this series add supports for the HDMI and CVBS input to R-Car E3 R8A77990
> Ebisu board.
> 
> It's an RFT, as I don't have an Ebisu to test with :(
> 
> The series adds supports for the following items:
> 
> - PFC: add VIN groups and functions
> - R-Car VIN and R-Car CSI-2: add support for R8A77990
> - R8A77990: Add I2C, VIN and CSI-2 nodes (v1 re-sent by Laurent in D3 DU
> series) - Ebisu: describe HDMI and CVBS inputs
> 
> Laurent has tested v1 and confirmed that the current mainline implementation
> of the adv748x driver does not work in the configuration used by the Ebisu
> board.

I've now tested v2 on Ebisu, and there's definitely progress after numbering 
the VIN endpoints correctly as mentioned in my review of patch 6/8.

I've added (or rather hacked) Ebisu support to the VIN tests, and I can 
capture frames:

# ./set-edid 
EDID set successfully.
# ./yavta-hdmi 4
format: RGB888_1X24 size: 800x600/800x600 field: none/none vdev: /dev/video2
Device /dev/video2 opened.
Device `R_Car_VIN' on `platform:e6ef4000.video' (driver 'rcar_vin') supports 
video, capture, without mplanes.
Video format set: RGB565 (50424752) 800x600 (stride 1600) field none buffer 
size 960000
Video format: RGB565 (50424752) 800x600 (stride 1600) field none buffer size 
960000
Device /dev/video2 opened.
Device `R_Car_VIN' on `platform:e6ef4000.video' (driver 'rcar_vin') supports 
video, capture, without mplanes.
Video format: RGB565 (50424752) 800x600 (stride 1600) field none buffer size 
960000
4 buffers requested.
length: 960000 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0x7f81323000.
length: 960000 offset: 962560 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0x7f81238000.
length: 960000 offset: 1925120 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0x7f8114d000.
length: 960000 offset: 2887680 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0x7f81062000.
0 (0) [-] none 0 960000 B 123.674468 123.676485 75.740 fps ts mono/EoF
1 (2) [-] none 1 960000 B 123.675610 123.700566 875.657 fps ts mono/EoF
2 (3) [-] none 2 960000 B 123.675637 123.718865 37037.037 fps ts mono/EoF
3 (1) [-] none 3 960000 B 123.675693 123.737100 17857.143 fps ts mono/EoF
4 (0) [-] none 252 960000 B 123.700914 123.755378 39.649 fps ts mono/EoF
5 (2) [-] none 417 960000 B 123.719047 123.773609 55.148 fps ts mono/EoF
6 (3) [-] none 600 960000 B 123.737330 123.791760 54.696 fps ts mono/EoF
7 (1) [-] none 789 960000 B 123.757476 123.810198 49.638 fps ts mono/EoF
8 (0) [-] none 951 960000 B 123.774199 123.828604 59.798 fps ts mono/EoF
9 (2) [-] none 1128 960000 B 123.792089 123.846743 55.897 fps ts mono/EoF
Captured 10 frames in 0.185478 seconds (53.914726 fps, 51758136.836038 B/s).
4 buffers released.

The frames are however all black.

I've applied the following modifications to the VIN test scripts (on top of 
your D3 patches-. Please feel free to include them in your next version.

diff --git a/scripts/boards.sh b/scripts/boards.sh
index 82806c6e56eb..a29d87918cf2 100644
--- a/scripts/boards.sh
+++ b/scripts/boards.sh
@@ -36,6 +36,11 @@ case $info in
         # FIXME: This is a hackfor D3, but results in an image.
         parallelformat="YUYV8_1X16"
         ;;
+    "Renesas Ebisu board based on r8a77990")
+        gen="gen3"
+        vins="4 5"
+        csis="40"
+        ;;
     "Renesas H3ULCB Kingfisher board based on r8a7795 ES2.0+")
         gen="gen3"
         vins="0 1 2 3 4 5 6 7"
@@ -76,19 +81,22 @@ if [[ "$gen" == "gen3" ]]; then
         esac
     done
 
-    if [[ "$info" == "Renesas Eagle board based on r8a77970" ]]; then
-        cvbsname="adv748x 0-0070 afe"
-        hdminame="adv748x 0-0070 hdmi"
-
-        txaname="adv748x 0-0070 txa"
-        txbname="adv748x 0-0070 txb"
-    elif [[ "$info" == "Renesas Draak board based on r8a77995" ]]; then
-        hdminame="adv7612 0-004c"
-    else
-        cvbsname="adv748x 4-0070 afe"
-        hdminame="adv748x 4-0070 hdmi"
-
-        txaname="adv748x 4-0070 txa"
-        txbname="adv748x 4-0070 txb"
-    fi
+    case $info in
+        "Renesas Eagle board based on r8a77970" | \
+	"Renesas Ebisu board based on r8a77990")
+            cvbsname="adv748x 0-0070 afe"
+            hdminame="adv748x 0-0070 hdmi"
+            txaname="adv748x 0-0070 txa"
+            txbname="adv748x 0-0070 txb"
+	    ;;
+	"Renesas Draak board based on r8a77995")
+            hdminame="adv7612 0-004c"
+            ;;
+        *)
+            cvbsname="adv748x 4-0070 afe"
+            hdminame="adv748x 4-0070 hdmi"
+            txaname="adv748x 4-0070 txa"
+            txbname="adv748x 4-0070 txb"
+	    ;;
+    esac
 fi
diff --git a/yavta-hdmi b/yavta-hdmi
index 2e3b625978fe..7f9e10b42d94 100755
--- a/yavta-hdmi
+++ b/yavta-hdmi
@@ -36,6 +36,7 @@ case $vc in
     4)
         vinname=$vinname4
         dev=/dev/$vin4
+        csipad=1
         ;;
     *)
         echo "Unkown VC '$vc'"

> This series should then be applied on top of the just sent:
> [PATCH v2 0/5] media: adv748x: Allow probe with a single output endpoint
> To allow the adv7482 to probe with a single output port enabled.
> 
> This series, based on v4.19-rc2 with adv748x series on top, is available at:
> git://jmondi.org/linux ebisu/linus-master/hdmi_cvbs_v2
> 
> Thanks
>    j
> 
> Jacopo Mondi (6):
>   media: dt-bindings: rcar-vin: Add R8A77990 support
>   media: rcar-vin: Add support for R-Car R8A77990
>   media: dt-bindings: rcar-csi2: Add R8A77990
>   media: rcar-csi2: Add R8A77990 support
>   pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and functions
>   arm64: dts: renesas: ebisu: Add HDMI and CVBS input
> 
> Koji Matsuoka (1):
>   arm64: dts: r8a77990: Add VIN and CSI-2 device nodes
> 
> Takeshi Kihara (1):
>   arm64: dts: r8a77990: Add I2C device nodes
> 
>  .../devicetree/bindings/media/rcar_vin.txt         |   1 +
>  .../bindings/media/renesas,rcar-csi2.txt           |   1 +
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  86 +++++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 202 +++++++++++++++++
>  drivers/media/platform/rcar-vin/rcar-core.c        |  20 ++
>  drivers/media/platform/rcar-vin/rcar-csi2.c        |   9 +
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 250 ++++++++++++++++++
>  7 files changed, 569 insertions(+)

-- 
Regards,

Laurent Pinchart
