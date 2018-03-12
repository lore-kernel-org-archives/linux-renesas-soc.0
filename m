Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:35940 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751293AbeCLPMH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 11:12:07 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: dts: renesas: Rename EtherAVB "mdc" pin group to "mdio"
Date: Mon, 12 Mar 2018 16:11:57 +0100
Message-Id: <1520867520-13942-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

On Renesas R-Car Gen2 SoCs, the pin group for the MDIO bus is named
"mdio".

When initial support was added for R-Car H3, the MDIO pin was forgotten,
and the MDC pin got its own group named "mdc".  During the addition of
support for R-Car M3-W, this mistake was noticed.  But as R-Car H3 and
M3-W are pin compatible, and can be mounted on the same boards, the
decision was made to just add the MDIO pin to the existing "mdc" group.
Later this was extended to R-Car H3 ES2.0, and M3-N, because of pin
compatibility, and to R-Car D3, in the name of consistency among R-Car
Gen3 SoCs.

However, this decision keeps on being questioned when adding new SoC
support.  Hence bite the bullet and admit our mistake, and rename the
pin group from "mdc" to "mdio", like on R-Car Gen2 SoCs.

This series is the DTS part, and depends on the series '[PATCH 0/6]
pinctrl: sh-pfc: rcar-gen3: Rename EtherAVB "mdc" pin group to "mdio"'.

Geert Uytterhoeven (3):
  arm64: dts: renesas: salvator-common: Rename EtherAVB "mdc" pin group
    to "mdio"
  arm64: dts: renesas: ulcb: Rename EtherAVB "mdc" pin group to "mdio"
  arm64: dts: renesas: draak: Rename EtherAVB "mdc" pin group to "mdio"

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts   | 2 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 6 +++---
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
