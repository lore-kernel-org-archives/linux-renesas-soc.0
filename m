Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57254 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933905AbcIGHu1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:50:27 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for v4.9
Date: Wed,  7 Sep 2016 09:49:30 +0200
Message-Id: <cover.1473234371.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC DT updates for v4.9.

This pull request is based on the previous round of
such requests, tagged as renesas-dt-for-v4.9,
which I have already sent a pull-request for.


The following changes since commit 8bec0842ba2bb1b3bd954a1ef50f426b8f09c84f:

  ARM: dts: r8a7792: add DU support (2016-08-09 14:37:47 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt2-for-v4.9

for you to fetch changes up to fa8f4aba72e6d619c003dab60f58ab6c7410e465:

  ARM: dts: wheat: add support for tactile switches (2016-09-07 09:43:57 +0200)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC DT Updates for v4.9

Fixes (for v4.9):
* Correct PWM clock parent on r8a7794 SoC

Clean-up:
* Remove obsolete vsp1 properties from r8a779[01] SoCs

New boards:
* Add r8a7792/wheat and r7s72100/rskrza1 boards

Enablement:
* Enable LEDs, DU, SDHI on r8a7792/blanche board
* Enable MMCIF and SDHI on r8a7794/alt board
* Add SPI and VSP1 to r8a7792 SoC
* Add ethernet to r7s72100 SoC

----------------------------------------------------------------
Chris Brandt (5):
      ARM: dts: Add RSKRZA1 DT bindings documentation
      ARM: dts: rskrza1: initial device tree
      ARM: dts: r7s72100: add ethernet clock to device tree
      ARM: dts: r7s72100: add ethernet to device tree
      ARM: dts: rskrza1: add ethernet DT support

Geert Uytterhoeven (2):
      ARM: dts: r8a7790: Remove obsolete vsp1 properties
      ARM: dts: r8a7791: Remove obsolete vsp1 properties

Sergei Shtylyov (17):
      ARM: dts: r8a7794: add VSP1 support
      ARM: dts: blanche: add support for general purpose switches
      ARM: dts: blanche: add SDHI0 support
      ARM: dts: blanche: add DU support
      ARM: dts: r8a7792: add VSP1V clocks
      ARM: dts: r8a7792: add VSP1V support
      ARM: dts: blanche: add support for general purpose LEDs
      ARM: dts: document Wheat board
      ARM: dts: wheat: initial device tree
      ARM: dts: wheat: add Ethernet support
      ARM: dts: r8a7794: fix PWM clock parent
      ARM: dts: wheat: add CAN support
      ARM: dts: wheat: add SDHI0 support
      ARM: dts: r8a7792: add QSPI clock
      ARM: dts: r8a7792: add QSPI support
      ARM: dts: wheat: add QSPI support
      ARM: dts: wheat: add support for tactile switches

Simon Horman (2):
      ARM: dts: alt: add SDHI0 and 1 support
      ARM: dts: alt: add MMCIF support

 Documentation/devicetree/bindings/arm/shmobile.txt |   4 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/r7s72100-rskrza1.dts             |  61 ++++++
 arch/arm/boot/dts/r7s72100.dtsi                    |  22 +++
 arch/arm/boot/dts/r8a7790.dtsi                     |  23 ---
 arch/arm/boot/dts/r8a7791.dtsi                     |  18 --
 arch/arm/boot/dts/r8a7792-blanche.dts              | 216 +++++++++++++++++++++
 arch/arm/boot/dts/r8a7792-wheat.dts                | 199 +++++++++++++++++++
 arch/arm/boot/dts/r8a7792.dtsi                     |  58 +++++-
 arch/arm/boot/dts/r8a7794-alt.dts                  | 106 ++++++++++
 arch/arm/boot/dts/r8a7794.dtsi                     |  18 +-
 include/dt-bindings/clock/r7s72100-clock.h         |   3 +
 12 files changed, 683 insertions(+), 47 deletions(-)
 create mode 100644 arch/arm/boot/dts/r7s72100-rskrza1.dts
 create mode 100644 arch/arm/boot/dts/r8a7792-wheat.dts
