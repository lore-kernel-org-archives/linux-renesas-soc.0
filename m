Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:38942 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbeHaROl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 13:14:41 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.20
Date: Fri, 31 Aug 2018 15:07:10 +0200
Message-Id: <20180831130710.6355-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.20-tag1

for you to fetch changes up to 2ed03c835d6f4dbe9f0d093187825d1c0e2e9b39:

  pinctrl: sh-pfc: r8a77990: Add DU pins, groups and function (2018-08-30 14:17:20 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.20

  - Add SATA and audio pin groups on R-Car M3-N,
  - Add EtherAVB pin groups on RZ/G1C,
  - Add PWM and display (DU) pin groups on R-Car E3,
  - Add support for the new RZ/G2M (r8a774a1) SoC.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (3):
      pinctrl: sh-pfc: r8a77470: Add EtherAVB pin groups
      dt-bindings: pinctrl: sh-pfc: Document r8a774a1 PFC support
      pinctrl: sh-pfc: r8a7796: Add R8A774A1 PFC support

Hoan Nguyen An (2):
      pinctrl: sh-pfc: r8a77965: Add Audio clock pin support
      pinctrl: sh-pfc: r8a77965: Add Audio SSI pin support

Laurent Pinchart (1):
      pinctrl: sh-pfc: r8a77990: Add DU pins, groups and function

Takeshi Kihara (2):
      pinctrl: sh-pfc: r8a77965: Add SATA pins, groups and functions
      pinctrl: sh-pfc: r8a77990: Add PWM pins, groups and functions

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |   5 +
 drivers/pinctrl/sh-pfc/Makefile                    |   1 +
 drivers/pinctrl/sh-pfc/core.c                      |   6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c              | 133 ++++
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               | 837 +++++++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              | 419 +++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 321 ++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   1 +
 9 files changed, 1327 insertions(+), 397 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
