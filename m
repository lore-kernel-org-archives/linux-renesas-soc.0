Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35889 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753201AbdCTIur (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:50:47 -0400
Received: by mail-pg0-f66.google.com with SMTP id 81so10531596pgh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2017 01:50:02 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Mon, 20 Mar 2017 17:35:18 +0900
Message-Id: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
Subject: [PATCH v3 00/09] arm64: dts: r8a7795: IPMMU upstream integration V3
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

arm64: dts: r8a7795: IPMMU upstream integration V3

[PATCH v3 01/09] arm64: dts: r8a7795: Add IPMMU device nodes
[PATCH v3 02/09] arm64: dts: r8a7795: Tie Audio/SYS-DMAC to IPMMU-DS0/1 and MP1
[PATCH v3 03/09] arm64: dts: r8a7795: Point DU/VSPD via FCPVD to IPMMU-VI
[PATCH v3 04/09] arm64: dts: r8a7795: Point FDP1 via FCPF to IPMMU-VP
[PATCH v3 05/09] arm64: dts: r8a7795: Point VSPBC/VSPBD via FCPVB to IPMMU-VP
[PATCH v3 06/09] arm64: dts: r8a7795: Point VSPI via FCPVI to IPMMU-VP
[PATCH v3 07/09] arm64: dts: r8a7795: Connect Ethernet-AVB to IPMMU-DS0
[PATCH v3 08/09] arm64: dts: r8a7795: Connect SATA to IPMMU-HC
[PATCH v3 09/09] arm64: dts: r8a7795: Enable IPMMU-VI, VP, MP1, DS0, DS1 and MM

This series adds DT nodes for IPMMU instances on r8a7795 together with
connections to various r8a7795 on-chip devices such as Audio-DMAC, SYS-DMAC,
Ethernet-AVB, SATA and a bunch of multimedia devices that make use of FCP.

With these patches applied a white list enabled IPMMU driver may be used
to check silicon revision and then enable IPMMU in the known working cases.

The recommended IPMMU driver patch stack consists of the following series:
 [PATCH v7 00/07] iommu/ipmmu-vmsa: IPMMU multi-arch update V7
 [PATCH v3 00/09] iommu/ipmmu-vmsa: r8a7795 support V3
 [PATCH v3 0/3] iommu/ipmmu-vmsa: r8a7796 support V3

The final patch in the series enable IPMMU support for all IPMMU instances
on r8a7795 that are used by IPMMU devices listed above with one exception.
The exception is the SATA device connected to IPMMU-HC which still is disabled
pending IPMMU USB integration support. I expect IPMMU USB integration to be
handled as a second step once this series is agreed on.

The DT binding for r8a7795 has since long been included in mainline
and this series implements support following such format:

d4e42e7 iommu/ipmmu-vmsa: Add r8a7795 DT binding

Changes since V2:
 - Added the iommus property before power domains - thanks Geert!
 - Added reviewed-by to patch 2 and 3 from Laurent - thanks!
 - Re-added Ethernet and FCPVD patches (They were present in V1 but not V2)
 - Added remaining FCP devices such as FCPF, FCPVB and FCPVI
 - Added SATA device
 - Added final patch to enable various IPMMU devices in the DTS file

Since the DT binding has been merged quite some time ago and the interface
seems stable enough I see no reason not to queue these up for upstream merge.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20170313-v4.11-rc2

 No special run time or compile time dependencies.

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |  173 ++++++++++++++++++++++++++++--
 1 file changed, 167 insertions(+), 6 deletions(-)
