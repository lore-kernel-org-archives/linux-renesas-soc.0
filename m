Return-Path: <SRS0+93W/=OP=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,geert+renesas@glider.be
Date: Tue, 16 Feb 2016 11:26:35 +0900
Message-Id: <20160216022635.12147.46525.sendpatchset@little-apple>
Subject: [PATCH 00/02] arm64: r8a7795 INTC-EX support using RENESAS_IRQC
List-ID: <linux-renesas-soc.vger.kernel.org>

arm64: r8a7795 INTC-EX support using RENESAS_IRQC

[PATCH 01/02] arm64: dts: r8a7795: Add INTC-EX device node
[PATCH 02/02] arm64: renesas: Enable RENESAS_IRQC

These two patches add the INTC-EX device node to the r8a7795 DTSI
file and selects RENESAS_IRQC to enable the irqchip driver. Those
two together allow r8a7795 based platforms to use external interrupt
pins IRQ0 -> IRQ5.

The patches in this series can be merged independently in any order,
but for complete run time support the following two patches are also
required:

[PATCH] pinctrl: sh-pfc: r8a7795: Add support for INTC-EX IRQ pins
[PATCH] clk: shmobile: r8a7795: Add INTC-EX clock

The DT compat string "renesas,intc-ex-r8a7795" is already included in
Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt

Tested on r8a7795 Salvator-X by toggling IRQ2 using an external GPIO
connected via a loop back adapter on EXIO_D.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2016-02-09-v4.5-rc3

 arch/arm64/Kconfig.platforms             |    1 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   15 +++++++++++++++
 2 files changed, 16 insertions(+)
