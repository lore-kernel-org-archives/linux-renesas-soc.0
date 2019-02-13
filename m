Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CD0C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 10:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C0032190A
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 10:33:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="RIN3LL9T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389683AbfBMKdI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 05:33:08 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39985 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbfBMKdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 05:33:08 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AB03125BE34;
        Wed, 13 Feb 2019 21:33:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550053985; bh=swDuxpMPf2iGMdMXiuRnN++eM8qPXGjWku44J0GdQBA=;
        h=From:To:Cc:Subject:Date:From;
        b=RIN3LL9TLKWzaXa7giloykhG/VbVLXaAU0u1PuwhBo7PYbMag5tFLwgYy/iVlgmhO
         D6DdZd6maxJrjr3wwpqM0HhUK/SFWcYBcKvCIwFGE/fwcW/5uMlA72WjC9G8GnWmMV
         t8r1xoznGxJS5P3gyX2sJiqxPYzdq8mf0U1LNE9k=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F0BEC944500; Wed, 13 Feb 2019 11:33:03 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77995: draak: Fix EthernetAVB phy mode to rgmii
Date:   Wed, 13 Feb 2019 11:32:55 +0100
Message-Id: <20190213103255.1265-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
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
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index db2bed1751b8..bfa260c9f78c 100644
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

