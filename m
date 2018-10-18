Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45404 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbeJRIkD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Oct 2018 04:40:03 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/3] R-Car LVDS: Add R8A77965 (M3-N) support
Date: Thu, 18 Oct 2018 03:41:46 +0300
Message-Id: <20181018004149.29448-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This small patch series adds support for the M3-N internal LVDS encoder in the
DT bindings, the LVDS encoder driver and the M3-N .dtsi.

Please see individual patches for details.

The series is based on a merge of Simon's devel branch and the DRM -next
branch.

Laurent Pinchart (2):
  dt-bindings: display: renesas: lvds: Document r8a77965 bindings
  drm: rcar-du: lvds: Add R8A77965 support
  arm64: dts: renesas: r8a77965: Add LVDS support

 arch/arm64/boot/dts/renesas/r8a77965.dtsi               | 27 ++++++++++++++++
 .../devicetree/bindings/display/bridge/renesas,lvds.txt | 1  +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                     | 1  +
 3 files changed, 29 insertions(+)

-- 
Regards,

Laurent Pinchart
