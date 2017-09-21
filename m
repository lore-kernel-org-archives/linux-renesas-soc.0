Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36115 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751707AbdIUVrS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 17:47:18 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, laurent.pinchart+renesas@ideasonboard.com,
        geert+renesas@glider.be, joro@8bytes.org,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        robin.murphy@arm.com
Date: Fri, 22 Sep 2017 06:44:54 +0900
Message-Id: <150603029494.9664.3785539947602559695.sendpatchset@little-apple>
Subject: [PATCH 0/3] iommu/ipmmu-vmsa: R-Car Gen3 IPMMU DT binding update
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

iommu/ipmmu-vmsa: R-Car Gen3 IPMMU DT binding update

[PATCH 1/3] iommu/ipmmu-vmsa: Document R-Car M3-W IPMMU DT bindings
[PATCH 2/3] iommu/ipmmu-vmsa: Document R-Car V3M IPMMU DT bindings
[PATCH 3/3] iommu/ipmmu-vmsa: Document R-Car D3 IPMMU DT bindings

This series documents IPMMU DT bindings for the following SoCs:
 - R-Car M3-W - R8A7796
 - R-Car V3M - R8A77970
 - R-Car D3 - R8A77995

Patch 1/3 is ready for upstream merge and includes the following tags:
Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch 2/3 and 3/3 are quite trivial but have no acked-by so far.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of v4.14-rc1

 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    3 +++
 1 file changed, 3 insertions(+)
