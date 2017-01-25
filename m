Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:54746 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751987AbdAYLTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 06:19:33 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] clk: renesas: r8a7795/r8a7796: Add IIC-DVFS clock
Date: Wed, 25 Jan 2017 12:19:32 +0100
Message-Id: <1485343174-16973-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

This patch series, pulled from the rcar-3.5.1 BSP, adds the module
clocks for IIC-DVFS on the R-Car H3 and M3-W SoCs.

As this is a dependency for Suspend-to-RAM, I plan to queue this in
clk-renesas-for-v4.11.

Thanks for your comments!

Keita Kobayashi (1):
  clk: renesas: r8a7795: Add IIC-DVFS clock

Khiem Nguyen (1):
  clk: renesas: r8a7796: Add IIC-DVFS clock

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 2 files changed, 2 insertions(+)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
