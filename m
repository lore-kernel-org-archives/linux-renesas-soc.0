Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46105 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933608AbdIYHyR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 03:54:17 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.15
Date: Mon, 25 Sep 2017 09:53:31 +0200
Message-Id: <cover.1506325167.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC defconfig updates for v4.15.


The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-defconfig-for-v4.15

for you to fetch changes up to 545dc83ed09b5c04f663b766a92cbc8bb02c5f15:

  ARM: multi_v7_defconfig: Enable BQ32000 RTC driver (2017-09-18 07:57:41 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Defconfig Updates for v4.15

Enable BQ32000 RTC driver in multi_v7_defconfig.

Biju Das says, "The iWave RZ/G1M Q7 SOM supports RTC (TI BQ32000).
To increase hardware support enable the driver in the
multi_v7_defconfig multiplatform configuration."

----------------------------------------------------------------
Biju Das (1):
      ARM: multi_v7_defconfig: Enable BQ32000 RTC driver

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)
