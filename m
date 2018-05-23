Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:49260 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933037AbeEWM4h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 08:56:37 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.18 (take two)
Date: Wed, 23 May 2018 14:56:32 +0200
Message-Id: <1527080192-30230-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

The following changes since commit 73dacc3403436fc246258c0933e35b6e809640ac:

  pinctrl: sh-pfc: Add r8a77470 PFC support (2018-05-16 13:32:15 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.18-tag2

for you to fetch changes up to db701f4bea09a0f9925e262753444e848c33af89:

  pinctrl: sh-pfc: rcar-gen3: Fix grammar in static pin comments (2018-05-23 14:43:49 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.18 (take two)

  - Add support for the new R-Car E3 SoC,
  - Add I2C pin groups on R-Car M3-N,
  - Small fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: sh-pfc: rcar-gen3: Fix grammar in static pin comments

Niklas Söderlund (1):
      pinctrl: sh-pfc: r8a77965: Add I2C pin support

Takeshi Kihara (6):
      pinctrl: sh-pfc: Add PORT_GP_11 helper macro
      pinctrl: sh-pfc: Initial R8A77990 PFC support
      pinctrl: sh-pfc: r8a77990: Add bias pinconf support
      pinctrl: sh-pfc: r8a77990: Add SCIF pins, groups and functions
      pinctrl: sh-pfc: r8a77990: Add I2C{1,2,4,5,6,7} pins, groups and functions
      pinctrl: sh-pfc: r8a77990: Add EthernetAVB pins, groups and functions

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |    6 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |    6 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |    6 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              |   83 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 2695 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    9 +-
 10 files changed, 2804 insertions(+), 14 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77990.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
