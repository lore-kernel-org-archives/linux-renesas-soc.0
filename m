Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/2] ARM: dts: r8a7793: add CAN to device tree
Date: Wed, 16 Mar 2016 10:52:54 +0900
Message-Id: <1458093176-1926-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this short series adds CAN clocks and nodes to the r8a7793 device tree.

I am not aware of an r8a7793 board that exposes CAN - the gose
board does not appear to - and thus am unsure of a way to test these changes.
However, they are based on what is present for the r8a7791 SoC and
I am unable to find a difference in the SoC documentation.

This series is similar to a series I posted for the r8a7794
earlier this week.

Based on renesas-devel-20160315-v4.5

Changes in v2
* Correct clock node names
* Add MSTP9 clocks
* Omit clock-output-names property from new nodes
* Use "renesas,rcar-gen2-can" compat string

Simon Horman (2):
  ARM: dts: r8a7793: add CAN clocks to device tree
  ARM: dts: r8a7793: add CAN nodes to device tree

 arch/arm/boot/dts/r8a7793.dtsi | 49 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 4 deletions(-)

-- 
2.1.4
