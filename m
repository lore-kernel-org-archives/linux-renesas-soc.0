Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:41404 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935843AbdGTMzK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2017 08:55:10 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] arm64: dts: renesas: Add Support for R-Car D3 and Draak
Date: Thu, 20 Jul 2017 14:54:33 +0200
Message-Id: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series adds minimal support for the R-Car D3 SoC and the
Draak development board, allowing to boot from a ramdisk using a serial
console.

  - The first two patches add DT sources for R-Car D3 and Draak.
    Due to the use of hardcoded constants, they have no further (build)
    dependencies (obviously there is a runtime dependency).
  - The last two patches replace the hardcoded constants by symbols from
    DT binding headers, and thus depend on those headers.  Hence it
    should be postponed to v4.15.

For proper operation, this depends on the 3 series I have just sent:
  - [PATCH 0/3] arm64: renesas: Base R-Car D3 support,
  - [PATCH 0/4] soc: renesas: Add R-Car D3 support,
  - [PATCH 0/4] clk: renesas: Add R-Car D3 support.

For testing, an integration branch containing all dependencies (and a
few DT binding updates I do not want to send before "ARM: shmobile:
Document R-Car D3 SoC DT bindings" has been accepted) is available in
the topic/r8a77995-integration branch of the git repository at
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git.

Thanks for your comments!

Geert Uytterhoeven (4):
  arm64: dts: renesas: Add Renesas R8A77995 SoC support
  arm64: dts: renesas: Add Renesas Draak board support
  arm64: dts: renesas: r8a77995: Use r8a7795-sysc binding definitions
  arm64: dts: renesas: r8a77995: Use r8a7795-cpg-mssr binding
    definitions

 arch/arm64/boot/dts/renesas/Makefile           |   1 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts |  46 ++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 151 +++++++++++++++++++++++++
 3 files changed, 198 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77995-draak.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77995.dtsi

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
