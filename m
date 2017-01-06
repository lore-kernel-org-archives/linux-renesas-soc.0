Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43774 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940179AbdAFLTL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:19:11 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v4.11
Date: Fri,  6 Jan 2017 12:18:48 +0100
Message-Id: <cover.1483701101.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v4.11.


The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.11

for you to fetch changes up to 70def3e53694a65c5583fb5f411491a5074bab18:

  ARM: shmobile: rcar-gen2: Remove unused rcar_gen2_read_mode_pins() (2017-01-03 10:50:45 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v4.11

* Allow booting secondary CPU cores in debug mode

----------------------------------------------------------------
Geert Uytterhoeven (5):
      ARM: shmobile: apmu: Add more register documentation
      ARM: shmobile: apmu: Add debug resource reset for secondary CPU boot
      ARM: shmobile: apmu: Allow booting secondary CPU cores in debug mode
      ARM: shmobile: r8a7791: Allow booting secondary CPU cores in debug mode
      ARM: shmobile: rcar-gen2: Remove unused rcar_gen2_read_mode_pins()

 arch/arm/mach-shmobile/platsmp-apmu.c    | 41 +++++++++++++++++++-------------
 arch/arm/mach-shmobile/rcar-gen2.h       |  2 --
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 18 --------------
 arch/arm/mach-shmobile/smp-r8a7791.c     | 14 +----------
 4 files changed, 25 insertions(+), 50 deletions(-)
