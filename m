Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAE2C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DF2F204FD
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbfDJIPV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 04:15:21 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58693 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727281AbfDJIPV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 04:15:21 -0400
X-IronPort-AV: E=Sophos;i="5.60,332,1549897200"; 
   d="scan'208";a="12628463"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2019 17:15:18 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3DD5B426FF8E;
        Wed, 10 Apr 2019 17:15:16 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V4 03/13] dt-bindings: rcar-gen3-phy-usb2: Add r8a77470 support
Date:   Wed, 10 Apr 2019 09:08:25 +0100
Message-Id: <1554883715-41725-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G1C (R8A77470) SoC bindings.

For RZ/G1C, this driver is used to enable interrupt generation and
initializing timing registers which is part of phy_init code.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
V3-->V4
  * No Change
V2-->V3
  * New patch
    https://patchwork.kernel.org/patch/10879899/
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index ad9c290..23894db 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -1,10 +1,12 @@
 * Renesas R-Car generation 3 USB 2.0 PHY
 
 This file provides information on what the device node for the R-Car generation
-3 and RZ/G2 USB 2.0 PHY contain.
+3, RZ/G1C and RZ/G2 USB 2.0 PHY contain.
 
 Required properties:
-- compatible: "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
+- compatible: "renesas,usb2-phy-r8a77470" if the device is a part of an R8A77470
+	      SoC.
+	      "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
 	      SoC.
 	      "renesas,usb2-phy-r8a774c0" if the device is a part of an R8A774C0
 	      SoC.
-- 
2.7.4

