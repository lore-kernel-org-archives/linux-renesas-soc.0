Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:34416 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932211AbdCMQlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 12:41:53 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a7795: Misc fixes and cleanups
Date: Mon, 13 Mar 2017 17:41:40 +0100
Message-Id: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus, Laurent,

This patch series contains miscellaneous fixes and cleanups for the
Renesas R-Car H3 pinctrl driver:

I plan to queue these up in sh-pfc-for-v4.12.

Thanks for your comments!

Geert Uytterhoeven (2):
  pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and hscif4_ctrl
  pinctrl: sh-pfc: r8a7795: Restore sort order

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 175 ++++++++++++++++++-----------------
 1 file changed, 88 insertions(+), 87 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
