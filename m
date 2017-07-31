Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42559 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbdGaPCm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:02:42 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.14
Date: Mon, 31 Jul 2017 17:02:28 +0200
Message-Id: <cover.1501509815.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.14.


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.14

for you to fetch changes up to 140cb4111a51381f51f6cdcc97113f2d04e5939b:

  arm64: defconfig: compile ak4613 and renesas sound as modules (2017-07-27 15:51:58 +0200)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.14

* compile ak4613 and renesas sound as modules

  This is intended to reduce the size of a kernel image compiled
  using the defconfig. This is timely as it brings the kernel image
  back below the size that can be booted in my environment, a limit
  it crept over in v4.13-rc1.

----------------------------------------------------------------
Kuninori Morimoto (1):
      arm64: defconfig: compile ak4613 and renesas sound as modules

 arch/arm64/configs/defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
