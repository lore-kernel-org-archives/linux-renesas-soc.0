Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B4CC282DF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84340222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfDSSXZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:23:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfDSSXX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:23:23 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4DF0B25B7B3;
        Sat, 20 Apr 2019 00:33:25 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 48525E21AF8; Fri, 19 Apr 2019 16:33:23 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/1] arm64: defconfig: enable RX-8581 config option
Date:   Fri, 19 Apr 2019 16:33:21 +0200
Message-Id: <940d1a288a598ee18afa25ee74f4ca124bddd364.1555683540.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555683540.git.horms+renesas@verge.net.au>
References: <cover.1555683540.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Enable support for RX-8571/RX-8581 RTC by turning on
CONFIG_RTC_DRV_RX8581 as module.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2d9c39033c1a..c5ec86c44656 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -605,6 +605,7 @@ CONFIG_EDAC_GHES=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
+CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_S5M=y
 CONFIG_RTC_DRV_DS3232=y
 CONFIG_RTC_DRV_EFI=y
-- 
2.11.0

