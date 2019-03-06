Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9C9C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2EFBB206DD
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cUnsyA8p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfCFXYA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfCFXYA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:00 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D292A242;
        Thu,  7 Mar 2019 00:23:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914637;
        bh=ydlfBvlhIIB6j3aTDyRhk8Hi8fAXCqeBs16UpbQ3Klo=;
        h=From:To:Cc:Subject:Date:From;
        b=cUnsyA8p/syedFvPkKP7YJ3S6YzWj5jLT+pjjKimHqN0lZpUo7tTBZ5sLcG0kbhkz
         USx3Es6IagmNTuH5CJAdTkZ0sKKbr6SD9zsFlAtiALN5YBDtK0VOSf2kEMVLRWSJvz
         jQleuRHy6bEF0eZqtJ5Sw2h+SzY3odudOJ3Zy814=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH/RFC 00/15] R-Car DU: LVDS dual-link mode support
Date:   Thu,  7 Mar 2019 01:23:30 +0200
Message-Id: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello everybody,

This patch series implements support for LVDS dual-link mode in the
R-Car DU and R-Car LVDS encoder drivers, and well as in the thc63lvd1024
LVDS decoder driver. I decided to tag it with RFC as it includes an
extension to the drm_bridge API.

LVDS dual-link is a mode of operation where two individual LVDS links
are operated together to carry even- and odd-numbered pixels separately.
This doubles the possible bandwidth of the video transmission. Both the
transmitter and the receiver need to support this mode of operation.

The R-Car D3 and E3 SoCs include two independent LVDS encoders that can
be grouped together to operate in dual-link mode. When used separately,
the LVDS encoders are connected to two different CRTCs and transmit
independent video streams. When used in dual-link mode, the first LVDS
encoder is connected to the first CRTC, and split even- and odd-numbered
pixels. It transmits half of the pixels on its LVDS output, and sends
the other half to the second LVDS encoder for transmittion over the
second LVDS link. The second LVDS encoder thus operates under control of
the first one, and isn't connected directly to a CRTC.

On the receiving side, the THC63LVD1024 LVDS-to-parallel bridge has two
LVDS inputs and two parallel outputs. It can operate in four different
modes:

- Single-in, single-out: The first LVDS input receives the video stream,
  and the bridge outputs it on the first parallel output. The second
  LVDS input and the second parallel output are not used.

- Single-in, dual-out: The first LVDS input receives the video stream,
  and the bridge splits even- and odd-numbered pixels and outputs them
  on the first and second parallel outputs. The second LVDS input is not
  used.

- Dual-in, single-out: The two LVDS inputs are used in dual-link mode,
  and the bridge combines the even- and odd-numbered pixels and outputs
  them on the first parallel output. The second parallel output is not
  used.

- Dual-in, dual-out: The two LVDS inputs are used in dual-link mode,
  and the bridge outputs the even- and odd-numbered pixels on the first
  parallel output.

The operating mode is selected by two input pins of the bridge, which
are connected to DIP switches on the development boards I use. The mode
is thus fixed from a Linux point of view.

The first three patches are borrowed from the omapdrm pending rework.
They clarify the DRM bus flags and extend the drm_bridge_timings to
report input bus flags instead of just the input sampling edge. They
have been extensively reviewed, there's no need to comment on them here.

Patch 04/15 adds a new dual_link boolen field to the drm_bridge_timings
structure to let bridges report their LVDS mode of operation. Patch
05/15 clarifies the THC63LVD1024 DT bindings to document dual-link
operation, and patch 06/15 implements dual-link support in the
thc64lvd1024 bridge driver by setting the drm_bridge_timings dual_link
field according to the mode selected through DT.

Patch 07/15 extends the R-Car LVDS DT bindings to specify the companion
LVDS encoder for dual-link operation. Patches 08/15 to 10/15 then clean
up the LVDS encoder driver and fix a couple of issues related to the D3
and E3 SoCs. Patch 11/15 implements dual-link support in the LVDS
encoder driver, which involves retrieving the operation mode from the
LVDS receiver, locating the companion LVDS encoder, and configuring both
encoders when dual-link operation is desired. The API towards the DU
driver is also extended to report the mode of operation.

