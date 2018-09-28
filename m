Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58158 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729111AbeI1Qp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:45:56 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v4.20
Date: Fri, 28 Sep 2018 12:22:47 +0200
Message-Id: <cover.1538123953.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v4.20.


The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-soc-for-v4.20

for you to fetch changes up to 6d14d4d313d09dabdb06b4a9f4e5fe4305051e9b:

  ARM: shmobile: Rework the PMIC IRQ line quirk (2018-09-19 11:11:46 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v4.20

* Rework the PMIC IRQ line quirk to use DT rather than hard coded topology
* Convert to SPDX identifiers
* Convert to using %pOFn instead of device_node.name
* Remove the no longer needed ARCH_SHMOBILE Kconfig symbol
* RZ/G1N (r8a7744) SoC: Add basic SoC and debug-ll support
* R-Car H1 (r8a7779) SoC: remove unused includes

----------------------------------------------------------------
Biju Das (2):
      ARM: shmobile: r8a7744: Basic SoC support
      ARM: debug-ll: Add support for r8a7744

Geert Uytterhoeven (2):
      ARM: shmobile: r8a7779: Remove unused includes
      ARM: shmobile: Remove the ARCH_SHMOBILE Kconfig symbol

Kuninori Morimoto (1):
      ARM: shmobile: convert to SPDX identifiers

Marek Vasut (1):
      ARM: shmobile: Rework the PMIC IRQ line quirk

Rob Herring (1):
      ARM: shmobile: Convert to using %pOFn instead of device_node.name

 arch/arm/Kconfig.debug                             |   9 +-
 arch/arm/mach-shmobile/Kconfig                     |  10 +-
 arch/arm/mach-shmobile/headsmp-scu.S               |  13 +-
 arch/arm/mach-shmobile/headsmp.S                   |   7 +-
 arch/arm/mach-shmobile/platsmp-scu.c               |   5 +-
 arch/arm/mach-shmobile/platsmp.c                   |   5 +-
 arch/arm/mach-shmobile/pm-rcar-gen2.c              |   5 +-
 arch/arm/mach-shmobile/pm-rmobile.c                |   7 +-
 arch/arm/mach-shmobile/pm-rmobile.h                |   7 +-
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 139 ++++++++++++++++-----
 arch/arm/mach-shmobile/setup-r8a7779.c             |   2 -
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |   2 +
 arch/arm/mach-shmobile/smp-sh73a0.c                |  10 +-
 arch/arm/mach-shmobile/suspend.c                   |   5 +-
 arch/arm/mach-shmobile/timer.c                     |  10 +-
 15 files changed, 137 insertions(+), 99 deletions(-)
