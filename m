Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:28316 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727329AbeIQOKn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 10:10:43 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/2] Add APMU support to r8a77470
Date: Mon, 17 Sep 2018 09:44:08 +0100
Message-Id: <1537173850-5310-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

this series adds APMU support to the RZ/G1C (a.k.a. r8a77470).

Thanks,
Fab

Fabrizio Castro (2):
  dt-bindings: apmu: Document r8a77470 support
  ARM: dts: r8a77470: Add APMU node and second CPU core

 Documentation/devicetree/bindings/power/renesas,apmu.txt |  1 +
 arch/arm/boot/dts/r8a77470.dtsi                          | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

-- 
2.7.4
