Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:40589 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S935512AbdGTSWQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2017 14:22:16 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/4] dts: rskrza1: Add pin configurations
Date: Thu, 20 Jul 2017 13:20:15 -0500
Message-Id: <20170720182019.85075-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now that the RZ/A1 pin control driver has appeared in 4.13-rc1, it
is safe to now add pin configurations for RZ/A1 boards.


Chris Brandt (4):
  arm: dts: rskrza1: Add SCIF2 pin group
  arm: dts: rskrza1: Add Ethernet pin group
  arm: dts: rskrza1: Add SDHI1 pin group
  arm: dts: rskrza1: Add LED0 pin support

 arch/arm/boot/dts/r7s72100-rskrza1.dts | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

-- 
2.13.0
