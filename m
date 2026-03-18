Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC23939BC;
	Wed, 18 Mar 2026 23:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878369; cv=none; b=k3cjnXIAqIdZ9tEQEi+9BwBQkay1cnsRKPKCDKJl8L0xLdf32tTE9JZbpIT8LtnnzvsfTyzRReffqLXrRkNpWjFyj5YLAXW0sFWnY4BL2yVFCQj2yUoAsk+pVcs8NuXZVPhFSVyVT4QlRL9WzFsZNyxjPwg/aSKGQznWfCsfVsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878369; c=relaxed/simple;
	bh=6lTbvVsA2+VSb1qmR5Q6DzqClilPvVdNFFaxuSYlJAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZig7BLp91wAMBuu4oNZHyPPX2/Fe5niUH1tLtIakuO8GCc3DWWU76G7sv3qxam5JfAyz+8qEfxNATJnBdycVcq/GVwNKJSqDY2goNmT5PULMTM/f8TnnOjqhRC5YNrmzSZPX8MkfpnRdSnap1ABX+TcX2nOjzzeswAbZf1dLDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G0RuoMDc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G0RuoMDc"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 34B91BE1;
	Thu, 19 Mar 2026 00:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878289;
	bh=6lTbvVsA2+VSb1qmR5Q6DzqClilPvVdNFFaxuSYlJAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0RuoMDccZsF1ued+O1Yl+CwlIfTEoEIKXG5OyblmkDpfiSCaHQ6PX2YiYfWiWL8z
	 q1VziSNE8V4Hm0acs5OwvzH0PYzqyCJ2RkQxPaZuRq+pO8CxBr1lHmewBK6+mZi1Sy
	 fCK/M2Dt3kkP5yGoEBB817xsij5yLUlt+Y1Ps47E=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 10/13] media: renesas: vsp1: histo: Fix size enumeration
Date: Thu, 19 Mar 2026 01:59:04 +0200
Message-ID: <20260318235907.831556-11-laurent.pinchart+renesas@ideasonboard.com>
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

The histogram supports size enumeration on the sink pad only, as the
source pad outputs a metadata format. The correct error code when
enumeration is not supported is -ENOTTY, not -EINVAL. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_histo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index f97aecb22058..313b9f3ce0f1 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -183,7 +183,7 @@ static int histo_enum_frame_size(struct v4l2_subdev *subdev,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->pad != HISTO_PAD_SINK)
-		return -EINVAL;
+		return -ENOTTY;
 
 	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
 }
-- 
Regards,

Laurent Pinchart

