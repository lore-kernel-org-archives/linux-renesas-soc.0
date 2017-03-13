Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] soc: renesas: rcar-sysc: Add support for R-Car H3 ES2.0
Date: Mon, 13 Mar 2017 18:13:14 +0100
Message-Id: <1489425197-22859-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus, Arnd[*], Greg[*],

This patch series adds power domain support for R-Car H3 ES2.0, which
differs from ES1.x in some areas.

The goal is twofold:
  1. Support both the ES1.x and ES2.0 SoC revisions in a single binary
     for now,
  2. Make it clear which code supports ES1.x, so it can easily be
     identified and removed later, when production SoCs are deemed
     ubiquitous.

This is achieved by detecting the SoC revision at runtime using the new
soc_device_match() API, and fixing up the power area table to match the
actual SoC revision.

As PM Domains are initialized quite early, the Renesas SoC device must
be initialized earlier, and this series thus depends on "[PATCH 0/2]
[RFC] base: soc: soc_device_match() improvements"
(https://lkml.org/lkml/2017/3/9/653).

[*] Due to this dependency, there are two options:
      - Both series go in through Simon's Renesas tree and arm-soc,
      - Both series go in through Greg's drivers tree.

For testers, this series and its dependencies are available in the
topic/r8a7795es2-sysc-v1 branch of my renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
An integration branch for testing on the R-Car H3 ES2.0 based Salvator-X
development board is provided as topic/r8a7795es2-integration.

This has been tested on Salvator-X with R-Car H3 ES1.0, ES1.1, and ES2.0
SoCs.

Thanks for your comments!

Geert Uytterhoeven (3):
  soc: renesas: Register SoC device early
  soc: renesas: rcar-sysc: Add support for fixing up power areas
  soc: renesas: rcar-sysc: Add support for R-Car H3 ES2.0

 drivers/soc/renesas/r8a7795-sysc.c       | 26 ++++++++++++++++++++++++--
 drivers/soc/renesas/rcar-sysc.c          | 25 ++++++++++++++++++++++++-
 drivers/soc/renesas/rcar-sysc.h          | 10 ++++++++++
 drivers/soc/renesas/renesas-soc.c        |  2 +-
 include/dt-bindings/power/r8a7795-sysc.h |  2 +-
 5 files changed, 60 insertions(+), 5 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
