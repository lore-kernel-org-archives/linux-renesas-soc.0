Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC275C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB6B220700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="A8irM3FF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfDCKyp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:45 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKyp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:45 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A55D625BECC;
        Wed,  3 Apr 2019 21:54:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288855; bh=Tjw5EOGxIyGLqODX8Km0Kb/vLwlfA8PCPWuQh12drm0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A8irM3FFXEUS5NCc6O+q7IekdUZ2aamqvodazP3wPW1NZ/M0P7ypXJveut5iGMAl1
         69SJOighNWDStTXbZJ7r28ahn6ji9SFlcbnhZ1/DtSgcZ3TLcMvnqp0Ddh9Bknticz
         ePw3AmdMx0nj2YZt6fMjQfIyi3zHzOw/QnFqxL38=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 70787940669; Wed,  3 Apr 2019 12:54:11 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 16/26] arm64: dts: renesas: r8a77990: Remove invalid compatible value for CSI40
Date:   Wed,  3 Apr 2019 12:53:59 +0200
Message-Id: <af965ba3248edde50c2a57b9c719b419e2feca94.1554281697.git.horms+renesas@verge.net.au>
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
Remove the only occurrence of the compatible value which manage to make
it upstream.

Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index b506d5613e01..0ca7cb72bfa7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1657,7 +1657,7 @@
 		};
 
 		csi40: csi2@feaa0000 {
-			compatible = "renesas,r8a77990-csi2", "renesas,rcar-gen3-csi2";
+			compatible = "renesas,r8a77990-csi2";
 			reg = <0 0xfeaa0000 0 0x10000>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 716>;
-- 
2.11.0

