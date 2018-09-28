Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57595 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729093AbeI1QmL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:42:11 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.20
Date: Fri, 28 Sep 2018 12:18:59 +0200
Message-Id: <cover.1538124193.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.20.


The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.20

for you to fetch changes up to 76506880eac66cb1f189a993c39ad0fcba723b99:

  arm64: defconfig: enable R8A774C0 SoC (2018-09-17 09:11:46 +0200)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.20

* Enable recently upstreamed RZ/G2E (r8a774c0) and RZ/G2M (r8a774a1) SoCs

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: enable R8A774A1 SoC

Fabrizio Castro (1):
      arm64: defconfig: enable R8A774C0 SoC

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
