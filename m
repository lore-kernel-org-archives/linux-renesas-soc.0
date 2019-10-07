Return-Path: <SRS0=uTUX=YA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A02ECE597
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Oct 2019 10:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6569B20867
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Oct 2019 10:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfJGKXp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Oct 2019 06:23:45 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:50942 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbfJGKXo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 06:23:44 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id AaPh2100Z05gfCL06aPh0B; Mon, 07 Oct 2019 12:23:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-000875-Hk; Mon, 07 Oct 2019 12:23:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-0003CH-GV; Mon, 07 Oct 2019 12:23:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 10/19] soc: renesas: Add R8A77961 config option
Date:   Mon,  7 Oct 2019 12:23:23 +0200
Message-Id: <20191007102332.12196-11-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007102332.12196-1-geert+renesas@glider.be>
References: <20191007102332.12196-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a configuration option for the Renesas R-Car M3-W+ (R8A77961) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 3bd0c218bf30992a..b2ec65210bd770d5 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -206,6 +206,12 @@ config ARCH_R8A7796
 	help
 	  This enables support for the Renesas R-Car M3-W SoC.
 
+config ARCH_R8A77961
+	bool "Renesas R-Car M3-W+ SoC Platform"
+	select ARCH_RCAR_GEN3
+	help
+	  This enables support for the Renesas R-Car M3-W+ SoC.
+
 config ARCH_R8A77965
 	bool "Renesas R-Car M3-N SoC Platform"
 	select ARCH_RCAR_GEN3
-- 
2.17.1

