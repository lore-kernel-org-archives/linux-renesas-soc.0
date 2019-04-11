Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBB0C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 07:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55F1721850
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 07:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfDKHzR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 03:55:17 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:50252 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfDKHzR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 03:55:17 -0400
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3B7t5NA039534;
        Thu, 11 Apr 2019 16:55:05 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav109.sakura.ne.jp);
 Thu, 11 Apr 2019 16:55:05 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav109.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3B7t3Fl039505
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 11 Apr 2019 16:55:05 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [PATCH v2 14/20] dt-bindings: display: renesas: lvds: Add r8a77470 support
Date:   Thu, 11 Apr 2019 16:54:16 +0900
Message-Id: <1554969262-15028-15-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add lvds support and document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                               | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
index a720dbb..f720883 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -9,6 +9,7 @@ Required properties:
 - compatible : Shall contain one of
   - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
   - "renesas,r8a7744-lvds" for R8A7744 (RZ/G1N) compatible LVDS encoders
+  - "renesas,r8a77470-lvds" for R8A77470 (RZ/G1C) compatible LVDS encoders
   - "renesas,r8a774c0-lvds" for R8A774C0 (RZ/G2E) compatible LVDS encoders
   - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
   - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS encoders
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index f7e4710..61a536f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -925,6 +925,7 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
 static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
+	{ .compatible = "renesas,r8a77470-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a774c0-lvds", .data = &rcar_lvds_r8a77990_info },
 	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
 	{ .compatible = "renesas,r8a7791-lvds", .data = &rcar_lvds_gen2_info },
-- 
2.7.4

