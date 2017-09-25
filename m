Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46212 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933359AbdIYHzE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 03:55:04 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v4.15
Date: Mon, 25 Sep 2017 09:54:43 +0200
Message-Id: <cover.1506325834.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v4.15.


The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.15

for you to fetch changes up to 3fd45a136ff61bb54deab70fb2d534a85e40481f:

  ARM: shmobile: rcar-gen2: Make sure CNTVOFF is initialized on CA7/15 (2017-09-18 08:10:44 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v4.15

* Prepare to enable SMP on R-Car E2 (r8a7794).

  Geert Uytterhoeven says:
  "The main hurdle here is that R-Car Gen2 boot loaders do not initialize
   the arch_timer CNTVOFF register, which thus needs workarounds on Linux.

   - The first patch adds a definition for MON_MODE, as suggested by Marc
     Zyngier,
   - The second patch makes sure CNTVOFF is initialized for boot and
     secondary Cortex-A15 and Cortex-A7 CPU cores, like is already done for
     the boot Cortex-A7 CPU core.  Without this, the ARM arch timer does
     not work on secondary CPU cores."

   A follow-up patch to enable SMP in DT on R-Car E2 (r8a7794) is currently
   deferred unto v4.16 as it depends on the above.

* Enable low-level debugging support for RZ/G1E (r8a7745).

  Fabrizio Castro says, "RZ/G1E uses SCIF4 for the debug console."

----------------------------------------------------------------
Fabrizio Castro (1):
      ARM: debug-ll: Add support for r8a7745

Geert Uytterhoeven (2):
      ARM: Add definition for monitor mode
      ARM: shmobile: rcar-gen2: Make sure CNTVOFF is initialized on CA7/15

 arch/arm/Kconfig.debug                   | 10 +++++++++
 arch/arm/include/uapi/asm/ptrace.h       |  1 +
 arch/arm/mach-shmobile/Makefile          |  1 +
 arch/arm/mach-shmobile/common.h          |  2 ++
 arch/arm/mach-shmobile/headsmp-apmu.S    | 37 ++++++++++++++++++++++++++++++++
 arch/arm/mach-shmobile/platsmp-apmu.c    |  2 +-
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 20 ++---------------
 7 files changed, 54 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm/mach-shmobile/headsmp-apmu.S
