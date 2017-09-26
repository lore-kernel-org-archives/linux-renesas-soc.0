Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54385 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965482AbdIZKGQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:16 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 2604321469
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:05 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 02/13] dt-bindings: media: renesas-fcp: Add a compatible string for VSPI FCP
Date: Tue, 26 Sep 2017 13:05:54 +0300
Message-Id: <20170926100605.2313-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The FCP instances associated with a VSPI must be treated differently
than the ones associated with another type of VSP. Add a new compatible
string to allow telling them apart.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
index 3ec91803ba58..c1f28736e2d6 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
@@ -11,7 +11,8 @@ are paired with. These DT bindings currently support the FCPV and FCPF.
 
  - compatible: Must be one or more of the following
 
-   - "renesas,fcpv" for generic compatible 'FCP for VSP'
+   - "renesas,fcpvi" for generic compatible 'FCP for VSPI'
+   - "renesas,fcpv" for generic compatible 'FCP for VSP' (all other VSPs)
    - "renesas,fcpf" for generic compatible 'FCP for FDP'
 
  - reg: the register base and size for the device registers
-- 
Regards,

Laurent Pinchart
