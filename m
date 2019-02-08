Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3F1C282CC
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 723F720863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ADnlzP8y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfBHLND (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:13:03 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46119 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfBHLND (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:13:03 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 579D825BECB;
        Fri,  8 Feb 2019 22:13:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624380; bh=QkAyxjcF72kuyAKNTJvy+Jja/aRCZWtKTQFjw220PHM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ADnlzP8yGzvjM8RxSMZTvzDpzniffyLoinAEIo9zLWSzT2YGTMZGOoB7Hux36tIr/
         vjqFcNukdtLDKVrCDH5qb8+m0ogCu9i4Yy3g22hN18Iawnjpt5l6F8q4+BU1d+6yuM
         gwtz8vOpm8JhwPIu7Z/DaWhORn67jcxNhKd7GrsU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A82D6940171; Fri,  8 Feb 2019 12:12:58 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] arm64: defconfig: Enable R-Car thermal driver
Date:   Fri,  8 Feb 2019 12:12:56 +0100
Message-Id: <4aac2bf0760d359af44e423dc01e10880d9d18b0.1549622798.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549622798.git.horms+renesas@verge.net.au>
References: <cover.1549622798.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the R-Car thermal driver as a built-in.
This seems safer than enabling as a module from the point of view of
protecting equipment from overheating.

This driver is used in conjunction with the R-Car V3M (r8a77970),
E3 (r8a77990) and D3 (r8a77995) SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 22b5f6fcf723..741b5f305e03 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -401,6 +401,7 @@ CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_ROCKCHIP_THERMAL=m
+CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_ARMADA_THERMAL=y
 CONFIG_BCM2835_THERMAL=m
-- 
2.11.0

