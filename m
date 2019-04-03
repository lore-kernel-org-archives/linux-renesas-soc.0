Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A53C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2038220700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="OUqJ0t1A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfDCKyw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKyv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ADAB125BEEA;
        Wed,  3 Apr 2019 21:54:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288856; bh=gzafnC0chXl0RtZPC5UOX3a4+Utl9UzQ7LQSGNR+h4c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OUqJ0t1Aul1Ey1AjRzRlod5Y6c85vPLYQUDNHUxXKufFlQyMHgqHM3fniDHrHgGZD
         wJ6mbADg1P20IrjDvyqt2UTw8Fbtmt7xc7j9oxoiXhGnsBpTqyrjQr/uNIY5bBpMk0
         j9hioQ0irVBpJpvMG3ew0N9g1FKl72t7OMDIxQXU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0C943940B15; Wed,  3 Apr 2019 12:54:12 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 24/26] arm64: dts: renesas: r8a77995: draak: Fix EthernetAVB phy mode to rgmii
Date:   Wed,  3 Apr 2019 12:54:07 +0200
Message-Id: <05f1d882d28b871f0c32a6307c7777fa834b2541.1554281697.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1554281697.git.horms+renesas@verge.net.au>
References: <cover.1554281697.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
August 24, 2018, the TX clock internal Delay mode does'nt support
on R-Car D3. This patch fixes EthernetAVB phy mode to rgmii.

This is achieved by simply dropping the phy-mode property from
r8a77995-draak.dts as the default property for this for r8a77995,
as set in r8a77995.dtsi, is "rgmii".

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Tested-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 25ae65294edd..a7dc11e36fd9 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -168,7 +168,6 @@
 	pinctrl-names = "default";
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii-txid";
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-- 
2.11.0

