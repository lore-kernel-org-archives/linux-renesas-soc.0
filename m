Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:58582 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932284AbdJ3P4e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Oct 2017 11:56:34 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: dts: renesas: eagle: Add watchdog timer support
Date: Mon, 30 Oct 2017 16:56:26 +0100
Message-Id: <1509378989-25069-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series adds support for the watchdog timer on R-Car V3M, and
enables it on the Eagle development board.

This allows to use the watchdog timer to reset the board, until PSCI is
enhanced to include such functionality.

Dependencies:
  - renesas-devel-20171030-v4.14-rc7,
  - "[PATCH] dt-bindings: watchdog: renesas-wdt: Add support for the
     r8a77970 wdt", which is a trivial addition.

Thanks!

Geert Uytterhoeven (3):
  arm64: dts: renesas: r8a77970: Add RWDT node
  arm64: dts: renesas: eagle: Move avb node to preserve sort order
  arm64: dts: renesas: eagle: Enable watchdog timer

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 23 ++++++++++++++---------
 arch/arm64/boot/dts/renesas/r8a77970.dtsi      | 10 ++++++++++
 2 files changed, 24 insertions(+), 9 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
