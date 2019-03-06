Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8CAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EE3E20663
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eYIvjFdQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfCFXYE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:04 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfCFXYE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:04 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECE379C8;
        Thu,  7 Mar 2019 00:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914639;
        bh=ydsRlSm2FAGElFSC9A6E/gNHX2afRhPMyV4tR486vaM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eYIvjFdQzlEn0+SbKTt/2c2nIeH5/r57aoOCOxkXNxWLLEJAXmr54OON27ukR+ag2
         P1H17Uf0zew+IG5ZVjoKHJDp/zD8TcCE+q4/62X2FMnEwWAM3USbW1nlbO3Y5SArpR
         HbMmzB42Mrl9Tn29hL3MKUAARbLfY1tlRZbPrbTg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH/RFC 04/15] drm: bridge: Add dual_link field to the drm_bridge_timings structure
Date:   Thu,  7 Mar 2019 01:23:34 +0200
Message-Id: <20190306232345.23052-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Extend the drm_bridge_timings structure with a new dual_link field to
indicate that the bridge's input bus carries data on two separate
physical links. The first use case is LVDS dual-link mode where even-
and odd-numbered pixels are transferred on separate LVDS links.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/drm/drm_bridge.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d4428913a4e1..aea1fcfd92a7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -265,6 +265,14 @@ struct drm_bridge_timings {
 	 * input signal after the clock edge.
 	 */
 	u32 hold_time_ps;
+	/**
+	 * @dual_link:
+	 *
+	 * True if the bus operates in dual-link mode. The exact meaning is
+	 * dependent on the bus type. For LVDS buses, this indicates that even-
+	 * and odd-numbered pixels are received on separate links.
+	 */
+	bool dual_link;
 };
 
 /**
-- 
Regards,

Laurent Pinchart

