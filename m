Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:55604 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935012AbdGTMfA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2017 08:35:00 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] soc: renesas: Add R-Car D3 support
Date: Thu, 20 Jul 2017 14:34:50 +0200
Message-Id: <1500554094-22198-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series adds R-Car D3 support to the Renesas-specific SoC
drivers:
  - SoC identification,
  - System controller,
  - Reset controller.

Thanks!

Geert Uytterhoeven (4):
  soc: renesas: Identify R-Car D3
  soc: renesas: Add r8a77995 SYSC PM Domain Binding Definitions
  soc: renesas: rcar-sysc: Add support for R-Car D3 power areas
  soc: renesas: rcar-rst: Add support for R-Car D3

 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 .../devicetree/bindings/reset/renesas,rst.txt      |  1 +
 drivers/soc/renesas/Kconfig                        |  7 ++++-
 drivers/soc/renesas/Makefile                       |  1 +
 drivers/soc/renesas/r8a77995-sysc.c                | 31 ++++++++++++++++++++++
 drivers/soc/renesas/rcar-rst.c                     |  1 +
 drivers/soc/renesas/rcar-sysc.c                    |  3 +++
 drivers/soc/renesas/rcar-sysc.h                    |  1 +
 drivers/soc/renesas/renesas-soc.c                  |  8 ++++++
 include/dt-bindings/power/r8a77995-sysc.h          | 23 ++++++++++++++++
 10 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/renesas/r8a77995-sysc.c
 create mode 100644 include/dt-bindings/power/r8a77995-sysc.h

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
