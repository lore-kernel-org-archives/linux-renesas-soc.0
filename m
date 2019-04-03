Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C2DC10F06
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBCA320700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CoeMatkN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfDCKyR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKyR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:17 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 352B925BE9A;
        Wed,  3 Apr 2019 21:54:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288852; bh=JpflYwf96LdCzHqYMzMtaa8gPKv0GziuF4TfyEsDH2A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CoeMatkNbOh+OmbDJ+iKLXay043xjkS80MVNtZUCc5VcZsZsvvdS2QWpgtsuQYoNE
         GkAPY/ShvllsRtcM4Ek1U8lpssTKVvlLPwKfA/htgVk/JgZX5zWLvK+e+cp6kd9pp3
         247U/K8nQ36OcyoqIAmqWhPkGPg2I7FXfReuDphk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 647DB9401C7; Wed,  3 Apr 2019 12:54:10 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/26] arm64: dts: renesas: r8a77990: Fix SPDX license identifier style
Date:   Wed,  3 Apr 2019 12:53:45 +0200
Message-Id: <b068ed6efe6244d3cdf6965ffa9668eeea434dcb.1554281697.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1554281697.git.horms+renesas@verge.net.au>
References: <cover.1554281697.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

According to Documentation/process/license-rules.rst, SPDX license
identifiers in DTS files should use C++ style comments.

Fixes: f37a7767f6c4ec66 ("arm64: dts: renesas: Add Renesas R8A77990 SoC support")
Fixes: 77049191b24b4586 ("arm64: dts: renesas: Add Renesas Ebisu board support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 4d14926b20f7..fc3e3e297647 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the ebisu board
  *
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index a69faa60ea4d..b506d5613e01 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the R-Car E3 (R8A77990) SoC
  *
-- 
2.11.0

