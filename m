Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:49649 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726672AbeKIClV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 21:41:21 -0500
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
Subject: [PATCH v2 0/3] Add QSPI flash support to iwg23s
Date: Thu,  8 Nov 2018 17:04:40 +0000
Message-Id: <1541696684-21235-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

this series includes all that is necessary to add QSPI flash
support to the iwg23s board powered by the RZ/G1C SoC (a.k.a.
r8a77470). The second version of this series is to address
a comment made by both Simon and Geert on one of the patches.

This series applies on top of renesas-devel-20181108v3-v4.20-rc1

Thanks,
Fab

Fabrizio Castro (3):
  mtd: spi-nor: Add support for is25lp016d
  ARM: dts: r8a77470: Add QSPI support
  ARM: dts: iwg23s-sbc: Add QSPI flash support

 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 26 +++++++++++++++++++++++++
 arch/arm/boot/dts/r8a77470.dtsi           | 32 +++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/spi-nor.c             |  2 ++
 3 files changed, 60 insertions(+)

-- 
2.7.4
