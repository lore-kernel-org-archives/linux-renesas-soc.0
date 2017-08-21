Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46101 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753861AbdHUNIJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2017 09:08:09 -0400
Date: Mon, 21 Aug 2017 15:08:04 +0200
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] clk: renesas: r8a779[56]: Add Z and
 Z2 clock support
Message-ID: <20170821130758.GA14062@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling the Z and Z2 clock support for r8a779[56] (v2).

This pull request is based on clk-renesas-for-v4.14-tag1.

These are dependencies for supporting CPUFreq. The remainder of that
work is being posted separately and can be found at:

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/rcar-gen3-cpufreq


A description of steps taken to lightly exercise the same feature for the
r8a7795 the above can be found at the link below. The results are the same
for the r8a7796 with the exception that it has two active CPU cores rather
than four.

http://elinux.org/Tests:R-CAR-GEN3-CPUFreq


The following changes since commit c29f82951b974f27e0bc4ce2525db164f86f2e4d:

  clk: renesas: r8a7796: Add USB3.0 clock (2017-08-17 09:22:26 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/rcar-gen3-z-clk

for you to fetch changes up to c7735aac9d57d35595c2f4b87c74db5702cc2051:

  clk: renesas: r8a7796: Add Z2 clock (2017-08-21 14:49:54 +0200)

----------------------------------------------------------------
Takeshi Kihara (6):
      clk: renesas: rcar-gen3: Add Z clock divider support
      clk: renesas: rcar-gen3: Add Z2 clock divider support
      clk: renesas: r8a7795: Add Z clock
      clk: renesas: r8a7795: Add Z2 clock
      clk: renesas: r8a7796: Add Z clock
      clk: renesas: r8a7796: Add Z2 clock

 drivers/clk/renesas/r8a7795-cpg-mssr.c |   2 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c |   2 +
 drivers/clk/renesas/rcar-gen3-cpg.c    | 204 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h    |   2 +
 4 files changed, 210 insertions(+)
