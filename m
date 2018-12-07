Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:60742 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbeLGMTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 07:19:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.21
Date: Fri,  7 Dec 2018 13:19:24 +0100
Message-Id: <20181207121924.32364-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

The following changes since commit b59d0e782706785b7042539e820e95df3be4d04c:

  pinctrl: Add RZ/A2 pin and gpio controller (2018-11-23 09:30:27 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.21-tag2

for you to fetch changes up to 3f3327dbc5596076f94695d8d4cc66da3d5027fb:

  pinctrl: rzn1: Fix of_get_child_count() error check (2018-12-04 10:33:49 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.21 (take two)

  - Two small fixes for RZ/N1.

Thanks for pulling!

----------------------------------------------------------------
Phil Edworthy (2):
      pinctrl: rzn1: Fix check for used MDIO bus
      pinctrl: rzn1: Fix of_get_child_count() error check

 drivers/pinctrl/pinctrl-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
