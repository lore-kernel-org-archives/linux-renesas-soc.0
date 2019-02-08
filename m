Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C39C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CB6021924
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="qxwqO3QC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbfBHLNx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:13:53 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46305 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLNx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:13:53 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E79A525BF01;
        Fri,  8 Feb 2019 22:13:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624430; bh=ftdiyIFmsH9rL18fTj55GmMBsd3dKTOHp1CQ93j4dzY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qxwqO3QCgQncehCOLxyKnbeVVwok8hwCp3Zs2j6kRoOmQcmnSA3fYbuGh0MFG007y
         whuGh/ASeO9tTngtoTGEP7kj2bzWYvwQuA6uKw/KuBLblnNf/3AxdcMEczoNym8yHj
         1RJwtPHLyAqWbzJ4AgQrI1rkTrMtLHH3PpTYSjBU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 414A89402EE; Fri,  8 Feb 2019 12:13:48 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/5] ARM: shmobile: Enable NXP pcf85363 rtc in shmobile_defconfig
Date:   Fri,  8 Feb 2019 12:13:43 +0100
Message-Id: <71e3039dd7c377118608321d6c1f2ecb35da4c17.1549621233.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549621233.git.horms+renesas@verge.net.au>
References: <cover.1549621233.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

The iWave RZ/G1C SBC supports RTC (NXP pcf85263). To increase hardware
support enable the driver in the shmobile_defconfig multiplatform
configuration.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 9e5a5ade6cab..fdac4e4ca04d 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -177,6 +177,7 @@ CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_RS5C372=y
+CONFIG_RTC_DRV_PCF85363=y
 CONFIG_RTC_DRV_BQ32K=y
 CONFIG_RTC_DRV_S35390A=y
 CONFIG_RTC_DRV_RX8581=y
-- 
2.11.0

