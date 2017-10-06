Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:52554 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752292AbdJFSAA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 14:00:00 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 0/2] ARM: dts: iwg20d-q7: New DT architecture
Date: Fri,  6 Oct 2017 18:59:51 +0100
Message-Id: <1507312793-6877-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <CAMuHMdW-Y7tK28YAGBRMqdgZK7vVqnUcud1FtzQd6wLrKii_AA@mail.gmail.com>
References: <CAMuHMdW-Y7tK28YAGBRMqdgZK7vVqnUcud1FtzQd6wLrKii_AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some of the serial interfaces are exposed on the camera daughter board.
The camera daughter board can be connected to the carrier board
by means of expansion connectors 1, 2 and 3. The carrier board may host
an RZ/G1M or an RZ/G1N based SoM.
While adding support for the serial interfaces on the camera daughter
board we faced the dilemma of how to properly describe all of the
possible HW configurations and how to maximize code reuse.
The best option would be to use device tree overlays, however there is
still some work to be done on that front before actually using them,
therefore for the time being we decided to provide .dtsi files to
describe the carrier board and the camera daughter board, and provide
.dts files to describe the HW configurations we need to support.

Best regards,

Fabrizio Castro (2):
  ARM: dts: iwg20d-q7: Rework DT architecture
  ARM: dts: iwg20d-q7-dbcm-ca: Add device trees for camera DB

 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/iwg20d-q7-common.dtsi         | 147 ++++++++++++++++++++++++
 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi        |  43 +++++++
 arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts |  19 +++
 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts         | 139 +---------------------
 5 files changed, 212 insertions(+), 137 deletions(-)
 create mode 100644 arch/arm/boot/dts/iwg20d-q7-common.dtsi
 create mode 100644 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts

-- 
2.7.4
