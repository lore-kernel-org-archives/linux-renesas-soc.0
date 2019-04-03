Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A924C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B3F320700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="OFUDC00j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfDCKyj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:39 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKyi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:38 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E37D025BEDF;
        Wed,  3 Apr 2019 21:54:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288855; bh=z0DnxR1jGnsYiEVMJPrDOklAT7sYXPbEOKxkWHaiwy8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OFUDC00j7euk0nRPf4DyxaU+YH6/QlmgwXuYrSv/OVp9eQJC7kECB0xgz5ffyurOm
         +rU9ySMIpKcEtaDSAoFnZc6Tpn1NL26NoJJBB2plmdoZV3SZTUJtQwKN+X1/ZtdeqN
         boWlPXycTAbuSgDPRSYkNEo0C72wQjR5fK2l+aWA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3591D9404F6; Wed,  3 Apr 2019 12:54:11 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 13/26] arm64: dts: renesas: r8a774c0-cat874: Add RWDT support
Date:   Wed,  3 Apr 2019 12:53:56 +0200
Message-Id: <79223ca1f57776d2770da9561c26cc2f2dd42205.1554281697.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1554281697.git.horms+renesas@verge.net.au>
References: <cover.1554281697.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Enable RWDT and use 60 seconds as default timeout.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 959919af5628..42c66f9d8f96 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -126,6 +126,11 @@
 	};
 };
 
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
-- 
2.11.0

