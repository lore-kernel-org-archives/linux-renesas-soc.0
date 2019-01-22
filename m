Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0781CC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 15:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA966217D6
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 15:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbfAVPbG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 10:31:06 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:55389 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729207AbfAVPbF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 10:31:05 -0500
X-IronPort-AV: E=Sophos;i="5.56,506,1539615600"; 
   d="scan'208";a="5680250"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2019 00:31:03 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5A2884007C5D;
        Wed, 23 Jan 2019 00:31:00 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v3 3/5] drm: rcar-du: lvds: Add r8a7744 support
Date:   Tue, 22 Jan 2019 15:25:47 +0000
Message-Id: <1548170749-12773-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The LVDS encoders on RZ/G1N SoC is similar to RZ/G1M. Add support for
RZ/G1N (R8A7744) SoC to the LVDS encoder driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 96d749a..caea2c5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -785,6 +785,7 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
 
 static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
+	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a774c0-lvds", .data = &rcar_lvds_r8a77990_info },
 	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
 	{ .compatible = "renesas,r8a7791-lvds", .data = &rcar_lvds_gen2_info },
-- 
2.7.4

