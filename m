Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:47436 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758822AbdKPNvl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 08:51:41 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: renesas: Correct primary compatible value for eeprom
Date: Thu, 16 Nov 2017 14:51:34 +0100
Message-Id: <1510840296-12767-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

The Renesas part numbers of the two-wire serial interface EEPROMs do not
follow the 24Cxx pattern, but the R1EX24xxx pattern.

Hence change the primary compatible values to the appropriate variant of
"renesas,r1ex24xxx", like is already done on Gose.

Note that the second patch depends on (trivial) "[PATCH] dt-bindings:
i2c: eeprom: Add Renesas R1EX24128" to please checkpatch.

Thanks!

Geert Uytterhoeven (2):
  ARM: dts: koelsch: Correct primary compatible value for eeprom
  ARM: dts: genmai: Correct primary compatible value for eeprom

 arch/arm/boot/dts/r7s72100-genmai.dts | 2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
