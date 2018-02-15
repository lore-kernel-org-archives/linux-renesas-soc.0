Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36359 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032091AbeBOADp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 19:03:45 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3 00/12] R-Car DU: Convert LVDS code to bridge driver
Date: Thu, 15 Feb 2018 02:04:03 +0200
Message-Id: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series addresses a design mistake that dates back from the initial
DU support. Support for the LVDS encoders, which are IP cores separate from
the DU, was bundled in the DU driver. Worse, both the DU and LVDS were
described through a single DT node.

To fix the, patches 01/12 and 02/12 define new DT bindings for the LVDS
encoders, and deprecate their description inside the DU bindings. To retain
backward compatibility with existing DT, patch 03/12 then patches the device
tree at runtime to convert the legacy bindings to the new ones.

With the DT side addressed, patch 04/12 then converts the LVDS support code to
a separate bridge driver. After a small fix to the Porter board device tree in
patch 05/12, patches 06/12 to 12/12 then update all the device tree sources to
the new DU and LVDS encoders bindings.

I decided to go for live DT patching in patch 03/12 because implementing
support for both the legacy and new bindings in the driver would have been
very intrusive, and prevented further cleanups. This version relies more
heavily on overlays to avoid touching the internals of the OF core compared to
v2, even if manual fixes to the device tree are still needed.

There were a few shortcomings in the OF API that I worked around with local
code in the driver. If anyone is interested in performing similar live DT
patching I think we could move some of the code to the OF core. I'm thinking
in particular about the rcar_du_of_find_node_by_path() function that resembles
of_find_node_by_path() but with a configurable base node, and about the
rcar_du_of_add_property() function that adds a property to an existing DT
node. Rob, Frank, should I submit patches ? Any advice ?

Compared to v2, the biggest change is in patch 03/12. Following Rob's and
Frank's reviews it was clear that modifying the unflattened DT structure of
the overlay before applying it wasn't popular. I have thus decided to use one
overlay source per SoC to move as much of the DT changes to the overlay as
possible, and only perform manual modifications (that are still needed as some
of the information is board-specific) on the system DT after applying the
overlay. As a result the overlay is parsed and applied without being modified.

Compared to v1, this series update the r8a7792 and r8a7794 device tree sources
and incorporate review feedback as described by the changelogs of individual
patches.

Laurent Pinchart (12):
  dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
  dt-bindings: display: renesas: Deprecate LVDS support in the DU
    bindings
  drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
  drm: rcar-du: Convert LVDS encoder code to bridge driver
  ARM: dts: porter: Fix HDMI output routing
  ARM: dts: r8a7790: Convert to new LVDS DT bindings
  ARM: dts: r8a7791: Convert to new LVDS DT bindings
  ARM: dts: r8a7792: Convert to new DU DT bindings
  ARM: dts: r8a7793: Convert to new LVDS DT bindings
  ARM: dts: r8a7794: Convert to new DU DT bindings
  arm64: dts: renesas: r8a7795: Convert to new LVDS DT bindings
  arm64: dts: renesas: r8a7796: Convert to new LVDS DT bindings

 .../bindings/display/bridge/renesas,lvds.txt       |  56 +++
 .../devicetree/bindings/display/renesas,du.txt     |  31 +-
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/r8a7790-lager.dts                |  22 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |  60 ++-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |  10 +-
 arch/arm/boot/dts/r8a7791-porter.dts               |  18 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |  34 +-
 arch/arm/boot/dts/r8a7792.dtsi                     |   1 -
 arch/arm/boot/dts/r8a7793-gose.dts                 |  10 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |  34 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |   1 -
 .../boot/dts/renesas/r8a7795-es1-salvator-x.dts    |   3 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |   3 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |   3 +-
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts |   3 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  34 +-
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     |   3 +-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |   3 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  34 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |   6 +-
 drivers/gpu/drm/rcar-du/Makefile                   |  10 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   7 -
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   3 -
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  21 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   5 -
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          | 175 +------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |  12 -
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |  13 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |  93 ----
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h          |  24 -
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c          | 238 ----------
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h          |  64 ---
 drivers/gpu/drm/rcar-du/rcar_du_of.c               | 374 +++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_of.h               |  20 +
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  81 ++++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  55 +++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  55 +++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  55 +++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  55 +++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 524 +++++++++++++++++++++
 42 files changed, 1561 insertions(+), 707 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_lvds.c

-- 
Regards,

Laurent Pinchart
