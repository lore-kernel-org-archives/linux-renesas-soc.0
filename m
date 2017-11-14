Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40276 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753376AbdKNJAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2017 04:00:34 -0500
Date: Tue, 14 Nov 2017 10:00:14 +0100
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] arm64: dts: renesas: r8a7795: IPMMU
 upstream integration
Message-ID: <20171114090013.dqlmb56ib2tvqbyx@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling this series which adds IPMMU support to the
DT for the r8a7795 (R-Car H3) SoC.

This is v5 of these changes.

They are based on renesas-devel-20171110-v4.14-rc8


The following changes since commit ce17f313172b05ca21422a9b2c335808eef883cc:

  Merge branches 'arm64-dt-for-v4.16', 'dt-for-v4.16' and 'soc-for-v4.16' into devel (2017-11-10 10:32:03 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/ipmmu-dt-r8a7795-v5

for you to fetch changes up to 1589f342427ddd9cd4d0d11171c74ab9a1b31530:

  arm64: dts: renesas: r8a7795-es1: Enable IPMMU-MP1 (2017-11-10 12:29:29 +0100)

----------------------------------------------------------------
Magnus Damm (15):
      arm64: dts: renesas: r8a7795: Add IPMMU device nodes
      arm64: dts: renesas: r8a7795-es1: Add IPMMU device nodes
      arm64: dts: renesas: r8a7795: Tie SYS-DMAC to IPMMU-DS0/1
      arm64: dts: renesas: r8a7795: Tie Audio-DMAC to IPMMU-MP0/1
      arm64: dts: renesas: r8a7795: Point DU/VSPD via FCPVD to IPMMU-VI0/1
      arm64: dts: renesas: r8a7795-es1: Point DU/VSPD via FCPVD to IPMMU-VI0
      arm64: dts: renesas: r8a7795: Point FDP1 via FCPF to IPMMU-VP0/1
      arm64: dts: renesas: r8a7795-es1: Point FDP1 via FCPF to IPMMU-VP0
      arm64: dts: renesas: r8a7795: Point VSPBC/VSPBD via FCPVB to IPMMU-VP0/1
      arm64: dts: renesas: r8a7795: Point VSPI via FCPVI to IPMMU-VP0/1
      arm64: dts: renesas: r8a7795-es1: Point VSPI via FCPVI to IPMMU-VP
      arm64: dts: renesas: r8a7795: Connect Ethernet-AVB to IPMMU-DS0
      arm64: dts: renesas: r8a7795: Connect SATA to IPMMU-HC
      arm64: dts: renesas: r8a7795: Enable IPMMU-VI0, VP1, DS0, DS1 and MM
      arm64: dts: renesas: r8a7795-es1: Enable IPMMU-MP1

 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |  81 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 191 +++++++++++++++++++++++++++
 2 files changed, 272 insertions(+)
