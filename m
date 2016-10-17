Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57277 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759384AbcJQU3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2016 16:29:12 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 60E112038D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Oct 2016 22:28:21 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: renesas-fcp: Remove SoC-specific compatible strings
Date: Mon, 17 Oct 2016 23:29:02 +0300
Message-Id: <1476736143-29937-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1476736143-29937-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476736143-29937-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The FCP IP cores include a version register that identifies which SoC
model the IP is integrated in. SoC-specific compatible strings are not
needed.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.txt | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
index 27f9b8e459ac..3ec91803ba58 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
@@ -11,15 +11,9 @@ are paired with. These DT bindings currently support the FCPV and FCPF.
 
  - compatible: Must be one or more of the following
 
-   - "renesas,r8a7795-fcpv" for R8A7795 (R-Car H3) compatible 'FCP for VSP'
-   - "renesas,r8a7795-fcpf" for R8A7795 (R-Car H3) compatible 'FCP for FDP'
    - "renesas,fcpv" for generic compatible 'FCP for VSP'
    - "renesas,fcpf" for generic compatible 'FCP for FDP'
 
-   When compatible with the generic version, nodes must list the
-   SoC-specific version corresponding to the platform first, followed by the
-   family-specific and/or generic versions.
-
  - reg: the register base and size for the device registers
  - clocks: Reference to the functional clock
 
@@ -32,7 +26,7 @@ Device node example
 -------------------
 
 	fcpvd1: fcp@fea2f000 {
-		compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+		compatible = "renesas,fcpv";
 		reg = <0 0xfea2f000 0 0x200>;
 		clocks = <&cpg CPG_MOD 602>;
 		power-domains = <&sysc R8A7795_PD_A3VP>;
-- 
Regards,

Laurent Pinchart
