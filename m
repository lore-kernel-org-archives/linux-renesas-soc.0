Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:39943 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbeHEBQT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Aug 2018 21:16:19 -0400
Received: by mail-wm0-f65.google.com with SMTP id y9-v6so10317049wma.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Aug 2018 16:14:01 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [PATCH 09/14] dt-bindings: arm: Document Renesas R-Car M3-N-based ULCB board
Date: Sun,  5 Aug 2018 01:11:09 +0200
Message-Id: <20180804231114.21420-10-erosca@de.adit-jv.com>
In-Reply-To: <20180804231114.21420-1-erosca@de.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In harmony with ATF and U-Boot outputs [1] and [2], the new board is
based on M3-N revision ES1.1 and the amount of memory present on SiP
is 2GiB, contiguously addressed.

[1] BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.21
    BL2: PRR is R-Car M3N Ver.1.1

[2] U-Boot 2015.04-00295-*
    CPU: Renesas Electronics R8A77965 rev 1.1
    ---8<----
    DRAM:  1.9 GiB
    Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
    ---8<----

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index f391dba10574..2f3494a0107c 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -106,6 +106,8 @@ Boards:
     compatible = "renesas,lager", "renesas,r8a7790"
   - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
     compatible = "renesas,ulcb", "renesas,r8a7796"
+  - M3-N ULCB (R-Car Starter Kit Pro, RTP0RC77965SKBX010SA00 (M3-N ES1.1))
+    compatible = "renesas,ulcb", "renesas,r8a77965"
   - Marzen (R0P7779A00010S)
     compatible = "renesas,marzen", "renesas,r8a7779"
   - Porter (M2-LCDP)
-- 
2.18.0
