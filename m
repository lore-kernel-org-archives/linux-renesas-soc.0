Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbeLFV7r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:47 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.21
Date: Thu,  6 Dec 2018 13:59:10 -0800
Message-Id: <cover.1544124873.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v4.21.


The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.21

for you to fetch changes up to 74791d15fd7c405511e3cc097c2f043171ecbdb0:

  dt-bindings: arm: renesas: Move 'renesas,prr' binding to its own doc (2018-12-06 11:33:22 -0800)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v4.21

* Move 'renesas,prr' binding to its own document
  - Prepration for converting board-level bindings to json-schema

* Document iW-RainboW-G20D-Qseven-RZG1N board and iWave RZ/G1N SOM

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: arm: renesas: Document iWave RZ/G1N SOM
      dt-bindings: arm: renesas: Document iW-RainboW-G20D-Qseven-RZG1N board

Rob Herring (1):
      dt-bindings: arm: renesas: Move 'renesas,prr' binding to its own doc

 .../devicetree/bindings/arm/renesas,prr.txt        | 20 ++++++++++++++++++++
 Documentation/devicetree/bindings/arm/shmobile.txt | 22 ++++------------------
 2 files changed, 24 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt
