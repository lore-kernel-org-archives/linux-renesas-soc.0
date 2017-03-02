Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56999 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750867AbdCBLeH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2017 06:34:07 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v4 0/4] drm: bridge: New LVDS encoder driver
Date: Thu,  2 Mar 2017 12:47:24 +0200
Message-Id: <20170302104728.7150-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This series is a rebase of the LVDS encoder driver previously posted as part
of "[PATCH v3 00/13] R-Car DU: Use drm bridge API" on top of the latest
drm-misc.

The DT bindings have been acked by Rob Herring, and the vga-dac change by
Maxime Ripard. Daniel Vetter reported in a public reply to "[PATCH v3 06/13]
drm: bridge: Add LVDS encoder driver" that he was fine with the patch and gave
me permission to add his Acked-by in a private conversation.

For convenience the patches are available in a git branch at

	git://linuxtv.org/pinchartl/media.git drm-next-lvds-encoder-v4-20170302

Archit, would you be able to do a final review of the driver code and merge it
if everything looks good to you ?

Laurent Pinchart (4):
  devicetree/bindings: display: bridge: Add LVDS encoder DT bindings
  drm: bridge: Add LVDS encoder driver
  drm: bridge: vga-dac: Add adi,adv7123 compatible string
  drm: bridge: lvds-encoder: Add thine,thc63lvdm83d compatible string

 .../bindings/display/bridge/lvds-transmitter.txt   |  64 +++++++
 drivers/gpu/drm/bridge/Kconfig                     |   9 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/dumb-vga-dac.c              |   1 +
 drivers/gpu/drm/bridge/lvds-encoder.c              | 210 +++++++++++++++++++++
 5 files changed, 285 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
 create mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c

-- 
Regards,

Laurent Pinchart
