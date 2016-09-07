Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57018 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756483AbcIGHlo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:41:44 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v4.9
Date: Wed,  7 Sep 2016 09:41:38 +0200
Message-Id: <cover.1473233986.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v4.9.


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.9

for you to fetch changes up to 82acc69402d91bde8657c0db26e5211943de65fd:

  ARM: shmobile: r8a7791: only use smp_init when SMP is selected (2016-08-24 09:08:57 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v4.9

Clean-up:
* Only use smp_init when SMP is selected

Enablement:
* Add debug-ll support for r8a7992

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: debug-ll: Add support for r8a7992

Wolfram Sang (2):
      ARM: shmobile: r8a7790: only use smp_init when SMP is selected
      ARM: shmobile: r8a7791: only use smp_init when SMP is selected

 arch/arm/Kconfig.debug                 | 8 ++++----
 arch/arm/mach-shmobile/setup-r8a7790.c | 2 +-
 arch/arm/mach-shmobile/setup-r8a7791.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
