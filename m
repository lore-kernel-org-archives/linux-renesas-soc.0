Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3171C67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 11:56:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FF7620879
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 11:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="pVdGsuDA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FF7620879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbeLNL46 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 06:56:58 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33410 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbeLNL46 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 06:56:58 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B3CB225BEE0;
        Fri, 14 Dec 2018 22:56:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544788614; bh=Aapek9I7/5mxMQpRX3IxlZDpnsDCq3Jv+NXsKr7N7Sg=;
        h=From:To:Cc:Subject:Date:From;
        b=pVdGsuDAqp12ArjEVzc9CtA+rWywXjABiW+sUzdwSawVqZpf4G3Bl1SPTVAHiLewD
         BHxAJ+KXNhhr2qcX5vAqUamh1lLC5OcUENO6s3lUMk5SGHeG6YplNoSa8AvxOnJVyD
         xK9Z+jWBqlFtP7FsCGUlEdIrRWdXOLjAv1IZgrDE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1A1559401C3; Fri, 14 Dec 2018 12:56:52 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] arm64: defconfig: Enable scu-simple-card driver
Date:   Fri, 14 Dec 2018 12:56:49 +0100
Message-Id: <20181214115650.12443-2-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the scu-simple-card which is used by
the R-Car E3 (r8a77990) based Ebisu board.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f88190463481..b521159f5f33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -491,6 +491,7 @@ CONFIG_SND_SOC_RT5514=m
 CONFIG_SND_SOC_RT5514_SPI=m
 CONFIG_SND_SOC_RT5645=m
 CONFIG_SND_SIMPLE_CARD=m
+CONFIG_SND_SIMPLE_SCU_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_I2C_HID=m
 CONFIG_USB=y
-- 
2.11.0

