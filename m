Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:45996 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933485AbdKPNoY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 08:44:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] arm64: dts: renesas: salvator-x/xs: Add SoC name to file header
Date: Thu, 16 Nov 2017 14:44:17 +0100
Message-Id: <1510839861-12303-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

With the proliferation of Salvator-X and Salvator-XS boards carrying
different R-Car Gen3 SoCs variants, several DTS files ended up having
the same file headers.

Add the SoC names to the file headers to avoid confusion.

Thanks!

Geert Uytterhoeven (4):
  arm64: dts: renesas: r8a7795-es1-salvator-x: Add SoC name to file
    header
  arm64: dts: renesas: r8a7795-salvator-x: Add SoC name to file header
  arm64: dts: renesas: r8a7796-salvator-x: Add SoC name to file header
  arm64: dts: renesas: r8a7795-salvator-xs: Add SoC name to file header

 arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts     | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts    | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
