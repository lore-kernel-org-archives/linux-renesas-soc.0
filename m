Return-Path: <devicetree-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] DT: net: renesas,ravb: document R8A77980 bindings
To: Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
Message-ID: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
Date: Thu, 1 Feb 2018 23:13:45 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas R-Car V3H (R8A77980) SoC has the R-Car gen3 compatible EtherAVB
device, so document the SoC specific bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against DaveM's 'net-next.git' repo but I wouldn't mind if it's
applied to 'net.git' instead. :-)

 Documentation/devicetree/bindings/net/renesas,ravb.txt |    1 +
 1 file changed, 1 insertion(+)

Index: net-next/Documentation/devicetree/bindings/net/renesas,ravb.txt
===================================================================
--- net-next.orig/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ net-next/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -18,6 +18,7 @@ Required properties:
       - "renesas,etheravb-r8a7795" for the R8A7795 SoC.
       - "renesas,etheravb-r8a7796" for the R8A7796 SoC.
       - "renesas,etheravb-r8a77970" for the R8A77970 SoC.
+      - "renesas,etheravb-r8a77980" for the R8A77980 SoC.
       - "renesas,etheravb-r8a77995" for the R8A77995 SoC.
       - "renesas,etheravb-rcar-gen3" as a fallback for the above
 		R-Car Gen3 devices.
