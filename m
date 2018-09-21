Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:45027 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727681AbeIURhm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 13:37:42 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be
Cc: laurent.pinchart@ideasonboard.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH] drm: rcar-du: fix probe error when DRM_RCAR_DW_HDMI disabled
Date: Fri, 21 Sep 2018 20:49:02 +0900
Message-Id: <1537530543-29518-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Skip return EPROBE_DEFER when DRM_RCAR_DW_HDMI is disabled in case HDMI initialize.
At this time, the rcar-du driver not be able to successfully initialize
if disable DRM_RCAR_DW_HDMI (rcar_du_probe return error),
so can not use other features such as RGB Analog, this patch to fix.

Hoan Nguyen An (1):
  drm: rcar-du: fix probe error when DRM_RCAR_DW_HDMI disabled

 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.7.4
