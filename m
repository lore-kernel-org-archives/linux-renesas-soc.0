Return-Path: <SRS0=E5el=C2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B67C433E2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Sep 2020 13:47:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 620DD21582
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Sep 2020 13:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgIQNp4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgIQNdZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 09:33:25 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3C5C06178A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2020 06:22:06 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id V1N62300D4C55Sk011N6fK; Thu, 17 Sep 2020 15:22:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kItrS-0000ke-89; Thu, 17 Sep 2020 15:22:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kItrS-0002Gs-72; Thu, 17 Sep 2020 15:22:06 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Enable R8A779A0 SoC
Date:   Thu, 17 Sep 2020 15:22:05 +0200
Message-Id: <20200917132205.8685-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the Renesas R-Car V3U (R8A779A0) SoC in the ARM64
renesas_defconfig.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to topic/renesas-defconfig.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 55e2ea01e35167ba..37f698f4a2f3c846 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -323,6 +323,7 @@ CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A77980=y
 CONFIG_ARCH_R8A77990=y
 CONFIG_ARCH_R8A77995=y
+CONFIG_ARCH_R8A779A0=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_MEMORY=y
 CONFIG_RENESAS_RPCIF=y
-- 
2.17.1

