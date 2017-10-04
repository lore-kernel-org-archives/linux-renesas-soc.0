Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:37468 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751893AbdJDLeb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 07:34:31 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Add git repository to Renesas clock driver section
Date: Wed,  4 Oct 2017 13:34:24 +0200
Message-Id: <1507116864-17219-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61d77c8037a1faf9..d23f4fba728d091a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11476,6 +11476,7 @@ F:	include/linux/rpmsg/
 RENESAS CLOCK DRIVERS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-renesas
 S:	Supported
 F:	drivers/clk/renesas/
 
-- 
2.7.4
