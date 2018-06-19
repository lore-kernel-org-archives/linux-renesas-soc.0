Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:58952 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966738AbeFSSJw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jun 2018 14:09:52 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: defconfig: Update renesas_defconfig for v4.18-rc1
Date: Tue, 19 Jun 2018 20:09:47 +0200
Message-Id: <20180619180947.23362-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update the defconfig for Renesas R-Car Gen3 boards:
  - Enable CONFIG_VIDEO_RCAR_CSI2 (for all R-Car Gen3),
  - Enable CONFIG_DRM_THINE_THC63LVD1024 (for Eagle and V3MSK),
  - Disable CONFIG_PCIE_DW_PLAT_HOST (N/A),
  - Disable CONFIG_SOCIONEXT_SYNQUACER_PREITS (N/A),
  - Disable CONFIG_HISILICON_ERRATUM_161600802 (N/A),
  - Disable CONFIG_ARM64_LSE_ATOMICS (not supported by CA53/57),
  - Disable CONFIG_ARM64_RAS_EXTN (not supported by CA53/57),
  - Disable CONFIG_CAVIUM_PTP (N/A),
  - Disable CONFIG_MEDIA_TUNER_TDA18250 (N/A),
  - Disable CONFIG_MEDIA_TUNER_QM1D1B0004 (N/A),
  - Remove CONFIG_SERIAL_SH_SCI_NR_UARTS=11 (default of 18 is fine),
  - Remove CONFIG_SERIAL_SH_SCI_CONSOLE=y (auto-enabled),
  - Remove CONFIG_SERIAL_SH_SCI_DMA=y (auto-enabled),
  - Remove CONFIG_DRM_RCAR_VSP=y (auto-enabled).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.

 arch/arm64/configs/renesas_defconfig | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 496cebe671078413..80071d44fc96b411 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -45,6 +45,7 @@ CONFIG_PCI_IOV=y
 CONFIG_HOTPLUG_PCI=y
 CONFIG_PCIE_RCAR=y
 CONFIG_PCI_HOST_GENERIC=y
+# CONFIG_PCIE_DW_PLAT_HOST is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
@@ -52,6 +53,8 @@ CONFIG_PCI_HOST_GENERIC=y
 # CONFIG_QCOM_FALKOR_ERRATUM_1003 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1009 is not set
 # CONFIG_QCOM_QDF2400_ERRATUM_0065 is not set
+# CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
+# CONFIG_HISILICON_ERRATUM_161600802 is not set
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
 CONFIG_PREEMPT=y
@@ -62,6 +65,8 @@ CONFIG_SECCOMP=y
 CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
 CONFIG_XEN=y
+# CONFIG_ARM64_LSE_ATOMICS is not set
+# CONFIG_ARM64_RAS_EXTN is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_COMPAT=y
 CONFIG_HIBERNATION=y
@@ -105,6 +110,7 @@ CONFIG_SATA_RCAR=y
 CONFIG_NETDEVICES=y
 CONFIG_TUN=y
 CONFIG_VIRTIO_NET=y
+# CONFIG_CAVIUM_PTP is not set
 CONFIG_RAVB=y
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_MICREL_PHY=y
@@ -117,9 +123,6 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_INPUT_MISC=y
 # CONFIG_SERIO is not set
 CONFIG_SERIAL_SH_SCI=y
-CONFIG_SERIAL_SH_SCI_NR_UARTS=11
-CONFIG_SERIAL_SH_SCI_CONSOLE=y
-CONFIG_SERIAL_SH_SCI_DMA=y
 CONFIG_VIRTIO_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C_CHARDEV=y
@@ -156,6 +159,7 @@ CONFIG_MEDIA_SDR_SUPPORT=y
 CONFIG_MEDIA_CONTROLLER=y
 CONFIG_VIDEO_V4L2_SUBDEV_API=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_RCAR_CSI2=y
 CONFIG_VIDEO_RCAR_VIN=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_RENESAS_FDP1=y
@@ -166,6 +170,7 @@ CONFIG_VIDEO_RCAR_DRIF=y
 # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_ADV748X=y
 # CONFIG_MEDIA_TUNER_SIMPLE is not set
+# CONFIG_MEDIA_TUNER_TDA18250 is not set
 # CONFIG_MEDIA_TUNER_TDA8290 is not set
 # CONFIG_MEDIA_TUNER_TDA827X is not set
 # CONFIG_MEDIA_TUNER_TDA18271 is not set
@@ -200,12 +205,13 @@ CONFIG_VIDEO_ADV748X=y
 # CONFIG_MEDIA_TUNER_R820T is not set
 # CONFIG_MEDIA_TUNER_MXL301RF is not set
 # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
+# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
 CONFIG_DRM=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
 CONFIG_DRM_RCAR_LVDS=y
-CONFIG_DRM_RCAR_VSP=y
 CONFIG_DRM_DUMB_VGA_DAC=y
+CONFIG_DRM_THINE_THC63LVD1024=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
-- 
2.17.1
