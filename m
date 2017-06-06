Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 2/5] ARM: shmobile: document iW-RainboW-G20M-Qseven-RZG1M system on module
Date: Tue,  6 Jun 2017 16:10:15 +0100
Message-Id: <1496761818-62126-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1496761818-62126-1-git-send-email-biju.das@bp.renesas.com>
References: <1496420523-23506-4-git-send-email-biju.das@bp.renesas.com>
 <1496761818-62126-1-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the iW-RainboW-G20M-Qseven-RZG1M device tree bindings,
listing it as a supported system on module.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 4b60ce2..ace4fe3 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -63,6 +63,8 @@ Boards:
     compatible = "renesas,h3ulcb", "renesas,r8a7795";
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
+  - iWave Systems RZ/G1M Qseven System On Module (iW-RainboW-G20M-Qseven)
+    compatible = "iwave,g20m", "renesas,r8a7743"
   - Koelsch (RTP0RC7791SEB00010S)
     compatible = "renesas,koelsch", "renesas,r8a7791"
   - Kyoto Microcomputer Co. KZM-A9-Dual
-- 
1.9.1

