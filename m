Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:43434 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751531AbdEOMWs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 08:22:48 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: salvator-x: Move HDMI0 to common Salvator-X board support
Date: Mon, 15 May 2017 14:22:42 +0200
Message-Id: <1494850964-7246-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

The extensions to the first HDMI device and connector nodes apply to
Salvator-X boards equipped with either an R-Car H3 (ES1.0 or ES2.0) or M3-W
SoC.
Hence move them from the R-Car H3 specific board file to the common
Salvator-X board file.

This requires adding a placeholder for hdmi0 to r8a7796.dtsi first.

Thanks!

Geert Uytterhoeven (2):
  arm64: dts: r8a7796: Add placeholder for HDMI device
  arm64: dts: r8a7795: salvator-x: Move HDMI0 to common Salvator-X board
    support

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 17 -----------------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  9 +++++++++
 arch/arm64/boot/dts/renesas/salvator-x.dtsi        | 17 +++++++++++++++++
 3 files changed, 26 insertions(+), 17 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
