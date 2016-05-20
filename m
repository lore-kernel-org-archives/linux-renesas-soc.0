Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:54724 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755486AbcETHu6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 20 May 2016 03:50:58 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] ARM/arm64: renesas: Stop using drivers/sh/
Date: Fri, 20 May 2016 09:50:53 +0200
Message-Id: <1463730655-16199-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

Now CONFIG_PM and CONFIG_PM_GENERIC_DOMAINS are enabled unconditionally
for Renesas ARM-based SoCs, the legacy clock domain is no longer used on
these SoCs, and we can return drivers/sh/ to SuperH.

Both patches were extracted from series "[PATCH 0/4] Enable PM and
PM_GENERIC_DOMAINS for SoCs with PM Domains", and updated, hence the
v2.

Note that this does break booting R-Car Gen2 boards using pre-v4.3 DTSes
that don't have power-domains properties, as this relied on the legacy
clock domain.

Thanks!

Geert Uytterhoeven (2):
  drivers: sh: Stop using the legacy clock domain on ARM
  MAINTAINERS: Drop drivers/sh/ for Renesas ARM

 MAINTAINERS             | 1 -
 drivers/Makefile        | 1 -
 drivers/sh/pm_runtime.c | 9 ---------
 3 files changed, 11 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
