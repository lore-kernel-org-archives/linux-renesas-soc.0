Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:34909 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934615AbcI2Wcm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 18:32:42 -0400
Received: by mail-lf0-f42.google.com with SMTP id l131so92404463lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Sep 2016 15:32:42 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: horms@verge.net.au
Subject: [PATCH RFC v2 10/12] DT: arm: shmobile: document SK-RZG1M board
Date: Fri, 30 Sep 2016 01:32:38 +0300
Message-ID: <32082029.3R2IVcCXuY@wasted.cogentembedded.com>
In-Reply-To: <1987532.PE2ex6PrJ5@wasted.cogentembedded.com>
References: <1987532.PE2ex6PrJ5@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the SK-RZG1M device tree bindings, listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to the
SK-RZG1M board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- new patch.

 Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
+++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -75,5 +75,7 @@ Boards:
     compatible = "renesas,salvator-x", "renesas,r8a7796";
   - SILK (RTP0RC7794LCB00011S)
     compatible = "renesas,silk", "renesas,r8a7794"
+  - SK-RZG1M (YR8A77430S000BE)
+    compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
   - Wheat
     compatible = "renesas,wheat", "renesas,r8a7792"
