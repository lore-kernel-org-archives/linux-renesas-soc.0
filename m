Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:50532 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728326AbeKAViC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 17:38:02 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Richard Weinberger <richard@nod.at>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/4] Add QSPI flash support to iwg23s
Date: Thu,  1 Nov 2018 12:35:01 +0000
Message-Id: <1541075705-1333-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

this series includes all that is necessary to add QSPI flash
support to the iwg23s board powered by the RZ/G1C SoC (a.k.a.
r8a77470).

Thanks,
Fab

Fabrizio Castro (4):
  spi: rspi: Add r8a77470 to the compatible list
  mtd: spi-nor: Add support for is25lp016d
  ARM: dts: r8a77470: Add QSPI support
  ARM: dts: iwg23s-sbc: Add QSPI flash support

 Documentation/devicetree/bindings/spi/spi-rspi.txt |  1 +
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          | 26 +++++++++++++++++
 arch/arm/boot/dts/r8a77470.dtsi                    | 34 ++++++++++++++++++++++
 drivers/mtd/spi-nor/spi-nor.c                      |  2 ++
 4 files changed, 63 insertions(+)

-- 
2.7.4
