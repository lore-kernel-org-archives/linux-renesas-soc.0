Return-Path: <SRS0+uua1=PN=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,joro@8bytes.org,geert+renesas@glider.be
Date: Fri, 18 Mar 2016 01:55:27 +0900
Message-Id: <20160317165527.28213.60694.sendpatchset@little-apple>
Subject: [PATCH/RFC 00/05] arm64: dts: r8a7795: salvator-x: IPMMU test code V2
List-ID: <linux-renesas-soc.vger.kernel.org>

arm64: dts: r8a7795: salvator-x: IPMMU test code V2

[PATCH/RFC 01/05] arm64: dts: r8a7795: Add IPMMU device nodes
[PATCH/RFC 02/05] arm64: dts: r8a7795: Enable IPMMU-MM
[PATCH/RFC 03/05] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU
[PATCH/RFC 04/05] arm64: dts: r8a7795: Enable IPMMU-DS0
[PATCH/RFC 05/05] arm64: dts: salvator-x: External SCIF3/HSCIF3 loop

Hook up r8a7795 IPMMU to SYS-DMAC and also tie in the external
SCIF3/HSCIF3 loop back adapter via DT. Previous version posted as:

[PATCH/RFC 00/03] ARM: shmobile: r8a7795 Salvator-X IPMMU test code

The DT binding for r8a7795 has been accepted for upstream merge
and this series implements support following such format:

d4e42e7 iommu/ipmmu-vmsa: Add r8a7795 DT binding

Even though the DT binding has been accepted I prefer to hold off
for a bit longer before merging patch 1-4 upstream.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of next-20160315 and:
 
 [PATCH v2 00/04] iommu/ipmmu-vmsa: IPMMU multi-arch update V2
 [PATCH 00/04] iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
 [PATCH 00/10] iommu/ipmmu-vmsa: Initial r8a7795 support

 No special run time or compile time dependencies apart from
 IPMMU DT binding change in the driver that can be merged
 independently from this series.

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |   26 +++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  155 +++++++++++++++++++-
 2 files changed, 179 insertions(+), 2 deletions(-)
