Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:53942 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752004AbeCWJJu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 05:09:50 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] pinctrl: sh-pfc: rcar-gen3: MSIOF enhancements
Date: Fri, 23 Mar 2018 10:09:39 +0100
Message-Id: <1521796182-24791-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Laurent, Linus,

This patch series:
  - Adds MSIOF groups on R-Car M3-N,
  - Fixes two small mistakes in comments.

To be queued in sh-pfc-for-v4.18.

Thanks!

Geert Uytterhoeven (2):
  pinctrl: sh-pfc: r8a7795: Fix comment for MSIOF3 SS2_E pin
  pinctrl: sh-pfc: r8a7796: Fix comment for MSIOF3 SS2_E pin

Takeshi Kihara (1):
  pinctrl: sh-pfc: r8a77965: Add MSIOF pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c  |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 912 ++++++++++++++++++++++++++++++++++
 3 files changed, 914 insertions(+), 2 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
