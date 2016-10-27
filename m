Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33032 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935270AbcJ0OqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 10:46:01 -0400
Received: by mail-pf0-f193.google.com with SMTP id i85so2857524pfa.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 07:45:48 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Thu, 27 Oct 2016 19:28:56 +0900
Message-Id: <20161027102856.26426.48132.sendpatchset@little-apple>
Subject: [PATCH 00/04] arm64: dts: r8a7795: Initial IPMMU upstream integration
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

arm64: dts: r8a7795: Initial IPMMU upstream integration

[PATCH 01/04] arm64: dts: r8a7795: Add IPMMU device nodes
[PATCH 02/04] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU
[PATCH 03/04] arm64: dts: r8a7795: Point FCP devices to IPMMU
[PATCH 04/04] arm64: dts: r8a7795: Connect Ethernet AVB to IPMMU

This series adds DT nodes for IPMMU devices on r8a7795 together
with connections to various other on-chip devices. Currently
all the IPMMU devices remain disabled, but once next hardware
iteration of r8a7795 becomes available (with errata fixes) and
various driver-level changes end up in mainline can start
enabling the IPMMU devices.

The DT binding for r8a7795 has since long been included in mainline
and this series implements support following such format:

d4e42e7 iommu/ipmmu-vmsa: Add r8a7795 DT binding

I hope these patches now can be queued up for upstream merge,
ideally aiming at v4.10-rc.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20161024-v4.9-rc2

 No special run time or compile time dependencies.

 The first two patches earlier posted as
 [PATCH/RFC 00/05] arm64: dts: r8a7795: salvator-x: IPMMU test code V2

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |  158 ++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)
