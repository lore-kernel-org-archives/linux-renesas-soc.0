Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:28660 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728927AbeHWMdz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 08:33:55 -0400
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
Subject: [PATCH 0/5] Add SYS-DMAC/INTC-EX/[H]SCIF/EAVB/RWDT support
Date: Thu, 23 Aug 2018 09:58:46 +0100
Message-Id: <1535014731-64472-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch series aims to add support for SYS-DMAC/INTC-EX/SCIF/HSCIF/
EAVB/RWDT on RZ/G2M SoC dtsi.

THis patch series based on renesas-devel-20180822-v4.18.

Biju Das (3):
  arm64: dts: renesas: r8a774a1: Add SYS-DMAC controller nodes
  arm64: dts: renesas: r8a774a1: Add INTC-EX device node
  arm64: dts: renesas: r8a774a1: Add RWDT node

Fabrizio Castro (2):
  arm64: dts: renesas: r8a774a1: Add SCIF and HSCIF nodes
  arm64: dts: renesas: r8a774a1: Add Ethernet AVB node

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 358 ++++++++++++++++++++++++++++++
 1 file changed, 358 insertions(+)

-- 
2.7.4
