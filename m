Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46682 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753387AbdHUN2V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2017 09:28:21 -0400
Date: Mon, 21 Aug 2017 15:28:14 +0200
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] arm64: dts: r8a779[56]: Add OPPs
 table for cpu devices
Message-ID: <20170821132813.GB13133@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling OPPs table for cpufreq support on the r8a7796 and
r8a7795.

This pull request is based on renesas-arm64-dt-for-v4.14.

These are dependencies for supporting CPUFreq. The remainder of that
work is being posted separately and can be found at:

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/rcar-gen3-cpufreq


A description of steps taken to lightly exercise the same feature for the
r8a7795 the above can be found at the link below. The results are the same
for the r8a7796 with the exception that it has two active CPU cores rather
than four.

http://elinux.org/Tests:R-CAR-GEN3-CPUFreq


The following changes since commit 4725f2b8805718a65dcbce8668710f145df797a8:

  arm64: dts: renesas: r8a7795: add hsusb ch3 device node (2017-07-27 17:19:05 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/rcar-gen3-cpufreq-dts

for you to fetch changes up to af95354abbae345bcb5f3c8ab5b5ff67f833bbd6:

  arm64: dts: r8a7796: Add OPPs table for cpu devices (2017-08-21 14:39:58 +0200)

----------------------------------------------------------------
Dien Pham (2):
      arm64: dts: r8a7795: Add OPPs table for cpu devices
      arm64: dts: r8a7796: Add OPPs table for cpu devices

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 309 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 341 +++++++++++++++++++++++++++++++
 2 files changed, 650 insertions(+)
