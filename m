Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40285 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753626AbdKNJA5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2017 04:00:57 -0500
Date: Tue, 14 Nov 2017 10:00:38 +0100
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] arm64: dts: renesas: r8a77995: IPMMU
 upstream integration
Message-ID: <20171114090037.bbwrsmm6dxv2e43z@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling this series which adds IPMMU support to the
DT for the r8a77995 (R-Car D3) SoC.

This is v5 of these changes.

They are based on renesas-devel-20171110-v4.14-rc8


The following changes since commit ce17f313172b05ca21422a9b2c335808eef883cc:

  Merge branches 'arm64-dt-for-v4.16', 'dt-for-v4.16' and 'soc-for-v4.16' into devel (2017-11-10 10:32:03 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/ipmmu-dt-r8a77995-v2

for you to fetch changes up to 4ad5f98e6e91d82a2df9b870e90a8e7e2d3c5a02:

  arm64: dts: renesas: r8a77995: Connect Ethernet-AVB to IPMMU-RT (2017-11-10 13:07:18 +0100)

----------------------------------------------------------------
Simon Horman (2):
      arm64: dts: renesas: r8a77995: Add IPMMU device nodes
      arm64: dts: renesas: r8a77995: Connect Ethernet-AVB to IPMMU-RT

 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 83 +++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
