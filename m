Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C693F54AC;
	Thu, 16 Jul 2026 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196236; cv=none; b=OC4Tb/Z01d7JNGfUzBele6jhQbROCfELptOO8G0gnfpQmhO96pAvLRKX5r13ryF2gRFVkPOwSjIgM4KEjwf9lEXZFrVlJ0o7s19SOuulez/pCs7jeKFtpf1a2HYmYyH5kT2Ii8LSh829EEb0ZcDoPeguTMRYT855osXvqD0XN0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196236; c=relaxed/simple;
	bh=eDM1Bys+i+Eqimvxb8Tdec20C7wxLXU5KD1/ptliuKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtycxClMjIpVKFCeXB3EXotrJZFCWVZb8aHJgz7BXEyzWqfBkFmakBGAJOfG834T4UOkOqcCJYN0dR9iPc2P6QcsvgGBtjcQI6NQsnLNFOvi/mN+Nw+Dm150A/ZZnMdGsn8sfZIBSogp4uIR9yVipEGEVR2rK6kK0IwgHMRxxq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BBA1F00AC4;
	Thu, 16 Jul 2026 10:03:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v7.3
Date: Thu, 16 Jul 2026 12:03:43 +0200
Message-ID: <cover.1784194406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784194401.git.geert+renesas@glider.be>
References: <cover.1784194401.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6fa6ee724d8dadf392139e242ac936b5da730c4b:

  arm64: dts: renesas: ironhide: Describe inline ECC carveouts (2026-07-14 10:34:32 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.3-tag1

for you to fetch changes up to 24afcb87e6aca1ff3face276223eeea0012f8e2b:

  arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges memory space code (2026-07-14 10:36:37 +0200)

----------------------------------------------------------------
Renesas DTS updates for v7.3

  - Add sound support for the RZ/G3E SoC and the RZ/G3E SMARC EVK board,
  - Add more serial and SPI support for the RZ/G3L SoC and the RZ/G3L
    SMARC EVK board,
  - Add SMP support (32x Cortex-A720AE) for the R-Car X5H SoC,
  - Add hwspinlock and mailbox (MFIS) support for the R-Car V4H SoC,
  - Add GPU support for R-Car M3-N-based Salvator-X(S) and ULCB
    development boards,
  - Add SPI and FRAM support for the RZ/N1D SoC and the RZN1D Expansion
    Board,
  - Add PCIe support for the RZ/V2H SoC and the RZ/V2H EVK development
    board,
  - Miscellaneous fixes and improvements.

Note that this PR is based on renesas-fixes-for-v7.2-tag1, for which I
have just sent a PR.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (5):
      arm64: dts: renesas: r9a08g046l48-smarc: Enable rsci{1,2,3} nodes
      arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
      arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2
      arm64: dts: renesas: r9a09g047e57-smarc: Drop SW_SER0_PMOD condition for rsci4
      arm64: dts: renesas: r9a09g047: Add max-frequency to SDHI nodes

John Madieu (6):
      arm64: dts: renesas: rzv2h: Add audio clock inputs
      arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
      arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
      arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
      arm64: dts: renesas: rzg3e-smarc-som: Add audio pinmux definitions
      arm64: dts: renesas: r9a09g047e57-smarc: Add DA7212 audio codec support

Lad Prabhakar (8):
      arm64: dts: renesas: rzt2h-n2h-evk: Remove unused MII/GMII pins
      arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
      arm64: dts: renesas: rzt2h-n2h-evk: Configure SCI0 pins
      arm64: dts: renesas: rzt2h-n2h-evk-common: Add memory nodes
      arm64: dts: renesas: r9a09g057: Add PCIe nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe
      arm64: dts: renesas: r9a09g056: Fix PCIe dma-ranges memory space code
      arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges memory space code

Marek Vasut (5):
      arm64: dts: renesas: r8a78000: Enable application CPU cores via PSCI
      arm64: dts: renesas: r8a77965-salvator-x: Enable GPU support
      arm64: dts: renesas: r8a77965-salvator-xs: Enable GPU support
      arm64: dts: renesas: r8a77965-ulcb: Enable GPU support
      arm64: dts: renesas: Add soc: labels to soc nodes

Wolfram Sang (3):
      arm64: dts: renesas: r8a779g0: Add MFIS node
      ARM: dts: renesas: r9a06g032: Describe SPI controllers
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM

bui duc phuc (1):
      ARM: dts: renesas: r8a7740: Add FSI clocks

 arch/arm/boot/dts/renesas/r8a7740.dtsi             |  12 +-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts |  25 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  84 ++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   2 +-
 .../arm64/boot/dts/renesas/r8a77965-salvator-x.dts |   4 +
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |   4 +
 arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts      |   4 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          |  32 ++
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  69 +++
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  78 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 525 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 114 ++++-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  22 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 160 ++++++-
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  18 +
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 144 ++++--
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 144 ++++--
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  44 ++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  14 +
 28 files changed, 1420 insertions(+), 112 deletions(-)
