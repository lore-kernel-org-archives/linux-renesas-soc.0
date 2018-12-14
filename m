Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51ACC67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 07:25:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9258D2080F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 07:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9258D2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jinso.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbeLNHZ3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 02:25:29 -0500
Received: from www3345.sakura.ne.jp ([49.212.235.55]:18890 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbeLNHZ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 02:25:29 -0500
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id wBE7PR8p037806;
        Fri, 14 Dec 2018 16:25:27 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav109.sakura.ne.jp);
 Fri, 14 Dec 2018 16:25:27 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav109.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id wBE7PJPR037673
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 14 Dec 2018 16:25:26 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc:     kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [PATCH 1/2] drm: rcar-du: Add Standby Mode support
Date:   Fri, 14 Dec 2018 16:25:17 +0900
Message-Id: <1544772318-17408-1-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Add function support for Module Standby Mode

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 90dacab..935cdd1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -651,6 +651,32 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 	rcar_du_group_start_stop(rcrtc->group, false);
 }
 
+int rcar_du_crtc_standby(struct rcar_du_crtc *rcrtc)
+{
+	u32 val_reg;
+	unsigned int i = 0;
+
+	/* Enter Standby mode */
+	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN, 0);
+
+	for(i = 100; i > 0; i--)
+	{
+		val_reg = rcar_du_crtc_read(rcrtc, DSSR);
+		if(!(val_reg & DSSR_VBK))
+			break;
+		udelay(10);
+	}
+
+	if(!(i > 0))
+		return -ETIMEDOUT;
+
+	/* Stop clock */
+	clk_set_rate(rcrtc->extclock, 0);
+	clk_set_rate(rcrtc->clock, 0);
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * CRTC Functions
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 59ac6e7..6e0de42 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -99,6 +99,7 @@ enum rcar_du_output {
 
 int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 			unsigned int hwindex);
+int rcar_du_crtc_standby(struct rcar_du_crtc *rcrtc);
 void rcar_du_crtc_suspend(struct rcar_du_crtc *rcrtc);
 void rcar_du_crtc_resume(struct rcar_du_crtc *rcrtc);
 
-- 
2.7.4

