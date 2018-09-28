Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57939 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729193AbeI1Qoq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:44:46 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.20
Date: Fri, 28 Sep 2018 12:21:37 +0200
Message-Id: <cover.1538122547.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC defconfig updates for v4.20.


The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-defconfig-for-v4.20

for you to fetch changes up to c26eb6f34c9ea56ed795785ecb7938f008dfed1e:

  ARM: shmobile: defconfig: Enable r8a7744 SoC (2018-09-19 10:40:47 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Defconfig Updates for v4.20

* shmobile and multi_v7 defconfigs:
  - Enable recently upstreamed r8a7744 SoC
  - Enable FDP1 (Fine Display processor) present on R-Car Gen2 and RZ/G1 SoCs
* shmobile defconfig (only):
  - Refresh for v4.19-rc1
  - Remove soon to be deprecated SOC_CAMERA

----------------------------------------------------------------
Biju Das (2):
      ARM: multi_v7_defconfig: Enable r8a7744 SoC
      ARM: shmobile: defconfig: Enable r8a7744 SoC

Geert Uytterhoeven (3):
      ARM: shmobile: defconfig: Refresh shmobile_defconfig for v4.19-rc1
      ARM: shmobile: defconfig: Enable VIDEO_RENESAS_FDP1
      ARM: multi_v7_defconfig: Enable VIDEO_RENESAS_FDP1

Jacopo Mondi (1):
      ARM: shmobile: defconfig: Remove SOC_CAMERA

 arch/arm/configs/multi_v7_defconfig | 2 ++
 arch/arm/configs/shmobile_defconfig | 8 +++-----
 2 files changed, 5 insertions(+), 5 deletions(-)
