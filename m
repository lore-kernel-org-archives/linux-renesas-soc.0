Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C13C67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 07:25:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAAAC2080F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 07:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAAAC2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jinso.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbeLNHZe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 02:25:34 -0500
Received: from www3345.sakura.ne.jp ([49.212.235.55]:18945 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbeLNHZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 02:25:34 -0500
Received: from fsav405.sakura.ne.jp (fsav405.sakura.ne.jp [133.242.250.104])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id wBE7PWAh037856;
        Fri, 14 Dec 2018 16:25:32 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav405.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp);
 Fri, 14 Dec 2018 16:25:32 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id wBE7PRXw037807
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 14 Dec 2018 16:25:32 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc:     kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [PATCH 2/2] drm: rcar-du: Add Standby Mode to suspend()
Date:   Fri, 14 Dec 2018 16:25:18 +0900
Message-Id: <1544772318-17408-2-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544772318-17408-1-git-send-email-na-hoan@jinso.co.jp>
References: <1544772318-17408-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Enter Standby Mode before suspend by drm
We will not need to "Release from Module Standby Mode"
because after resume() is called, this is done.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 32dba13..1ab3f56 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -426,6 +426,20 @@ static struct drm_driver rcar_du_driver = {
 static int rcar_du_pm_suspend(struct device *dev)
 {
 	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
+	int ret;
+	unsigned int i = 0;
+
+	for (i = 0; i < rcdu->num_crtcs; i++)
+	{
+		struct rcar_du_crtc *rcrtc = &rcdu->crtcs[i];
+
+		ret = rcar_du_crtc_standby(rcrtc);
+		if(ret)
+		{
+			dev_err(dev, "failed to enter Standby mode\n");
+			return ret;
+		}
+	}
 
 	return drm_mode_config_helper_suspend(rcdu->ddev);
 }
-- 
2.7.4

