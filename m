Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46768 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753264AbdHUNbj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2017 09:31:39 -0400
Date: Mon, 21 Aug 2017 15:31:35 +0200
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] cpufreq: dt-platdev: Automatically
 create cpufreq device with OPP v2
Message-ID: <20170821133134.GC13133@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling driver cpufreq driver changes to allow it to
automatically create a cpufreq device. This patch is proposed by
Viresh Kumar. The other patches remove the r8a7795 and r8a7796 from the
creation whitelist so that Viresh's code may be exercised on those
platforms.

This pull request is based on linux-pm/linux-next

These are dependencies for supporting CPUFreq. The remainder of that
work is being posted separately and can be found at:

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/rcar-gen3-cpufreq


A description of steps taken to lightly exercise the same feature for the
r8a7795 the above can be found at the link below. The results are the same
for the r8a7796 with the exception that it has two active CPU cores rather
than four.

http://elinux.org/Tests:R-CAR-GEN3-CPUFreq


The following changes since commit 1764ef1421da3e83b57b202d0c33736bb23e62ad:

  Merge branch 'device-properties' into linux-next (2017-08-21 01:55:36 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/cpufreq-automatic

for you to fetch changes up to 188434f5da64c9e99dc948123d63698b3d002170:

  Revert "cpufreq: rcar: Add support for R8A7795 SoC" (2017-08-21 13:46:17 +0200)

----------------------------------------------------------------
Simon Horman (2):
      Revert "cpufreq: dt: Add r8a7796 support to to use generic cpufreq driver"
      Revert "cpufreq: rcar: Add support for R8A7795 SoC"

Viresh Kumar (1):
      cpufreq: dt-platdev: Automatically create cpufreq device with OPP v2

 drivers/cpufreq/cpufreq-dt-platdev.c | 47 ++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 7 deletions(-)
