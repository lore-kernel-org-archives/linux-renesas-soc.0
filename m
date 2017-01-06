Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43762 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940151AbdAFLSk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:18:40 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Updates for v4.11
Date: Fri,  6 Jan 2017 12:18:31 +0100
Message-Id: <cover.1483700969.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT updates for v4.11.


The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-for-v4.11

for you to fetch changes up to 654450baf2afba86cf328e1849ccac61ec4630af:

  ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for msiof nodes (2017-01-03 10:47:05 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC DT Updates for v4.11

* Add da9063 PMIC device node for system restart to gose board
* Add device node for PRR to SoCs where it was missing
* Move RST node before SYSC node where it was incorrectly placed
* Use Gen 2 fallback bindings for I2C, IIC, MSIOf and USB2 phy
* Use SoC-specific compat string for MMCIF where it was missing

----------------------------------------------------------------
Geert Uytterhoeven (5):
      ARM: dts: r8a7743: Move RST node before SYSC node
      ARM: dts: r8a7745: Move RST node before SYSC node
      ARM: dts: r8a7743: Add device node for PRR
      ARM: dts: r8a7745: Add device node for PRR
      ARM: dts: gose: Add da9063 PMIC device node for system restart

Simon Horman (20):
      ARM: dts: r8a73a4: Use SoC-specific compat string for mmcif
      ARM: dts: r8a7778: Use SoC-specific compat string for mmcif
      ARM: dts: sh73a0: Use SoC-specific compat string for mmcif
      ARM: dts: r8a7790: Use renesas,rcar-gen2-usb-phy fallback binding
      ARM: dts: r8a7791: Use renesas,rcar-gen2-usb-phy fallback binding
      ARM: dts: r8a7794: Use renesas,rcar-gen2-usb-phy fallback binding
      ARM: dts: r8a7779: Use R-Car Gen 1 fallback binding for i2c nodes
      ARM: dts: r8a7778: Use R-Car Gen 1 fallback binding for i2c nodes
      ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for i2c nodes
      ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for i2c nodes
      ARM: dts: r8a7792: Use R-Car Gen 2 fallback binding for i2c nodes
      ARM: dts: r8a7793: Use R-Car Gen 2 fallback binding for i2c nodes
      ARM: dts: r8a7794: Use R-Car Gen 2 fallback binding for i2c nodes
      ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for iic nodes
      ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for iic nodes
      ARM: dts: r8a7793: Use R-Car Gen 2 fallback binding for iic nodes
      ARM: dts: r8a7794: Use R-Car Gen 2 fallback binding for iic nodes
      ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for msiof nodes
      ARM: dts: r8a7792: Use R-Car Gen 2 fallback binding for msiof nodes
      ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for msiof nodes

 arch/arm/boot/dts/r8a73a4.dtsi     |  4 ++--
 arch/arm/boot/dts/r8a7743.dtsi     | 13 +++++++++----
 arch/arm/boot/dts/r8a7745.dtsi     | 13 +++++++++----
 arch/arm/boot/dts/r8a7778.dtsi     | 10 +++++-----
 arch/arm/boot/dts/r8a7779.dtsi     |  8 ++++----
 arch/arm/boot/dts/r8a7790.dtsi     | 35 ++++++++++++++++++++++-------------
 arch/arm/boot/dts/r8a7791.dtsi     | 33 ++++++++++++++++++++-------------
 arch/arm/boot/dts/r8a7792.dtsi     | 24 ++++++++++++++++--------
 arch/arm/boot/dts/r8a7793-gose.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/r8a7793.dtsi     | 21 ++++++++++++---------
 arch/arm/boot/dts/r8a7794.dtsi     | 21 ++++++++++++---------
 arch/arm/boot/dts/sh73a0.dtsi      |  2 +-
 12 files changed, 133 insertions(+), 72 deletions(-)
