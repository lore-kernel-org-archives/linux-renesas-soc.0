Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15ABC10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 14:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B90992184B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 14:41:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfDKOlN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 10:41:13 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:62824 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726264AbfDKOlN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 10:41:13 -0400
X-IronPort-AV: E=Sophos;i="5.60,337,1549897200"; 
   d="scan'208";a="12768469"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Apr 2019 23:41:11 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 343C34067529;
        Thu, 11 Apr 2019 23:41:08 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/4] dt-bindings: display: renesas: du: Document the r8a774a1 bindings
Date:   Thu, 11 Apr 2019 15:34:28 +0100
Message-Id: <1554993271-29523-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
References: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the RZ/G2M (R8A774A1) SoC in the R-Car DU bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index aedb22b..c97dfac 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -7,6 +7,7 @@ Required Properties:
     - "renesas,du-r8a7744" for R8A7744 (RZ/G1N) compatible DU
     - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
     - "renesas,du-r8a77470" for R8A77470 (RZ/G1C) compatible DU
+    - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
     - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
     - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
     - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
@@ -58,6 +59,7 @@ corresponding to each DU output.
  R8A7744 (RZ/G1N)       DPAD 0         LVDS 0         -              -
  R8A7745 (RZ/G1E)       DPAD 0         DPAD 1         -              -
  R8A77470 (RZ/G1C)      DPAD 0         DPAD 1         LVDS 0         -
+ R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
  R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
  R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
  R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
-- 
2.7.4

