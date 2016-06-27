Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:43965 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751713AbcF0Rjl (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 27 Jun 2016 13:39:41 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] clk: renesas: r8a7796: Add watchdog clocks
Date: Mon, 27 Jun 2016 19:39:23 +0200
Message-Id: <1467049165-7025-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi,

This patch series adds all clocks related to the Watchdog Timer (WDT)
controller on the Renesas R-Car M3-W (r8a7796) SoC.

I plan to queue this up in clk-renesas-for-v4.8.

Thanks!

Geert Uytterhoeven (2):
  clk: renesas: r8a7796: Add watchdog core clocks
  clk: renesas: r8a7796: Add watchdog module clock

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
