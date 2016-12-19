Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:33121 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762033AbcLSC01 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Dec 2016 21:26:27 -0500
Received: by mail-pg0-f65.google.com with SMTP id g1so4973791pgn.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Dec 2016 18:26:27 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Mon, 19 Dec 2016 11:19:32 +0900
Message-Id: <148211397261.8020.4659661835061990009.sendpatchset@little-apple>
Subject: [PATCH v2 00/02] arm64: dts: r8a7795: IPMMU upstream integration V2
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

arm64: dts: r8a7795: IPMMU upstream integration V2

[PATCH v2 01/02] arm64: dts: r8a7795: Add IPMMU device nodes
[PATCH v2 02/02] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU

This series adds DT nodes for IPMMU devices on r8a7795 together
with connections to the DMAC hardware. Currently all the IPMMU
devices remain disabled, but once next hardware iteration of
r8a7795 becomes available (with errata fixes) we can start
enabling the IPMMU devices.

The DT binding for r8a7795 has since long been included in mainline
and this series implements support following such format:

d4e42e7 iommu/ipmmu-vmsa: Add r8a7795 DT binding

The second patch in this series that ties the IPMMU to DMAC devices
has been blocked on DMA Engine framework changes, and in v4.10-rc
the last two patches are in:

60c4e80 arm64: Wire up iommu_dma_{map, unmap}_resource()
51f8cc9 iommu/dma: Implement dma_{map,unmap}_resource()

Compared to the earlier V1 series the last two patches have been
dropped due to lacking software support.

I hope these patches now can be queued up for upstream merge,
ideally aiming at v4.11-rc.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20161212-v4.9

 No special run time or compile time dependencies.

 Earlier posted as
 [PATCH 00/04] arm64: dts: r8a7795: Initial IPMMU upstream integration

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |  153 ++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)
