Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20055C433EF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Feb 2022 17:13:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348967AbiBUROT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Feb 2022 12:14:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343840AbiBUROT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 12:14:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9CE2611C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 09:13:55 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A454482;
        Mon, 21 Feb 2022 18:13:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645463633;
        bh=E0OKuErSDL1WNEJCzwYNIQlTzecUYcbH1CPyRCYIpT8=;
        h=From:To:Cc:Subject:Date:From;
        b=CefefJs3LrohP7qQmJxmeVCstcxqU7EDFGoDk0UrPmq0s4Ve1GP/s1VubTYIYQzS9
         tW+u/gN8YJJkAYXuKhCbX0Yyrl5hDyu36j+Z6u4fNs45gD0Tda100lpO7ftZZDrzg8
         8dBu12uhNcsNApGCXrAn6uVLZgIkrtyK0iia4T78=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Michael Rodin <mrodin@de.adit-jv.com>, michael@rodin.online,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com
Subject: [PATCH 0/2] drm: rcar-du: Avoid flicker when enabling a VSP plane
Date:   Mon, 21 Feb 2022 19:13:38 +0200
Message-Id: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series avoids flicker in some scenarios related to dual
output configuration.

The issue was originally reported by Michael Rodin in [1]. The problem
is described in details there, and copied here to facilitate discussion:

--------
Restarting a display unit group can cause a visible flicker on the display.
Particularly when a LVDS display is connected to a Salvator board and an
HDMI display is (re)connected, then there will be 2 visible flickers on the
LVDS display:

 1. during atomic_flush (The need_restart flag is set in this case by
    rcar_du_vsp_enable.):
  rcar_du_crtc_atomic_flush
    rcar_du_crtc_update_planes
      ...
      ...
      /* Restart the group if plane sources have changed. */
      if (rcrtc->group->need_restart)
              rcar_du_group_restart(rcrtc->group);
 2. during atomic_enable:
  rcar_du_crtc_atomic_enable
    rcar_du_crtc_start
      rcar_du_group_start_stop(rcrtc->group, true);

To avoid flickers in all use cases, do not restart DU groups on the Gen3
SoCs at all, since it is not required any more.
--------

The proposed patch unfortunately introduced a regression. This series
fixes the issue in the first scenario described above. The second
scenario still leads to flicker, and I don't think that can be fixed as
the hardware requires the whole group of outputs to be stopped for some
register changes to take effect.

[1] https://lore.kernel.org/dri-devel/1637680811-90510-1-git-send-email-mrodin@de.adit-jv.com

Laurent Pinchart (2):
  drm: rcar-du: Don't select VSP1 sink on Gen3
  drm: rcar-du: Don't restart group when enabling plane on Gen3

 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 12 ++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |  9 ---------
 2 files changed, 10 insertions(+), 11 deletions(-)

-- 
Regards,

Laurent Pinchart

