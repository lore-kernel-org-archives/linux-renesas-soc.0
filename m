Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1310111.outbound.protection.outlook.com ([40.107.131.111]:25803
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726972AbeK1RLI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 12:11:08 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "joro@8bytes.org" <joro@8bytes.org>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] iommu/ipmmu-vmsa: Modify ipmmu_slave_whitelist() to check
 SoC revisions
Date: Wed, 28 Nov 2018 06:10:30 +0000
Message-ID: <1543385279-1584-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1543385279-1584-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1543385279-1584-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some R-Car Gen3 SoCs has hardware restrictions on the IPMMU. So,
to check whether this R-Car Gen3 SoC can use the IPMMU correctly,
this patch modifies the ipmmu_slave_whitelist().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9e2655f..1c38538 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -754,12 +754,6 @@ static int ipmmu_init_platform_device(struct device *d=
ev,
 	return 0;
 }
=20
-static bool ipmmu_slave_whitelist(struct device *dev)
-{
-	/* By default, do not allow use of IPMMU */
-	return false;
-}
-
 static const struct soc_device_attribute soc_rcar_gen3[] =3D {
 	{ .soc_id =3D "r8a774a1", },
 	{ .soc_id =3D "r8a7795", },
@@ -771,11 +765,35 @@ static bool ipmmu_slave_whitelist(struct device *dev)
 	{ /* sentinel */ }
 };
=20
+static const struct soc_device_attribute soc_rcar_gen3_whitelist[] =3D {
+	{ .soc_id =3D "r8a7795", .revision =3D "ES3.0" },
+	{ .soc_id =3D "r8a77965", },
+	{ .soc_id =3D "r8a77990", },
+	{ .soc_id =3D "r8a77995", },
+	{ /* sentinel */ }
+};
+
+static bool ipmmu_slave_whitelist(struct device *dev)
+{
+	/*
+	 * For R-Car Gen3 use a white list to opt-in slave devices.
+	 * For Other SoCs, this returns true anyway.
+	 */
+	if (!soc_device_match(soc_rcar_gen3))
+		return true;
+
+	/* Check whether this R-Car Gen3 can use the IPMMU correctly or not */
+	if (!soc_device_match(soc_rcar_gen3_whitelist))
+		return false;
+
+	/* By default, do not allow use of IPMMU */
+	return false;
+}
+
 static int ipmmu_of_xlate(struct device *dev,
 			  struct of_phandle_args *spec)
 {
-	/* For R-Car Gen3 use a white list to opt-in slave devices */
-	if (soc_device_match(soc_rcar_gen3) && !ipmmu_slave_whitelist(dev))
+	if (!ipmmu_slave_whitelist(dev))
 		return -ENODEV;
=20
 	iommu_fwspec_add_ids(dev, spec->args, 1);
--=20
1.9.1
