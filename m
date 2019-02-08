Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9760CC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66F5120863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CF2Qcit5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbfBHLOl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:14:41 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:14:41 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1956225BF20;
        Fri,  8 Feb 2019 22:14:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624472; bh=xjiK41YEs0DmzW1kYnR7YzTGqSgTamUKXBuJZ47aMLo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CF2Qcit5ZVlF1A/ji1TS2Lr8vhUJ6xDbONocd+TcIDHeX3PklsqR8+Ic5yGn9+2tI
         jSyMKYVYovzysiqw3p18arUfEKCFputu0HfYw4sTZ35ySTtVAOtvTkzKcpo+cxgQU8
         VjOuf4QdIPhZKZjW3kMDVDkaTMgiJFPUMIvRUK3w=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 63C079401DB; Fri,  8 Feb 2019 12:14:30 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] ARM: shmobile: Add missing dts files to MAINTAINERS
Date:   Fri,  8 Feb 2019 12:14:27 +0100
Message-Id: <8d22020a7e1e540592e801a0aa0aebe938599f47.1549622472.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549622472.git.horms+renesas@verge.net.au>
References: <cover.1549622472.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add some more patterns to the ARM/SHMOBILE ARM ARCHITECTURE
section of MAINTAINERS to complete the list of maintained dts files.

As of writing dts files covered are:
* arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi
* arch/arm/boot/dts/iwg20d-q7-common.dtsi
* arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32d444476a90..f4c805c1a34b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2109,6 +2109,8 @@ Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
 S:	Supported
 F:	arch/arm/boot/dts/emev2*
+F:	arch/arm/boot/dts/gr-peach*
+F:	arch/arm/boot/dts/iwg20d-q7*
 F:	arch/arm/boot/dts/r7s*
 F:	arch/arm/boot/dts/r8a*
 F:	arch/arm/boot/dts/r9a*
-- 
2.11.0

