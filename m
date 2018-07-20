Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33157 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbeGTMvU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:51:20 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.19
Date: Fri, 20 Jul 2018 14:03:18 +0200
Message-Id: <cover.1532080241.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.19.


The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.19

for you to fetch changes up to 83c05e98f732bfa77830631e8d4403c76cad9b31:

  arm64: defconfig: Enable BD9571MWV regulator (2018-06-18 12:01:14 +0200)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.19

* Enable BD9571MWV regulator in ARM64 defconfig

  This is to allow wider testing of the BD9571 PMIC which is
  present on boards with Renesas R-Car Gen3 SoCs

----------------------------------------------------------------
Dien Pham (1):
      arm64: defconfig: Enable BD9571MWV regulator

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
