Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34344 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752258AbdI2Lwa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:52:30 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.15
Date: Fri, 29 Sep 2017 13:52:04 +0200
Message-Id: <cover.1506678593.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.15.


The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.15

for you to fetch changes up to bb58b29899ff9c6d1e97727ec05b500e832ebd7d:

  arm64: defconfig: enable R8A77970 SoC (2017-09-25 09:19:10 +0200)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.15

* Enable the following to allow further test coverage
  - r8a77970 (V3M) and r8a77995 (D3) R-Car Gen3 SoCs
  - R-Car Gen3 thermal driver.
    This is used on a range of R-Car Gen3 SoCs

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: defconfig: Enable Renesas R8A77995 SoC

Sergei Shtylyov (1):
      arm64: defconfig: enable R8A77970 SoC

Wolfram Sang (1):
      arm64: defconfig: enable thermal driver for Renesas R-Car Gen3

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
