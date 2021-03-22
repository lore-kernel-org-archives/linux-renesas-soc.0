Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ABDC433E2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 22 Mar 2021 03:03:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6988F61928
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 22 Mar 2021 03:03:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhCVDC4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 21 Mar 2021 23:02:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35480 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhCVDCY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 23:02:24 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F6D51023;
        Mon, 22 Mar 2021 04:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616382138;
        bh=qTSL3Zo26gmQDgDc4XC2lHSwH2Ynw6KKyyxnLEfXNoQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oLoqlWK1dmvH5WZZ8h6X4dWmRzhZBWfsNs70Unq9y0aTqLw+HQGvpXVbVU3hxruqN
         V820hxk9V6Wb2B71B1zgI6ePJAUhL6UIiNsxcnaupxUU5h2IDDi36Cri1sqXuHDNLX
         u6mZ72gV9U0yABXYOHAyPgDQTsfwSexGp/l7Xsnc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 03/11] drm/bridge: ti-sn65dsi86: Unregister AUX adapter in remove()
Date:   Mon, 22 Mar 2021 05:01:20 +0200
Message-Id: <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The AUX adapter registered in probe() need to be unregistered in
remove(). Do so.

Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index da78a12e58b5..c45420a50e73 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1307,6 +1307,9 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 		return -EINVAL;
 
 	kfree(pdata->edid);
+
+	drm_dp_aux_unregister(&pdata->aux);
+
 	ti_sn_debugfs_remove(pdata);
 
 	of_node_put(pdata->host_node);
-- 
Regards,

Laurent Pinchart

