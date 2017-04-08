Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53838 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751764AbdDHL2L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Apr 2017 07:28:11 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] arm64: gen3: enable eMMC HS200 in DT
Date: Sat,  8 Apr 2017 13:27:57 +0200
Message-Id: <20170408112759.26724-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Simon,

the driver patches for HS200 support are now upstream. So, based on the earlier
discussion [1] it should be now safe to pick up the DTS patches. I rebased them
to the arm64-dt-for-v4.12 branch.

Thanks,

   Wolfram

[1] http://www.spinics.net/lists/linux-renesas-soc/msg11230.html

Wolfram Sang (2):
  arm64: dts: r8a7795: enable HS200 for eMMC
  arm64: dts: r8a7796: enable HS200 for eMMC

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 1 +
 2 files changed, 2 insertions(+)

-- 
2.11.0
