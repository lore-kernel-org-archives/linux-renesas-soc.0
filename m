Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42170 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755650AbdJJIMV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 04:12:21 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC Updates for v4.15
Date: Tue, 10 Oct 2017 10:12:07 +0200
Message-Id: <cover.1507623048.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC updates for v4.15.

This pull request is based on the previous round of
such requests, tagged as renesas-soc-for-v4.15,
which I have already sent a pull-request for.

This pull request fixes a bug introduced in renesas-soc-for-v4.15.


The following changes since commit 3fd45a136ff61bb54deab70fb2d534a85e40481f:

  ARM: shmobile: rcar-gen2: Make sure CNTVOFF is initialized on CA7/15 (2017-09-18 08:10:44 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc2-for-v4.15

for you to fetch changes up to dc15ca962757ca72a4492b2e13be2eecc6dcd716:

  ARM: shmobile: rcar-gen2: fix non-SMP build (2017-10-06 11:35:34 +0200)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC Updates for v4.15

Fix to allow UP build of shmobile.

Arnd Bergmann says:

  A bugfix for the SMP case broke the build for the UP case:

  arch/arm/mach-shmobile/headsmp-apmu.o: In function `shmobile_boot_apmu':
  (.text+0x34): undefined reference to `secondary_startup'

  The assembler file mixes code that is used for SMP with code
  that we also need on a single-CPU build, so I'm leaving it
  always enabled in the Makefile, but enclose the SMP code
  in an #ifdef.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: shmobile: rcar-gen2: fix non-SMP build

 arch/arm/mach-shmobile/headsmp-apmu.S | 2 ++
 1 file changed, 2 insertions(+)
