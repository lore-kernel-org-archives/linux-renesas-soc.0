Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbeLFV7c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:32 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.21
Date: Thu,  6 Dec 2018 13:58:53 -0800
Message-Id: <cover.1544131943.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC drivers updates for v4.21.


The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers-for-v4.21

for you to fetch changes up to 7fc4650cc2417d7a2907a000f6f88240baa42018:

  soc: renesas: rcar-sysc: Fix power domain control after system resume (2018-12-06 12:10:10 -0800)

----------------------------------------------------------------
Renesas ARM Based SoC Drivers Updates for v4.21

SYSC Driver:
* Common
  - Fix power domain control after system resume
  - Merge PM Domain registration and linking
  - Remove rcar_sysc_power_{down,up}() helpers
* R-Car E3 (r8a77990) SoC
  - Fix initialization order of 3DG-{A,B}
* R-Car V3H (r8a77980) SoC
  - Correct A3VIP[012] power domain hierarchy
  - Correct names of A2DP[01] power domains
* R-Car V3M (r8a77970) SoC
  - Correct names of A2DP/A2CN power domains
  - emove non-existent CR7 power domain
* R-Car M3-N (r8a77965) SoC
  - Remove non-existent A3IR power domain

----------------------------------------------------------------
Geert Uytterhoeven (9):
      soc: renesas: r8a77965-sysc: Remove non-existent A3IR power domain
      soc: renesas: r8a77970-sysc: Remove non-existent CR7 power domain
      soc: renesas: r8a77970-sysc: Correct names of A2DP/A2CN power domains
      soc: renesas: r8a77980-sysc: Correct names of A2DP[01] power domains
      soc: renesas: r8a77980-sysc: Correct A3VIP[012] power domain hierarchy
      soc: renesas: r8a77990-sysc: Fix initialization order of 3DG-{A,B}
      soc: renesas: rcar-sysc: Remove rcar_sysc_power_{down,up}() helpers
      soc: renesas: rcar-sysc: Merge PM Domain registration and linking
      soc: renesas: rcar-sysc: Fix power domain control after system resume

 drivers/soc/renesas/r8a77965-sysc.c       |  1 -
 drivers/soc/renesas/r8a77970-sysc.c       |  5 +--
 drivers/soc/renesas/r8a77980-sysc.c       | 10 ++---
 drivers/soc/renesas/r8a77990-sysc.c       | 23 ++---------
 drivers/soc/renesas/rcar-sysc.c           | 65 +++++++++----------------------
 include/dt-bindings/power/r8a77970-sysc.h |  7 ++--
 include/dt-bindings/power/r8a77980-sysc.h |  6 +--
 7 files changed, 35 insertions(+), 82 deletions(-)
