Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709E4C282C5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39A422184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="pwt35HRA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfAXPN1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:27 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPN0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:26 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8E48625BF00;
        Fri, 25 Jan 2019 02:12:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342764; bh=qX9IulV3oia5ZE7Z04lEVFjAVdpZHrt/pOcAH5dkHr8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pwt35HRA/b5F/xG123U7qVFCy/7Z48n5IGa6Mhrf7vHd5d5i31pEmroWVpVvMMBEn
         jxnqTSS0nVAYhNGKrlJHeijXd4fHsGKQEQaaP0qE1Pcq+hD4NSKJ+BXukAKtiahcui
         0wIIkp7yCvRps8deNAVp7jGgOn+mmzpomRrdlX1A=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0DF9C940D52; Thu, 24 Jan 2019 16:12:41 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 33/44] arm64: dts: renesas: r8a7796: salvator-xs: Convert to new LVDS DT bindings
Date:   Thu, 24 Jan 2019 16:12:27 +0100
Message-Id: <2e0e5b1685b708297b8ace867eacb0d692a2b7cf.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

As of commit 6d2ca85279becdff ("dt-bindings: display: renesas: Deprecate
LVDS support in the DU bindings"), the internal LVDS encoder has DT
bindings separate from the DU.  The device trees for all R-Car H3 and
M3-W development boards were ported over to the new model, but
Salvator-XS boards equipped with an R-Car M3-W SoC were forgotten.

Fixes: 58e8ed2ee9abe718 ("arm64: dts: renesas: Convert to new LVDS DT bindings")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
index 8860be65342e..31f12059355e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
@@ -29,11 +29,10 @@
 	clocks = <&cpg CPG_MOD 724>,
 		 <&cpg CPG_MOD 723>,
 		 <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 727>,
 		 <&versaclock6 1>,
 		 <&x21_clk>,
 		 <&versaclock6 2>;
-	clock-names = "du.0", "du.1", "du.2", "lvds.0",
+	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
 
-- 
2.11.0

