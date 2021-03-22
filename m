Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EA8C433C1
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 22 Mar 2021 03:03:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4BF461930
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 22 Mar 2021 03:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhCVDCu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 21 Mar 2021 23:02:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35412 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbhCVDCT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 23:02:19 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6F1BAD6;
        Mon, 22 Mar 2021 04:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616382137;
        bh=oe1/Wdj5FWpelYYwipukb7KrPvZJeboz8t2tMJQq0V8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JeMvkBuUlkSYTdqIf575bAVcxz7npokYKm6lC8guDCrnkovUfqwxfIcvMuaFhbpP2
         kHV9nNxRL99mKvu5Y1tYC+8JwGcqt0J1Jihf3rbRcO6CNAWRHoyhVT7/gyMDvIvKNu
         VmIH8Ik9xepVKKjh5YFQQDJASjgxK9LNOXwFg1ts=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 01/11] dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
Date:   Mon, 22 Mar 2021 05:01:18 +0200
Message-Id: <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
global reset signal, not controllable by the kernel. Make it optional in
those cases.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 26932d2e86ab..2506765cb338 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -150,7 +150,6 @@ properties:
 required:
   - compatible
   - reg
-  - enable-gpios
   - vccio-supply
   - vpll-supply
   - vcca-supply
-- 
Regards,

Laurent Pinchart

