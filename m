Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48909 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751064AbcKBJX7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 05:23:59 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.10
Date: Wed,  2 Nov 2016 10:23:53 +0100
Message-Id: <cover.1478078446.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC defconfig updates for v4.10.


The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-defconfig-for-v4.10

for you to fetch changes up to a604a37d46b80899d5a09d937fdd670e93af690d:

  ARM: shmobile: defconfig: Enable CONFIG_CGROUPS (2016-10-17 08:24:41 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Defconfig Updates for v4.10

* Enable cgroups in shmobile_defconfig

----------------------------------------------------------------
Niklas Söderlund (1):
      ARM: shmobile: defconfig: Enable CONFIG_CGROUPS

 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)
