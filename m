Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03693C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BCB8D20863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CQ8xOi5f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfBHLN7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:13:59 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46305 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLN7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:13:59 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4263325BF06;
        Fri,  8 Feb 2019 22:13:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624431; bh=nBe6d6/3N+UvRoQo4afNzeHMQrKo8mg3Pvkzl/F1WtQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CQ8xOi5fWDzVISIhem8pduvsfCr/Z4vtjbTjafNmQeB2PNq2ewn+BTT21x6Aq3+jn
         BwWv0UggwiOthPGATT9Ik28C3OU/66klF6H9NKLTzBnva6hsuGD7Qsi+ZPhSy9hSXc
         WPfIa3g118tGZhx8QGfVPdgceBVNBfawDw5122kg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7D4EB9406FE; Fri,  8 Feb 2019 12:13:48 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 5/5] ARM: multi_v7_defconfig: Enable support for RZ/A2
Date:   Fri,  8 Feb 2019 12:13:47 +0100
Message-Id: <03ff9677930064a495fcce269a0f6f1db5dd9dd9.1549621233.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549621233.git.horms+renesas@verge.net.au>
References: <cover.1549621233.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Enable support for the RZ/A2 SoC, including pin control, now the DTS for
the Renesas RZ/A2M evaluation board is included.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ffaf5c00f367..dba15b1b3083 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -76,6 +76,7 @@ CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_EMEV2=y
 CONFIG_ARCH_R7S72100=y
+CONFIG_ARCH_R7S9210=y
 CONFIG_ARCH_R8A73A4=y
 CONFIG_ARCH_R8A7740=y
 CONFIG_ARCH_R8A7743=y
@@ -404,6 +405,7 @@ CONFIG_SPI_XILINX=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_SPMI=y
 CONFIG_PINCTRL_AS3722=y
+CONFIG_PINCTRL_RZA2=y
 CONFIG_PINCTRL_PALMAS=y
 CONFIG_PINCTRL_APQ8064=y
 CONFIG_PINCTRL_APQ8084=y
-- 
2.11.0

