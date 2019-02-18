Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7329C10F01
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B983217D7
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:48:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="cgl0n33c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbfBRKsX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 05:48:23 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:45386 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729667AbfBRKsX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 05:48:23 -0500
Received: from penelope.horms.nl (unknown [62.119.166.9])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F100025BE5E;
        Mon, 18 Feb 2019 21:48:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550486901; bh=32uaDT+PiOq+2YKnV/pfLTweW+XBn0+t82ttKLcKpWQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cgl0n33ci4ua7NrjKg1l0VXINkVOxQl49vpZxeRLlvQJ5HKDRmuAcbaGsM/vRtFks
         FVEgoAxHGhVTZbMKmmx+Jar0+34Um6u91ouD6Z4WMRgaIJljqTezNsP4mU3yPuqZB3
         nkFsw/yLzRG1yZG70zcz8d8DtTeCPv0qM2UJXEPM=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C8838E218D5; Mon, 18 Feb 2019 11:48:07 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/4] dt-bindings: arm: renesas: Fix SoC mismatch for Stout
Date:   Mon, 18 Feb 2019 11:48:06 +0100
Message-Id: <c051dc5e3cea482ceb019028ddde67b7cb921e85.1549624030.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549624030.git.horms+renesas@verge.net.au>
References: <cover.1549624030.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

make dtbs_check:

    arch/arm/boot/dts/r8a7790-stout.dt.yaml: compatible: ['renesas,stout', 'renesas,r8a7790'] is not valid under any of the given schemas

The Stout development board has an R-Car H2 (r8a7790) SoC, not an R-Car
H1 (r8a7779).

Fixes: 12749350567c819d ("dt-bindings: arm: Convert Renesas board/soc bindings to json-schema")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index cb9b4417e8a1..19f379863d50 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -130,13 +130,13 @@ properties:
         items:
           - enum:
               - renesas,marzen # Marzen (R0P7779A00010S)
-              - renesas,stout # Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
           - const: renesas,r8a7779
 
       - description: R-Car H2 (R8A77900)
         items:
           - enum:
               - renesas,lager # Lager (RTP0RC7790SEB00010S)
+              - renesas,stout # Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
           - const: renesas,r8a7790
 
       - description: R-Car M2-W (R8A77910)
-- 
2.11.0

