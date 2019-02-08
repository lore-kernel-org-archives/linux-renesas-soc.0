Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8ECC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5B3520863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="D7cHJMhO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfBHLNE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:13:04 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46119 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfBHLNE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:13:04 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5794825B7CA;
        Fri,  8 Feb 2019 22:13:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624380; bh=rs/sCmGu6sMf7oYH6Bzls3iug6B0lumVynOjQwT5RJU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D7cHJMhOxDIgNyMGj6s0AJWXMKi+PQL/Qo3vjeHZ2EHw8Btdr5hSge0o3UT850KIC
         dpFCg/3GIBOBBaeAFyt3ds9APxm7GX+RNQX3exepHqIGuGXewyHR/Cm3zAhx8n75cR
         kbZIqxjpSMc4CZ7/MM5T8qcn66bwfJ5xmt2RZA+k=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9BCBF9402EE; Fri,  8 Feb 2019 12:12:58 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/3] arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE
Date:   Fri,  8 Feb 2019 12:12:55 +0100
Message-Id: <12f41a5dfe6c250fcf14fa7770dd5ab7b914d38e.1549622798.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549622798.git.horms+renesas@verge.net.au>
References: <cover.1549622798.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Enable R-Car Gen3 PCIe PHY support, which is needed for PCIe to function
on the Renesas Condor board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3ef443cfbab6..22b5f6fcf723 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -689,6 +689,7 @@ CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_USB_HS=y
+CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
 CONFIG_PHY_ROCKCHIP_EMMC=y
-- 
2.11.0

