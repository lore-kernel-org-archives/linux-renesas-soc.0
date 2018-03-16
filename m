Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36054 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753310AbeCPOuq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:50:46 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.17
Date: Fri, 16 Mar 2018 15:50:34 +0100
Message-Id: <cover.1521201256.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.17.


The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.17

for you to fetch changes up to f3768b0bc2e924477b6ca20c2293e8d51d948431:

  arm64: defconfig: enable R8A77965 SoC (2018-02-26 12:01:34 +0100)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.17

Enable the following to allow them to be more widely exercised:
* Newly added R8A77965 and R8A77980 SoCs
* PWM and USB as used on R-Car Gen3 SoCs

----------------------------------------------------------------
Simon Horman (2):
      arm64: defconfig: enable R8A77980 SoC
      arm64: defconfig: enable R8A77965 SoC

Yoshihiro Shimoda (1):
      arm64: defconfig: Enable PWM and USB for R-Car

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)
