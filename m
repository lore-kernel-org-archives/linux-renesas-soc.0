Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34783 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753702AbdC1JiJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 05:38:09 -0400
Received: by mail-pg0-f67.google.com with SMTP id o123so17223593pga.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Mar 2017 02:37:55 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Tue, 28 Mar 2017 18:32:33 +0900
Message-Id: <149069355375.22662.10367253365715059744.sendpatchset@little-apple>
Subject: [PATCH 00/03] arm64: dts: r8a7795: IPMMU upstream USB integration
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

arm64: dts: r8a7795: IPMMU upstream USB integration

[PATCH 01/03] arm64: dts: r8a7795: Connect USB-DMAC0/1 to IPMMU-HC
[PATCH 02/03] arm64: dts: r8a7795: Connect USB3 Host to IPMMU-HC
[PATCH 03/03] arm64: dts: r8a7795: Tie USB2 and USB1 Host to IPMMU-HC

This series adds IPMMU connections of on-chip r8a7795 USB devices such as:
 - USB2.0 Peripheral USB-DMAC Controllers
 - USB3.0 Host Controllers (XHCI)
 - USB2.0 and USB1.0 Host Controllers (EHCI, OHCI)

The modifications are based on the R-Car-Gen3-rev0.52E.pdf data sheet.

The recommended IPMMU driver patch stack consists of the following series:
 [PATCH v7 00/07] iommu/ipmmu-vmsa: IPMMU multi-arch update V7
 [PATCH v3 00/09] iommu/ipmmu-vmsa: r8a7795 support V3
 [PATCH v3 0/3] iommu/ipmmu-vmsa: r8a7796 support V3

Untested at this point, needs testing and driver white list enablement.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2017-03-21-v4.11-rc3 that includes:
 [PATCH v3 00/09] arm64: dts: r8a7795: IPMMU upstream integration V3

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)
