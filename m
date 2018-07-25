Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38224 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729213AbeGYUsL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 16:48:11 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] arm64: dts: enable SATA on Gen3 boards
Date: Wed, 25 Jul 2018 21:34:55 +0200
Message-Id: <20180725193457.3999-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since Geert also argumented that it is reasonable to have this in the board DTS
files [1], I converted the RFC into proper patches. So, SATA will be available
out of the box for H3 and M3-N if MD12 is switched off properly.

Patches are bases on current renesas-drivers/master. M3-N has been tested
successfully, too.

[1] https://patchwork.kernel.org/patch/10131041/

Changes since RFC:

* added comments
* kept the sorting
* used GPIO macros instead of hardcoded values
* added Geert's tag
* added a patch for M3-N, too

Wolfram Sang (2):
  arm64: dts: r8a7795: salvator-xs: enable SATA
  arm64: dts: r8a77965: salvator-xs: enable SATA

 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts  | 14 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

-- 
2.11.0
