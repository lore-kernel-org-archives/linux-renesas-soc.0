Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37068 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751319AbdJENYV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 09:24:21 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 0/6] clk: renesas: r8a779[56]: Add Z and Z2 clock support
Date: Thu,  5 Oct 2017 15:23:51 +0200
Message-Id: <1507209837-16938-1-git-send-email-horms+renesas@verge.net.au>
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

Further testing on Salvator-X/M3-W ES1.0 is as follows:

# cd /sys/devices/system/cpu/cpu0/cpufreq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:468749
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:500000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:468749
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:500000
/sys/kernel/debug/clk/z/clk_rate:468749981
# echo performance > scaling_governor
# grep .  /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1499999
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1500000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:1499999
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1500000
/sys/kernel/debug/clk/z/clk_rate:1499999940
# echo 1000000 > scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:937499
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:937499
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1000000
/sys/kernel/debug/clk/z/clk_rate:937499963
# echo 500000 > scaling_max_freq 
# grep .  /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z/clk_rate 
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:468749
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:500000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:468749
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:500000
/sys/kernel/debug/clk/z2/clk_rate:2399999904


Based on clk-renesas-for-v4.15-tag1

Changes since v2:
* Rebase
* Address review of v2 as noted in patch changelogs

Takeshi Kihara (6):
  clk: renesas: rcar-gen3: Add Z clock divider support
  clk: renesas: rcar-gen3: Add Z2 clock divider support
  clk: renesas: r8a7795: Add Z clock
  clk: renesas: r8a7795: Add Z2 clock
  clk: renesas: r8a7796: Add Z clock
  clk: renesas: r8a7796: Add Z2 clock

 drivers/clk/renesas/r8a7795-cpg-mssr.c |   2 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c |   2 +
 drivers/clk/renesas/rcar-gen3-cpg.c    | 136 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h    |   2 +
 4 files changed, 142 insertions(+)

-- 
2.1.4
