Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751540AbeERLSK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:18:10 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.18
Date: Fri, 18 May 2018 13:16:44 +0200
Message-Id: <cover.1526549153.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v4.18.


The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.18

for you to fetch changes up to c92db4a4a4c6c176c34604e456d6d355803d9ada:

  dt-bindings: arm: document Renesas V3HSK board bindings (2018-05-15 09:17:45 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v4.18

Document bindings for:

* V3H Starter Kit, a board used with the R-Car V3H (r8a77980) SoC
* R-Car E3 (R8A77990) SoC and its Ebisu board
* iWave Systems RZ/G1C Single Board Computer (iW-RainboW-G23S)
  which uses an RZ/G1C (R8A77470) SoC
* RZ/G1M (R8A7743) and RZ/G1N (R8A7744) CMT support

Cleanup:
* Consistently name r8a77965 as R-Car M3-N

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: arm: Document iW-RainboW-G23S single board computer

Fabrizio Castro (1):
      dt-bindings: timer: renesas, cmt: Document r8a774[35] CMT support

Sergei Shtylyov (1):
      dt-bindings: arm: document Renesas V3HSK board bindings

Simon Horman (1):
      dt-bindings: arm: consistently name r8a77965 as M3-N

Yoshihiro Shimoda (2):
      dt-bindings: arm: Document R-Car E3 SoC DT bindings
      dt-bindings: arm: Document Renesas Ebisu board DT bindings

 Documentation/devicetree/bindings/arm/shmobile.txt      | 10 +++++++++-
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 14 ++++++++++----
 2 files changed, 19 insertions(+), 5 deletions(-)
