Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:51608 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753086AbeGDJph (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 05:45:37 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.19
Date: Wed,  4 Jul 2018 11:45:30 +0200
Message-Id: <20180704094530.16156-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.19-tag1

for you to fetch changes up to a742fcf72902ed28f8836b8327cde50bebfb9ff1:

  pinctrl: sh-pfc: r8a77990: Add USB3.0 pins, groups and functions (2018-07-04 11:05:29 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.19

  - Add HSCIF pin groups on R-Car M3-N,
  - Add USB 2.0/3.0 pin groups on R-Car E3,
  - A small fix.

Thanks for pulling!

----------------------------------------------------------------
Takeshi Kihara (3):
      pinctrl: sh-pfc: r8a77965: Add HSCIF pins, groups, and functions
      pinctrl: sh-pfc: r8a77990: Add USB2.0 pins, groups and functions
      pinctrl: sh-pfc: r8a77990: Add USB3.0 pins, groups and functions

Yoshihiro Shimoda (1):
      pinctrl: sh-pfc: r8a77990: Revise USB ID pin name

 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 333 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c |  69 ++++++-
 2 files changed, 400 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
