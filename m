Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41819 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbeJORoH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 13:44:07 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 0/4] arm64: renesas: ebisu: Enable Audio
Date: Mon, 15 Oct 2018 11:59:20 +0200
Message-Id: <20181015095924.25794-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This series describes R-Car audio for the R-Car E3 (r8a77990) and
enables it on the Ebisu board which uses that SoC. It also enables the
scu-simple-card driver in the relevant defconfigs, a dependency for
enabling audio on the Ebisu board.

Other dependencies. It is safe to apply this series without them present:
* "[PATCH 0/2] sh-pfc: r8a77990: Add Audio clock and SSI pins, groups and functions"
  Required for audio be initialised at boot.

* "[PATCH] iommu/ipmmu-vmsa: Hook up r8a77990 DT matching code"
  Required for Audio DMA. Without this patch present audio will
  fall back to using PIO. Alternatively, the iommus properties
  may be removed from audma0, which is added to DT of
  patch 3 of this series.

Based on renesas-devel-20181012-v4.19-rc7

Simon Horman (2):
  arm64: defconfig: Enable scu-simple-card driver
  arm64: renesas_defconfig: Enable scu-simple-card driver

Takeshi Kihara (1):
  arm64: dts: renesas: ebisu: Enable Audio

Yoshihiro Kaneko (1):
  arm64: dts: renesas: r8a77990: Add Audio-DMAC and Sound device nodes

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 127 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 271 +++++++++++++++++++++++++
 arch/arm64/configs/defconfig                   |   1 +
 arch/arm64/configs/renesas_defconfig           |   1 +
 4 files changed, 400 insertions(+)

-- 
2.11.0
