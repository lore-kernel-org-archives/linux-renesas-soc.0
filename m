Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:36666 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbeJES4O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Oct 2018 14:56:14 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.20 (take three)
Date: Fri,  5 Oct 2018 13:57:41 +0200
Message-Id: <20181005115741.27477-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

The following changes since commit a97f340c0a071bcb32ff68f3d19cf56a76887288:

  pinctrl: sh-pfc: rcar: Rename automotive-only arrays to automotive (2018-09-28 09:49:15 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.20-tag3

for you to fetch changes up to ef26d96023a4c34b1bcc4294f570df2b63a1b952:

  pinctrl: sh-pfc: r8a77990: Add INTC-EX pins, groups and function (2018-10-02 12:16:47 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.20 (take three)

  - Add support for the new RZ/N1D (R9A06G032) and RZ/N1S (R9A06G033)
    SoCs,
  - Add INTC-EX pin groups on R-Car E3.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: sh-pfc: r8a77990: Add INTC-EX pins, groups and function

Phil Edworthy (2):
      dt-bindings: pinctrl: renesas,rzn1-pinctrl: documentation
      pinctrl: renesas: Renesas RZ/N1 pinctrl driver

 .../bindings/pinctrl/renesas,rzn1-pinctrl.txt      | 153 ++++
 drivers/pinctrl/Kconfig                            |  10 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-rzn1.c                     | 948 +++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              |  64 +-
 include/dt-bindings/pinctrl/rzn1-pinctrl.h         | 141 +++
 6 files changed, 1315 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rzn1.c
 create mode 100644 include/dt-bindings/pinctrl/rzn1-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
