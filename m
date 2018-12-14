Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD69C6786C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 11:57:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B6D820879
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 11:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Rcm3YZmy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6D820879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbeLNL5I (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 06:57:08 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33449 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbeLNL5H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 06:57:07 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6BF5225BEF2;
        Fri, 14 Dec 2018 22:57:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544788625; bh=3NA86evH3EwFbLMAZISS+zlx1d5fuUAg7aShuZst9ek=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rcm3YZmy/y5IgFpj5TPmkGYpiBtz7f6ddD7N+z+RK1sbymOtZc7Sks4RXXqVaDzuQ
         9e4vrJCaEWYCB0yPMQpxtuYQsLfOngv4oNII7NO0VOakQ6HLCAPE5LuPsXmDbhadEF
         aFu5epML2saH5rt2V6tA/wLIJ/eBynX1o1WDrES4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C812F9403C3; Fri, 14 Dec 2018 12:57:03 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/1] arm64: dts: renesas: draak: Fix CVBS input
Date:   Fri, 14 Dec 2018 12:57:01 +0100
Message-Id: <6f61a2c8f1f6163c7e08c77c5f71df0427e4d2f6.1544705534.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1544705534.git.horms+renesas@verge.net.au>
References: <cover.1544705534.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

A typo in the adv7180 DT node prevents successful probing of the VIN.
Fix it.

Fixes: 6a0942c20f5c ("arm64: dts: renesas: draak: Describe CVBS input")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 2405eaad0296..0f2523296b8a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -195,7 +195,7 @@
 		compatible = "adi,adv7180cp";
 		reg = <0x20>;
 
-		port {
+		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-- 
2.11.0

