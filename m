Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:59038 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751389AbeAEKdL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jan 2018 05:33:11 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.16 (take two)
Date: Fri,  5 Jan 2018 11:33:05 +0100
Message-Id: <1515148385-5448-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 7aff266552d6042b43d3d5a9b13f0009ef862033:

  clk: renesas: cpg-mssr: Keep wakeup sources active during system suspend (2017-12-14 16:40:36 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.16-tag2

for you to fetch changes up to a115f6362cee01813c66e10e397b25f2a06aecfb:

  clk: renesas: r8a7796: Add FDP clock (2018-01-05 11:14:38 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.16 (take two)

  - Add support for the FDP1-0 module clock on R-Car M3-W.

Thanks for pulling!

----------------------------------------------------------------
ABE Hiroshige (1):
      clk: renesas: r8a7796: Add FDP clock

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
