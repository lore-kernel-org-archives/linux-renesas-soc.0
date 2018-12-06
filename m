Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726235AbeLFV7y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:54 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v4.21
Date: Thu,  6 Dec 2018 13:59:31 -0800
Message-Id: <cover.1544132474.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v4.21.


Usually I separate SoC changes for ARM and arm64 into separate branches.
On this occasion I have applied them to a single branch and pull request.
The reason for this is that moving SoC Konfig symbols for both ARM and
arm64 creates a dependency and a combined branch is a clean way to resolve
this.

If separate branches are required then I propose deferring the movement
of ARM (but not arm64) SoC Kconfig symbols to v4.22.


The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.21

for you to fetch changes up to 2ed29e15e4b2500ae78de658a18f4482e7ac288b:

  ARM: shmobile: R-Mobile: Move pm-rmobile to drivers/soc/renesas/ (2018-11-30 11:29:11 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v4.21

* pm-rmobile driver
  - Move to drivers/soc/renesas/
  - Clean up struct rmobile_pm_domain
* Renesas SoC Kconfig Symbols
  - Move symbols for ARM and SoCs to drivers/soc/renesas/
  - Hide ARCH_RZN1 to improve consistency
* SH-Mobile AG5 (sh73a0) SoC: Remove obsolete inclusion of <asm/smp_twd.h>
* Restrict TWD and SCU to Renesas ARM based SoCs where they are present
* Enable GPIOLIB on Renesas arm64 based SoCs to allow GPIO driver selection

----------------------------------------------------------------
Geert Uytterhoeven (8):
      ARM: shmobile: Restrict SCU support to SoCs that have it
      ARM: shmobile: Restrict TWD support to SoCs that have it
      ARM: shmobile: sh73a0: Remove obsolete inclusion of <asm/smp_twd.h>
      ARM: shmobile: Hide ARCH_RZN1 to improve consistency
      arm64: renesas: Move SoC Kconfig symbols to drivers/soc/renesas/
      ARM: shmobile: Move SoC Kconfig symbols to drivers/soc/renesas/
      ARM: shmobile: R-Mobile: Clean up struct rmobile_pm_domain
      ARM: shmobile: R-Mobile: Move pm-rmobile to drivers/soc/renesas/

Takeshi Kihara (1):
      arm64: renesas: Enable GPIOLIB to allow GPIO driver selection

 arch/arm/mach-shmobile/Kconfig                     | 129 -----------
 arch/arm/mach-shmobile/Makefile                    |   1 -
 arch/arm/mach-shmobile/pm-rmobile.h                |  22 --
 arch/arm/mach-shmobile/smp-sh73a0.c                |   1 -
 arch/arm64/Kconfig.platforms                       |  60 +----
 drivers/soc/renesas/Kconfig                        | 241 +++++++++++++++++++--
 drivers/soc/renesas/Makefile                       |   1 +
 .../soc/renesas/rmobile-sysc.c                     |  37 ++--
 8 files changed, 240 insertions(+), 252 deletions(-)
 delete mode 100644 arch/arm/mach-shmobile/pm-rmobile.h
 rename arch/arm/mach-shmobile/pm-rmobile.c => drivers/soc/renesas/rmobile-sysc.c (93%)
