Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:38086 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbeH1TCV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 15:02:21 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] arm: renesas: Remove the ARCH_SHMOBILE Kconfig symbol
Date: Tue, 28 Aug 2018 17:10:09 +0200
Message-Id: <20180828151011.14065-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

Commit 9b5ba0df4ea4f940 ("ARM: shmobile: Introduce ARCH_RENESAS") started
the conversion from ARCH_SHMOBILE to ARCH_RENESAS for Renesas ARM SoCs.
Now all dependencies have been merged, this patch series completes the
conversion by removing the ARCH_SHMOBILE Kconfig symbols on ARM and ARM64.

Changes compared to v1:
  - Drop updates of dependencies for drivers, all merged.

Thanks!

Geert Uytterhoeven (2):
  ARM: shmobile: Remove the ARCH_SHMOBILE Kconfig symbol
  arm64: renesas: Remove the ARCH_SHMOBILE Kconfig symbol

 arch/arm/mach-shmobile/Kconfig |  4 ----
 arch/arm64/Kconfig.platforms   | 44 ++++++++++++++++------------------
 2 files changed, 20 insertions(+), 28 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
