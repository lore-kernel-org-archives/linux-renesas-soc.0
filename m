Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:46826 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751545AbeERLGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:06:53 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-sh@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] Remove calls to empty arch_setup_pdev_archdata()
Date: Fri, 18 May 2018 13:06:49 +0200
Message-Id: <1526641611-2769-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi,

Recently, a few calls to arch_setup_pdev_archdata() were added to the
ecovec and migor board files (copied from platform_device_register())?

However, SuperH doesn't implement arch_setup_pdev_archdata(), and falls
back to the default (empty) implementation.  As this code is
board-specific, the calls can just be removed.

Thanks!

Geert Uytterhoeven (2):
  sh: ecovec: Remove calls to empty arch_setup_pdev_archdata()
  sh: migor: Remove calls to empty arch_setup_pdev_archdata()

 arch/sh/boards/mach-ecovec24/setup.c | 2 --
 arch/sh/boards/mach-migor/setup.c    | 1 -
 2 files changed, 3 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
