Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:34126 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbeLEPuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:50:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH 0/7] soc: renesas: rcar-gen3-sysc: Fix power request conflicts
Date: Wed,  5 Dec 2018 16:50:21 +0100
Message-Id: <20181205155028.14335-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

Recent R-Car Gen3 SoCs added an External Request Mask Register to the
System Controller (SYSC).  This register allows to mask external power
requests for CPU or 3DG domains, to prevent conflicts when Linux changes
the state of a power domain through SYSC, which could lead to system
lock-ups.

This RFC patch series starts making use of this register.  Note that the
register is optional, and that its location and contents are
SoC-specific.

This was inspired by a patch in the BSP by Dien Pham
<dien.pham.ry@renesas.com>.

This has been boot-tested on R-Car H3 ES1.0, H3 ES2.0, M3-W ES1.0, M3-N,
V3M, and E3 (only the last 3 have this register!), and regression-tested
on R-Car Gen2.

This has not been tested on R-Car H3 ES3.0, M3-W ES2.0, and V3H.

Thanks for your comments!

Geert Uytterhoeven (7):
  soc: renesas: rcar-sysc: Prepare for fixing power request conflicts
  soc: renesas: r8a7795-sysc: Fix power request conflicts
  soc: renesas: r8a7796-sysc: Fix power request conflicts
  soc: renesas: r8a77965-sysc: Fix power request conflicts
  soc: renesas: r8a77970-sysc: Fix power request conflicts
  soc: renesas: r8a77980-sysc: Fix power request conflicts
  soc: renesas: r8a77990-sysc: Fix power request conflicts

 drivers/soc/renesas/r8a7795-sysc.c  | 32 ++++++++++++++++++++++++-----
 drivers/soc/renesas/r8a7796-sysc.c  | 22 +++++++++++++++++++-
 drivers/soc/renesas/r8a77965-sysc.c |  3 +++
 drivers/soc/renesas/r8a77970-sysc.c |  3 +++
 drivers/soc/renesas/r8a77980-sysc.c |  3 +++
 drivers/soc/renesas/r8a77990-sysc.c |  3 +++
 drivers/soc/renesas/rcar-sysc.c     | 16 +++++++++++++++
 drivers/soc/renesas/rcar-sysc.h     |  7 +++++--
 8 files changed, 81 insertions(+), 8 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
