Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E43C43460
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 May 2021 06:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA85E61184
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 May 2021 06:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhETGwR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 May 2021 02:52:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35674 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhETGwQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 May 2021 02:52:16 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A3AFDEE;
        Thu, 20 May 2021 08:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621493454;
        bh=7qhbhjQahaK9N+tXjfFkjKUsFUKQOo1QWnXmw+ag19U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SZUsBM9wFhpxWvRXpbZFlg/7jvRUxpYFP2QOe95oFDd/pHzNtS6CAY9TA7fLpNv5s
         4mQ3oTR6I7XbA028iuT4KMf9zvTNLmg7o1mi/FrJwnpiBOZVhzJmzoceVYMtzCuuzc
         fL0wmHmnNknxkkT2BcRdO59KhVBUKixH/mUjo2og=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 3/4] drm: rcar-du: dw-hdmi: Set output port number
Date:   Thu, 20 May 2021 09:50:45 +0300
Message-Id: <20210520065046.28978-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Report the DT output port number in dw_hdmi_plat_data to connect to the
next bridge in the dw-hdmi driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
index 7b8ec8310699..18ed14911b98 100644
--- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -75,6 +75,7 @@ static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi, void *data,
 }
 
 static const struct dw_hdmi_plat_data rcar_dw_hdmi_plat_data = {
+	.output_port = 1,
 	.mode_valid = rcar_hdmi_mode_valid,
 	.configure_phy	= rcar_hdmi_phy_configure,
 };
-- 
Regards,

Laurent Pinchart

