Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:37216 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732545AbeISVfh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 17:35:37 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/2] drm: Alpha blending issue
Date: Wed, 19 Sep 2018 16:56:57 +0100
Message-Id: <20180919155700.10342-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Testing on the RCar Salvaltor-XS using the rcar-du has identified that
commit 161ad653d6c9 ("drm: rcar-du: Use __drm_atomic_helper_plane_reset
instead of copying the logic") caused a regression in display output on
the primary planes.

The effect was that primary plane was 'invisible' though secondary
planes were displayed correctly.

This issue turned out to be a change in the initialisation of the
default alpha property value in the state object. A plane without an
alpha property would leave the alpha property unset (and thus at zero,
or 'transparent').

Two patches are thus presented, which both individually can fix this
regression - but both are suitable for integration.

The RCar-DU driver is updated to provide an alpha property on primary
planes, as it isn't unreasonable to be able to set the property there.
This alone would have the effect of ensuring that the default value was
set to the full opaque setting, and repair the regression.

As a separate patch, we also update __drm_atomic_helper_plane_reset()
call such that the alpha values are always initialised to a more
practical default value of DRM_BLEND_ALPHA_OPAQUE for all planes.


Kieran Bingham (2):
  drm/atomic: Initialise planes with opaque alpha values
  drm: rcar-du: Enable alpha property on primary planes

 drivers/gpu/drm/drm_atomic_helper.c     | 4 +---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 7 ++++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.17.1
