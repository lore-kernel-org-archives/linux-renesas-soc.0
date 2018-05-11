Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:37575 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750927AbeEKDNr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 May 2018 23:13:47 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: net: ravb: Add support for r8a77990 SoC
Date: Fri, 11 May 2018 12:13:06 +0900
Message-Id: <1526008386-26420-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526008386-26420-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526008386-26420-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add documentation for r8a77990 compatible string to renesas ravb device
tree bindings documentation.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index 890526d..fac897d 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -21,6 +21,7 @@ Required properties:
       - "renesas,etheravb-r8a77965" for the R8A77965 SoC.
       - "renesas,etheravb-r8a77970" for the R8A77970 SoC.
       - "renesas,etheravb-r8a77980" for the R8A77980 SoC.
+      - "renesas,etheravb-r8a77990" for the R8A77990 SoC.
       - "renesas,etheravb-r8a77995" for the R8A77995 SoC.
       - "renesas,etheravb-rcar-gen3" as a fallback for the above
 		R-Car Gen3 devices.
-- 
1.9.1
