Return-Path: <SRS0=YZYO=5Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F864C2BA2B
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 00:36:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC03B2078E
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 00:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fcAu+wjB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgDIAgw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 8 Apr 2020 20:36:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39476 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbgDIAgv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 20:36:51 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0F9C2DC;
        Thu,  9 Apr 2020 02:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586392610;
        bh=llMVLB099oOYeZ3D8OnWk599VQrLiuIALgpwEDkkeHs=;
        h=From:To:Cc:Subject:Date:From;
        b=fcAu+wjBiZNy1Xbk7Au1SYIMai5D3Wp2nuVdDRxk1ZJSAJpNhC83AJQw0RwHuM7/i
         8JHgbx2dzkqoEvBSa5dCqUlrfTp4iYlqfcV3ajhjZs+7+ZwathJzmYzErI/0tqIEDb
         +Lz1oRldCZHSpKSxkfJxh3H27wnJCgY5M/irk06c=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/2] drm: bridge: simple-bridge: Enable usage with DRM bridge connector helper
Date:   Thu,  9 Apr 2020 03:36:34 +0300
Message-Id: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This small patch series enables usage of the simple-bridge driver with
the DRM bridge connector helper (drm_bridge_connector.c). Patch 1/2
starts by simplifying the driver by delegating DDC handling to the next
bridge in the chain, and patch 2/2 makes the connector creation
optional.

I will continue converting existing bridge drivers to this new model,
starting with the adv7511, rcar-lvds and dw-hdmi bridges. Anyone willing
to give a and converting additional bridge drivers is more than welcome
:-)

Laurent Pinchart (2):
  drm: bridge: simple-bridge: Delegate operations to next bridge
  drm: bridge: simple-bridge: Make connector creation optional

 drivers/gpu/drm/bridge/simple-bridge.c | 107 +++++++++----------------
 1 file changed, 36 insertions(+), 71 deletions(-)

-- 
Regards,

Laurent Pinchart

