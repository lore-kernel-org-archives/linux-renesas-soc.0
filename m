Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35591 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753185AbdKXK6f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Nov 2017 05:58:35 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Alex Williamson <alex.williamson@redhat.com>,
        Joerg Roedel <joro@8bytes.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/2] iommu/ipmmu-vmsa: Add r8a779(6|70|95) DT bindings
Date: Fri, 24 Nov 2017 10:58:02 +0000
Message-Id: <20171124105804.26924-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update the IPMMU DT binding documentation to include r8a7796 (R-Car M3-W),
r8a77970 (R-Car V3M) and r8a77995 (R-Car D3) compat strings.

This patch-set is comprised of patches previously included in
* [PATCH v4 0/3] iommu/ipmmu-vmsa: r8a7796 support V4
* [PATCH 0/2] iommu/ipmmu-vmsa: r8a779(70|95) support

Those series also include driver updates to implement the bindings,
however, it while it is felt that the bindings themselves are ready
to be merged we feel that the driver updates are not at that stage yet.

Changes since v1:
* Correct typo in r8a779(70|95) patch: R8A7770 -> R8A77970


Magnus Damm (1):
  iommu/ipmmu-vmsa: Add r8a7796 DT binding

Simon Horman (1):
  iommu/ipmmu-vmsa: Add r8a779(70|95) DT bindings

 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.11.0
