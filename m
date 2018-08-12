Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44752 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbeHLQKw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Aug 2018 12:10:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id r16-v6so12002202wrt.11
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Aug 2018 06:32:47 -0700 (PDT)
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
Subject: [PATCH v2 1/7] dt-bindings: arm: Document Renesas R-Car M3-N-based ULCB board
Date: Sun, 12 Aug 2018 15:31:43 +0200
Message-Id: <20180812133149.7710-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In harmony with ATF and U-Boot outputs [1] and [2], the new board is
based on M3-N revision ES1.1 and the amount of memory present on SiP
is 2GiB, contiguously addressed.

The amount of RAM is mentioned based on the assumption that it is
encoded in the board id/string. There is some evidence supporting this
in form of last-digit-mismatch between two R-Car H3 ES2.0 ULCB board
ids, one with 4GiB and one with 8GiB of RAM (see [3]).

[1] BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.21
    BL2: PRR is R-Car M3N Ver.1.1

[2] U-Boot 2015.04-00295-*
    CPU: Renesas Electronics R8A77965 rev 1.1
    ---8<----
    DRAM:  1.9 GiB
    Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
    ---8<----

[3] https://patchwork.kernel.org/patch/10555957/#22169325

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
Changes in v2:
 - [Jacopo Mondi] Emphasized the fact the amount of RAM is encoded in
   the board id, so documenting it *is* relevant for this commit.
 - [Simon Horman]
   - Renamed board name 's/M3-N ULCB/M3NULCB/'
   - Renamed compatible string 's/renesas,ulcb/renesas,m3nulcb/'
 - Pushed all dt-bindings patches to the beginning of the series.
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index d8cf740132c6..03a314c7989d 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -106,6 +106,8 @@ Boards:
     compatible = "renesas,lager", "renesas,r8a7790"
   - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
     compatible = "renesas,m3ulcb", "renesas,r8a7796"
+  - M3NULCB (R-Car Starter Kit Pro, RTP0RC77965SKBX010SA00 (M3-N ES1.1))
+    compatible = "renesas,m3nulcb", "renesas,r8a77965"
   - Marzen (R0P7779A00010S)
     compatible = "renesas,marzen", "renesas,r8a7779"
   - Porter (M2-LCDP)
-- 
2.18.0
