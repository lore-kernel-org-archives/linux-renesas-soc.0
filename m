Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42651 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750987AbdGaPEN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:04:13 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.14
Date: Mon, 31 Jul 2017 17:04:03 +0200
Message-Id: <cover.1501511923.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC drivers updates for v4.14.


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers-for-v4.14

for you to fetch changes up to 105ae504a3eb6c2e188e8d67db59b71186f11967:

  soc: renesas: rcar-rst: Add support for R-Car D3 (2017-07-27 17:08:28 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Drivers Updates for v4.14

Add R-Car D3 (r8a77995) support to the Renesas-specific SoC drivers
- SoC identification
- System controller
- Reset controller

----------------------------------------------------------------
Geert Uytterhoeven (4):
      soc: renesas: Identify R-Car D3
      soc: renesas: Add r8a77995 SYSC PM Domain Binding Definitions
      soc: renesas: rcar-sysc: Add support for R-Car D3 power areas
      soc: renesas: rcar-rst: Add support for R-Car D3

 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 .../devicetree/bindings/reset/renesas,rst.txt      |  1 +
 drivers/soc/renesas/Kconfig                        |  7 ++++-
 drivers/soc/renesas/Makefile                       |  1 +
 drivers/soc/renesas/r8a77995-sysc.c                | 31 ++++++++++++++++++++++
 drivers/soc/renesas/rcar-rst.c                     |  1 +
 drivers/soc/renesas/rcar-sysc.c                    |  3 +++
 drivers/soc/renesas/rcar-sysc.h                    |  1 +
 drivers/soc/renesas/renesas-soc.c                  |  8 ++++++
 include/dt-bindings/power/r8a77995-sysc.h          | 23 ++++++++++++++++
 10 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/renesas/r8a77995-sysc.c
 create mode 100644 include/dt-bindings/power/r8a77995-sysc.h
