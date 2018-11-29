Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:15493 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726492AbeK2Lo1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 06:44:27 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] renesas: rcar-gen3: add HS400 quirk for SD clock
Date: Thu, 29 Nov 2018 01:39:47 +0100
Message-Id: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

This series aims to solve the clock quirk needed to enabled HS400 on 
SoCs needing special clock handeling. It uses the same method as v1 of 
this series and which was discussed during the SDHI hackathon. However 
patch 2/2 have been completely rewritten to take your comments from v1 
into account. Due to this change this series now depends on [1].

This is tested on H3 (ES1.0, ES2.0), M3-W (ES1.0) and M3-N together with
patches to enable HS400 with great results. No regressions found for
eMMC HS200/HS400 modes nor for SDR{25,50,104} on any of the SoCs.

Patch 1/2 adds documentation on which settings is used while 2/2 is the
real change where the quirk is implemented.

1. [PATCH] clk: renesas: rcar-gen3: set state when registering SD clocks

Niklas Söderlund (2):
  clk: renesas: rcar-gen3: add documentation for SD clocks
  clk: renesas: rcar-gen3: add HS400 quirk for SD clock

 drivers/clk/renesas/rcar-gen3-cpg.c | 43 +++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 12 deletions(-)

-- 
2.19.1
