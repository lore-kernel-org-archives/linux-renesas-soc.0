Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:40624 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751976AbeEGNYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 09:24:54 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: r7s72100: Correct interrupt types
Date: Mon,  7 May 2018 15:24:47 +0200
Message-Id: <1525699489-6172-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

RZ/A1H peripherals use a mix of level and edge interrupts.

This patch series corrects the interrupt types for watchdog and RTC from
edge to level, to match the datasheet.

Is there any easy way to test this?
The watchdog interrupt is not used by the Linux driver.
The RTC interrupts are used, but how to trigger them?

Thanks!

Geert Uytterhoeven (2):
  ARM: dts: r7s72100: Correct watchdog timer interrupt type
  ARM: dts: r7s72100: Correct RTC interrupt types

 arch/arm/boot/dts/r7s72100.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
