Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633F5C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2941220700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="p4FRA7D0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfDCKyV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKyV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:21 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2FDB525BEC6;
        Wed,  3 Apr 2019 21:54:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288853; bh=CdOk4fNLmO/uQr9rq30mnl+iIu3VAZI2DXTvxfql6t8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p4FRA7D0gX3OFy8uuk0WzkHIGn7HKfMRC4+k1njNTxYr2zABG7xp4Xdpj3Z5ByXtU
         68WW6DO5nWJ/b5YI2l8lo8hq9kBUMwQDtwm+/fxKfZu0st06YKy6chqxMLj6JgASp4
         Z1rxpaHM7c1JGe+RdGIrsmSLLjcihBZgDge/MLtU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9B2A2940410; Wed,  3 Apr 2019 12:54:10 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 05/26] arm64: dts: renesas: r8a77995: draak: Enable LVDS1 encoder
Date:   Wed,  3 Apr 2019 12:53:48 +0200
Message-Id: <9a0ff5c727b60a3afefc71407612e515f7a51ef3.1554281697.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1554281697.git.horms+renesas@verge.net.au>
References: <cover.1554281697.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The LVDS1 encoder must supply a pixel clock to the DU for the DPAD
output when the LVDS0 encoder is used. Enable it despite its output not
being connected.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index db2bed1751b8..244b0dda03ed 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -356,6 +356,13 @@
 };
 
 &lvds1 {
+	/*
+	 * Even though the LVDS1 output is not connected, the encoder must be
+	 * enabled to supply a pixel clock to the DU for the DPAD output when
+	 * LVDS0 is in use.
+	 */
+	status = "okay";
+
 	clocks = <&cpg CPG_MOD 727>,
 		 <&x12_clk>,
 		 <&extal_clk>;
-- 
2.11.0

