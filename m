Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F20C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03EB920700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ou4hFn35"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfDCKyS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:18 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKyS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:18 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5479425BEB8;
        Wed,  3 Apr 2019 21:54:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288852; bh=qHkPyAlW5SbFJx43qPK1mm9440hRlk+sHp4En5PB4Og=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ou4hFn35uNWgIw8RPSN2dMhVvUvLE3/HdMCg1AwFCflL+6vnJ250j4XddMU73tyyI
         pFpH8OwxagSGI81KFA2oN7o9Ilwx4WOGAM0Ft1I2iXJHG3PUqm2eLQtFYH2ohqpkqH
         YP6KxjcRY3ag5yg4FNduaftfUfXNvBtDtURFJRUs=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 760B59403C0; Wed,  3 Apr 2019 12:54:10 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Timo Wischer <twischer@de.adit-jv.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 03/26] arm64: dts: renesas: r8a7796: remove unneeded sound #address/size-cells
Date:   Wed,  3 Apr 2019 12:53:46 +0200
Message-Id: <96c25882252704dc3167367f70977569f4116fcd.1554281697.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1554281697.git.horms+renesas@verge.net.au>
References: <cover.1554281697.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Jiada Wang <jiada_wang@mentor.com>

commit 78bc93b3ffb2 ("arm64: dts: renesas: r8a7796: Add address
properties to rcar_sound port nodes") added missing #address-cells
and #size-cells for sound ports.
But, these are based on platform, not on SoC. This patch cleanups it.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts  |  1 +
 arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts |  1 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi            | 11 -----------
 3 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index b4f9567cb9f8..2aefa53cb16b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -68,6 +68,7 @@
 	ports {
 		/* rsnd_port0 is on salvator-common */
 		rsnd_port1: port@1 {
+			reg = <1>;
 			rsnd_endpoint1: endpoint {
 				remote-endpoint = <&dw_hdmi0_snd_in>;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
index 31f12059355e..d58ede18108d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
@@ -68,6 +68,7 @@
 	ports {
 		/* rsnd_port0 is on salvator-common */
 		rsnd_port1: port@1 {
+			reg = <1>;
 			rsnd_endpoint1: endpoint {
 				remote-endpoint = <&dw_hdmi0_snd_in>;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index cdf784899cf8..111f462cd708 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -2162,17 +2162,6 @@
 					dma-names = "rx", "tx";
 				};
 			};
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 {
-					reg = <0>;
-				};
-				port@1 {
-					reg = <1>;
-				};
-			};
 		};
 
 		audma0: dma-controller@ec700000 {
-- 
2.11.0

