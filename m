Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55692 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752310AbdKAKgO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 06:36:14 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/7] arm64: dts: renesas: r8a7795: IPMMU upstream integration
Date: Wed,  1 Nov 2017 11:34:51 +0100
Message-Id: <20171101103458.7582-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series adds DT nodes for IPMMU instances on r8a7796 together with
connections to various r8a7796 on-chip devices such as Audio-DMAC, SYS-DMAC,
Ethernet-AVB and a bunch of multimedia devices that make use of FCP.

With these patches applied a white list enabled IPMMU driver may be used
to check silicon revision and then enable IPMMU in the known working cases.

The recommended IPMMU driver patch is iommu/next with the following applied:
 [PATCH v5 00/09] iommu/ipmmu-vmsa: r8a7795 support V5
 [PATCH v4 0/3] iommu/ipmmu-vmsa: r8a7796 support V4

The final patch in the series enable IPMMU support for all IPMMU
instances on r8a7796 that are used by IPMMU devices listed above.

The DT binding for r8a7796 have been acked (as part of the r8a7796 series
noted above) but have not yet been merged.

Based on work by Magnus Damm.

Based on renesas-devel-20171101-v4.14-rc7

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

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 128 +++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

-- 
2.11.0
