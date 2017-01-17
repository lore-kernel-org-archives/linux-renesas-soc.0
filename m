Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from leibniz.telenet-ops.be ([195.130.137.77]:42170 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750870AbdAQNhA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 08:37:00 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 3v2qd62WZnzMqmXT
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2017 13:47:38 +0100 (CET)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] clk: renesas: Use CLK_IS_CRITICAL to handle critical clocks
Date: Tue, 17 Jan 2017 13:46:28 +0100
Message-Id: <1484657190-12838-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Mike, Stephen,

This patch series adds support for the CLK_IS_CRITICAL flag to drivers
for module clocks on Renesas ARM SoCs.  For now, this is used to prevent
disabling of the ARM GIC module clock, which would lead to a system
lock-up when accessing the GIC's registers.

  1. The first patch migrates the Renesas CPG/MSSR driver from the
     never merged CLK_ENABLE_HAND_OFF flag to the CLK_IS_CRITICAL flag.
     Note that as the driver already handled critical clocks (i.e. it
     ignored them :-), this is not a prerequisite for linking the GIC to
     its module clock in DT.

  2. The second patch makes sure the CLK_IS_CRITICAL flag is set for the
     INTC-SYS clock on SoCs not (yet) using the Renesas CPG/MSSR driver.
     Note that this is a hard dependency for describing the INTC-SYS
     clock in DT on R-Mobile APE6 and R-Car Gen2.

I plan to queue these patches in my clk-renesas-for-v4.11 branch, if
you agree.

Thanks!
        
Geert Uytterhoeven (2):
  clk: renesas: cpg-mssr: Migrate to CLK_IS_CRITICAL
  clk: renesas: mstp: Make INTC-SYS a critical clock

 drivers/clk/renesas/clk-mstp.c         |  5 +++++
 drivers/clk/renesas/renesas-cpg-mssr.c | 11 ++---------
 2 files changed, 7 insertions(+), 9 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
