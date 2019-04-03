Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA46DC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE8AB20700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="fj/UZei9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfDCKyX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKyX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:23 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 352F125BECB;
        Wed,  3 Apr 2019 21:54:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288853; bh=vUA+STE9vf4XvdnIbmwX9eToHK5U4yt0mDcEdMbyaAQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fj/UZei9Ubn1PDNG4wNe7WJu5ZhT1FM05tZjkmAVrwzvYs2tB8fBLR/wx6VAyR0yV
         O0Pt96PNSHnE23bC0ozxPQ0an1dfjRjhC0ohN8kjIhsrOpc3dq65qofZd5vgOZ/nrq
         nhdDYg3mTqN6+pXW1STJJ0IAZ6mILsXxHx3ECGIs=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B635B940444; Wed,  3 Apr 2019 12:54:10 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 06/26] arm64: dts: renesas: ebisu: Fix adv7482 hexadecimal register address
Date:   Wed,  3 Apr 2019 12:53:49 +0200
Message-Id: <9130c15829846fae56ea729f42d1894b8413f89b.1554281697.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1554281697.git.horms+renesas@verge.net.au>
References: <cover.1554281697.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

The register address used for the reg property of the adv7482 node in
other Renesas device trees are decimal not hex, change this for Ebisu to
align it with the others.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[Niklas: rewrite commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 62004b609b15..bfa40196029b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -407,7 +407,7 @@
 		};
 
 		port@a {
-			reg = <0xa>;
+			reg = <10>;
 
 			adv7482_txa: endpoint {
 				clock-lanes = <0>;
-- 
2.11.0

