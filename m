Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:36714 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727248AbeK2WOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 17:14:35 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: shmobile: R-Mobile: Clean up and move pm-rmobile driver
Date: Thu, 29 Nov 2018 12:09:29 +0100
Message-Id: <20181129110931.11783-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This is a patch series for the pm-rmobile driver, used on R-Mobile A1 and
APE6, and on SH-Mobile AG5, to clean up the driver, move it to
drivers/soc/renesas/, and enable compile-testing.

Thanks!

Geert Uytterhoeven (2):
  ARM: shmobile: R-Mobile: Clean up struct rmobile_pm_domain
  ARM: shmobile: R-Mobile: Move pm-rmobile to drivers/soc/renesas/

 arch/arm/mach-shmobile/Kconfig                |  5 ---
 arch/arm/mach-shmobile/Makefile               |  1 -
 arch/arm/mach-shmobile/pm-rmobile.h           | 22 -----------
 drivers/soc/renesas/Kconfig                   |  7 +++-
 drivers/soc/renesas/Makefile                  |  1 +
 .../soc/renesas/rmobile-sysc.c                | 37 +++++++++----------
 6 files changed, 25 insertions(+), 48 deletions(-)
 delete mode 100644 arch/arm/mach-shmobile/pm-rmobile.h
 rename arch/arm/mach-shmobile/pm-rmobile.c => drivers/soc/renesas/rmobile-sysc.c (93%)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
