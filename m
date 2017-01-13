Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:52660 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751653AbdAMOAE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 09:00:04 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.11
Date: Fri, 13 Jan 2017 14:59:59 +0100
Message-Id: <1484315999-25110-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.11-tag1

for you to fetch changes up to e6bdf28eff475a026b922abe78ae710e7179bdf7:

  clk: renesas: r8a7796: Add MSIOF controller clocks (2016-12-27 10:56:08 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.11

  - Add CAN and MSIOF related clocks for R-Car M3-W.

Thanks for pulling!
----------------------------------------------------------------
Chris Paterson (3):
      clk: renesas: r8a7796: Add CAN peripheral clock
      clk: renesas: r8a7796: Add CANFD clock
      clk: renesas: r8a7796: Add CAN FD peripheral clock

Hiromitsu Yamasaki (1):
      clk: renesas: r8a7796: Add MSIOF controller clocks

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
