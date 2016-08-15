Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47936 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752455AbcHOIzw (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 04:55:52 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Updates for v4.9
Date: Mon, 15 Aug 2016 10:55:35 +0200
Message-Id: <cover.1471251169.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT updates for v4.9.

In brief it adds support for a number of IP blocks on the r8a7792 and
r8a7794 SoCs, and corrects SDHI register size on the r8a7794.


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-for-v4.9

for you to fetch changes up to 8bec0842ba2bb1b3bd954a1ef50f426b8f09c84f:

  ARM: dts: r8a7792: add DU support (2016-08-09 14:37:47 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC DT Updates for v4.9

* Add DU, VIN, I2C, SDHI, EtherAVB, GPIO support to r8a7792
* Enable CAN0 on r8a7792/blanche
* Enable sound on r8a7794/silk
* Correct SDHI register size on r8a7794

----------------------------------------------------------------
Sergei Shtylyov (25):
      ARM: dts: r8a7792: add PFC support
      ARM: dts: blanche: add SCIF0/3 pins
      ARM: dts: blanche: add Ethernet pins
      ARM: dts: r8a7792: add GPIO clocks
      ARM: dts: r8a7792: add GPIO support
      ARM: dts: r8a7792: add EtherAVB clocks
      ARM: dts: r8a7792: add EtherAVB support
      ARM: dts: r8a7792: add CAN clocks
      ARM: dts: r8a7792: add CAN support
      ARM: dts: blanche: add CAN0 support
      ARM: dts: r8a7792: add SD clocks
      ARM: dts: r8a7792: add SDHI support
      ARM: dts: r8a7792: add I2C clocks
      ARM: dts: r8a7792: add I2C support
      ARM: dts: r8a7792: add VIN clocks
      ARM: dts: r8a7792: add VIN support
      ARM: dts: r8a7794: add audio clocks
      ARM: dts: r8a7794: add MSTP5 clocks
      ARM: dts: r8a7794: add MSTP10 clocks
      ARM: dts: r8a7794: add Audio-DMAC support
      ARM: dts: r8a7794: add sound support
      ARM: dts: silk: add sound support
      ARM: dts: r8a7792: fix misindented line
      ARM: dts: r8a7792: add DU clocks
      ARM: dts: r8a7792: add DU support

Simon Horman (1):
      ARM: dts: r8a7794: Correct SDHI register size

 arch/arm/boot/dts/r8a7792-blanche.dts     |  48 +++
 arch/arm/boot/dts/r8a7792.dtsi            | 500 +++++++++++++++++++++++++++++-
 arch/arm/boot/dts/r8a7794-silk.dts        |  70 +++++
 arch/arm/boot/dts/r8a7794.dtsi            | 293 ++++++++++++++++-
 include/dt-bindings/clock/r8a7794-clock.h |  25 ++
 5 files changed, 933 insertions(+), 3 deletions(-)
