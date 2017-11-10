Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56232 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752619AbdKJN0R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 08:26:17 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/7] arm64: dts: renesas: r8a7796: IPMMU upstream integration
Date: Fri, 10 Nov 2017 14:26:05 +0100
Message-Id: <20171110132612.1589-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series adds DT nodes for IPMMU instances on r8a7796 together with
connections to various r8a7796 on-chip devices such as Audio-DMAC, SYS-DMAC,
Ethernet-AVB and a bunch of multimedia devices that make use of FCP.

With these patches applied a white list enabled IPMMU driver may be used
to check silicon revision and then enable IPMMU in the known working cases.

The recommended test stack for this patchset is a merge of
* The iommu/next branch of the vfio tree
* renesas-devel-20171110-v4.14-rc8 tag of the renesas tree

With the following applied:
 [PATCH v4 0/3] iommu/ipmmu-vmsa: r8a7796 support V4

The final patch in the series enable IPMMU support for all IPMMU
instances on r8a7796 that are used by IPMMU devices listed above.

The DT binding for r8a7796 have been acked (as part of the r8a7796 series
noted above) but have not yet been merged.

Changes since V1:
* Drop mostly redundant comments from nodes
* Add power domains

Based on work by Magnus Damm.

Based on renesas-devel-20171110-v4.14-rc8

Magnus Damm (3):
  arm64: dts: renesas: r8a7796: Add IPMMU device nodes
  arm64: dts: renesas: r8a7796: Tie SYS-DMAC to IPMMU-DS0/1
  arm64: dts: renesas: r8a7796: Enable IPMMU-DS0, DS1, MP, VI0, VC0 and
    MM

Simon Horman (4):
  arm64: dts: renesas: r8a7796: Tie Audio-DMAC to IPMMU-MP
  arm64: dts: renesas: r8a7796: Point FDP1 via FCPF to IPMMU-VI0
  arm64: dts: renesas: r8a7796: Point VSPI via FCPVI to IPMMU-VC0
  arm64: dts: renesas: r8a7796: Connect Ethernet-AVB to IPMMU-DS0

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 138 +++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

-- 
2.11.0
