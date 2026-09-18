Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3821D3AFB1B;
	Fri, 18 Sep 2026 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724242; cv=none; b=RKPA+luP4n7kr/0Bh+f7SyNKdupO22jNenOHdpmmnTggYb5xaidQuTC+lAc6MeqHsieMc/IeqpcyPsvrvwoSfpKztbuWFUTJe/W4L8aJu6NoWJM06mo15hSz8h8SrCT0lwEY6Y4vEIzfUUfbnWqZz1z7skDwXirCfH5bug8Tv24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724242; c=relaxed/simple;
	bh=tdLzM35fvNa+ePTZFB6PwfoolvSKeDWJH3gr9YBT3aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XilkEB1RrHO7gXgiWwmnevFbYG6fY2rqAqtVeTwTqZc/GP8q2fsOVD9YNS2Hqbb8m5aEvPJGmjsckjTVDTh217Qvi9QAXGu3lB+wDztPVq/Ubl3/tsAKbXl9uixvEx3e+sjCf7CAlEFuK8vdJwqZpdOgR0XafW7INdopPOrMBwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECD71F00893;
	Fri, 18 Sep 2026 09:37:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v7.4
Date: Fri, 18 Sep 2026 11:37:05 +0200
Message-ID: <cover.1789722875.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789722868.git.geert+renesas@glider.be>
References: <cover.1789722868.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8dc2615d5702059b2b71fca6f93c0d7d10ae54cb:

  arm64: dts: renesas: r8a779f0: Set UFS lane count (2026-09-14 10:07:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.4-tag1

for you to fetch changes up to b43aa6a6ebe8ca8bdd75ee688e1eb2d0d16a888e:

  arm64: dts: renesas: r8a779f0: Add GICv3 ITS and update PCIe nodes (2026-09-15 10:46:16 +0200)

----------------------------------------------------------------
Renesas DTS updates for v7.4

  - Add GPU and display support for the RZ/G3L SoC,
  - Add display and RTC support for the RZ/T2H and RZ/N2H SoCs, and
    their EVK development boards,
  - Add I3C support for the RZ/G3S SMARC SoM,
  - Specify ethernet PHY reset timings on various ARM32 boards,
  - Add Clock Pulse Generator (CPG) and Module Controller (MDLC) support
    on the R-Car X5H SoC,
  - Add GICv3 Interrupt Translation Services (ITS) support on the R-Car
    V4H, V4M, and S4-8 SoCs,
  - Add GPIO support for the RZ/N1D-EB Expansion Board,
  - Add Display Stream Compressor (DSC) and (more) DisplayPort support
    for the R-Car V4H SoC and the Sparrow Hawk and White Hawk
    development boards,
  - Add WaveShare dual-channel CANFD HAT support for the Sparrow Hawk
    development board,
  - Miscellaneous fixes and improvements.

Note that this is based on renesas-fixes-for-v7.3-tag2, for which I have
just sent a PR.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (7):
      arm64: dts: renesas: r9a08g046: Add Mali-G31 GPU node
      arm64: dts: renesas: rzg3l-smarc-som: Enable Mali-G31
      arm64: dts: renesas: r9a08g045: Move max-frequency to SoC dtsi
      arm64: dts: renesas: r9a08g046: Add FCPVD node
      arm64: dts: renesas: r9a08g046: Add VSPD node
      arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
      arm64: dts: renesas: r9a08g046: Add LVDS node

Claudiu Beznea (1):
      arm64: dts: renesas: rzg3s-smarc-som: Enable I3C

Geert Uytterhoeven (4):
      arm64: dts: renesas: r8a78000: Add CPG node
      arm64: dts: renesas: r8a78000: Add MDLC nodes
      arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
      arm64: dts: renesas: white-hawk: Add second mini-DP output support

Krzysztof Kozlowski (3):
      ARM: dts: renesas: Correct white-space style
      arm64: dts: renesas: Correct white-space style
      arm64: dts: renesas: Use hyphens in node names

Lad Prabhakar (12):
      arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
      arm64: dts: renesas: r9a09g077: Add DU node
      arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
      arm64: dts: renesas: r9a09g087: Add DU node
      arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
      arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
      arm64: dts: renesas: rzt2h-n2h-evk: Use consistent switch notation
      arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs
      arm64: dts: renesas: r9a09g077: Add RTC node
      arm64: dts: renesas: r9a09g087: Add RTC node
      arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
      arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot partitions read-only

Marek Vasut (22):
      arm64: dts: renesas: sparrow-hawk: Always enable edge connector I2C busses
      ARM: dts: renesas: gr-peach: Specify ethernet PHY reset timings
      ARM: dts: renesas: armadillo800eva: Specify ethernet PHY reset timings
      ARM: dts: renesas: lager: Specify ethernet PHY reset timings
      ARM: dts: renesas: stout: Specify ethernet PHY reset timings
      ARM: dts: renesas: koelsch: Specify ethernet PHY reset timings
      ARM: dts: renesas: porter: Specify ethernet PHY reset timings
      ARM: dts: renesas: gose: Specify ethernet PHY reset timings
      ARM: dts: renesas: alt: Specify ethernet PHY reset timings
      ARM: dts: renesas: silk: Specify ethernet PHY reset timings
      ARM: dts: renesas: sk-rzg1m: Specify ethernet PHY reset timings
      ARM: dts: renesas: sk-rzg1e: Specify ethernet PHY reset timings
      arm64: dts: renesas: cat875: Specify ethernet PHY reset timings
      arm64: dts: renesas: hihope-rzg2-ex: Specify ethernet PHY reset timings
      arm64: dts: renesas: beacon: Specify ethernet PHY reset timings
      arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
      arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update PCIe node
      arm64: dts: renesas: r8a779g0: Add DSC
      arm64: dts: renesas: sparrow-hawk: Enable DisplayPort by adding DSC
      arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name with label
      arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare 2CH CANFD HAT
      arm64: dts: renesas: r8a779f0: Add GICv3 ITS and update PCIe nodes

Tommaso Merciai (1):
      arm64: dts: renesas: r9a09g047e57-smarc: Set I2C1 clock frequency to 1 MHz

Wolfram Sang (5):
      ARM: dts: renesas: lager: Specify correct connector for i2cexio0 bus
      ARM: dts: renesas: lager: Use inclusive wording
      ARM: dts: renesas: r9a06g032-rzn1d400: Don't enable gpiochips which are always on
      ARM: dts: renesas: r9a06g032: Don't set status to the default value
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable GPIOs on CN12

 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts    |   2 +
 .../boot/dts/renesas/r8a7740-armadillo800eva.dts   |   2 +
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts     |   2 +
 arch/arm/boot/dts/renesas/r8a7743.dtsi             |   6 +-
 arch/arm/boot/dts/renesas/r8a7744.dtsi             |   6 +-
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts     |   2 +
 arch/arm/boot/dts/renesas/r8a7745.dtsi             |   6 +-
 arch/arm/boot/dts/renesas/r8a77470.dtsi            |   6 +-
 arch/arm/boot/dts/renesas/r8a7790-lager.dts        |  28 +-
 arch/arm/boot/dts/renesas/r8a7790-stout.dts        |   4 +-
 arch/arm/boot/dts/renesas/r8a7790.dtsi             |   4 +-
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      |   2 +
 arch/arm/boot/dts/renesas/r8a7791-porter.dts       |   2 +
 arch/arm/boot/dts/renesas/r8a7791.dtsi             |   4 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |   4 +-
 arch/arm/boot/dts/renesas/r8a7793-gose.dts         |   2 +
 arch/arm/boot/dts/renesas/r8a7793.dtsi             |   4 +-
 arch/arm/boot/dts/renesas/r8a7794-alt.dts          |   2 +
 arch/arm/boot/dts/renesas/r8a7794-silk.dts         |   2 +
 arch/arm/boot/dts/renesas/r8a7794.dtsi             |   4 +-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |   1 -
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts |  14 +-
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   2 -
 arch/arm64/boot/dts/renesas/Makefile               |   9 +
 .../dts/renesas/aistarvision-mipi-adapter-2.1.dtsi |   2 +-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |   6 +-
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |  12 +-
 arch/arm64/boot/dts/renesas/cat875.dtsi            |   2 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             |   2 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   6 +-
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi  |   8 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   4 +-
 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi       |   8 +-
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |   4 +-
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |   6 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  14 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  12 +-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |   4 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  12 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  14 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  14 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  14 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  14 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  12 +-
 .../renesas/r8a77970-eagle-function-expansion.dtso |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  10 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   6 +-
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |   2 +-
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   4 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   2 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |   2 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  36 ++-
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts      |   2 +-
 .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts |  94 +++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  69 ++++-
 .../renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso |   1 -
 .../r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso        | 135 ++++++++++
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |  19 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  26 +-
 arch/arm64/boot/dts/renesas/r8a779md-geist.dts     |  12 +-
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          | 300 +++++++++++++++++++--
 .../arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts |   2 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |   5 +-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 265 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |   4 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  27 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |   2 +-
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   6 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  65 ++++-
 .../dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso    |  53 ++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  18 +-
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  65 ++++-
 .../dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso    |  63 +++++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  32 ++-
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  13 +-
 .../boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  |  16 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  20 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |   2 +-
 .../boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  16 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |  20 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |   2 +-
 .../boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi |  16 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |  20 +-
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |  14 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |  25 +-
 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h |   4 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |   1 -
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |   7 +
 .../boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi |  72 +++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  14 +-
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi       |   2 +-
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi       |  18 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |   2 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   8 +-
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |   6 +-
 103 files changed, 1577 insertions(+), 358 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi
