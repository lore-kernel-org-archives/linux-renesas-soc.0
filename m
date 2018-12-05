Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46374 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727195AbeLEPjv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:39:51 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] soc: renesas: rcar-sysc: Miscellaneous fixes and cleanups
Date: Wed,  5 Dec 2018 16:39:41 +0100
Message-Id: <20181205153945.13767-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This series (against renesas-devel-20181204-v4.20-rc5) contains
miscellaneous fixes and cleanups for the R-Car SYSC driver.

This has been tested on R-Car Gen2 (H2 and M2-W) and R-Car Gen3 (H3
ES1.0, H3 ES2.0, M3-W, M3-N, D3, E3, and V3M) (without 3DG).

This not been tested on R-Car H1 and R-Car V3H.

Thanks!

Geert Uytterhoeven (4):
  soc: renesas: r8a77990-sysc: Fix initialization order of 3DG-{A,B}
  soc: renesas: rcar-sysc: Remove rcar_sysc_power_{down,up}() helpers
  soc: renesas: rcar-sysc: Merge PM Domain registration and linking
  soc: renesas: rcar-sysc: Fix power domain control after system resume

 drivers/soc/renesas/r8a77990-sysc.c | 23 ++--------
 drivers/soc/renesas/rcar-sysc.c     | 65 ++++++++---------------------
 2 files changed, 22 insertions(+), 66 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
