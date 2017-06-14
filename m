Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751735AbdFNT6R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 15:58:17 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v5 0/2] ADV748x HDMI/Analog video receiver
Date: Wed, 14 Jun 2017 20:58:11 +0100
Message-Id: <cover.90fc3153078e79a3f74af832de923ac675eb29ad.1497469745.git-series.kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

This is a driver for the Analog Devices ADV748x device, and follows on from a
previous posting by Niklas Söderlund [0] of an earlier incarnation of this
driver.

Aside from a few bug fixes, and considerable refactoring this driver:
 - is refactored to multiple object files
 - defines multiple sub devices for the output paths.
 - has independent controls for both HDMI and Analog video paths
 - Specifies 'endpoint' matching instead of 'device' in async framework

These patches are based up on Niklas' pending RVin work [1] and Sakari's fwnode
series [2]

This version is the culmination of large refactoring and development, and I
believe is ready (or near) for mainline integration.

ADV748x
=======
The ADV7481 and ADV7482 support two video pipelines which can run independently
of each other, with each pipeline terminating in a CSI-2 output: TXA (4-Lane)
and TXB (1-Lane)

The ADV7480 (Not included here), ADV7481, and ADV7482 are all derivatives,
with the following features

            Analog   HDMI  MHL  4-Lane  1-Lane
              In      In         CSI     CSI
 ADV7480               X    X     X
 ADV7481      X        X    X     X       X
 ADV7482      X        X          X       X

Implementation
==============

This series creates 4 entities. AFE (CVBS/Analog In), HDMI, TXA and TXB.  At
probe time, the DT is parsed to identify the endpoints for each of these nodes,
and those are used for async matching of the CSI2 (TXA/TXB) entities in the
master driver. The HDMI and AFE entities are then registered after a successful
registration of both the CSI2 entities.

HDMI is statically linked to the TXA entity, while the AFE is statically linked
to the TXB entity. Routing the AFE through TXA is not supported.

(Known) Future Todo's
=====================

Further potential development areas include:
 - ADV7480 Support (No AFE)
 - MHL support (Not present on ADV7482)
 - EDID support
 - CEC Support
 - Configurable I2C addressing
 - Interrupt handling for format changes and hotplug detect.

However, this driver is functional without the above, and these developments
can be written when required.

References
==========
[0] http://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg05196.html
[1] https://git.ragnatech.se/linux rcar-vin-elinux-v9
[2] https://www.mail-archive.com/linux-media@vger.kernel.org/msg111332.html

v1/RFC:
 - Initial posting

v2:
 - Reworked DT parsing and entities

v3:
 - Refreshed with lots of fixups from Sakari's review comments

v4:
 - Many changes all round, following Laurent's review and extensive development
 - Now uses regmap
 - AFE port numbering has been changed to match the entity pads

v5:
 - DT is now based on the latest salvator-common.dtsi
 - Entities are linked with immutable connections

Kieran Bingham (2):
  media: i2c: adv748x: add adv748x driver
  arm64: dts: renesas: salvator-x: Add ADV7482 support

 Documentation/devicetree/bindings/media/i2c/adv748x.txt |  96 +-
 MAINTAINERS                                             |   6 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi        | 123 +-
 drivers/media/i2c/Kconfig                               |  11 +-
 drivers/media/i2c/Makefile                              |   1 +-
 drivers/media/i2c/adv748x/Makefile                      |   7 +-
 drivers/media/i2c/adv748x/adv748x-afe.c                 | 570 ++++++-
 drivers/media/i2c/adv748x/adv748x-core.c                | 831 +++++++++-
 drivers/media/i2c/adv748x/adv748x-csi2.c                | 327 ++++-
 drivers/media/i2c/adv748x/adv748x-hdmi.c                | 651 +++++++-
 drivers/media/i2c/adv748x/adv748x.h                     | 415 ++++-
 11 files changed, 3038 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.txt
 create mode 100644 drivers/media/i2c/adv748x/Makefile
 create mode 100644 drivers/media/i2c/adv748x/adv748x-afe.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x-core.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x-csi2.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x-hdmi.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x.h

base-commit: 53043171831f82e3f26280e4edd5852ca63d6e12
-- 
git-series 0.9.1
