Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD6EC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4361320700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CQsQAc6I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfDCKyZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKyY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:24 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2CF7325BECE;
        Wed,  3 Apr 2019 21:54:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288854; bh=GFl+KXBc65rmy1w1QAegGqD/Ug0f7s9zz85r5ZF4Zlw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CQsQAc6InOUTnb0AUe0xiu+IVPn6XOk+hsMR+FjIszYKCD75qrhNHLJcomKHDNidX
         rKaiEbRMz1oHz50N9+K7YTDduw6Z5CaakqkBmSawlsKuW9Y036PFJhUA7WO0v/WGpS
         XYQdCiRIInwAjG3TReS4CiP8AM0sXbhd2BIpuNs0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 58F03940600; Wed,  3 Apr 2019 12:54:11 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 15/26] arm64: dts: renesas: r8a774c0: Remove invalid compatible value for CSI40
Date:   Wed,  3 Apr 2019 12:53:58 +0200
Message-Id: <82ec009297bc573e6aace629181d13ed6ce3772f.1554281697.git.horms+renesas@verge.net.au>
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

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The compatible value renesas,rcar-gen3-csi2 was used while prototyping
the R-Car CSI-2 driver but was removed before the driver was merged.

Fixes: e961ab42e034d469 ("arm64: dts: renesas: r8a774c0: Add VIN and CSI-2 device nodes")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 0bbcaf181262..ebe69dcfa3ca 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1741,8 +1741,7 @@
 		};
 
 		csi40: csi2@feaa0000 {
-			compatible = "renesas,r8a774c0-csi2",
-				     "renesas,rcar-gen3-csi2";
+			compatible = "renesas,r8a774c0-csi2";
 			reg = <0 0xfeaa0000 0 0x10000>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 716>;
-- 
2.11.0

