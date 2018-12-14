Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2A5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 15:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC9FF206DD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 15:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XDWunSu6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbeLNP6z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 10:58:55 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35766 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbeLNP6y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 10:58:54 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 61D3725B75B;
        Sat, 15 Dec 2018 02:58:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544803132; bh=2et4Vkd0a14rD7PjYLwkWzPjF0BAmNZLh1cpZuXea1E=;
        h=From:To:Cc:Subject:Date:From;
        b=XDWunSu6y2hdrIS52Hm5KPbTclDy1hKM6Qa+bMZq83AoAdu+IH9qNc/DuGRmnljmg
         lr/35yzbiMYm0ICE6vXn4U+npi94ovFGnaPlFO4Ef0dvoZzNQth6mf+ne6f+EbBOEe
         UMlwD+s9U3VTbZj0mOBQKUJJ35aJYg8jnptYcDdM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 886429403C3; Fri, 14 Dec 2018 16:58:50 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] arm64: dts: renesas: r8a77990: ebisu: Fix EthernetAVB phy mode to rgmii
Date:   Fri, 14 Dec 2018 16:58:44 +0100
Message-Id: <20181214155844.25662-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
August 24, 2018, the TX clock internal delay mode doesn't support
on R-Car E3. This patch fixes EthernetAVB phy mode to rgmii.

v2 [Simon Horman]
* Simply drop phy-mode property from r8a77990-ebisu.dts
  as the default property for this for r8a77990, as set in
  r8a77990.dtsi, is "rgmii".

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 -
 1 file changed, 1 deletion(-)

 Based on renesas-devel-20181213-v4.20-rc6

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 62bdddcbbae7..b7082c5bab60 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -248,7 +248,6 @@
 	pinctrl-names = "default";
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii-txid";
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-- 
2.11.0

