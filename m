Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56932 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756345AbcIGHlP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:41:15 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Fixes for v4.8
Date: Wed,  7 Sep 2016 09:41:04 +0200
Message-Id: <cover.1473232298.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC fixes for v4.8.

This relaxes the requirement that all da9xxx devices are added before
the drivers for any are initialised.

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v4.8

for you to fetch changes up to c2f321126e31cd69365e65ecd4a7c774e4fc71d2:

  ARM: shmobile: fix regulator quirk for Gen2 (2016-09-02 10:15:38 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Fixes for v4.8

* Correct R-Car Gen2 regulator quirk

----------------------------------------------------------------
Wolfram Sang (1):
      ARM: shmobile: fix regulator quirk for Gen2

 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 62 +++++++++-------------
 1 file changed, 26 insertions(+), 36 deletions(-)
