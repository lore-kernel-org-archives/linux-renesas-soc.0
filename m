Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34495 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752181AbdI2Lxy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:53:54 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.15
Date: Fri, 29 Sep 2017 13:52:52 +0200
Message-Id: <cover.1506676368.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v4.15.


The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.15

for you to fetch changes up to 2e931b06de97d762ef139bffbbe75e1483735734:

  ARM: shmobile: remove inconsistent ; from documentation (2017-09-25 09:02:47 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v4.15

* Consistently do not use ';' in documentation of compat strings
  for boards. A misture of using and not using a trailing ';' had
  krept in over time with not using being dominant.

* Document bindings for
  - Eagle board and r8a77970 (V3M) SoC bindings.
    Eagle is a board for the V3M SoC
  - Document Kingfisher board bindings.
    Kingfisher is an extension board for the H3ULCB and M3ULCB boards.

* Add r8a77970 (V3M) SYSC power domain definitions

  Add macros usable by the device tree sources to reference r8a77970 SYSC
  power domains by index.

* Add Renesas SoC DT bindings doc to Renesas ARM section of MAINTAINERS file

* Drop bogus node name suffix from example of /renesas,dw-hdmi binding

* Document APMU and SMP enable method for r8a7745 (RZ/G1E) SoC

----------------------------------------------------------------
Fabrizio Castro (1):
      dt-bindings: apmu: Document r8a7745 support

Geert Uytterhoeven (3):
      dt-bindings: display: renesas: dw-hdmi: Drop bogus node name suffix
      ARM: shmobile: Document R-Car V3M SoC DT bindings
      MAINTAINERS: Add Renesas SoC DT bindings doc to Renesas ARM sections

Sergei Shtylyov (2):
      dt-bindings: power: add R8A77970 SYSC power domain definitions
      arm64: renesas: document Eagle board bindings

Simon Horman (1):
      ARM: shmobile: remove inconsistent ; from documentation

Vladimir Barinov (1):
      arm: shmobile: Document Kingfisher board DT bindings

 Documentation/devicetree/bindings/arm/shmobile.txt | 16 +++++++----
 .../bindings/display/bridge/renesas,dw-hdmi.txt    |  2 +-
 .../devicetree/bindings/power/renesas,apmu.txt     |  1 +
 MAINTAINERS                                        |  2 ++
 include/dt-bindings/power/r8a77970-sysc.h          | 32 ++++++++++++++++++++++
 5 files changed, 47 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/power/r8a77970-sysc.h
