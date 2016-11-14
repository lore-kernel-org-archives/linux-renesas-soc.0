Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36827 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753133AbcKNQjI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 11:39:08 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [PATCH 0/4] Renesas R-Car DU fixes
Date: Mon, 14 Nov 2016 18:39:08 +0200
Message-Id: <1479141552-8509-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This series contains four fixes for the R-Car DU driver, all backported or
inspired by the R-Car Gen3 BSP.

Please see individual patches for details.

Koji Matsuoka (3):
  drm: rcar-du: Fix display timing controller parameter
  drm: rcar-du: Fix H/V sync signal polarity configuration
  drm: rcar-du: Fix LVDS start sequence on Gen3

Laurent Pinchart (1):
  drm: rcar-du: Fix dot clock routing configuration

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  6 +++---
 drivers/gpu/drm/rcar-du/rcar_du_group.c   | 22 +++++++++++++---------
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 15 ++++++++-------
 3 files changed, 24 insertions(+), 19 deletions(-)

-- 
Regards,

Laurent Pinchart
