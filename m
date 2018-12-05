Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:28260 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727309AbeLEVp1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 16:45:27 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 0/2] Add Initial Device Tree for RZ/A2
Date: Wed,  5 Dec 2018 16:44:47 -0500
Message-Id: <20181205214449.52165-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a Device Tree for RZ/A2 and the existing eval board.

Once these get approved, I'll start piling on the other drivers in
another patch series.


NOTE:
Since Rob is in the middle of converting shmobile.txt to renesas.yaml,
I'll wait till that is finisehd before I add this RZ/A2M EVB board.



Chris Brandt (2):
  ARM: dts: r7s9210: Initial SoC device tree
  ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB

 arch/arm/boot/dts/Makefile             |   1 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts |  98 ++++++++++++++++
 arch/arm/boot/dts/r7s9210.dtsi         | 204 +++++++++++++++++++++++++++++++++
 3 files changed, 303 insertions(+)
 create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
 create mode 100644 arch/arm/boot/dts/r7s9210.dtsi

-- 
2.16.1
