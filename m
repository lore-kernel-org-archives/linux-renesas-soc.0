Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402C6C282C5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C08F2184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ekfjKqFg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbfAXPNj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:39 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPNj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:39 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 493BC25BF09;
        Fri, 25 Jan 2019 02:12:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342765; bh=m9wr3n27o8TRMpJOQgtwEoTEiiImT/awXySBMbYEpag=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ekfjKqFg8pAL8VqcYTQfrbps01zHaVUR2TQ5YeWO+k+mBTJAvE8wDayWgbqFvIQf1
         /rqhyihOcxzHLUGA7ArblIU5F5p+ssmv3enXuzSd1kyFyC6aKeHaetV6fH1TDXgrJd
         x58FJYBv/uhKBwC2LTDi6IoJAWCnbDmAhgG2QXkQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 73AF9940E4C; Thu, 24 Jan 2019 16:12:41 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 40/44] arm64: dts: renesas: v3msk: specify EtherAVB PHY IRQ
Date:   Thu, 24 Jan 2019 16:12:34 +0100
Message-Id: <d5e5790c6ff0b6825f6d8b4baf67fa13810ce4fc.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Specify EtherAVB PHY IRQ in the V3M Starter Kit board's device tree, now
that we have the GPIO support (previously phylib had to resort to polling).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 0dbcb4cccc18..15cc9fed2e16 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -108,6 +108,8 @@
 	phy0: ethernet-phy@0 {
 		rxc-skew-ps = <1500>;
 		reg = <0>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-- 
2.11.0

