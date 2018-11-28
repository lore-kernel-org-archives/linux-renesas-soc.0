Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:47712
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727382AbeK1UYk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 15:24:40 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "joro@8bytes.org" <joro@8bytes.org>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] iommu/ipmmu-vmsa: add an array of slave devices
 whitelist
Date: Wed, 28 Nov 2018 09:23:36 +0000
Message-ID: <1543396868-14723-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1543396868-14723-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1543396868-14723-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

To avoid adding copy and pasted strcmp codes in the future,
this patch adds an array "rcar_gen3_slave_whitelist" to check
whether the device can work with the IPMMU or not.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/iommu/ipmmu-vmsa.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 5f88031..60e3314 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -773,8 +773,13 @@ static int ipmmu_init_platform_device(struct device *d=
ev,
 	{ /* sentinel */ }
 };
=20
+static const char * const rcar_gen3_slave_whitelist[] =3D {
+};
+
 static bool ipmmu_slave_whitelist(struct device *dev)
 {
+	unsigned int i;
+
 	/*
 	 * For R-Car Gen3 use a white list to opt-in slave devices.
 	 * For Other SoCs, this returns true anyway.
@@ -786,7 +791,13 @@ static bool ipmmu_slave_whitelist(struct device *dev)
 	if (!soc_device_match(soc_rcar_gen3_whitelist))
 		return false;
=20
-	/* By default, do not allow use of IPMMU */
+	/* Check whether this slave device can work with the IPMMU */
+	for (i =3D 0; i < ARRAY_SIZE(rcar_gen3_slave_whitelist); i++) {
+		if (!strcmp(dev_name(dev), rcar_gen3_slave_whitelist[i]))
+			return true;
+	}
+
+	/* Otherwise, do not allow use of IPMMU */
 	return false;
 }
=20
--=20
1.9.1
