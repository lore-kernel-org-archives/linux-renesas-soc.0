Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48874 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751064AbcKBJXv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 05:23:51 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.10
Date: Wed,  2 Nov 2016 10:23:40 +0100
Message-Id: <cover.1478078567.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.10.


The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.10

for you to fetch changes up to 833c97254724a620d1d9fb9a580681fb52536fbf:

  arm64: defconfig: Enable DRM DU and V4L2 FCP + VSP modules (2016-10-27 09:07:35 +0200)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.10

* Enable R-Car DU and related drivers as modules in defconfig

----------------------------------------------------------------
Magnus Damm (1):
      arm64: defconfig: Enable DRM DU and V4L2 FCP + VSP modules

 arch/arm64/configs/defconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
