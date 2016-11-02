Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48949 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751993AbcKBJYP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 05:24:15 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.10
Date: Wed,  2 Nov 2016 10:24:05 +0100
Message-Id: <cover.1478077617.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC drivers updates for v4.10.


The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers-for-v4.10

for you to fetch changes up to 603311ba979fa5bbbf6a8961e5f7a27deafce1b4:

  soc: renesas: rcar-sysc: add R8A7743 support (2016-10-17 08:21:20 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Drivers Updates for v4.10

* Add support for the r8a7743 SoC to rcar-sysc

----------------------------------------------------------------
Sergei Shtylyov (2):
      ARM: shmobile: r8a7743: add power domain index macros
      soc: renesas: rcar-sysc: add R8A7743 support

 .../bindings/power/renesas,rcar-sysc.txt           |  7 +++--
 drivers/soc/renesas/Makefile                       |  1 +
 drivers/soc/renesas/r8a7743-sysc.c                 | 32 ++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c                    |  3 ++
 drivers/soc/renesas/rcar-sysc.h                    |  1 +
 include/dt-bindings/power/r8a7743-sysc.h           | 25 +++++++++++++++++
 6 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 drivers/soc/renesas/r8a7743-sysc.c
 create mode 100644 include/dt-bindings/power/r8a7743-sysc.h
