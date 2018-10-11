Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:51704 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbeJKQVe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Oct 2018 12:21:34 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/2] arm: renesas: Move SoC Kconfig symbols to drivers/soc/renesas/
Date: Thu, 11 Oct 2018 10:55:06 +0200
Message-Id: <20181011085508.5234-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

As pointed out by Arnd[*], there are lots of SoC-specific Kconfig
symbols in the Renesas section of arch/arm64/Kconfig.platforms, while
other vendors expose a single Kconfig symbol there.

Hence this patch series moves them to drivers/soc/renesas/Kconfig,
reducing the footprint and associated amount of churn in
arch/arm64/Kconfig.platforms, while preserving the benefits for users of
automatic selection of e.g. clock and pinctrl drivers.

As my OCD just loves consistency, the second patch does the same for
arm32 SoCs.

Note that e.g. drivers/clk/ is included before drivers/soc/.  Hence when
COMPILE_TEST=y and ARCH_RENESAS=n, questions will be asked about clock
drivers before they can be auto-selected by the corresponding
SoC-specific Kconfig symbols.

Of course this will trigger some defconfig updates later...

Thanks for your comments!

[*] https://www.spinics.net/lists/arm-kernel/msg679390.html

Geert Uytterhoeven (2):
  [RFC] arm64: renesas: Move SoC Kconfig symbols to drivers/soc/renesas/
  [RFC] ARM: shmobile: Move SoC Kconfig symbols to drivers/soc/renesas/

 arch/arm/mach-shmobile/Kconfig | 101 -----------------
 arch/arm64/Kconfig.platforms   |  54 ---------
 drivers/soc/renesas/Kconfig    | 201 +++++++++++++++++++++++++++++----
 3 files changed, 180 insertions(+), 176 deletions(-)

-- 
2.17.1
