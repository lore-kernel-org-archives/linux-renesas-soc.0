Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:44880 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751422AbdFFPXv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2017 11:23:51 -0400
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
Subject: [PATCH v2 3/5] ARM: shmobile: document iW-RainboW-G20D-Qseven-RZG1M board
Date: Tue,  6 Jun 2017 16:10:16 +0100
Message-Id: <1496761818-62126-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1496761818-62126-1-git-send-email-biju.das@bp.renesas.com>
References: <1496420523-23506-4-git-send-email-biju.das@bp.renesas.com>
 <1496761818-62126-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the iW-RainboW-G20D-Qseven-RZG1M device tree bindings,
listing it as a supported board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index ace4fe3..9b6f6cc 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -63,6 +63,8 @@ Boards:
     compatible = "renesas,h3ulcb", "renesas,r8a7795";
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
+  - iWave Systems RZ/G1M Qseven Development Platform (iW-RainboW-G20D-Qseven)
+    compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743"
   - iWave Systems RZ/G1M Qseven System On Module (iW-RainboW-G20M-Qseven)
     compatible = "iwave,g20m", "renesas,r8a7743"
   - Koelsch (RTP0RC7791SEB00010S)
-- 
1.9.1
