Return-Path: <SRS0=ZWut=VB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1930AC46484
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Jul 2019 15:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6AB421852
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Jul 2019 15:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfGDPhe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Jul 2019 11:37:34 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:41620 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbfGDPhe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jul 2019 11:37:34 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id YfdY2000d05gfCL01fdYm2; Thu, 04 Jul 2019 17:37:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hj3ng-00083B-Ip; Thu, 04 Jul 2019 17:37:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hj3ng-0002kZ-Hx; Thu, 04 Jul 2019 17:37:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH rza_u-boot-2017.05 2/2] rza2mevb: Use second Ethernet port if first one is not available
Date:   Thu,  4 Jul 2019 17:37:26 +0200
Message-Id: <20190704153726.10507-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704153726.10507-1-geert+renesas@glider.be>
References: <20190704153726.10507-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When SW6-4 is switched off, the first Ethernet port is not available,
and thus doesn't work.  Hence fall back to using the second port
instead.

This allows to use TFTP when SDRAM is enabled (RZA2M_ENABLE_SDRAM is
defined), and the serial console is moved to SCIF2.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/configs/rza2mevb.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/configs/rza2mevb.h b/include/configs/rza2mevb.h
index 7ac9b8f80e329288..a217d668eedae631 100644
--- a/include/configs/rza2mevb.h
+++ b/include/configs/rza2mevb.h
@@ -216,7 +216,11 @@
 /* Network interface */
 #if (SW6_4 == SW_ON) || (SW6_5 == SW_ON)
 #define CONFIG_SH_ETHER
+#if (SW6_4 == SW_ON)
 #define CONFIG_SH_ETHER_USE_PORT	0
+#else
+#define CONFIG_SH_ETHER_USE_PORT	1
+#endif
 #define CONFIG_SH_ETHER_PHY_ADDR	0
 #define CONFIG_SH_ETHER_PHY_MODE PHY_INTERFACE_MODE_MII
 #define CONFIG_PHYLIB
-- 
2.17.1

