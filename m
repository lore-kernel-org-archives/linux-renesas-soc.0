Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:51034 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752031AbdGDRiA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jul 2017 13:38:00 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/2] ARM: renesas: rcar-gen2: arch_timer cleanups
Date: Tue,  4 Jul 2017 19:37:54 +0200
Message-Id: <1499189876-4822-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus, Sergei,

This RFC patch series contains two small fixes for the ARM architecture
timer initialization in platform code for Renesas R-Car Gen2 and RZ/G1
SoCs.

  - The first patch skips an unneeded initialization on R-Car V2h.
    This is marked RFC as the check for Cortex-A7 may have to be
    changed, depending on the discussion sparked by "[PATCH 0/2] ARM:
    renesas: Enable SMP on R-Car E2".
  - The second patch corrects the frequency of the architecture timer on
    RZ/G1E.
    This is marked RFC as I don't have access to hardware to test.

Thanks for your comments!

Geert Uytterhoeven (2):
  ARM: shmobile: rcar-gen2: Separate arch timer init and parent handling
  ARM: shmobile: rcar-gen2: Correct arch timer frequency on RZ/G1E

 arch/arm/mach-shmobile/setup-rcar-gen2.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
