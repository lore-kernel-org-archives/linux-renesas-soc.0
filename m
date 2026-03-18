Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1DD392C34;
	Wed, 18 Mar 2026 23:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878361; cv=none; b=umNRpUlMrqv0h+u+bIbrHWfykvtno7hQttXd5LB3Asg2UqLtYUgJ5ZmJy1eFNyDNvl4VnYhmO9PZNTqPRTrYd1KEVE/ptOCQ9lJWGT1CxYUwbSJMD86T/daaAIT6f4gtStg8rGypf3dQmQ0aKFD9ZzyYAZ5dOIcurzAQ+Z08324=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878361; c=relaxed/simple;
	bh=sVcQav0HgYZORzmFRBMpxUQ2PfhsHz5b7OALKy0MZsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GwoLhh7lB+8hFG+B9ZVe7H1pjq1gnkLlwf8DJAo+gCFxXyurF+kMsAQcRDWCA00WjibU+xlXI/mgvuEWZyyXIGqW+R8BBouP4yPi6uI1bmpSozE3N/q0ffjQtKlenbpZ7ggPbE4vEmLiQRUAyNigP7FWQEQavGJlxznz5dX11oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rLovK+8+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rLovK+8+"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AFEC3195E;
	Thu, 19 Mar 2026 00:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878282;
	bh=sVcQav0HgYZORzmFRBMpxUQ2PfhsHz5b7OALKy0MZsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLovK+8+ZvXvMzi1TtPXvVwt+WTRR7rKc6gyolZulB8sn8YQ1E3ocoG+QuDWoW167
	 4cxrf9Ow3ncS83eaQ2SmWVf9Xl9pHTnaSXkxDS062UBV/VunOAB2mqQQ9pOhHV4et8
	 G9Rfhnk+cLSR6NVb/fRsu24QTtVYDDHheQ2XZw+I=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 05/13] media: renesas: vsp1: rpf: Fix crop width and height clamping
Date: Thu, 19 Mar 2026 01:58:59 +0200
Message-ID: <20260318235907.831556-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The vsp1 driver doesn't enforce a minimum value on the RPF crop rectangle
width and height. Empty rectangles are accepted, leading to incorrect
hardware behaviour. Fix it by adding minimum width and height
constraints to the value clamping.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index ffc1b3ab54e2..ccc7608f538d 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -261,9 +261,9 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 
 	sel->r.left = clamp_t(int, sel->r.left, 0, format->width - min_width);
 	sel->r.top = clamp_t(int, sel->r.top, 0, format->height - min_height);
-	sel->r.width = min_t(unsigned int, sel->r.width,
+	sel->r.width = clamp(sel->r.width, min_width,
 			     format->width - sel->r.left);
-	sel->r.height = min_t(unsigned int, sel->r.height,
+	sel->r.height = clamp(sel->r.height, min_height,
 			      format->height - sel->r.top);
 
 	crop = v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
-- 
Regards,

Laurent Pinchart

