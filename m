Return-Path: <devicetree-owner@vger.kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 5/5] ARM: shmobile: defconfig: Enable SII902X
Date: Fri, 21 Sep 2018 19:08:31 +0100
Message-Id: <1537553311-8831-6-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The iwg23s board comes with the SiI9022ACNU HDMI transmitter,
this patch makes sure the corresponding driver gets built.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---

Hello Simon,

a patch for the multi_v7_defconfig will be sent at a later stage.

Thanks,
Fab

 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index d090022..9e5a5ad 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -142,6 +142,7 @@ CONFIG_DRM=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_LVDS=y
 CONFIG_DRM_DUMB_VGA_DAC=y
+CONFIG_DRM_SII902X=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_FB_SH_MOBILE_LCDC=y
-- 
2.7.4
