Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54739 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753771AbdFPNbW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 09:31:22 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC DT Bindings Updates for v4.13
Date: Fri, 16 Jun 2017 15:30:57 +0200
Message-Id: <cover.1497617896.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC DT bindings
updates for v4.13.

This pull request is based on the previous round of
such requests, tagged as renesas-dt-bindings-for-v4.13,
which I you have already pulled.


The following changes since commit 40c9bbea140e64a4257b794969e759c2c481c399:

  ARM: dts: r7s72100: add USB bit definitions (2017-05-15 09:02:37 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings2-for-v4.13

for you to fetch changes up to 521ec12e2f56b16e6a0b4e7ef97a666bd3de4ff5:

  ARM: shmobile: Document Renesas H3-based Salvator-XS board DT bindings (2017-06-12 11:59:07 +0200)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC DT Bindings Updates for v4.13

* Document:
  - Add Renesas H3-based Salvator-XS board DT bindings
  - Add iW-RainboW-G20D-Qseven-RZG1M board
  - Add iW-RainboW-G20M-Qseven-RZG1M system on module
  - Update R-Car Gen3 ULCB board part numbers
* Add clock bit definitions for r7s72100 SoC

----------------------------------------------------------------
Biju Das (2):
      ARM: shmobile: document iW-RainboW-G20M-Qseven-RZG1M system on module
      ARM: shmobile: document iW-RainboW-G20D-Qseven-RZG1M board

Chris Brandt (1):
      ARM: dts: r7s72100: add clock bit definitions

Geert Uytterhoeven (2):
      ARM: shmobile: Update R-Car Gen3 ULCB board part numbers
      ARM: shmobile: Document Renesas H3-based Salvator-XS board DT bindings

 Documentation/devicetree/bindings/arm/shmobile.txt | 11 ++++-
 include/dt-bindings/clock/r7s72100-clock.h         | 51 ++++++++++++++++++++++
 2 files changed, 60 insertions(+), 2 deletions(-)
