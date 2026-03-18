Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C5F39447C;
	Wed, 18 Mar 2026 23:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878372; cv=none; b=Kezh3I3/fL0ipQkzHs7DsJiDc7GHZNd2QP8Y3IqO4gsGNeouOKvGQvwFMkoRwGwy+J6Je+vXPYH35iKleNqlAps6wqg8kxvw5jzl3x+fPw1D6PzsIPXATHsh3lMVeFBPnB0Bp+5QTSMPqXAVYiU2QTrMNdht9df+N2gUBORjA1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878372; c=relaxed/simple;
	bh=Xg2AIlok+V2s180rgQMeDJu40Dxlzd18NVxVUawmrAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9u8H7FXoTMgplcbmeOeYJWJZ+p0x2BABmaMJLD+Y2UBlZ12RvVoa44em21kQXLGUioGM0BfuYSAF1bAkZQltV10MxMoqjf+dCbNae9BdVSubk/OMEpMrxqXPQElz5sEvXd1EFeLTB/7+9pTBHX4E468WmREppbLNBsNsISYiDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BJdMSgua; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BJdMSgua"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5293A1AA6;
	Thu, 19 Mar 2026 00:58:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878293;
	bh=Xg2AIlok+V2s180rgQMeDJu40Dxlzd18NVxVUawmrAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BJdMSguab/W9P/4RTWX4oDcIRG5aAAnFwN3hWYJdtChG6/erDUsf8eQNrT1eTuBwa
	 BVwqmiM/4NO+jfbPpjWRN3BkqOWU+txfNXsyChRILRObFVRPYPaCppJqB0vULvQ4Je
	 PFGihFduKkoZ/TNekIfhTtMarCCRC1t3NJZyKUEE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 13/13] media: renesas: vsp1: Initialize format on all pads
Date: Thu, 19 Mar 2026 01:59:07 +0200
Message-ID: <20260318235907.831556-14-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The state initialization function vsp1_entity_init_state() incorrectly
leaves the last entity pad out when initializing formats due to an off
by one error. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_entity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 839b75b62ceb..1dad9589768c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -380,7 +380,7 @@ static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
 	unsigned int pad;
 
 	/* Initialize all pad formats with default values. */
-	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
+	for (pad = 0; pad < subdev->entity.num_pads; ++pad) {
 		struct v4l2_subdev_format format = {
 			.pad = pad,
 			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-- 
Regards,

Laurent Pinchart

