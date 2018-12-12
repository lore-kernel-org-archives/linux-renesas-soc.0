Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA84C04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53EFD20849
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="A1ud9BUg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53EFD20849
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbeLLKqD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 05:46:03 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:44362 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbeLLKqD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 05:46:03 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2876525AE79;
        Wed, 12 Dec 2018 21:46:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544611561; bh=IdwZwCAVHXeZDcKLr6hBo2xPxh8Nu1+LoB2nKb3BnDc=;
        h=From:To:Cc:Subject:Date:From;
        b=A1ud9BUgwlLthJIu/8lju97Qgg0KXeTJ3SlJwbJhEsWEnah268b2SCzQpaHryZi4p
         q0aBrdhRnvALOION2TYprdyuRmGCF4JXtOWTnSNmOKrUXZW10/17H8bXjMySqyGncF
         mIvBPNBCF4Dpn/UQj/hftdTOUwP7D8avv6BqUldU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7E38C9404C7; Wed, 12 Dec 2018 11:45:59 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix EthernetAVB phy mode to rgmii
Date:   Wed, 12 Dec 2018 11:45:52 +0100
Message-Id: <20181212104552.27414-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
August 24, 2018, the TX clock internal delay mode doesn't support
on R-Car E3. This patch fixes EthernetAVB phy mode to rgmii.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

 Based on renesas-devel-20181210-v4.20-rc6

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 62bdddcbbae7..0c4df048a8cb 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -248,7 +248,7 @@
 	pinctrl-names = "default";
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii-txid";
+	phy-mode = "rgmii";
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-- 
2.11.0

