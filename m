Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85456C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5946E2184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Sl8B2mYp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbfAXPNt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:49 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPNt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:49 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D846E25BF15;
        Fri, 25 Jan 2019 02:12:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342766; bh=dm/iK671NtjSHS+gUSA82jNuD6JDX33CA9cLxwGcyaU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sl8B2mYpAl80SPB/QfYA8IY6K+tQK4fq60ogsRh/Y9xjNpi5yV5TyU058fusZYwB6
         hJCGNUxdFL7LGheTYv9zbXJq+k7c59vGcZ4NnqTmeqbXdy2kHnj070qZNJe+ymHvTj
         ympk9+ckycj562Lf5kqtuq1fAipO0w6U77WvDw2E=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B74F5940D20; Thu, 24 Jan 2019 16:12:40 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 27/44] arm64: dts: renesas: r8a774c0: Connect RZ/G2E Audio-DMAC to IPMMU
Date:   Thu, 24 Jan 2019 16:12:21 +0100
Message-Id: <52a20e64cce7f25727e6ca5de19424222bdd220a.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Hook up the RZ/G2E Audio-DMAC device to IPMMU-MP as stated by the
RZ/G2 User's manual.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 58d4c60c54c3..6247ebc22b2a 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1296,6 +1296,14 @@
 			resets = <&cpg 502>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp 0>, <&ipmmu_mp 1>,
+				 <&ipmmu_mp 2>, <&ipmmu_mp 3>,
+				 <&ipmmu_mp 4>, <&ipmmu_mp 5>,
+				 <&ipmmu_mp 6>, <&ipmmu_mp 7>,
+				 <&ipmmu_mp 8>, <&ipmmu_mp 9>,
+				 <&ipmmu_mp 10>, <&ipmmu_mp 11>,
+				 <&ipmmu_mp 12>, <&ipmmu_mp 13>,
+				 <&ipmmu_mp 14>, <&ipmmu_mp 15>;
 		};
 
 		xhci0: usb@ee000000 {
-- 
2.11.0

