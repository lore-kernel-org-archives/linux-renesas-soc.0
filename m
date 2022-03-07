Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3D4C433F5
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Mar 2022 18:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244606AbiCGSBB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 13:01:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244597AbiCGSBA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 13:01:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485715C343
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 10:00:06 -0800 (PST)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2384851C;
        Mon,  7 Mar 2022 19:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646676004;
        bh=qrw2gGZZSAH8WzuW1hnu0e5cP7sznDYGRbaWMpNFiKU=;
        h=From:To:Cc:Subject:Date:From;
        b=uwvor2gnw+FSjbIUF5QmokCQDXUBK9yjjZA8TyKyHkInbJDMd0+bxuieCznC7MMnl
         Cnc1ZQMLIPQTOFocNcUQ0y0BNbTDXV6Fgh9/wDz6TeJ9vvTv47V5AJQ7o/Xjqop4aj
         Qw9LdZtWWe9IJz3NLzVLlRXZSCWYpHIeOBTtd54M=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 0/4] drm/bridge: ti-sn65dsi86: Support non-eDP DisplayPort connectors
Date:   Mon,  7 Mar 2022 17:59:51 +0000
Message-Id: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Implement support for non eDP connectors on the TI-SN65DSI86 bridge, and
provide IRQ based hotplug detect to identify when the connector is
present.

no-hpd is extended to be the default behaviour for non DisplayPort
connectors.

This series is based on top of José Expósito's patch [0] "drm/bridge:
ti-sn65dsi86: switch to devm_drm_of_get_bridge" and Nikita Yushchenko's
patch [1] "drm/bridge_connector: enable HPD by default if supported".

[0] https://lore.kernel.org/all/20220228183955.25508-1-jose.exposito89@gmail.com/
[1] https://lore.kernel.org/all/20211225063151.2110878-1-nikita.yoush@cogentembedded.com/

Kieran Bingham (1):
  drm/bridge: ti-sn65dsi86: Support hotplug detection

Laurent Pinchart (3):
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations
  drm/bridge: ti-sn65dsi86: Make connector creation optional
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 178 ++++++++++++++++++++++----
 1 file changed, 156 insertions(+), 22 deletions(-)

-- 
2.32.0

