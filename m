Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51498C43612
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 10:18:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A231214DA
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 10:18:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="WjrE9feW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbfAJKSn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 05:18:43 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:36415 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbfAJKSn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 05:18:43 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F24D825B7DA;
        Thu, 10 Jan 2019 21:18:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547115521; bh=+fN9b9sqVrBqQvyfTybKbT1mL8VNSDITqltDqe1gias=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WjrE9feWHhr0HwapvQmLqdinKOw8OECUVZzEwnOjhcFSQ5d9ZsYYxv4l/2gXLpl7K
         QDwiag/F88fua73dm0LSe5nPNBXsbfeiRupIdOhnvLNt+Pc9W84EGc3iabEaP2b6/4
         FulthDx/MbsAspREqeSKI1btqGYIpt1KAHl21+TM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 383A79404A5; Thu, 10 Jan 2019 11:18:39 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] ARM: shmobile: fix build regressions
Date:   Thu, 10 Jan 2019 11:18:37 +0100
Message-Id: <8070ba6348608aa1da15eb83dbaa9ece596aaa67.1547115367.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1547115367.git.horms+renesas@verge.net.au>
References: <cover.1547115367.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A number of Kconfig options have become available now to random ARM
platforms outside of ARCH_MULTIPLATFORM, which now causes Kconfig
warnings, and other build errors when those select options that
lack additional dependencies, e.g.:

WARNING: unmet direct dependencies detected for HAVE_ARM_ARCH_TIMER
  Depends on [n]: CPU_V7 [=n]
  Selected by [y]:
  - ARCH_RCAR_GEN2 [=y] && SOC_RENESAS [=y]
  - ARCH_R8A73A4 [=y] && SOC_RENESAS [=y] && ARM [=y]

WARNING: unmet direct dependencies detected for SYS_SUPPORTS_EM_STI
  Depends on [n]: GENERIC_CLOCKEVENTS [=n]
  Selected by [y]:
  - ARCH_EMEV2 [=y] && SOC_RENESAS [=y] && ARM [=y]

Put the old dependency on ARCH_RENESAS back for the moment to restore
the previous behavior.

Fixes: 062887bf5ef7 ("ARM: shmobile: Move SoC Kconfig symbols to drivers/soc/renesas/")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 4d8012e1205c..68bfca6f20dd 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -44,7 +44,7 @@ config ARCH_RZN1
 	bool
 	select ARM_AMBA
 
-if ARM
+if ARM && ARCH_RENESAS
 
 #comment "Renesas ARM SoCs System Type"
 
-- 
2.11.0

