Return-Path: <devicetree-owner@vger.kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/9] Add more support for r8a774a1
Date: Thu, 23 Aug 2018 14:42:59 +0100
Message-Id: <1535031788-19907-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

This series adds SDHI, I2C, IIC, Thermal, IPMMU, MSIOF, A53, PWM,
Audio and FCP support to the r8a774a1 SoC dtsi.

There is a dependency with:
https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg30528.html

Thanks,
Fab

Biju Das (5):
  arm64: dts: renesas: r8a774a1: Add I2C and IIC-DVFS support
  arm64: dts: renesas: r8a774a1: Add RZ/G2M thermal support
  arm64: dts: renesas: r8a774a1: Add all MSIOF nodes
  arm64: dts: renesas: r8a774a1: Add Cortex-A53 CPU cores
  arm64: dts: renesas: r8a774a1: Add audio support

Fabrizio Castro (4):
  arm64: dts: renesas: r8a774a1: Add SDHI nodes
  arm64: dts: renesas: r8a774a1: Add IPMMU device nodes
  arm64: dts: renesas: r8a774a1: Add PWM device nodes
  arm64: dts: renesas: r8a774a1: Add FCPF and FCPV instances

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 848 +++++++++++++++++++++++++++++-
 1 file changed, 843 insertions(+), 5 deletions(-)

-- 
2.7.4