Patch 12/15 implements dual-link mode support in the DU driver. There is
no specific configuration to be performed there, as dual-link is fully
implemented in the LVDS encoder driver, but the DU driver has to skip
creation of the DRM encoder and connector related to the second LVDS
encoder when dual-link is used, as the second LVDS encoder operates as a
slave of the first one, transparently from a CRTC (and thus userspace)
perspective.

Patch 13/15 specifies the companion LVDS encoder in the D3 and E3 DT
bindings. This by itself doesn't enable dual-link mode, the LVDS0
encoder is still connected to the HDMI output through LVDS receiver, and
the LVDS1 encoder is not used. Patches 14/15 and 15/15, not intended to
be merged, enable dual-link operation for the D3 and E3 boards for
testing and require flipping DIP switches on the boards.

The patches are based on top of my drm/du/next branch, and are available
for convenience at

	git://linuxtv.org/pinchartl/media.git drm/du/lvds/dual-link

They have been tested successfully on the D3 Draak board. I expect them
to work on E3 as well, but I don't have access to an Ebisu board to test
this.

Laurent Pinchart (14):
  drm: Clarify definition of the DRM_BUS_FLAG_(PIXDATA|SYNC)_* macros
  drm: Use new DRM_BUS_FLAG_*_(DRIVE|SAMPLE)_(POS|NEG)EDGE flags
  drm: bridge: Add dual_link field to the drm_bridge_timings structure
  dt-bindings: display: bridge: thc63lvd1024: Document dual-link
    operation
  drm: bridge: thc63: Report input bus mode through bridge timings
  dt-bindings: display: renesas: lvds: Add renesas,companion property
  drm: rcar-du: lvds: Remove LVDS double-enable checks
  drm: rcar-du: lvds: Adjust operating frequency for D3 and E3
  drm: rcar-du: lvds: Set LVEN and LVRES bits together on D3
  drm: rcar-du: lvds: Add support for dual-link mode
  drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
  arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1
  [HACK] arm64: dts: renesas: draak: Enable LVDS dual-link operation
  [HACK] arm64: dts: renesas: ebisu: Enable LVDS dual-link operation

Stefan Agner (1):
  drm/bridge: use bus flags in bridge timings

 .../bindings/display/bridge/renesas,lvds.txt  |   6 +
 .../display/bridge/thine,thc63lvd1024.txt     |   7 +
 .../arm64/boot/dts/renesas/r8a77990-ebisu.dts |  21 ++-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   2 +
 .../arm64/boot/dts/renesas/r8a77995-draak.dts |  21 ++-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   2 +
 drivers/gpu/drm/bridge/dumb-vga-dac.c         |   6 +-
 drivers/gpu/drm/bridge/tc358767.c             |   4 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c         |  46 ++++--
 drivers/gpu/drm/drm_modes.c                   |  12 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c    |   2 +-
 drivers/gpu/drm/imx/ipuv3-crtc.c              |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c            |   6 +-
 .../gpu/drm/omapdrm/displays/encoder-tfp410.c |   5 +-
 .../displays/panel-lgphilips-lb035q02.c       |   5 +-
 .../omapdrm/displays/panel-nec-nl8048hl11.c   |   5 +-
 .../displays/panel-sharp-ls037v7dw01.c        |   5 +-
 .../omapdrm/displays/panel-sony-acx565akm.c   |   5 +-
 .../omapdrm/displays/panel-tpo-td028ttec1.c   |   5 +-
 .../omapdrm/displays/panel-tpo-td043mtea1.c   |   5 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c             |   4 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c             |   4 +-
 drivers/gpu/drm/omapdrm/omap_encoder.c        |   8 +-
 drivers/gpu/drm/panel/panel-arm-versatile.c   |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c  |   4 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   |   2 +-
 drivers/gpu/drm/panel/panel-simple.c          |  24 +--
 drivers/gpu/drm/panel/panel-tpo-tpg110.c      |  10 +-
 drivers/gpu/drm/pl111/pl111_display.c         |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  12 ++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c           | 140 +++++++++++++-----
 drivers/gpu/drm/rcar-du/rcar_lvds.h           |   5 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   4 +-
 drivers/gpu/drm/tve200/tve200_display.c       |   3 +-
 include/drm/drm_bridge.h                      |  19 ++-
 include/drm/drm_connector.h                   |  36 ++++-
 37 files changed, 329 insertions(+), 126 deletions(-)

-- 
Regards,

Laurent Pinchart

