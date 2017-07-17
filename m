Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/6] ARM: shmobile_defconfig: Cleanup from non-existing options
Date: Mon, 17 Jul 2017 07:49:52 +0200
Message-Id: <1500270596-22384-2-git-send-email-krzk@kernel.org>
In-Reply-To: <1500270596-22384-1-git-send-email-krzk@kernel.org>
References: <1500270596-22384-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Remove options which do not exist anymore:
 - DRM_RCAR_HDMI was merged to generic DRM bridge and is obsolete since
   commit 5c602531feb3 ("drm: rcar-du: Replace manual bridge
   implementation with DRM bridge");

 - SND_SOC_RSRC_CARD was replaced by SND_SIMPLE_SCU_CARD in commit
   d12c6216c4a5 ("ASoC: rsrc-card: rename rsrc-card to simple-scu-card
   phase3");

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/configs/shmobile_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 3c66a422fb4d..123a1debe3d7 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -155,7 +155,6 @@ CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_RCAR_DU=y
-CONFIG_DRM_RCAR_HDMI=y
 CONFIG_DRM_RCAR_LVDS=y
 CONFIG_FB_SH_MOBILE_LCDC=y
 CONFIG_FB_SH_MOBILE_MERAM=y
@@ -169,9 +168,9 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_SH4_FSI=y
 CONFIG_SND_SOC_RCAR=y
-CONFIG_SND_SOC_RSRC_CARD=y
 CONFIG_SND_SOC_AK4642=y
 CONFIG_SND_SOC_WM8978=y
+CONFIG_SND_SIMPLE_SCU_CARD=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_RCAR=y
-- 
2.7.4
