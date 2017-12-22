Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33901 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755987AbdLVK3v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Dec 2017 05:29:51 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.16
Date: Fri, 22 Dec 2017 11:29:33 +0100
Message-Id: <cover.1513935930.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC defconfig updates for v4.16.


The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-defconfig-for-v4.16

for you to fetch changes up to 1943cbd3b39ee3310494d5b531a906e836bb9f7f:

  ARM: shmobile: defconfig: Enable PWM (2017-12-20 09:29:49 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Defconfig Updates for v4.16

shmobile_defconfig:
* Enable PWM timers, which are present on R-Car and RZ/G1 platforms,
  as a built-in
* Enable SGTL5000 audio codec, which is present on the he iWave RZ/G1M Q7
  carrier board, as a built-in

multi_v7_defconfig:
* Enable PWM timers, which are present on R-Car and RZ/G1 platforms,
  as a module

----------------------------------------------------------------
Biju Das (1):
      ARM: shmobile: defconfig: Enable SGTL5000 audio codec

Fabrizio Castro (2):
      ARM: multi_v7_defconfig: Select PWM_RCAR as module
      ARM: shmobile: defconfig: Enable PWM

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/shmobile_defconfig | 2 ++
 2 files changed, 3 insertions(+)
