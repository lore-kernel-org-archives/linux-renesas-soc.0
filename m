Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C473C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 13:06:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6046C20856
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 13:06:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbfDBNGY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 09:06:24 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:41076 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfDBNGY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 09:06:24 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id vR6L1z0063XaVaC01R6L0W; Tue, 02 Apr 2019 15:06:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBJ7M-0002Du-2b; Tue, 02 Apr 2019 15:06:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBJ7M-0003h5-0u; Tue, 02 Apr 2019 15:06:20 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas_defconfig: Reduce NR_CPUS to 8
Date:   Tue,  2 Apr 2019 15:06:19 +0200
Message-Id: <20190402130619.14145-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The maximum number of arm64 CPU cores (excluding the real-time core) in
Renesas ARM SoCs is 8.

The default value of NR_CPUS used to be 64, causing a negligible kernel
size increase of ca. 16 KiB, compared to the minimum needed value of 8.
As of commit 846a415bf4408ccd ("arm64: default NR_CPUS to
256"), the default value of NR_CPUS was increased to 256, increasing the
waste by another 78 KiB.

Reduce NR_CPUS to 8, reducing kernel size by ca. 94 KiB.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 5561d30a3f270e26..4480e7dc40180bcd 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -40,6 +40,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_HISILICON_ERRATUM_161600802 is not set
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
+CONFIG_NR_CPUS=8
 CONFIG_SECCOMP=y
 CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
-- 
2.17.1

