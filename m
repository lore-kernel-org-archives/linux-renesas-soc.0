Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751172AbdIORCm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 13:02:42 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org, geert@glider.be
Subject: [PULL REQUEST] vsp-du: Provide support for DU Suspend and Resume
Date: Fri, 15 Sep 2017 18:02:40 +0100
Message-Id: <1505494960-5770-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The following changes since commit ac74d019be78a24c610f9fb1f007bb46dbcf6fba:

  Merge remote-tracking branch 'airlied-drm/drm-next' into vsp1/next (2017-09-15 14:40:32 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp-du/du-suspend-resume/v1

for you to fetch changes up to 29952c78e7fa4533f18bbf629dd01a95abdfd61f:

  drm: rcar-du: Remove unused CRTC suspend/resume functions (2017-09-15 14:45:31 +0100)

----------------------------------------------------------------
VSP1 and DU Suspend Resume v1

Support DU suspend and resume, with a bug fix in VSP1 and (re-)implementation
in rcar-du of the suspend handlers

----------------------------------------------------------------
Kieran Bingham (3):
      media: vsp1: Prevent resuming DRM pipelines
      drm: rcar-du: Add suspend resume helpers
      drm: rcar-du: Remove unused CRTC suspend/resume functions

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 35 ----------------------------------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 18 ++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
 drivers/media/platform/vsp1/vsp1_drv.c |  8 +++++++-
 4 files changed, 23 insertions(+), 39 deletions(-)
