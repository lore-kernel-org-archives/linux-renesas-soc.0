Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:39531 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbeHTSmd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 14:42:33 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ulrich.hecht+renesas@gmail.com, kieran.bingham@ideasonboard.com,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS)
Subject: [PATCH v2 0/2] drm: rcar-du: Rework clock configuration
Date: Mon, 20 Aug 2018 17:26:15 +0200
Message-Id: <1534778777-6002-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,
  second round for improved input dot clock selection procedure for R-Car DU
peripheral.

Please refer to the v1 cover letter for the background:
https://lkml.org/lkml/2018/7/30/702

compared to v1 I have squashed the small patch I initially separated from
Laurent's one, and have closed a comment on alignment from Kieran there.

The second patch has been greatly simplified, not taking into account
non-rounded clock rates provided by the external clock source. In this way the
only rates to compared are the CPG generated one and the one provided by the
external clock source.

Tested on M3-W Salvator-X board with VGA output in 1920x1080 mode.

With this patch applied:
 rcar-du feb00000.display: mode clock 148500000 ext rate 148500000
 rcar-du feb00000.display: rcar_du_crtc_set_display_timing: ESCR 0x0000000

The requested pixel clock is opportunely provided by the external clock source.

Without this patch:
 rcar-du feb00000.display: mode clock 148500000 extrate 108000000 rate 133333328 ESCR 0x00100002

The requested pixel clock is approximated by the CPG generated clock to 133,3
MHz, which for some monitor is not enough to correctly display any output.

Thanks
  j

Jacopo Mondi (1):
  drm: rcar-du: Improve non-DPLL clock selection

Laurent Pinchart (1):
  drm: rcar-du: Rework clock configuration based on hardware limits

v1 -> v2:
- Squash v1' [1/3] and [2/3]
- Simplify [3/3] only taking into account rounded rates provided by the external
  clock source.

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 143 +++++++++++++++++++--------------
 1 file changed, 83 insertions(+), 60 deletions(-)

--
2.7.4
