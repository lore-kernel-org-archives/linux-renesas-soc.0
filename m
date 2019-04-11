Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67214C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 14:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 369F62184E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 14:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfDKOlW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 10:41:22 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:62824 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726685AbfDKOlV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 10:41:21 -0400
X-IronPort-AV: E=Sophos;i="5.60,337,1549897200"; 
   d="scan'208";a="12768485"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Apr 2019 23:41:20 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2BA0E40579FD;
        Thu, 11 Apr 2019 23:41:17 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 4/4] drm: rcar-du: lvds: Add r8a774a1 support
Date:   Thu, 11 Apr 2019 15:34:31 +0100
Message-Id: <1554993271-29523-5-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
References: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The LVDS encoders on RZ/G2M SoC is similar to R-Car M3-W. Add support for
RZ/G2M (R8A774A1) SoC to the LVDS encoder driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 7ef97b2..819561e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -857,6 +857,7 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
 static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
+	{ .compatible = "renesas,r8a774a1-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a774c0-lvds", .data = &rcar_lvds_r8a77990_info },
 	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
 	{ .compatible = "renesas,r8a7791-lvds", .data = &rcar_lvds_gen2_info },
-- 
2.7.4

