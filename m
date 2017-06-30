Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:35661 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751668AbdF3IAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jun 2017 04:00:34 -0400
Date: Fri, 30 Jun 2017 11:00:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: rcar-du: remove an unneeded NULL check
Message-ID: <20170630080011.o5s7tbrcd7gob3et@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

"params" can't be NULL here.  The next lines assume that we either
hit the break statement of "params->mpixelclock == ~0UL".  The
inconsistent NULL checking makes static checkers complain.  I've just
removed the test.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
index 7539626b8ebd..dc85b53d58ef 100644
--- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -45,7 +45,7 @@ static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi,
 {
 	const struct rcar_hdmi_phy_params *params = rcar_hdmi_phy_params;
 
-	for (; params && params->mpixelclock != ~0UL; ++params) {
+	for (; params->mpixelclock != ~0UL; ++params) {
 		if (mpixelclock <= params->mpixelclock)
 			break;
 	}
