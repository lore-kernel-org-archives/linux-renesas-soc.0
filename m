Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55894 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbeLFV6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:58:33 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for v4.21
Date: Thu,  6 Dec 2018 13:58:23 -0800
Message-Id: <cover.1544125558.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC DT updates for v4.21.

This pull request is based on the previous round of
such requests, tagged as renesas-arm-dt-for-v4.21,
which you have already pulled.


The following changes since commit 673df60a880f060e3e94920c7b5f7a9ed8aa65f2:

  ARM: dts: r9a06g032: Correct the GIC DT node name (2018-11-28 13:55:30 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-dt2-for-v4.21

for you to fetch changes up to e259e04748e2798a747d9c363ded50514b15a7b9:

  ARM: dts: r8a7744-iwg20m: Add SPI NOR support (2018-12-05 11:52:46 -0800)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC DT Updates for v4.21

* RZ/G1N (r8a7744) SoC
  - Describe in DT: SYS-DMAC, GPIO, Ethernet AVB, SMP, [H]SCIF{A|B},
    I2C, USB 2.0 and 3.0 hosts, USB-DMAC, HSUSB, RWDT, Audio, CAN, IRQC,
    thermal, CMT, VIN, VSP, IPMMU, PMU, TPU, QSPI MSIOF, and PCIE
  - iWave G20D-Q7 board
    - Initial support
    - Enable eMMC, SDHI and SPIO NOR support
  - Add camera daughterboard

* RZ/G1M (r8a7743) SoC
  - Remove legacy "renesas,rcar-thermal" compatibility

----------------------------------------------------------------
Biju Das (33):
      ARM: dts: r8a7744-iwg20m: Add iWave RZ/G1N Qseven SOM
      ARM: dts: r8a7744: Initial SoC device tree
      ARM: dts: r8a7744-iwg20d-q7: Add support for iWave G20D-Q7 board based on RZ/G1N
      ARM: dts: r8a7744: Add SYS-DMAC support
      ARM: dts: r8a7744: Add GPIO support
      ARM: dts: r8a7744: Add Ethernet AVB support
      ARM: dts: r8a7744: Add SMP support
      ARM: dts: r8a7744: Add [H]SCIF{A|B} support
      ARM: dts: r8a7744: Add I2C and IIC support
      ARM: dts: r8a7744: Add SDHI nodes
      ARM: dts: r8a7744: Add MMC node
      ARM: dts: r8a7744-iwg20m: Add eMMC support
      ARM: dts: r8a7744-iwg20m: Enable SDHI0 controller
      ARM: dts: r8a7744: USB 2.0 host support
      ARM: dts: r8a7744: Add USB-DMAC and HSUSB device nodes
      ARM: dts: r8a7744: Add RWDT node
      ARM: dts: r8a7744: Add audio support
      ARM: dts: r8a7744: Add CAN support
      ARM: dts: r8a7744: Add IRQC support
      ARM: dts: r8a7744: Add thermal device to DT
      ARM: dts: r8a7744: Add CMT SoC specific support
      ARM: dts: r8a7744: add VIN dt support
      ARM: dts: r8a7744: Add VSP support
      ARM: dts: r8a7744: Add IPMMU DT nodes
      ARM: dts: r8a7744: Add PWM SoC support
      ARM: dts: r8a7744: Add TPU support
      ARM: dts: r8a7744-iwg20d-q7-dbcm-ca: Add device tree for camera DB
      ARM: dts: r8a7744: Add QSPI support
      ARM: dts: r8a7744: Add MSIOF[012] support
      ARM: dts: r8a7744: Add xhci support
      ARM: dts: r8a7744: Add PCIe Controller device node
      ARM: dts: iwg20d-q7-common: Move cmt/rwdt node out of RZ/G1M SOM
      ARM: dts: r8a7744-iwg20m: Add SPI NOR support

Geert Uytterhoeven (1):
      ARM: dts: r8a7743: Remove legacy "renesas,rcar-thermal" compatibility

 arch/arm/boot/dts/Makefile                      |    2 +
 arch/arm/boot/dts/iwg20d-q7-common.dtsi         |    9 +
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi           |    9 -
 arch/arm/boot/dts/r8a7743.dtsi                  |    3 +-
 arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dts |   17 +
 arch/arm/boot/dts/r8a7744-iwg20d-q7.dts         |   15 +
 arch/arm/boot/dts/r8a7744-iwg20m.dtsi           |   90 ++
 arch/arm/boot/dts/r8a7744.dtsi                  | 1741 +++++++++++++++++++++++
 8 files changed, 1875 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dts
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20d-q7.dts
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20m.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7744.dtsi
