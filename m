Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56970 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754004AbcIGHld (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:41:33 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.9
Date: Wed,  7 Sep 2016 09:41:26 +0200
Message-Id: <cover.1473233745.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.9.


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.9

for you to fetch changes up to 6c04d2f7f1038bf6e5561827f862c6aa2beb4b37:

  arm64: defconfig: Enable SDHI and GPIO_REGULATOR (2016-09-01 16:32:46 +0200)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.9

* Enable HSUSB and SDHI

----------------------------------------------------------------
Simon Horman (1):
      arm64: defconfig: Enable SDHI and GPIO_REGULATOR

Yoshihiro Shimoda (1):
      arm64: defconfig: Add Renesas R-Car HSUSB driver support as module

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)
