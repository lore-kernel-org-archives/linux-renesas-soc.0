Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40262 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751466AbdKNJAR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2017 04:00:17 -0500
Date: Tue, 14 Nov 2017 09:59:58 +0100
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] arm64: dts: renesas: r8a7796: IPMMU
 upstream integration
Message-ID: <20171114085952.ozmodvs2ssdfg7xq@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling this series which adds IPMMU support to the
DT for the r8a7796 (R-Car M3-W) SoC.

This is v5 of these changes.

They are based on renesas-devel-20171110-v4.14-rc8


The following changes since commit ce17f313172b05ca21422a9b2c335808eef883cc:

  Merge branches 'arm64-dt-for-v4.16', 'dt-for-v4.16' and 'soc-for-v4.16' into devel (2017-11-10 10:32:03 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/ipmmu-dt-r8a7796-v2

for you to fetch changes up to 4ae67c1bae2394c1504c262225fd00ea4302c5c6:

  arm64: dts: renesas: r8a7796: Enable IPMMU-DS0, DS1, MP, VI0, VC0 and MM (2017-11-10 12:38:18 +0100)

----------------------------------------------------------------
Magnus Damm (3):
      arm64: dts: renesas: r8a7796: Add IPMMU device nodes
      arm64: dts: renesas: r8a7796: Tie SYS-DMAC to IPMMU-DS0/1
      arm64: dts: renesas: r8a7796: Enable IPMMU-DS0, DS1, MP, VI0, VC0 and MM

Simon Horman (4):
      arm64: dts: renesas: r8a7796: Tie Audio-DMAC to IPMMU-MP
      arm64: dts: renesas: r8a7796: Point FDP1 via FCPF to IPMMU-VI0
      arm64: dts: renesas: r8a7796: Point VSPI via FCPVI to IPMMU-VC0
      arm64: dts: renesas: r8a7796: Connect Ethernet-AVB to IPMMU-DS0

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 138 +++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)
