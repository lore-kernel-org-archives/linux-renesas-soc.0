Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:16704
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726195AbeKUSnm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 13:43:42 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "kishon@ti.com" <kishon@ti.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: follow the hardware manual
 procedure
Date: Wed, 21 Nov 2018 08:10:06 +0000
Message-ID: <1542787663-32142-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch modifies rcar_gen3_init_otg() procedure to follow Figure
73.4 of "R-Car Series, 3rd Generation User's Manual: Hardware Rev.1.00".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the latest linux-phy / next branch
(commit id =3D 0eb86fa77f0f0c81631a030f10679a45c05df33a).

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas=
/phy-rcar-gen3-usb2.c
index d0f412c..a9e53e8 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -307,16 +307,21 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan =
*ch)
 	void __iomem *usb2_base =3D ch->base;
 	u32 val;
=20
+	rcar_gen3_set_linectrl(ch, 0, 1);
+	val =3D readl(usb2_base + USB2_LINECTRL1);
+	writel(val | USB2_LINECTRL1_DPRPD_EN | USB2_LINECTRL1_DMRPD_EN,
+	       usb2_base + USB2_LINECTRL1);
+
 	val =3D readl(usb2_base + USB2_VBCTRL);
 	writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
-	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
-	rcar_gen3_control_otg_irq(ch, 1);
 	val =3D readl(usb2_base + USB2_ADPCTRL);
 	writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
-	val =3D readl(usb2_base + USB2_LINECTRL1);
-	rcar_gen3_set_linectrl(ch, 0, 0);
-	writel(val | USB2_LINECTRL1_DPRPD_EN | USB2_LINECTRL1_DMRPD_EN,
-	       usb2_base + USB2_LINECTRL1);
+
+	msleep(20);
+
+	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
+
+	rcar_gen3_control_otg_irq(ch, 1);
=20
 	rcar_gen3_device_recognition(ch);
 }
--=20
1.9.1
