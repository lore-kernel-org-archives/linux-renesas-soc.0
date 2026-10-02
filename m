Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1E468C1A;
	Fri,  2 Oct 2026 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940541; cv=none; b=aO6JReVu6ZwHGetesLRv3pCmavr9uG1gXGtJhHkWYxTWHmNMNuhTAPa+PxCcbkqnOSZRcMV5nzAQn2CY10UbYPBjJo3GOPeW8ws3fVi9TYT3/zdK7swmB9cmXnERL96x3A7G9nl1ohK3VVElL4sFkRsjpXB2mZ89IeQWkT+w8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940541; c=relaxed/simple;
	bh=zdenfoRb2D0ai0YJahFZ4Y7aiO0/hzaDiFgJBhc+Qe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l45qZUxAQ6iUejIDaJm11mCDWBggWk7waYCY3VvZ1pqA3LEpEHbuVohL+PaAzYny258GG++ma5LRkUuRgjqnctENpeqMWma8ueWZmPEft+nKyfxjOAlJ/Yp58b74VmyQjB9sPTJ8JMqrhhUt6aJ7LS3kSIjgPWzBANOBHk7TKtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E321F00898;
	Fri,  2 Oct 2026 11:28:58 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v7.4 (take two)
Date: Fri,  2 Oct 2026 13:28:40 +0200
Message-ID: <cover.1790939715.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790939711.git.geert+renesas@glider.be>
References: <cover.1790939711.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b43aa6a6ebe8ca8bdd75ee688e1eb2d0d16a888e:

  arm64: dts: renesas: r8a779f0: Add GICv3 ITS and update PCIe nodes (2026-09-15 10:46:16 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.4-tag2

for you to fetch changes up to d99e991749f3b12a3a8b23224725dbc1ca15f6bf:

  arm64: dts: renesas: Add support for solidrun rzg2ul som on hb-ripple (2026-10-02 11:59:02 +0200)

----------------------------------------------------------------
Renesas DTS updates for v7.4 (take two)

  - Add PCIe support for the RZ/G3L SoC,
  - Add ADC DMA support for the RZ/T2H and RZ/N2H SoCs,
  - Add initial support for the RZ/G2M v3.0 SoC and the HopeRun HiHope
    RZ/G2M v3.0 board stack,
  - Add USB support for the RZ/G3E SoC and the RZ/G3E SMARC EVK board,
  - Add SPI (MSIOF) and I2C support for the R-Car X5H SoC,
  - Add support for various SolidRun boards based on RZ/G2L, RZ/G2LC,
    RZ/V2L, and RZ/G2UL,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definitions and updates for the
RZ/G2M v3.0 and R-Car X5H SoCs, which are shared by the clock and
pmdomain subsystems and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Anurag Pateriya (1):
      dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index

Ayman Chaudhry (6):
      dt-bindings: power: renesas,rcar-sysc: Document vendor-prefixed header paths
      dt-bindings: power: Add r8a774a3 SYSC power domain definitions
      dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
      arm64: dts: renesas: Add initial SoC DTSI for RZ/G2M v3.0
      arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC main board support
      arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC sub board support

Biju Das (1):
      arm64: dts: renesas: r9a08g046: Add PCIe support

Cosmin Tanislav (2):
      arm64: dts: renesas: r9a09g077: Wire up DMA support for ADC
      arm64: dts: renesas: r9a09g087: Wire up DMA support for ADC

Geert Uytterhoeven (5):
      Merge tag 'renesas-r8a774a3-dt-binding-defs-tag1' into renesas-dts-for-v7.4
      Merge branch 'dt' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm into renesas-dts-for-v7.4
      dt-bindings: clock: renesas,r8a78000-cpg: Add MSIOF clocks
      Merge tag 'renesas-r8a78000-dt-binding-defs-tag3' into renesas-dts-for-v7.4
      arm64: dts: renesas: r8a78000: Add MSIOF nodes

Hardeep Sharma (1):
      dt-bindings: power: rpmpd: Document Kuno RPMh power domains

Joshua Yeong (1):
      dt-bindings: power: Add RPMI device power service

Josua Mayer (9):
      dt-bindings: soc: renesas: Add various SolidRun RZ/G2 based boards
      arm64: dts: renesas: Add support for solidrun rzg2l som and hb-iiot evb
      arm64: dts: renesas: Add support for solidrun rzv2l som and hb-iiot evb
      arm64: dts: renesas: Add support for solidrun rzg2lc som and hb-iiot evb
      arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: Add dsi panel dt overlay
      arm64: dts: renesas: Add support for solidrun hb-ripple with rzg2l som
      arm64: dts: renesas: Add support for solidrun hb-ripple with rzv2l som
      arm64: dts: renesas: Add support for solidrun hb-ripple with rzg2lc som
      arm64: dts: renesas: Add support for solidrun rzg2ul som on hb-ripple

Lad Prabhakar (2):
      arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
      arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts

Marek Vasut (4):
      arm64: dts: renesas: ironhide: Align inline ECC carveout sizes with bootloader settings
      arm64: dts: renesas: r8a779f0: Add PCIe Application/Local register reset
      arm64: dts: renesas: r8a779g0: Add PCIe Application/Local register reset
      arm64: dts: renesas: r8a779h0: Add PCIe Application/Local register reset

Sreeshankar K (1):
      dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250

Tommaso Merciai (3):
      arm64: dts: renesas: r9a08g046: Add USB2.0 placeholder nodes
      arm64: dts: renesas: r9a09g047: Add USB2.0 support
      arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

Wolfram Sang (1):
      arm64: dts: renesas: r8a78000: Add I2C nodes

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   2 +
 .../bindings/power/renesas,rcar-sysc.yaml          |   7 +-
 .../bindings/power/riscv,rpmi-device-power.yaml    |  65 +++
 .../power/riscv,rpmi-mpxy-device-power.yaml        |  65 +++
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  37 ++
 arch/arm64/boot/dts/renesas/Makefile               |  76 ++-
 .../boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts  |  14 +
 .../boot/dts/renesas/r8a774a3-hihope-rzg2m.dts     |  49 ++
 arch/arm64/boot/dts/renesas/r8a774a3.dtsi          | 302 +++++++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  16 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  16 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |   8 +-
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts  |  12 +-
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          | 216 ++++++++
 .../renesas/r9a07g043u12-hummingboard-ripple.dts   |  89 ++++
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 .../renesas/r9a07g044c2-hummingboard-ripple.dts    |  93 ++++
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../renesas/r9a07g044l2-hummingboard-ripple.dts    |  18 +
 .../dts/renesas/r9a07g054l2-hummingboard-iiot.dts  |  16 +
 .../renesas/r9a07g054l2-hummingboard-ripple.dts    |  18 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  70 ++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  36 ++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 124 +++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  31 ++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  24 +-
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  24 +-
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  25 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 560 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  79 +++
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 .../renesas/rzg2l-hummingboard-pulse-common.dtsi   | 116 +++++
 .../rzg2l-hummingboard-pulse-micro-hdmi.dtsi       |  79 +++
 .../dts/renesas/rzg2l-hummingboard-ripple.dtsi     | 122 +++++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 473 +++++++++++++++++
 .../renesas/rzg2lc-hummingboard-pulse-leds.dtso    |  48 ++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 436 ++++++++++++++++
 .../renesas/rzg2ul-hummingboard-pulse-leds.dtso    |  48 ++
 arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi     | 418 +++++++++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |  11 +
 .../dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h  |  59 +++
 include/dt-bindings/clock/renesas,r8a78000-cpg.h   |   2 +
 include/dt-bindings/power/qcom,rpmhpd.h            |   1 +
 include/dt-bindings/power/renesas,r8a774a3-sysc.h  |  30 ++
 48 files changed, 4069 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
 create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-microsd.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-a.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-b.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-micro-hdmi.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-hummingboard-pulse-leds.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-hummingboard-pulse-leds.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi
 create mode 100644 include/dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/renesas,r8a774a3-sysc.h
