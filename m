Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41647 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752619AbdBMP03 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 10:26:29 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL FOR renesas-drivers] arm64: dts: r8a779[56]: EtherAVB Gigabit timing enhancements
Date: Mon, 13 Feb 2017 16:26:19 +0100
Message-Id: <1486999579-24959-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

this series tweaks PHY settings to address communications failures reported
for 1Gbit communication using EtherAVB. Gigabit is supported for R-Car H3
ES1.1+ and M3-W as of commit 0e98f9d5f0b4 ("ravb: Support 1Gbps on R-Car H3
ES1.1+ and R-Car M3-W") which is present in net-next and should be included
in v4.11.

The series is based on renesas-devel-20170130-v4.10-rc6.

This pull request is redundant as the series is included in
renesas-devel-20170207-v4.10-rc7.


The following changes since commit 6879cb193c2bb574d1de8d212d978181edbda44e:

  Merge tag 'v4.10-rc6' into devel (2017-01-30 12:03:00 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/ravb-gigabit-integration

for you to fetch changes up to 8c4e72607a720b5fdb65276983df85a02dfc13d4:

  arm64: dts: r8a7796: salvator-x: Fix EthernetAVB PHY timing (2017-02-01 09:39:31 +0100)

----------------------------------------------------------------
Kazuya Mizuguchi (4):
      arm64: dts: r8a7795: Use rgmii-txid phy-mode for EthernetAVB
      arm64: dts: r8a7795: salvator-x: Fix EthernetAVB PHY timing
      arm64: dts: r8a7796: Use rgmii-txid phy-mode for EthernetAVB
      arm64: dts: r8a7796: salvator-x: Fix EthernetAVB PHY timing

Vladimir Barinov (1):
      arm64: dts: h3ulcb: Fix EthernetAVB PHY timing

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 13 +------------
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 13 +------------
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  2 +-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 13 +------------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  2 +-
 5 files changed, 5 insertions(+), 38 deletions(-)
