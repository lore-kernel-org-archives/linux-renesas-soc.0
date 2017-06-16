Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54866 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753291AbdFPNbj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 09:31:39 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v4.13
Date: Fri, 16 Jun 2017 15:31:16 +0200
Message-Id: <cover.1497619609.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v4.13.


The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.13

for you to fetch changes up to fd8cf827d8a635df3dad46773ad828ce4c93d95b:

  ARM: shmobile: pm-rmobile: Use GENPD_FLAG_ALWAYS_ON (2017-06-14 10:58:48 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v4.13

* Use GENPD_FLAG_ALWAYS_ON in pm-rmobile

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: pm-rmobile: Use GENPD_FLAG_ALWAYS_ON

 arch/arm/mach-shmobile/pm-rmobile.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)
