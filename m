Return-Path: <devicetree-owner@vger.kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/4] ARM: dts: iwg22d: DT architecture rework and UART
Date: Fri, 13 Oct 2017 14:03:12 +0100
Message-Id: <1507899796-7941-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

iWave's iW-RainboW-G22D SODIMM SOM Development Platform exposes three
serial interfaces on the HDMI daughter board, adding support for them
has triggered the creation of an additional device tree, file
r8a7745-iwg22d-sodimm-dbhd-ca.dts. Since the RZ/G1E based SoM is the
only RZ/G1 based module that can be put on the carrier board, there is
no need to make the new DT architecture that describes the configuration
with the daughter board on highly modular, as it can't be reused by SoM
with chip from manufacturers other than Renesas. Therefore, file
r8a7745-iwg22d-sodimm-dbhd-ca.dts includes file r8a7745-iwg22d-sodimm.dts
straight away. The user will take advantage of r8a7745-iwg22d-sodimm.dtb
when the daughter board is not connected to the carrier board, and he/she
will use r8a7745-iwg22d-sodimm-dbhd-ca.dtb to boot up the HW configuration
with the HDMI daughter board plugged in.
This series also adds support for hscif1 exposed on the carrier board, and
takes into account comments made on the similar rework of the DT
architecture for iWave's iW-RainboW-G22D SODIMM SOM Development Platform:
https://www.spinics.net/lists/arm-kernel/msg609681.html
by reordering the nodes in the carrier board DT.

Best regards,

Fabrizio Castro (4):
  ARM: dts: iwg22d: Use /dev/ttySC3 as debug console
  ARM: dts: iwg22d: Add /dev/ttySC5 support
  ARM: dts: iwg22d-sodimm-dbhd-ca: Add device tree for HDMI DB
  ARM: dts: iwg22d-sodimm: sort dt nodes

 arch/arm/boot/dts/Makefile                         |  1 +
 .../arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts | 61 ++++++++++++++++++
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts        | 74 +++++++++++++---------
 3 files changed, 106 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts

-- 
2.7.4

