Return-Path: <SRS0=3qy3=B5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3E9C433E1
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Aug 2020 10:10:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5FCF206B5
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Aug 2020 10:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgHSKKB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Aug 2020 06:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgHSKJ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 06:09:57 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871EDC061757
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2020 03:09:56 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id HN9v230034C55Sk06N9vmR; Wed, 19 Aug 2020 12:09:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8L2Y-0008SR-VA; Wed, 19 Aug 2020 12:09:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8L2Y-00037A-UA; Wed, 19 Aug 2020 12:09:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 1/2] arm64: renesas: defconfig: Enable RPC-IF support
Date:   Wed, 19 Aug 2020 12:09:51 +0200
Message-Id: <20200819100952.11913-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819100952.11913-1-geert+renesas@glider.be>
References: <20200819100952.11913-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the Renesas SPI Multi I/O Bus Controller (RPC-IF),
which is used on the Condor, Eagle, V3HSK, and V3MSK boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to topic/renesas-defconfig.
---
 arch/arm64/configs/renesas_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 8cec36543ae8e441..c96094352bee6756 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -144,6 +144,7 @@ CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_RCAR=y
 CONFIG_SPI=y
+CONFIG_SPI_RPCIF=y
 CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_SPMI=y
@@ -317,6 +318,8 @@ CONFIG_ARCH_R8A77980=y
 CONFIG_ARCH_R8A77990=y
 CONFIG_ARCH_R8A77995=y
 CONFIG_EXTCON_USB_GPIO=y
+CONFIG_MEMORY=y
+CONFIG_RENESAS_RPCIF=y
 CONFIG_IIO=y
 CONFIG_MAX9611=y
 CONFIG_PWM=y
-- 
2.17.1

