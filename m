Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Yangbo Lu <yangbo.lu@nxp.com>
Cc: Lee Jones <lee.jones@linaro.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] soc: renesas: Identify SoC and register with the SoC bus
Date: Tue,  4 Oct 2016 11:09:23 +0200
Message-Id: <1475572167-29581-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

Some Renesas SoCs may exist in different revisions, providing slightly
different functionalities (e.g. R-Car H3 ES1.x and ES2.0). This needs to
be catered for by drivers and/or platform code.  The recently proposed
soc_device_match() API seems like a good fit to handle this.

This patch series implements the core infrastructure to provide SoC and
revision information through the SoC bus for Renesas ARM SoCs. It
consists of 4 patches:
  - Patch 1 avoids a crash when SoC revision information is needed and
    provided early,
  - Patch 2 (from Arnd) introduces the soc_device_match() API.
    I don't know if, when, and through which channel this patch is
    planned to go upstream,
  - Patch 3 fixes a bug in soc_device_match(), causing a crash when
    trying to match on an SoC attribute that is not provided (seen on
    EMEV2, RZ/A, and R-Car M1A, which lack revision information),
  - Patch 4 identifies Renesas SoCs and registers them with the SoC bus.

Tested on (family, machine, soc_id, optional revision):

    Emma Mobile EV2, EMEV2 KZM9D Board, emev2
    RZ/A, Genmai, r7s72100
    R-Mobile, APE6EVM, r8a73a4, ES1.0
    R-Mobile, armadillo 800 eva, r8a7740, ES2.0
    R-Car Gen1, bockw, r8a7778
    R-Car Gen1, marzen, r8a7779, ES1.0
    R-Car Gen2, Lager, r8a7790, ES1.0
    R-Car Gen2, Koelsch, r8a7791, ES1.0
    R-Car Gen2, Gose, r8a7793, ES1.0
    R-Car Gen2, Alt, r8a7794, ES1.0
    R-Car Gen3, Renesas Salvator-X board based on r8a7795, r8a7795, ES1.0
    R-Car Gen3, Renesas Salvator-X board based on r8a7796, r8a7796, ES1.0
    SH-Mobile, KZM-A9-GT, sh73a0, ES2.0

For your convenience, this series is also available in the
topic/renesas-soc-id-v1 branch of my renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Thanks for your comments!

Arnd Bergmann (1):
  base: soc: Introduce soc_device_match() interface

Geert Uytterhoeven (3):
  base: soc: Early register bus when needed
  base: soc: Check for NULL SoC device attributes
  [RFC] soc: renesas: Identify SoC and register with the SoC bus

 arch/arm/mach-shmobile/Kconfig    |   1 +
 arch/arm64/Kconfig.platforms      |   1 +
 drivers/base/Kconfig              |   1 +
 drivers/base/soc.c                |  79 +++++++++++
 drivers/soc/renesas/Makefile      |   2 +
 drivers/soc/renesas/renesas-soc.c | 266 ++++++++++++++++++++++++++++++++++++++
 include/linux/sys_soc.h           |   3 +
 7 files changed, 353 insertions(+)
 create mode 100644 drivers/soc/renesas/renesas-soc.c

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
