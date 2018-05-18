Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751815AbeERLSB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:18:01 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.18
Date: Fri, 18 May 2018 13:16:25 +0200
Message-Id: <cover.1526548577.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC defconfig updates for v4.18.


The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-defconfig-for-v4.18

for you to fetch changes up to eedd7902366b17f95f4fe687c54dcfa186a53158:

  ARM: multi_v7_defconfig: Enable RENESAS_WDT (2018-05-16 11:08:35 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Defconfig Updates for v4.18

* Enable in shmobile and multi_v7 defconfigs to give wider test coverage:

  - Recently mainlined support for RZ/G1C (r8a77470) SoC

  - Renesas Watchdog (RENESAS_WDT) which is used on
    R-Car Gen2 and RZ/G1 platforms.

* Disable in shmobile and multi_v7 defconfigs to avoid unecessary bloat:

  FB_SH_MOBILE_MERAM the last user of which was removed in v4.1 by
  a521422ea4ae6128 ("ARM: shmobile: mackerel: Remove Legacy C board
  code").

----------------------------------------------------------------
Biju Das (2):
      ARM: shmobile: defconfig: Enable r8a77470 SoC
      ARM: multi_v7_defconfig: Enable r8a77470 SoC

Fabrizio Castro (1):
      ARM: shmobile: defconfig: Enable RENESAS_WDT_GEN

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Disable CONFIG_FB_SH_MOBILE_MERAM
      ARM: multi_v7_defconfig: Disable CONFIG_FB_SH_MOBILE_MERAM

Simon Horman (1):
      ARM: multi_v7_defconfig: Enable RENESAS_WDT

 arch/arm/configs/multi_v7_defconfig | 3 ++-
 arch/arm/configs/shmobile_defconfig | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)
