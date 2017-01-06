Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43610 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940146AbdAFLS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:18:27 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.11
Date: Fri,  6 Jan 2017 12:18:10 +0100
Message-Id: <cover.1483701293.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC defconfig updates for v4.11.


The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-defconfig-for-v4.11

for you to fetch changes up to e37278d83e348eb53029452e65892780359b6bea:

  ARM: multi_v7_defconfig: Enable r8a774[35] SoCs (2017-01-03 10:44:04 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Defconfig Updates for v4.11

Enable:
* Recently added Enable r8a774[35] SoCs
* CMA for DMA to allow use of VIN with large frame sizes
* CONFIG_VIDEO_ADV7604 to allow use of HDMI input

----------------------------------------------------------------
Niklas Söderlund (2):
      ARM: shmobile: defconfig: Enable CONFIG_VIDEO_ADV7604
      ARM: shmobile: defconfig: Enable CMA for DMA

Simon Horman (2):
      ARM: shmobile: defconfig: Enable r8a774[35] SoCs
      ARM: multi_v7_defconfig: Enable r8a774[35] SoCs

 arch/arm/configs/multi_v7_defconfig | 2 ++
 arch/arm/configs/shmobile_defconfig | 6 ++++++
 2 files changed, 8 insertions(+)
