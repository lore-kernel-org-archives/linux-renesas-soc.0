Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46092 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751007AbdEVMaO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 08:30:14 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.13
Date: Mon, 22 May 2017 14:29:58 +0200
Message-Id: <cover.1495454780.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v4.13.


The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.13

for you to fetch changes up to 40c9bbea140e64a4257b794969e759c2c481c399:

  ARM: dts: r7s72100: add USB bit definitions (2017-05-15 09:02:37 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v4.13

* Add USB bit definitions and pinctrl header for r7s72100 SoC
* Add GyroADC clock for r8a7791 SoC

----------------------------------------------------------------
Chris Brandt (1):
      ARM: dts: r7s72100: add USB bit definitions

Jacopo Mondi (1):
      ARM: dts: r7s72100: add Renesas RZ/A1 pinctrl header

Marek Vasut (1):
      ARM: dts: r8a7791: add GyroADC clock

 include/dt-bindings/clock/r7s72100-clock.h     |  2 ++
 include/dt-bindings/clock/r8a7791-clock.h      |  1 +
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h | 16 ++++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h
