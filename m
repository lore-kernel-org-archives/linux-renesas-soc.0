Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B158C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5345F20663
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A2DRcZEX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfCFXYJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46758 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfCFXYI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:08 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98527E66;
        Thu,  7 Mar 2019 00:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914641;
        bh=/l8mrFsuPvh1e2UJg2MCsrj0bMOopuyMA+hlXso3LAA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A2DRcZEXUZ6gU2lQounEtOQNugrpWTVhVuxhr5aps6Z8Qxkiph7F7DvvIoMJ9Ghy4
         d0fXQa56igZwMLImCo/ImMK8HkZ3zshcdH45PSh9tMbwD8FaAsgjrEYv4X2qvPwq5e
         8lYyjJdMv37bYi5t5bSAQj7SgQqzqb1UNFwmooeM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH/RFC 10/15] drm: rcar-du: lvds: Set LVEN and LVRES bits together on D3
Date:   Thu,  7 Mar 2019 01:23:40 +0200
Message-Id: <20190306232345.23052-11-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On the D3 SoC the LVDS PHY must be enabled in the same register write
that enables the LVDS output. Skip writing the LVEN bit independently
on that platform, it will be set by the write that sets LVRES.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index b1abe737dc05..5ac92ee15be0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -475,9 +475,13 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	}
 
 	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
-		/* Turn on the LVDS PHY. */
+		/*
+		 * Turn on the LVDS PHY. On D3, the LVEN and LVRES bit must be
+		 * set at the same time, so don't write the register yet.
+		 */
 		lvdcr0 |= LVDCR0_LVEN;
-		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+		if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_PWD))
+			rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 	}
 
 	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
-- 
Regards,

Laurent Pinchart

