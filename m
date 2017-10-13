Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:62399 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1758637AbdJMPvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 11:51:23 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/4] Add USB function support
Date: Fri, 13 Oct 2017 16:50:39 +0100
Message-Id: <1507909843-52034-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This series aims to add USB function support for iWave RZ/G1E (R8A7745) board.
This series has been tested against renesas-dev tag 20171013-v4.14-rc4.

The patch "ARM: dts: iwg22d-sodimm: Enable HS-USB" depend upon
the below patch

* [4/4] ARM: dts: iwg22d-sodimm: sort dt nodes
https://patchwork.kernel.org/patch/10004691/

This patch has documentation dependency on below patches

* [v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
https://patchwork.kernel.org/patch/9990063/
* [v2] dmaengine: usb-dmac: Add compatible string for r8a7743/5
https://patchwork.kernel.org/patch/9990113/

Regards,

Biju Das (4):
  ARM: dts: r8a7745: Add HS-USB device node
  ARM: dts: r8a7745: Add USB-DMAC device nodes
  ARM: dts: r8a7745: Enable DMA for HSUSB
  ARM: dts: iwg22d-sodimm: Enable HS-USB

 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 11 +++++++
 arch/arm/boot/dts/r8a7745.dtsi              | 45 +++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

-- 
1.9.1
