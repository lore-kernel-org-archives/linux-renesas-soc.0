Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:60580 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753047AbeBFNGB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 08:06:01 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] dt-bindings: net: renesas-ravb: Make stream buffer optional
Date: Tue,  6 Feb 2018 14:05:52 +0100
Message-Id: <1517922354-28421-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1517922354-28421-1-git-send-email-geert+renesas@glider.be>
References: <1517922354-28421-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Stream Buffer for EtherAVB-IF (STBE) is an optional component, and
is not present on all SoCs.

Document this in the DT bindings, including a list of SoCs that do have
it.

Fixes: 785ec87483d1e24a ("ravb: document R8A77970 bindings")
Fixes: f231c4178a655b09 ("dt-bindings: net: renesas-ravb: Add support for R8A77995 RAVB")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/net/renesas,ravb.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index c902261893b913f5..296191c323a64403 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -26,7 +26,10 @@ Required properties:
 	SoC-specific version corresponding to the platform first followed by
 	the generic version.
 
-- reg: offset and length of (1) the register block and (2) the stream buffer.
+- reg: Offset and length of (1) the register block and (2) the stream buffer.
+       The region for the register block is mandatory.
+       The region for the stream buffer is optional, as it is only present on
+       R-Car Gen2, RZ/G1, and R-Car H3 and M3-W.
 - interrupts: A list of interrupt-specifiers, one for each entry in
 	      interrupt-names.
 	      If interrupt-names is not present, an interrupt specifier
-- 
2.7.4
