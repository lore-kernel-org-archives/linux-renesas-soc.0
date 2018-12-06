Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55718 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbeLFV5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:57:12 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.21
Date: Thu,  6 Dec 2018 13:57:02 -0800
Message-Id: <cover.1544126077.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.21.


The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.21

for you to fetch changes up to fe16bcd6d44f1a2bccc4618119463d9d23a6ae92:

  arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE (2018-11-16 06:56:49 -0800)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.21

* Enable in arm64 defconfig:
  - Renesas R-Car Gen3 PCIe PHY driver
  - Renesas R-Car thermal driver
  - ASoC simple SCU sound card support

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE

Simon Horman (2):
      arm64: defconfig: Enable R-Car thermal driver
      arm64: defconfig: Enable scu-simple-card driver

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
