Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54386 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967955AbdIZKGQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:16 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 4DEFA21471
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:05 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 03/13] dt-bindings: media: renesas-fcp: Add memory-region property
Date: Tue, 26 Sep 2017 13:05:55 +0300
Message-Id: <20170926100605.2313-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The FCP can't perform lossy decompression by itself, but relies instead
on the DDR controller to provide that feature. To do so, it needs to
allocate buffers from a special lossy decompression reserved memory
area. This DT property references that memory area.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
index c1f28736e2d6..489b026c4016 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
@@ -19,8 +19,11 @@ are paired with. These DT bindings currently support the FCPV and FCPF.
  - clocks: Reference to the functional clock
 
 Optional properties:
- - power-domains : power-domain property defined with a power domain specifier
-		   to respective power domain.
+ - memory-region: list of phandles referencing the lossy decompression reserved
+ 		  memory regions associated with the FCP, if any. Valid for FCPV
+		  and FCPVI instances only.
+ - power-domains: power-domain property defined with a power domain specifier
+		  to respective power domain.
 
 
 Device node example
-- 
Regards,

Laurent Pinchart
