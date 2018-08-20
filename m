Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45576 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbeHTTRC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 15:17:02 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/2] drm: rcar-du: Add interlaced feature support flag
Date: Mon, 20 Aug 2018 17:00:42 +0100
Message-Id: <20180820160044.15783-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R-Car DU on the D3 and E3 does not support interlaced pipelines,
thus we need to have a means to reject interlaced configurations on
those platoforms.

Provide a new feature flag, and add that flag to all existing devices
which currently support interlaced pipelines.

When D3 and E3 support is added, this feature flag shall be ommited.



Kieran Bingham (2):
  drm: rcar-du: Refactor Feature and Quirk definitions
  drm: rcar-du: Add interlaced feature flag

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 14 +++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 32 +++++++++++++++++---------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  9 ++++----
 3 files changed, 40 insertions(+), 15 deletions(-)

-- 
2.17.1
