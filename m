Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775396;
	b=Yjlj/ODaN16a0OYb7joIoXDInI9v9w59rYBrVoz50fOoaJG+RW7SwAntMD+g7lAHMNCN
	 xJdtNdmOAghptiueOnC5JVhXhkNdV4xIy9yZ6lph3woOOYRAWz0+HuB7WUDPJkeklpeLp
	 6G9WyszFPPD3Vc8OHXOp5Vdf53x9/5EPiWuCuoXbdgrWCaSgvZJtyMokegNVja0zA1myJ
	 wAEbuWVSDqeFzDG4Gp+lx3uVt6P96NiVf36FkISCfqi3QOhCPDlJlO00vNqduzYzu6jcj
	 CWbR9z+49vzDjlceKi1mCLop4EvneEvArH78+xO1FdEWVqZezJMbIA6xdcqD9c10u+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775396;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=f3jxLyFP6J5COGwedbfdcg/yUUWFe7/SF6O5BVof00o=;
	b=EzqXNRFPc4dggCBVdWRNmNEHHXjN5w6BOF0JaIjgAv/0VW72Shu+2xHhPPVCqeS/pJiz
	 WBofjIiL7kz/oZPi8uDaEvzSzXrapQ8d1HZrMTLMavWNTaWwWNn0wws8UfXAnp5ijZHTw
	 wwkPa7Ypi7Ru52jwweAR7YbGVwPAFghzu4fxOboZmz99jkKD0z9SU6HT/+0GwtpfE+YBY
	 MPpcOerdpVG3hn9jd52bX7NM3ptsX6CJ/BDk2hliCrwbwCPjZvpWxk4vr/PtEgsBwOKiy
	 j9dzSOTzKt+N4u7j3fPsQk3cJp6Ncc3OZGztRLx8TTgkqSzMsDdVR4n/s4ExhkvVV8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=EmfJe1Nx;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66460606A31C;
	Fri, 27 Nov 2026 10:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66460606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=EmfJe1Nx
Received: from pb-laptop.local (185.182.215.119.nat.pool.zt.hu [185.182.215.119])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60E4CBE1;
	Fri, 27 Nov 2026 11:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795775238;
	bh=5WSuZBghyy9QIlk/xp/w5qy3vy9MzKxDPwndTOyM9wU=;
	h=From:To:Cc:Subject:Date:From;
	b=EmfJe1Nx3izz52mZ14jrUnLDn/pLoFYAj30gKX11EHAAv6Ux2GpBcUrWUqQLSUYCp
	 JiHVm+q07yECYyk1gx+TeNzaXLodx86WDnIeKwR7M5g+ocWtqPhmfCJWdekwaiXwnG
	 bG0mF2waos/ilxokQzVbywpDBsDERP/5ih8EecZQ=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Subject: [RFC PATCH v1] media: rcar-vin: Use V4L2_COLORSPACE_RAW for raw formats
Date: Fri, 27 Nov 2026 11:29:42 +0100
Message-ID: <20261127102942.2208296-1-barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In `rvin_mc_try_format()`, `RVIN_DEFAULT_COLORSPACE` is used unconditionally.
That corresponds to the SRGB color space. However, this is reported even for
raw formats, where `V4L2_COLORSPACE_RAW` would be a better fit.

So check if the adjusted pixel format has bayer encoding and if so, report
the raw color space, otherwise fall back to `RVIN_DEFAULT_COLORSPACE`.

Fixes: e87c1a81f158d ("media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format")
Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
---

This is an RFC because this approach feels a bit ad-hoc, and while it solves the
issue at hand, maybe there is a better solution.

---
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 4961d28f42c78..28573c0bde863 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -543,19 +543,23 @@ static int rvin_subscribe_event(struct v4l2_fh *fh,
 static void rvin_mc_try_format(struct rvin_dev *vin,
 			       struct v4l2_pix_format *pix)
 {
+	rvin_format_align(vin, pix);
+
 	/*
 	 * The V4L2 specification clearly documents the colorspace fields
 	 * as being set by drivers for capture devices. Using the values
 	 * supplied by userspace thus wouldn't comply with the API. Until
 	 * the API is updated force fixed values.
 	 */
-	pix->colorspace = RVIN_DEFAULT_COLORSPACE;
+	if (v4l2_is_format_bayer(v4l2_format_info(pix->pixelformat)))
+		pix->colorspace = V4L2_COLORSPACE_RAW;
+	else
+		pix->colorspace = RVIN_DEFAULT_COLORSPACE;
+
 	pix->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix->colorspace);
 	pix->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(pix->colorspace);
 	pix->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true, pix->colorspace,
 							  pix->ycbcr_enc);
-
-	rvin_format_align(vin, pix);
 }
 
 static int rvin_mc_try_fmt_vid_cap(struct file *file, void *priv,
-- 
2.56.1

