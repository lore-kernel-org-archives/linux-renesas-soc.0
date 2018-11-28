Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1310111.outbound.protection.outlook.com ([40.107.131.111]:25803
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726972AbeK1RLF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 12:11:05 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "joro@8bytes.org" <joro@8bytes.org>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] iommu/ipmmu-vmsa: Modify ipmmu_slave_whitelist()
Date: Wed, 28 Nov 2018 06:10:30 +0000
Message-ID: <1543385279-1584-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on iommu.git / latest next branch
(commit id =3D f262283c224537962cba0f41b8823e3be9f7b0ff)

I talked with Geert-san about this topic on below:
https://patchwork.kernel.org/patch/10651375/

Also Simon-san suggests we should keep the whitelist.

So, not to change behavior of R-Car Gen2, this patch set adds
two conditions. After applied this patch set, we can add slave
devices easily like below:

--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -774,6 +774,8 @@ static int ipmmu_init_platform_device(struct device *de=
v,
 };
=20
 static const char * const rcar_gen3_slave_whitelist[] =3D {
+	"e6700000.dma-controller",
+	"e7300000.dma-controller"
 };
=20
 static bool ipmmu_slave_whitelist(struct device *dev)


Yoshihiro Shimoda (2):
  iommu/ipmmu-vmsa: Modify ipmmu_slave_whitelist() to check SoC
    revisions
  iommu/ipmmu-vmsa: add an array of slave devices whitelist

 drivers/iommu/ipmmu-vmsa.c | 45 +++++++++++++++++++++++++++++++++++++-----=
---
 1 file changed, 37 insertions(+), 8 deletions(-)

--=20
1.9.1
