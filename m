Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH ] dt-bindings: net: ravb : Add support for r8a7745 SoC
Date: Tue, 15 Aug 2017 15:40:20 +0100
Message-Id: <1502808020-22406-1-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a new compatible string for the RZ/G1E (R8A7745) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is tested against linux-next tag next-20170815
as well as net-next.

 Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index 4717bc2..1672353 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -6,6 +6,7 @@ interface contains.
 Required properties:
 - compatible: Must contain one or more of the following:
       - "renesas,etheravb-r8a7743" for the R8A7743 SoC.
+      - "renesas,etheravb-r8a7745" for the R8A7745 SoC.
       - "renesas,etheravb-r8a7790" for the R8A7790 SoC.
       - "renesas,etheravb-r8a7791" for the R8A7791 SoC.
       - "renesas,etheravb-r8a7792" for the R8A7792 SoC.
-- 
1.9.1

