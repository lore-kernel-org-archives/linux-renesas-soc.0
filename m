Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CCD30AD10;
	Wed, 11 Mar 2026 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237248; cv=none; b=EV6l6DN+fKgH2u9YCanqwbhTVMkIbREn4XUVy4Jj4+kkzHydBVJXKxPqHewT4VH4Ox3yTpQZxFmIuxFg8ofqf6CZ+if/ZpyvNUvAa3Vy+Q6skcDDrh5bRN2OEUfLoWNUdUrIQECfTI+XnYwsYC5fzeskKP/JkXTM4+F4uhfvMKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237248; c=relaxed/simple;
	bh=E1CJ0rQnAi0EUDChncm+qXC9IRTJno6m1t3x5jgRLOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvjNcknjw1CxDiJ+ZXvk2IYqjACHFl/5CnVOcS/hqNjWt2VdyKzN5TSjdtItfYGNVwJjxN3cvprBlSarJJHryHEGD6CSo63a2MHhE7bW4kPgSShYYTDRJ6PNiev0o38hZiDdXnRyEL7/KtKJAwzjrSrZCpT1jtkDP/bnzth8dqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IHIkBe0z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IHIkBe0z"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3155482A;
	Wed, 11 Mar 2026 14:52:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773237163;
	bh=E1CJ0rQnAi0EUDChncm+qXC9IRTJno6m1t3x5jgRLOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IHIkBe0zt89usnMQEKPG0LEMgqLvMRxlry8QJaY6rP0G+S7aTitEYWtdgApopFk8c
	 cZWFknIM9rWIgy/C7W2Swmf47kU4L8EgIS1aui5g80k1th+5LS863v0qpJSA2x5ibx
	 XmtbYs/XPvNpiIqfFCc1lalZG09EelbzFzVzIo/0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 15:53:15 +0200
Subject: [PATCH v5 02/10] media: rcar-isp: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-rcar-streams-v5-2-3e6c957d7567@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
In-Reply-To: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2882;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=E1CJ0rQnAi0EUDChncm+qXC9IRTJno6m1t3x5jgRLOo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsXPpSql/XKpW0MiS6ZQgzQwm2PZvKRm7eIx7X
 FjLNiRM5X6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFz6QAKCRD6PaqMvJYe
 9eDtD/4vPH9Ir0oSN/kUgoHrxPl//tf154k1DQVf61j8SI49eqbLgG8j8MXfo7ihEem/65owoZa
 AndGUJdAoVpm+zr84DXznV+bWzXrJXfQsrvYhyixyvuSz9YUtJDGaVw7ItmfgpyTtA4wyeKBNsJ
 SWh6P5Adtd+hibMMtchM+AwPfRkWoTnxFxJd6mao1XneMNbMbGYb/TjgOezSjIRNnsyBS8HKOlQ
 M9OTkuNjYsj0CnVzoN4CkHqHcdxxdKhZZHYwa/vAF2COXlYwAShjGYRLRRtpOtJhIrgw9ndfWtS
 9oejXrzKfEKYOrDIsoB7eh+Jgm0yHIufq7BKO/bC58eCTaSm0U9N4HL0DUb21U90ZQoGNpeUF0T
 WG7+f2a82SimB2YuZU8NnfnP6MYPLBc5Nx5bIkOX8mXifzdA2zGwrVLvH5G8JxguNRhHpmXduWH
 DFa2uF1IEMOzhkX5UUJ9yhE0/rpNMtLg8pnsis1ZCYllMxrSnyL9FqYiPSz+PY4hu1hhRV3JTa8
 3LxB0x8BKpVJLFBzEHXZVELGHKZCgdVmLaGD4cuHFZBoHo59SWOPAuub9x86tcxTDY03vmRljHY
 lh6A1adM92dr6oVLWDgdQVyALl+gC7wf0NlY9pXVDkghFPqVD2VMXvZswuDktCrkHhGmTy9act3
 OHScUODrXjRKvUg==
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

