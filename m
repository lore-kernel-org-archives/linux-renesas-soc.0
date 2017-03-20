Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37309 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753425AbdCTJHw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 05:07:52 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v4.12
Date: Mon, 20 Mar 2017 09:57:30 +0100
Message-Id: <cover.1489999913.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC DT updates for v4.12.


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v4.12

for you to fetch changes up to 3cbe33367d4fd480a92fbc131a96fa925be9e95d:

  arm64: dts: r8a7796: salvator-x: Drop superfluous status update for frequency override (2017-03-13 10:21:16 +0100)

----------------------------------------------------------------
Renesas ARM64 Based SoC DT Updates for v4.12

Cleanup:
* Drop superfluous status update for frequency override from all
  r8a779[56] boards
* Tidyup Audio-DMAC channel for DVC for r8a7795 SoC
* Remove unit-address and reg from integrated cache on r8a779[56] SoCs

Enhancements:
* Add all Cortex-A53 and Cortex-A57 CPU cores to r8a7796 SoC
* Add Cortex-A53 CPU cores to r8a7795 SoC
* Update memory node to 4 GiB map on h3ulcb board
* Upgrade to PSCI v1.0 to support Suspend-to-RAM on r8a779[56] SoCs
* Add SCIF1 (DEBUG1) to r8a7796/salvator-x board
* Add all SCIF and HSCIF nodes with DMA enabled to r8a7796 SoC
* Set drive-strength for ravb pins for r8a7795/salvator-x board
* Enable gigabit ethernet on r8a779[56]/salvator-x boards
* Enable I2C for DVFS device r8a779[56]/salvator-x boards

----------------------------------------------------------------
Dien Pham (2):
      arm64: dts: r8a7796: Add I2C for DVFS device node
      arm64: dts: r8a7796: salvator-x: Add I2C for DVFS device support

Geert Uytterhoeven (11):
      arm64: dts: r8a7795: Add Cortex-A53 CPU cores
      arm64: dts: r8a7795: Add Cortex-A53 PMU node
      arm64: dts: r8a7795: Remove unit-addresses and regs from integrated caches
      arm64: dts: r8a7796: Remove unit-address and reg from integrated cache
      arm64: dts: r8a7796: Add CA53 L2 cache-controller node
      arm64: dts: r8a7796: Add Cortex-A53 CPU cores
      arm64: dts: r8a7796: Add Cortex-A53 PMU node
      arm64: dts: h3ulcb: Drop superfluous status update for frequency override
      arm64: dts: r8a7795: salvator-x: Drop superfluous status updates for frequency overrides
      arm64: dts: m3ulcb: Drop superfluous status update for frequency override
      arm64: dts: r8a7796: salvator-x: Drop superfluous status update for frequency override

Kazuya Mizuguchi (4):
      arm64: dts: r8a7795: Use rgmii-txid phy-mode for EthernetAVB
      arm64: dts: r8a7795: salvator-x: Fix EthernetAVB PHY timing
      arm64: dts: r8a7796: Use rgmii-txid phy-mode for EthernetAVB
      arm64: dts: r8a7796: salvator-x: Fix EthernetAVB PHY timing

Keita Kobayashi (2):
      arm64: dts: r8a7795: Add I2C for DVFS core to dtsi
      arm64: dts: r8a7795: salvator-x: Enable I2C for DVFS device

Khiem Nguyen (2):
      arm64: dts: r8a7795: Upgrade to PSCI v1.0 to support Suspend-to-RAM
      arm64: dts: r8a7796: Upgrade to PSCI v1.0 to support Suspend-to-RAM

Kuninori Morimoto (1):
      arm64: dts: r8a7795: Tidyup Audio-DMAC channel for DVC

Niklas Söderlund (1):
      arm64: dts: r8a7795: salvator-x: Set drive-strength for ravb pins

Takeshi Kihara (2):
      arm64: dts: r8a7796: Add Cortex-A57 CPU cores
      arm64: dts: r8a7796: Add Cortex-A57 PMU node

Ulrich Hecht (5):
      arm64: dts: r8a7796 dtsi: Add all HSCIF nodes
      arm64: dts: r8a7796: Add all SCIF nodes
      arm64: dts: r8a7796: Enable SCIF DMA
      arm64: dts: r8a7796: salvator-x: add SCIF1 (DEBUG1)
      arm64: dts: r8a7796: Enable HSCIF DMA

Vladimir Barinov (2):
      arm64: dts: h3ulcb: Update memory node to 4 GiB map
      arm64: dts: h3ulcb: Fix EthernetAVB PHY timing

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |  29 ++-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  37 +--
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  86 ++++++-
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     |   1 -
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  32 ++-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 265 ++++++++++++++++++++-
 6 files changed, 384 insertions(+), 66 deletions(-)
