Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:43519 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755453AbcETHu5 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 20 May 2016 03:50:57 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] MAINTAINERS: Drop drivers/sh/ for Renesas ARM
Date: Fri, 20 May 2016 09:50:55 +0200
Message-Id: <1463730655-16199-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1463730655-16199-1-git-send-email-geert+renesas@glider.be>
References: <1463730655-16199-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

None of the code under drivers/sh/ is used anymore on Renesas ARM.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Extracted from series "[PATCH 0/4] Enable PM and PM_GENERIC_DOMAINS
    for SoCs with PM Domains",
  - Rebased.
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 03d537d375503907..c45737b306c97e9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1605,7 +1605,6 @@ F:	arch/arm/boot/dts/sh*
 F:	arch/arm/configs/shmobile_defconfig
 F:	arch/arm/include/debug/renesas-scif.S
 F:	arch/arm/mach-shmobile/
-F:	drivers/sh/
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
 
-- 
1.9.1
