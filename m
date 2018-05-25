Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54560 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S936185AbeEYPFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 11:05:23 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] arm64: dts: renesas: add missing strobe pin to SDHI
Date: Fri, 25 May 2018 17:05:16 +0200
Message-Id: <20180525150518.26894-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The strobe pin (SD2_DS) was forgotten to be configured when switching to 1.8V
on H3/M3-W/M3-N boards. Fix it with this series.

While this is a bug, I am not sure if it needs to be backported. This pin is
only needed for HS400 operation which we don't support yet but soon.

So, we surely want to have it in 4.17 before we hopefully merge HS400 support
for 4.18. But it could also be argued that this is a bug in the HW description,
so it needs to be backported. I am open for both options here.

But we really want this patch whenever we test HS400.

Thanks,

   Wolfram


Masaharu Hayakawa (1):
  arm64: dts: salvator-common: Add sdhi2_ds pin group to SDHI2 pinctrl
    groups

Wolfram Sang (1):
  arm64: dts: ulcb: Add sdhi2_ds pin group to SDHI2 pinctrl groups

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.11.0
