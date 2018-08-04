Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33584 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbeHEBQL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Aug 2018 21:16:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id g6-v6so8829565wrp.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Aug 2018 16:13:53 -0700 (PDT)
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
Subject: [PATCH 08/14] arm64: dts: renesas: r8a7796: ulcb-kf: Use "renesas,ulcb" compatible
Date: Sun,  5 Aug 2018 01:11:08 +0200
Message-Id: <20180804231114.21420-9-erosca@de.adit-jv.com>
In-Reply-To: <20180804231114.21420-1-erosca@de.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Following the recent change in dt-bindings [1], switch from
"renesas,m3ulcb" to "renesas,ulcb" compatible string.

[1] Documentation/devicetree/bindings/arm/shmobile.txt

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-ulcb-kf.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a7796-ulcb-kf.dts
index faa32c28eef7..5bd655c0355e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-ulcb-kf.dts
@@ -14,6 +14,6 @@
 
 / {
 	model = "Renesas M3ULCB Kingfisher board based on r8a7796";
-	compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
+	compatible = "shimafuji,kingfisher", "renesas,ulcb",
 		     "renesas,r8a7796";
 };
-- 
2.18.0
