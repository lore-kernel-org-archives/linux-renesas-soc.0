Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53264 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965827AbeEYLFw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 07:05:52 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] arm: dts: salvator-x(s): increase I2C ch4 bus speed
Date: Fri, 25 May 2018 13:05:40 +0200
Message-Id: <20180525110542.10620-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Patches taken from the BSP. I did some testing by accessing the chips manually.
I also checked the datasheets of the attached I2C clients which confirm this
step up.

Takeshi Kihara (2):
  arm64: dts: salvator-x: Update I2C ch4 clock to 400kHz
  arm64: dts: salvator-xs: Update I2C ch4 clock to 400kHz

 arch/arm64/boot/dts/renesas/salvator-x.dtsi  | 2 ++
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.11.0
