Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CEF3EB111;
	Wed, 17 Jun 2026 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697370; cv=none; b=UGv7EU8XAlpo/M3W+m9i2ec+sydytfHeFlXsNtGZPcMpixFaS69PwPVEdSn0pvzXPU7X7F56zVYupmH5aL0qWOhYfufKGuDJ3gtnGaRks6Aaj0MNQR5NW+MKzBtRywhwpMhhJs1GlypWwB4pLuPiTlwq2Rmk63+9F1G78jfPdws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697370; c=relaxed/simple;
	bh=hrHGVZ86FuA2oCxeuk7UfW40XyZ8V8YygkjiETwuZx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekG8YIB+ECuT5JI6RHGmhx+AgkVoL+TN0CeUGgl3nnxQsZH+1DkVcYu7hiuzzE9sEQ2GVnQze902dnXi2ICsTPlbEs7YBoUmapaByI9xqCwjVAPHiXwLZnE5XAEz26gqXJG5OAIRWYh8AlPWoZklvh/iVtH39tLfMPhOlIdvcqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sG4ZHbNQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sG4ZHbNQ"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA23C1121;
	Wed, 17 Jun 2026 13:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697320;
	bh=hrHGVZ86FuA2oCxeuk7UfW40XyZ8V8YygkjiETwuZx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sG4ZHbNQA8AqaX6jThiQGH3MKhOSsEFfrDMgSF2/SKh7xhrwoatLuEJ5lteE/oCmV
	 QDHChy9qFRdfyWjiDGs2CphcANDUIqcFgC7Yw6tiEBpxTKmb/QulmdRVcnuu9awZim
	 Ds9GbmwBg7me1R+cN6+3VLATIq94Zw847HXy+xOM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:54:56 +0300
Subject: [PATCH v6 03/11] media: rcar-isp: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rcar-streams-v6-3-1260eb72dff7@ideasonboard.com>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
In-Reply-To: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=hrHGVZ86FuA2oCxeuk7UfW40XyZ8V8YygkjiETwuZx0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotDjUAWK2AHvY4Z642Hauke3MoG8A52GZi4a
 HQGbVIZGuWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLQwAKCRD6PaqMvJYe
 9YETD/9HPvOgCc39eNbylZDnJBnvkaITgQcZvIX+6jvpcpC17zzMVeavkPeZOoM5vRK95IO8fsm
 L37xTXk0zkaxW+y5ElhcUId8lg7D8T8LdzHWlyWtQDkH1L8+3wWazuLgErWS1vUld4ZIOcbHeC0
 o3BlRpmBwHeYiaQnbTLQR+Ddo0Eqi79HxvbFr6zh5p0pCpcaeWJFdUvRVaCG4tYADAjw1ZfWf4p
 sDmmbcGIrC0CfBktHDUBo7y41AY7858aGHz2GjmaTtRKUex4wewIH0//QQiRyEMmW3Agt+t7JOj
 B/XpDReZO19eCgGRnJcEunltozBLpfrhjszdn4jEqWv0pAmddNJY6d2do6WVx+DeY74eFqt2mEV
 Bc6QYo/J8rty9YNRC5ACu4RLDpduKDBLtq5SJg+4/XAtxmeNK/zklQ4f3GwXFkZAg6bwra2+rxL
 xRaNpnunheibRPIcS7g1JtCjNfjkKKs7yVV/0JrmbXgCoSW1PXIuRoh3aUwBX0rcX104aloVJ74
 RWtwmp477LP4PPZnwV/76ou3z3f2ywyXAjalcj6reCy+K/OBAarYMyzJg79UPzTA01aLmDpNDmR
 2/fLCkbfIMQHz4eWEYIHcYb0g9/byMf6scGE5oRglhiq9vVS/Dp5AYneE8S+F7asn9JOnEjec/k
 Tw8/GcdZI3HX8jA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With multiple streams the operation to enable the ISP hardware and to
call {enable|disable}_streams() on upstream subdev will need to be
handled separately.

Prepare for that by moving {enable|disable}_streams() calls out from
risp_start() and risp_stop().

On Gen4, a side effect of this change is that if the sink side devices
call .enable_streams() on rcar-isp multiple times, the second call will
fail. This is because we always use stream ID 0, so the second call
would attempt to enable the same stream again, leading to an error. In
other words, a normal single-stream setup continues to work, but trying
to use the current driver's custom VC based routing will fail.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 27 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..58a9a3bd9f75 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -268,18 +268,11 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	/* Start ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
 
-	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
-	if (ret)
-		risp_power_off(isp);
-
-	return ret;
+	return 0;
 }
 
 static void risp_stop(struct rcar_isp *isp)
 {
-	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
-
 	/* Stop ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
 
@@ -291,7 +284,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			       u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
-	int ret = 0;
+	int ret;
 
 	if (source_streams_mask != 1)
 		return -EINVAL;
@@ -305,9 +298,17 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		if (isp->stream_count == 0)
+			risp_stop(isp);
+		return ret;
+	}
+
 	isp->stream_count += 1;
 
-	return ret;
+	return 0;
 }
 
 static int risp_disable_streams(struct v4l2_subdev *sd,
@@ -315,6 +316,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	int ret;
 
 	if (source_streams_mask != 1)
 		return -EINVAL;
@@ -322,6 +324,11 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
+	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad,
+					  BIT_ULL(0));
+	if (ret)
+		return ret;
+
 	if (isp->stream_count == 1)
 		risp_stop(isp);
 

-- 
2.43.0

