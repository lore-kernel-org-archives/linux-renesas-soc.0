Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33682 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLOy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:14:54 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.18
Date: Fri, 18 May 2018 13:14:48 +0200
Message-Id: <cover.1526548323.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.18.


The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.18

for you to fetch changes up to c1fcd2ec1b1970e0e7b0c40c64bc51cf667b1a75:

  arm64: defconfig: enable R8A77990 SoC (2018-05-16 11:08:20 +0200)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.18

* Enable in ARM64 defconfig:
  - Recently mainlined support for R-Car E3 (r8a77990) SoC

  - HDMI sound and depdencies.

    HDMI sound is used by R-Car Gen 3.  These options are enabled as
    modules to avoid unnecesesarily enlarging the kernel image.

----------------------------------------------------------------
Kuninori Morimoto (2):
      arm64: defconfig: makes SND_SIMPLE_CARD to module
      arm64: defconfig: Enable CONFIG_SND_AUDIO_GRAPH_CARD

Simon Horman (1):
      arm64: defconfig: enable R8A77990 SoC

 arch/arm64/configs/defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
