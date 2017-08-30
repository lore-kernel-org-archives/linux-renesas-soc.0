Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:30280 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751541AbdH3N62 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 09:58:28 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/5] Add USB2.0 Host support
Date: Wed, 30 Aug 2017 14:41:08 +0100
Message-Id: <1504100473-5528-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This series aims to add USB2.0 Host support on iWave RZ/G1M(r8a7743)
based board.

This series has been tested against renesas-dev tag 20170830-v4.13-rc7

This patch has documentation dependency on below patches
 * PCI: rcar: Add r8a7743/5 support
https://patchwork.kernel.org/patch/9919697/
 * phy: rcar-gen2: Add r8a7743/5 support
https://patchwork.kernel.org/patch/9919727/

Biju Das (5):
  ARM: dts: r8a7743: Add internal PCI bridge nodes
  ARM: dts: r8a7743: Add USB PHY DT support
  ARM: dts: r8a7743: Link PCI USB devices to USB PHY
  ARM: dts: iwg20d-q7: Enable internal PCI
  ARM: dts: iwg20d-q7: Enable USB PHY

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 26 ++++++++++
 arch/arm/boot/dts/r8a7743.dtsi          | 92 +++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

-- 
1.9.1
