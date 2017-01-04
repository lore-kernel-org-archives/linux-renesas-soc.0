Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:44376 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S968681AbdADRkB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 12:40:01 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Date: Wed,  4 Jan 2017 18:39:52 +0100
Message-Id: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Simon,

as Ulf picked up the driver patches for HS200 support, it is now safe to pick
up the DTS patches, I'd say? I rebased them to the dt-for-4.11 branch.

All the best,

   Wolfram


Wolfram Sang (2):
  arm64: dts: r8a7795: enable HS200 for eMMC
  arm64: dts: r8a7796: enable HS200 for eMMC

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 1 +
 2 files changed, 2 insertions(+)

-- 
2.10.2
