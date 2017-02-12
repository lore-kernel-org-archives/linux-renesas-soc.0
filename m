Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39290 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751153AbdBLMcI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Feb 2017 07:32:08 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] rcar-du: Enable fences support using atomic commit helper
Date: Sun, 12 Feb 2017 14:32:26 +0200
Message-Id: <20170212123229.18277-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series enables fences support in the rcar-du driver through
switching to the atomic commit helper.

Patches 1/3 and 2/3 prepare the driver to handle CRTC events the way expected
by the atomic commit helper. Patch 3/3 then replaces the custom atomic commit
handler with the atomic commit helper, using a custom commit tail handler to
support the driver-specific CRTC enable/disable and plane commit order.

Patch 3/3 depends on the "[PATCH] drm: Constify drm_mode_config atomic helper
private pointer" (merged in drm-misc) for proper compilation, and on
"[PATCH v3 0/7] drm/atomic: Add accessor macros for all atomic state" (posted
to the dri-devel mailing list) for proper runtime operation of asynchronous
commits.

Laurent Pinchart (3):
  drm: rcar-du: Handle event when disabling CRTCs
  drm: rcar-du: Clear handled event pointer in CRTC state
  drm: rcar-du: Use DRM core's atomic commit helper

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 13 +++--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c  | 99 ++++------------------------------
 2 files changed, 19 insertions(+), 93 deletions(-)

-- 
Regards,

Laurent Pinchart
