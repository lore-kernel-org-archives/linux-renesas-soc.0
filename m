Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49365C282C5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:12:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1209D2184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kqcWONap"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbfAXPMq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:12:46 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfAXPMq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:12:46 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 30FD025BECA;
        Fri, 25 Jan 2019 02:12:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342761; bh=8E63qU3vq3HMFYA4WRz17QWBtmI6iZvVZ11znfOQyL8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kqcWONap/fHRpOQ7wS6Cj67ZMI/0jTHCwiEr5LkSSB0YxVh+r6l+b+ycBb/i4CBah
         cJropWKGFqjbb3dFI1828807wQeO0/z/D5CrZxedNH7BeLFhYnYx4bMl1QlbaaAFpN
         F/7rHRHwjiAfQhd+aEopjKlA65DftTQaanUjogfU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 590EE9407D9; Thu, 24 Jan 2019 16:12:39 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 03/44] arm64: dts: renesas: r8a77990: ebisu: Fix EthernetAVB phy mode to rgmii
Date:   Thu, 24 Jan 2019 16:11:57 +0100
Message-Id: <7eda14afb8843a0d5b6120b889ec8eec407b214d.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
August 24, 2018, the TX clock internal delay mode doesn't support
on R-Car E3. This patch fixes EthernetAVB phy mode to rgmii.

This is achieved by simply dropping the phy-mode property from
r8a77990-ebisu.dts as the default property for this for r8a77990,
as set in r8a77990.dtsi, is "rgmii".

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 24beb0e22cb0..8b66ee86e7bb 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -267,7 +267,6 @@
 	pinctrl-names = "default";
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii-txid";
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-- 
2.11.0

