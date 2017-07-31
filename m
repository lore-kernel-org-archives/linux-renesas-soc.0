Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42947 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752324AbdGaPEg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:04:36 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.14
Date: Mon, 31 Jul 2017 17:04:29 +0200
Message-Id: <cover.1501512759.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v4.14.


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.14

for you to fetch changes up to 100acb0bd90be67b3fc625cff91c7617b791743d:

  ARM: shmobile: Document Renesas Draak board DT bindings (2017-07-27 17:10:48 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v4.14

* Document R-Car D3 (r8a77995) SoC and Draak board

* Document reserved SRAM for the SMP jump stub on R-Car Gen2 and RZ/G1 SoCs

  Geert Uytterhoeven says, "+Renesas R-Car Gen2 and RZ/G1 SoCs need a small
  piece of SRAM for the jump stub +for secondary CPU bringup and CPU
  hotplug.  +This memory is reserved by adding a child node to a
  "mmio-sram" node..."

* Add a VSP channel index to DU vsps

  Laurent Pinchart says, "multiple LIF instances in the VSP. The current DT
  bindings don't support specifying that kind of SoC integration scheme.
  Extend them with a VSP channel index."

* Add R-Car M3-W (r8a7796) HDMI TX DT bindings

  This is compatible with existing R-Car H3 (r8a7795) support

----------------------------------------------------------------
Geert Uytterhoeven (3):
      dt-bindings: sram: Document renesas,smp-sram
      ARM: shmobile: Document R-Car D3 SoC DT bindings
      ARM: shmobile: Document Renesas Draak board DT bindings

Laurent Pinchart (2):
      dt-bindings: display: renesas: Add R-Car M3-W HDMI TX DT bindings
      dt-bindings: display: rcar-du: Add a VSP channel index to the vsps DT property

 Documentation/devicetree/bindings/arm/shmobile.txt |  4 ++
 .../bindings/display/bridge/renesas,dw-hdmi.txt    |  1 +
 .../devicetree/bindings/display/renesas,du.txt     | 51 +++++++++++++---------
 .../devicetree/bindings/sram/renesas,smp-sram.txt  | 27 ++++++++++++
 4 files changed, 62 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sram/renesas,smp-sram.txt
