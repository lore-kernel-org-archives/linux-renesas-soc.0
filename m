Return-Path: <SRS0=RWjW=PK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C834DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C19F21871
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="qzMv1w55"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbfABJwE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Jan 2019 04:52:04 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33702 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729120AbfABJwE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jan 2019 04:52:04 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C3ECD25BE2C;
        Wed,  2 Jan 2019 20:52:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546422722; bh=4WXDZ4KzsVVwj77Z3Lu21DiSj9EbcMCdA+GPS+ykhkY=;
        h=From:To:Cc:Subject:Date:From;
        b=qzMv1w558HEc+hripxBRBb6++TXHRPoYP/1sqpN8q034l3NHEy94OOsfGB48W5csp
         b7ZU5KaizhJOAJizdxLgXftBHTPaWqtD+NoQCU9aW+wJUKlM/+DyB+3SPeFC3Jbn1a
         KqkHgZjkiGxEDzZf/fEZ0jC8kzVQ5Dxz5MsJrvOw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EF3EF9402C1; Wed,  2 Jan 2019 10:51:59 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] arm64: defconfig: Enable R-Car thermal driver
Date:   Wed,  2 Jan 2019 10:51:54 +0100
Message-Id: <20190102095154.25839-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the R-Car thermal driver as a built-in.

This driver is used in conjunction with the R-Car V3M (r8a77970),
E3 (r8a77990) and D3 (r8a77995) SoCs.

[v2] Enable as a built-in rather than a module as this seems
     safer from the point of view of protecting equipment from
     overheating.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

 Based on renesas-devel-20190102-v4.20

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a0801002b537..4530f50f06e5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -377,6 +377,7 @@ CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_ROCKCHIP_THERMAL=m
+CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_ARMADA_THERMAL=y
 CONFIG_BRCMSTB_THERMAL=m
-- 
2.11.0

