Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51650 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941554AbcKQRnJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 12:43:09 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC Drivers Updates for v4.10
Date: Thu, 17 Nov 2016 15:04:35 +0100
Message-Id: <cover.1479389981.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC drivers updates for v4.10.

This pull request is based on a merge of:

* The previous round of such requests, tagged as renesas-drivers-for-v4.10,
  which you have already pulled.
* The soc-device-match-tag1 tag of Geert Uytterhoeven's renesas-driver's tree.
  This is included to provide core soc_device_match() infrastructure which
  is a dependency of identifying SoC and registering with SoC bus.


The following changes since commit 437c4eeb0bd4c1d68817be997716f52b8c22a9c3:

  Merge tag 'soc-device-match-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into HEAD (2016-11-15 14:12:57 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers2-for-v4.10

for you to fetch changes up to 63ee9e2ba47dbdb42156c9b940515cfd49e78c91:

  soc: renesas: Identify SoC and register with the SoC bus (2016-11-17 14:37:20 +0100)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC Drivers Updates for v4.10

* Identify SoC and register with the SoC bus
* Add support for the r8a7745 SoC to rcar-sysc

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: shmobile: Document DT bindings for Product Register
      soc: renesas: Identify SoC and register with the SoC bus

Sergei Shtylyov (2):
      ARM: shmobile: r8a7745: add power domain index macros
      soc: renesas: rcar-sysc: add R8A7745 support

 Documentation/devicetree/bindings/arm/shmobile.txt |  18 ++
 .../bindings/power/renesas,rcar-sysc.txt           |   1 +
 arch/arm/mach-shmobile/Kconfig                     |   1 +
 arch/arm64/Kconfig.platforms                       |   1 +
 drivers/soc/renesas/Makefile                       |   3 +
 drivers/soc/renesas/r8a7745-sysc.c                 |  32 +++
 drivers/soc/renesas/rcar-sysc.c                    |   3 +
 drivers/soc/renesas/rcar-sysc.h                    |   1 +
 drivers/soc/renesas/renesas-soc.c                  | 257 +++++++++++++++++++++
 include/dt-bindings/power/r8a7745-sysc.h           |  25 ++
 10 files changed, 342 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a7745-sysc.c
 create mode 100644 drivers/soc/renesas/renesas-soc.c
 create mode 100644 include/dt-bindings/power/r8a7745-sysc.h
