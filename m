Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:61190 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726546AbeHXOYO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 10:24:14 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/3] Add USB support
Date: Fri, 24 Aug 2018 11:43:46 +0100
Message-Id: <1535107429-5458-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch series aims to add USB2.0/USB3.0 Host/Function support
for RZ/G2M SoC. RZ/G2M SoC is similar to R-Car Gen3 M3-W SoC.

---
This patch series depend on
https://patchwork.kernel.org/patch/10574109/
---

Biju Das (3):
  arm64: dts: renesas: r8a774a1: Add USB2.0 phy and host(EHCI/OHCI)
    device nodes
  arm64: dts: renesas: r8a774a1: Add USB-DMAC and HSUSB device nodes
  arm64: dts: renesas: r8a774a1: Add USB3.0 device nodes

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 153 ++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

-- 
2.7.4
