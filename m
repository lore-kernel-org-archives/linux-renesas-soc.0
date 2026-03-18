Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3546393DEA;
	Wed, 18 Mar 2026 23:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878360; cv=none; b=gFy0JSTp43NxL9O9XRnt+L/BmBwQxhJ30KVrgo7BJOG7nAnnnEXW3ctIXMv0xSjJM7a/uffPr1SGGQls61sVHYQOjiDaO4jY6fcY8e+oWLqip8QEoQgsEUnBl0yPbgPpJqdq1K3f0XDg6HDxkRQDbMI2wDdaM8lIfA5NlyxiPzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878360; c=relaxed/simple;
	bh=auRle7XhTdoA84OB+3YLddaxKuYus3SY1NowcIEnPQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z9dUK46BDWUN9dXZlJcUikdbXx4j/pJn6SsbDjlZL0Y9qQ96ZzL1FNHKmLPIzU3yGuP6MJ4k+z/rNwlLlU9/hL2iQ1G2PGrGY+oH3lh6QQh1oqhyApmMCYC6/fan5pZgXzdnSPfB1F0gNAnV9Ve5X2pXhBxtbeONqKvyeo6m0Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bGMxGO/Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bGMxGO/Q"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5A16B176E;
	Thu, 19 Mar 2026 00:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878281;
	bh=auRle7XhTdoA84OB+3YLddaxKuYus3SY1NowcIEnPQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGMxGO/QlfP7dJ1YCmZhTb06QhN6mqtQtB9YQRaDpd7LDxgxS8PTRSNOFsRnk/vfv
	 wgEzFY/yTuRGLsUM4v2cz4IYoJPSRluWWzGZosSFJxjQ352GAQeku7NVIQnKsvflr4
	 1EFUix6zIlct9RI0hd/dC12yfAcQF1gznEmtomLg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 04/13] media: renesas: vsp1: rpf: Fix crop left and top clamping
Date: Thu, 19 Mar 2026 01:58:58 +0200
Message-ID: <20260318235907.831556-5-laurent.pinchart+renesas@ideasonboard.com>
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

The RPF doesn't enforces the alignment constraint on the sink pad
format, which could have an odd size, possibly down to 1x1. In that
case, the upper bounds for the left and top coordinates clamping would
become negative, cast to a very large positive value. Incorrect crop
rectangle coordinates would then be incorrectly accepted.

A second issue can occur when the requested left and top coordinates are
negative. They are cast to a large unsigned value, clamped to the
maximum. While the calculation will produce valid values for the
hardware, this is not compliant with the V4L2 specification that
requires values to be adjusted to the closest valid value.

Fix both issues by switching to signed clamping, with an explicit
minimum to adjust negative values, and adjusting the clamp bounds to
avoid negative upper bounds.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 56464875a6c5..ffc1b3ab54e2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -201,6 +201,8 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel)
 {
+	unsigned int min_width = RWPF_MIN_WIDTH;
+	unsigned int min_height = RWPF_MIN_HEIGHT;
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
@@ -229,18 +231,36 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 
 	/*
-	 * Restrict the crop rectangle coordinates to multiples of 2 to avoid
-	 * shifting the color plane.
+	 * For YUV formats, restrict the crop rectangle coordinates to multiples
+	 * of 2 to avoid shifting the color plane.
 	 */
 	if (format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
 		sel->r.left = ALIGN(sel->r.left, 2);
 		sel->r.top = ALIGN(sel->r.top, 2);
 		sel->r.width = round_down(sel->r.width, 2);
 		sel->r.height = round_down(sel->r.height, 2);
+
+		/*
+		 * The RPF doesn't enforces the alignment constraint on the sink
+		 * pad format, which could have an odd size, possibly down to
+		 * 1x1. In that case, the minimum width and height would be
+		 * smaller than the sink pad format, leading to a negative upper
+		 * bound in the left and top clamping. Clamp the minimum width
+		 * and height to the format width and height to avoid this.
+		 *
+		 * In such a situation, odd values for the crop rectangle size
+		 * would be accepted when clamping the width and height below.
+		 * While that would create an invalid hardware configuration,
+		 * the video device enforces proper alignment of the pixel
+		 * format, and the mismatch will then result in link validation
+		 * failure. Incorrect operation of the hardware is not possible.
+		 */
+		min_width = min(ALIGN(min_width, 2), format->width);
+		min_height = min(ALIGN(min_height, 2), format->height);
 	}
 
-	sel->r.left = min_t(unsigned int, sel->r.left, format->width - 2);
-	sel->r.top = min_t(unsigned int, sel->r.top, format->height - 2);
+	sel->r.left = clamp_t(int, sel->r.left, 0, format->width - min_width);
+	sel->r.top = clamp_t(int, sel->r.top, 0, format->height - min_height);
 	sel->r.width = min_t(unsigned int, sel->r.width,
 			     format->width - sel->r.left);
 	sel->r.height = min_t(unsigned int, sel->r.height,
-- 
Regards,

Laurent Pinchart

