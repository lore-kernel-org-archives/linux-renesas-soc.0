Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pu1apc01on0094.outbound.protection.outlook.com ([104.47.126.94]:32192
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751798AbcJGFL0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 01:11:26 -0400
From: Jithin T Raj <jithin.t@tataelxsi.co.in>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>
Subject: HDMI No signal for koelsch Board
Date: Fri, 7 Oct 2016 05:11:21 +0000
Message-ID: <SG2PR0401MB1296D6828F14FE3C6D844327D8C60@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

hi,
=A0 =A0 I have a trouble in getting HDMI OUT in koelsche Board=A0=20



I am using source tree v4.1.17-ltsi..also i have applied the below patch to=
 shmobile_defconfig

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobil=
e_defconfig
index 0bdeb4925be4..3aef019c0de7 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -140,7 +140,10 @@ CONFIG_VIDEO_RENESAS_VSP1=3Dy
=A0CONFIG_VIDEO_ADV7180=3Dy
=A0CONFIG_VIDEO_ML86V7667=3Dy
=A0CONFIG_DRM=3Dy
+CONFIG_DRM_I2C_ADV7511=3Dy
=A0CONFIG_DRM_RCAR_DU=3Dy
+CONFIG_DRM_RCAR_HDMI=3Dy
+CONFIG_DRM_RCAR_LVDS=3Dy
=A0CONFIG_FB_SH_MOBILE_LCDC=3Dy
=A0CONFIG_FB_SH_MOBILE_MERAM=3Dy
=A0# CONFIG_LCD_CLASS_DEVICE is not set

and when I checked the pinmux it is like

du_pins: du {
=A0=A0 =A0=A0=A0 =A0renesas,groups =3D "du_rgb666", "du_sync", "du_disp", "=
du_clk_out_0";
=A0=A0 =A0=A0=A0 =A0renesas,function =3D "du";
=A0=A0 =A0};

do I need to change it to =A0 24 bit (du_rgb888)? my UBoot is gb653737..


Best Regards
 Jithin T Raj
=20
   =
