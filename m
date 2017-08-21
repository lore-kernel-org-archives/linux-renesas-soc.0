Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45893 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753243AbdHUNBi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2017 09:01:38 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/6] clk: renesas: r8a779[56]: Add Z and Z2 clock support
Date: Mon, 21 Aug 2017 15:01:21 +0200
Message-Id: <1503320487-13591-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Hi,

this patch-set adds Z and Z2 clock support.

These are dependencies for supporting CPUFreq. The remainder of that
work is being posted separately and can be found at:

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/rcar-gen3-cpufreq


A description of steps taken to lightly exercise the same feature for the
r88a7795 the above can be found at the link below. The results are the same
for the r8a7796 with the exception that it has two active CPU cores rather
than four.

http://elinux.org/Tests:R-CAR-GEN3-CPUFreq


Based on clk-renesas-for-v4.14-tag1

Changes since v1:
* Rebase
* Include r8a7795 and r8a7796 changes in same patchset

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

-- 
2.1.4
