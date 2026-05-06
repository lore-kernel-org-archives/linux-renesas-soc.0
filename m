Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFBC364052;
	Wed,  6 May 2026 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778104616; cv=none; b=kCDB3k+1fdOl96NRwPyEUbcnJBNNFhWnsOIxX4Q/umVV9JjXg6ww4p1Ky0uPgwlpzOmZ8zZLXK4u4gHSmAmjEHnhPEvA7tDwiQelgAwercyeaZA232NjBlDBh3RTfCtXJjca0erKuX93vlBgn/AgHgybeMHZE0GM5pKqOyJJgzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778104616; c=relaxed/simple;
	bh=v48+HlYogwE3W6NBFC9AnfLnHzuLsAAi31a7n5umF04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIYAYZjLhE+LFh3AQ05CvDRcSFRshOTRg3/jKa/aF5a2wk3XzmHCdtk87WJ7CeBLsMOirDBD1JNt3kf2yhmkgA6BAb5LBNphsKUn1mfZw4Coty8XYMrlVuxfPL8BO7fYlWHHfySz1rBCqrRrXWmZQnbEjUz6jdwq4qZ6iPohgh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TJCfOFeK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TJCfOFeK"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2458163D;
	Wed,  6 May 2026 23:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778104610;
	bh=v48+HlYogwE3W6NBFC9AnfLnHzuLsAAi31a7n5umF04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TJCfOFeKfgXTcZoa/EpYKAq1q7IUg2m3SyvUXk1FN8DH+gpyqpPRAMfIOcHzRVIPq
	 GM595lShySWS+zfLbOBpYnTEgRL4P+aA+2L6H97nHoWzjyoFRqPiEV9TDP0kD8EW4y
	 RGlhlqBa3qlYqIWZfYSDuxa7o8cNcRRD8uniBLZc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 1/2] Revert "media: renesas: vsp1: Initialize format on all pads"
Date: Thu,  7 May 2026 00:56:49 +0300
Message-ID: <20260506215650.1897177-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 133ac42af0a1b389e8b7b3dc7c1cc8c30ff162b6.

The change to format initialization, along with the change to format
propagation in the BRx in commit 937f3e6b51f1 ("media: renesas: vsp1:
brx: Fix format propagation"), broke configuration of the DRM pipeline.
Revert it to fix the regression.

The original commit was meant to fix a v4l2-compliance failure, with no
known userspace applications being affected beside test tools. Reverting
is the simplest option, a more comprehensive fix can be developed (and
tested more thoroughly) later.

Fixes: 133ac42af0a1 ("media: renesas: vsp1: Initialize format on all pads")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_entity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 1dad9589768c..839b75b62ceb 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -380,7 +380,7 @@ static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
 	unsigned int pad;
 
 	/* Initialize all pad formats with default values. */
-	for (pad = 0; pad < subdev->entity.num_pads; ++pad) {
+	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
 		struct v4l2_subdev_format format = {
 			.pad = pad,
 			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-- 
Regards,

Laurent Pinchart

