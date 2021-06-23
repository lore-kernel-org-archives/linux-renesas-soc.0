Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D826C2B9F4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jun 2021 03:07:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC74A601FE
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jun 2021 03:07:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhFWDJh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jun 2021 23:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFWDJg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:09:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A898C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 20:07:20 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BE869B1;
        Wed, 23 Jun 2021 05:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624417639;
        bh=052lPGGPzvKrwnQudRfcCLXlzUFxaRL8WCqYmcGFWG8=;
        h=From:To:Cc:Subject:Date:From;
        b=Hg7J3toWw6YheP/74GLsj1/YehZqaRiQjAywp5XCa5YkZkTfdID2NEGefYpc2h5d/
         yWnAYXrdyJz/TkHmKa/oePBvz5V5kbyGp3dsWoCFsZGNJVJB7fWdh99uAqGKC6WmDi
         mCg9Y65NAIxOvoqFtwoqk76rlYDeZom5ZbcTo0t0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: lvds: use dev_err_probe()
Date:   Wed, 23 Jun 2021 06:06:46 +0300
Message-Id: <20210623030646.7720-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Simplify error handling by using the dev_err_probe() function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 5909173b26eb..165be31c4c45 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -839,9 +839,8 @@ static struct clk *rcar_lvds_get_clock(struct rcar_lvds *lvds, const char *name,
 	if (PTR_ERR(clk) == -ENOENT && optional)
 		return NULL;
 
-	if (PTR_ERR(clk) != -EPROBE_DEFER)
-		dev_err(lvds->dev, "failed to get %s clock\n",
-			name ? name : "module");
+	dev_err_probe(lvds->dev, PTR_ERR(clk), "failed to get %s clock\n",
+		      name ? name : "module");
 
 	return clk;
 }
-- 
Regards,

Laurent Pinchart

