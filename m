Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:40961 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751840AbdCCReW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 12:34:22 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
        Archit Taneja <architt@codeaurora.org>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 10/10] drm: bridge: dw-hdmi: Move the driver to a separate directory.
Date: Fri,  3 Mar 2017 19:20:07 +0200
Message-Id: <20170303172007.26541-11-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170303172007.26541-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170303172007.26541-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The driver is already made of 5 separate source files. Move it to a
newly created directory named synopsys where more Synopsys bridge
drivers can be added later (for the DisplayPort controller for
instance).

Suggested-by: Jose Abreu <Jose.Abreu@synopsys.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
---
Changes since v4:

- Fixed typos in Kconfig
---
 drivers/gpu/drm/bridge/Kconfig                     |  2 ++
 drivers/gpu/drm/bridge/Makefile                    |  4 +---
 drivers/gpu/drm/bridge/synopsys/Kconfig            | 23 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/Makefile           |  5 +++++
 .../drm/bridge/{ => synopsys}/dw-hdmi-ahb-audio.c  |  0
 .../gpu/drm/bridge/{ => synopsys}/dw-hdmi-audio.h  |  0
 .../drm/bridge/{ => synopsys}/dw-hdmi-i2s-audio.c  |  0
 drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.c    |  0
 drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.h    |  0
 9 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/synopsys/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/synopsys/Makefile
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-ahb-audio.c (100%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-audio.h (100%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-i2s-audio.c (100%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.c (100%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.h (100%)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index eb8688ec6f18..68ceba083ca1 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -101,4 +101,6 @@ source "drivers/gpu/drm/bridge/analogix/Kconfig"
 
 source "drivers/gpu/drm/bridge/adv7511/Kconfig"
 
+source "drivers/gpu/drm/bridge/synopsys/Kconfig"
+
 endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 2e83a7855399..103f82e63102 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -2,9 +2,6 @@ ccflags-y := -Iinclude/drm
 
 obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
 obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
-obj-$(CONFIG_DRM_DW_HDMI) += dw-hdmi.o
-obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) += dw-hdmi-ahb-audio.o
-obj-$(CONFIG_DRM_DW_HDMI_I2S_AUDIO) += dw-hdmi-i2s-audio.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
@@ -13,3 +10,4 @@ obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
 obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix/
 obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
 obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
+obj-y += synopsys/
diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
new file mode 100644
index 000000000000..40d2827a6d19
--- /dev/null
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -0,0 +1,23 @@
+config DRM_DW_HDMI
+	tristate
+	select DRM_KMS_HELPER
+
+config DRM_DW_HDMI_AHB_AUDIO
+	tristate "Synopsys Designware AHB Audio interface"
+	depends on DRM_DW_HDMI && SND
+	select SND_PCM
+	select SND_PCM_ELD
+	select SND_PCM_IEC958
+	help
+	  Support the AHB Audio interface which is part of the Synopsys
+	  Designware HDMI block.  This is used in conjunction with
+	  the i.MX6 HDMI driver.
+
+config DRM_DW_HDMI_I2S_AUDIO
+	tristate "Synopsys Designware I2S Audio interface"
+	depends on SND_SOC
+	depends on DRM_DW_HDMI
+	select SND_SOC_HDMI_CODEC
+	help
+	  Support the I2S Audio interface which is part of the Synopsys
+	  Designware HDMI block.
diff --git a/drivers/gpu/drm/bridge/synopsys/Makefile b/drivers/gpu/drm/bridge/synopsys/Makefile
new file mode 100644
index 000000000000..17aa7a65b57e
--- /dev/null
+++ b/drivers/gpu/drm/bridge/synopsys/Makefile
@@ -0,0 +1,5 @@
+#ccflags-y := -Iinclude/drm
+
+obj-$(CONFIG_DRM_DW_HDMI) += dw-hdmi.o
+obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) += dw-hdmi-ahb-audio.o
+obj-$(CONFIG_DRM_DW_HDMI_I2S_AUDIO) += dw-hdmi-i2s-audio.o
diff --git a/drivers/gpu/drm/bridge/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
similarity index 100%
rename from drivers/gpu/drm/bridge/dw-hdmi-ahb-audio.c
rename to drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
diff --git a/drivers/gpu/drm/bridge/dw-hdmi-audio.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
similarity index 100%
rename from drivers/gpu/drm/bridge/dw-hdmi-audio.h
rename to drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
diff --git a/drivers/gpu/drm/bridge/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
similarity index 100%
rename from drivers/gpu/drm/bridge/dw-hdmi-i2s-audio.c
rename to drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
similarity index 100%
rename from drivers/gpu/drm/bridge/dw-hdmi.c
rename to drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
diff --git a/drivers/gpu/drm/bridge/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
similarity index 100%
rename from drivers/gpu/drm/bridge/dw-hdmi.h
rename to drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
-- 
Regards,

Laurent Pinchart
