Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:6273 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbeKAI1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:27:13 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] renesas: rcar-gen3: add HS400 quirk for SD clock
Date: Thu,  1 Nov 2018 00:25:16 +0100
Message-Id: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Hi Geert,

This is the result of the SDHI hackathon for a possible solution to the 
clock issue on early ES versions. It is based on the Gen2 solution where 
a row of the possible clock settings are ignored on the effected SoC+ES 
versions. The first row is not effected when reading settings left by 
the bootloader, only when the setting the clock.

This is tested on H3 (ES1.0, ES2.0), M3-W (ES1.0) and M3-N together with 
patches to enable HS400 with great results. No regressions found for 
eMMC HS200/HS400 modes nor for SDR{25,50,104} on any of the SoCs.

Patch 1/2 adds documentation on which settings is used while 2/2 is the 
real change where the quirk is implemented.

Niklas Söderlund (2):
  clk: renesas: rcar-gen3: add documentation for SD clocks
  clk: renesas: rcar-gen3: add HS400 quirk for SD clock

 drivers/clk/renesas/rcar-gen3-cpg.c | 38 ++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

-- 
2.19.1
