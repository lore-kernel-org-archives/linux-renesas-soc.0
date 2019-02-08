Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7CBC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 751FC20863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="aKR8ETcT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfBHLNG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:13:06 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46119 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfBHLNG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:13:06 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 770EA25BED6;
        Fri,  8 Feb 2019 22:13:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624380; bh=s+y/hSUxd77HC1BsGDgL5iVTLISHyt1kBkkYmerObnE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aKR8ETcTPmXiWl7jEhBkZKeMSPeEsdn4e2ysehZG7CtQc/vBOPcZT5fXscGAEclF3
         nDEbIOJsxMIT5LyEMtDg5+yt7o2pbNjFK2qdfF4EkcmScE1lFjtYvlYisYJSjA7jAa
         DBuQMEMlXIkzIWCEBw96O9HmX7P+Z4WCdZ5xZYCg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B93F4940461; Fri,  8 Feb 2019 12:12:58 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/3] arm64: defconfig: select Kingfisher Sound related configs
Date:   Fri,  8 Feb 2019 12:12:57 +0100
Message-Id: <b8c3667a892a2ef2a2a5f91dfc2e3e3f0225185e.1549622798.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549622798.git.horms+renesas@verge.net.au>
References: <cover.1549622798.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch selects PCM3168A which is needed for Kingfisher Sound

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 741b5f305e03..e1484113667b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -510,6 +510,7 @@ CONFIG_SND_SOC_RK3399_GRU_SOUND=m
 CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_AK4613=m
+CONFIG_SND_SOC_PCM3168A_I2C=m
 CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_I2C_HID=m
-- 
2.11.0

