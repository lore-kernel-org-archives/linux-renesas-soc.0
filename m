Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A1DC282C5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:12:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 791642184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CUBqEiO2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbfAXPM5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:12:57 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfAXPM5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:12:57 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 65F7625BEE7;
        Fri, 25 Jan 2019 02:12:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342763; bh=B0Lm+yZcTEX2kX7RAPznxoXzx/M0ixC5L6fK3+8TXlU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CUBqEiO240IzJWI44CK6c08vgDayvZbPOusQlKqN435PNJU8/xKNko8+0zdTXIlN/
         nm9Qgsu9LhEDddWf5rp0zb/tCl1LZR0XOPTySGE3QSPqEPFcfFJbrUhk2XfXgiJ5KM
         EOla+8/jkI2JCzZmLqVDcevy1IPxZhMCi+1hLdkA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9989F940A91; Thu, 24 Jan 2019 16:12:39 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 08/44] arm64: dts: renesas: r8a774c0: Add PFC support
Date:   Thu, 24 Jan 2019 16:12:02 +0100
Message-Id: <788e55b66c13e8e77003e9226677e49eaaa9f751.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add PFC support to the RZ/G2E (a.k.a. r8a774c0) SoC specific
device tree.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 895f407f7043..afb4751219fa 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -105,6 +105,11 @@
 		#size-cells = <2>;
 		ranges;
 
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a774c0";
+			reg = <0 0xe6060000 0 0x508>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a774c0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
-- 
2.11.0

