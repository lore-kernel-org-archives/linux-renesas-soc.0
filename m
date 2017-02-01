Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59919 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751535AbdBAImO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 03:42:14 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 0/5] arm64: dts: r8a779[56]: EtherAVB Gigabit timing enhancements
Date: Wed,  1 Feb 2017 09:41:59 +0100
Message-Id: <1485938524-9322-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this series tweaks PHY settings to address communications failures reported
for 1Gbit communication using EtherAVB. Gigabit is supported for R-Car H3
ES1.1+ and M3-W as of commit 0e98f9d5f0b4 ("ravb: Support 1Gbps on R-Car H3
ES1.1+ and R-Car M3-W") which is present in net-next and should be included
in v4.11.

This series is based on renesas-devel-20170130-v4.10-rc6

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

-- 
2.7.0.rc3.207.g0ac5344
