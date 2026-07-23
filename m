Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E62044C4E4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 18:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832403; cv=none; b=n4fxWw1phc9yxL8JQ06eONfgIimGVO064AdNLie0Zrlp3jZgCQ9ekx/7Ze8tRpe0cHLGTEhPtQ2kcaA1do+kKYkrH70eqpEg8DHpSWFKZo0FWSOkdBnODl7Ajmr2Y2pBvoWhPt/gqNGDSzz3m8zxnaUMzUegoQk8JIRMjpUZh/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832403; c=relaxed/simple;
	bh=DQFKVraIj3hS/K9rhtkP6NnYFqE9X4Ceep45IBu9BFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+o6ZelXB29hzxAALaajHTQgiiAs7wMe5TqlMISBtfMgtk68meiuRhMpohosHWvSWeDB2ZOJZ9mklNta7Gk+6f743m93uRmpuxAukb4fBdTgdzi5G7MGjdPQdVKg4/y0JioAY3DJAbmIR0cTm2I9TPuR3ukTKAzrxIISNKDF0r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4d/hxw0; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4d/hxw0"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso961827a91.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 11:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832391; x=1785437191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aDNX5oWZPCLlEUZqO7qQYiyJOs0NAqqQhS2frdoUAY=;
        b=S4d/hxw05hTzm0cZgrTJhDMi/tEYkkLv8thfW5xvM8+ellLJtka8xcwyR+RfpFIR0B
         F2LEXTmR4wcfgwL+5lshVIAoswu25IJERzRiEbcXwYJErCV2wnh5Ch4pe+yF/p/uMQ87
         Lb/MxCyE5bjBIrQ3J59Bv8SLkLj3QCR95dArQXg/HWHSeD9zMb9CiysXsQPuwOaJpll8
         HIPh9jp+8/KkPx78J2bGPwUrlwfWk6WYLJqHghyzcXUiUS/Ztz+V+IisvgUwoV83IoqV
         b2mCVsm6MmwWxBIg3khUb+MmEu666Q1fyy5O+qJktvPDTZYWd3FEbd5gYeEexCo0lMb7
         73Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832391; x=1785437191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8aDNX5oWZPCLlEUZqO7qQYiyJOs0NAqqQhS2frdoUAY=;
        b=m70ol5VaVdo24mldWo+DOCjx7LvwF8WS/iegpKZtCWDtk8epGelw1Pv5EOO5FNIsBG
         /DsDcVzcaYZibSNOdGIHCJ9oMDhqqZYwncY0Eck9dgK7SBTAxQgvfqfWFQ18YWo9oukp
         gJPJQRyErLx2b5GpeHwSOEBnF883BMUn1SjAzhypG4ynPRdO9K5GTVS9BLIe0if3+gg/
         wZie33z4GkgSsyTycGeg4JV+qMC6L0YRqyrzAmNiOJytNP6cHiaIA8XayYopdijsgFSR
         3RG+OsxH8m4Mn1E313epW9/j1VM/YmtUni6iuyQ+ZGQ4AUoKeeEEStukQ90R3b6usP1j
         +QtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoF+asEU6fXDemoes8/0H46z8k1jjFXFGcdqAXSLD60nwhFRBDyqD0w4pm5B/MuedjUr8lv1IW06jqi5hW2ICO01Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVvCTPCMuSKoAzgEQnBUQE269WWuQLSKB8FThEeeRo6y+yjQs
	LyXjLBQn8ppQsOdkh0lnEKy5BFGGeH5AY+eSFvh5gU7iACeT8teaZ6tpmIj3rUV70UM=
X-Gm-Gg: AR+sD11//OisIcNkZWBxkVtl4ZmlDigaL4caCuFLYWjvdKhB8akfJU/0kka/2QyCV2V
	RnLTNV8LxtSapcGYiAkvm8mRslRHNBU13X9+Y/oplHWj7niTQdO+nthoVzOjmzpoAuSN48icvpp
	HZNC6FYzhyoOq8PSfKQliVJTYFGRq2JR57zj/QzrzIqD9CnYapXy5sIG+YlMis09pdfvL/ZXFXo
	VWA1zxSXkkCl6qBx0KylWQpENrfKrmGZ/lR1s5nPIISlkOf9JnVqPBJxLLRrSS8MK0JXJqkm5WW
	E1GJH7fUu3PExTunwBgW5chAo5fPscr97uQE5H5dpM2m6oD0+fgJ9z3YGGhK+LEtzxMV6MIZ/VM
	xY35KZ6whVdVBLTGOk/fAVxoglSe8Nm+secqWgysO7oVDf3xRC0rnp1ysbzFe/G6KUKcq3ij+
X-Received: by 2002:a17:90b:52cd:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38ec6661b73mr4668847a91.34.1784832391486;
        Thu, 23 Jul 2026 11:46:31 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:31 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eugen Hristev <ehristev@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: cocci@inria.fr,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 12/36] media: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:14 +0900
Message-ID: <20260723184538.3888637-13-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/media/i2c/mt9p031.c                          |  6 +-----
 .../media/platform/microchip/microchip-sama7g5-isc.c |  7 +------
 drivers/media/platform/qcom/iris/iris_resources.c    |  6 +-----
 drivers/media/platform/qcom/venus/pm_helpers.c       |  7 +------
 drivers/media/platform/renesas/rcar-csi2.c           |  6 +-----
 .../media/platform/samsung/s3c-camif/camif-core.c    |  7 +------
 drivers/media/usb/dvb-usb-v2/mxl111sf.c              | 12 ++----------
 drivers/media/usb/gspca/jl2005bcd.c                  |  7 +------
 8 files changed, 9 insertions(+), 49 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index d21510caf45a..2b09e8315c8e 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -452,11 +452,7 @@ static int mt9p031_set_params(struct mt9p031 *mt9p031)
 	ret = mt9p031_write(client, MT9P031_HORIZONTAL_BLANK, hblank - 1);
 	if (ret < 0)
 		return ret;
-	ret = mt9p031_write(client, MT9P031_VERTICAL_BLANK, vblank - 1);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return mt9p031_write(client, MT9P031_VERTICAL_BLANK, vblank - 1);
 }
 
 static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index b0302dfc3278..7383341ec51d 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -598,13 +598,8 @@ static int __maybe_unused xisc_runtime_suspend(struct device *dev)
 static int __maybe_unused xisc_runtime_resume(struct device *dev)
 {
 	struct isc_device *isc = dev_get_drvdata(dev);
-	int ret;
-
-	ret = clk_prepare_enable(isc->hclock);
-	if (ret)
-		return ret;
 
-	return ret;
+	return clk_prepare_enable(isc->hclock);
 }
 
 static const struct dev_pm_ops microchip_xisc_dev_pm_ops = {
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..872bd09656b1 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -78,11 +78,7 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(pd_dev);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return pm_runtime_get_sync(pd_dev);
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index be1cbd5cfe84..e88e66be4f6d 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -781,7 +781,6 @@ static int decide_core(struct venus_inst *inst)
 	unsigned long max_freq = ULONG_MAX;
 	struct device *dev = core->dev;
 	struct dev_pm_opp *opp;
-	int ret = 0;
 
 	if (legacy_binding) {
 		if (inst->session_type == VIDC_SESSION_TYPE_DEC)
@@ -829,11 +828,7 @@ static int decide_core(struct venus_inst *inst)
 	}
 
 done:
-	ret = hfi_session_set_property(inst, ptype, &cu);
-	if (ret)
-		return ret;
-
-	return ret;
+	return hfi_session_set_property(inst, ptype, &cu);
 }
 
 static int acquire_core(struct venus_inst *inst)
diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..6635f5782175 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2273,11 +2273,7 @@ static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
 			return ret;
 	}
 
-	ret = rcsi2_phtw_write_array(priv, step4, ARRAY_SIZE(step4));
-	if (ret)
-		return ret;
-
-	return ret;
+	return rcsi2_phtw_write_array(priv, step4, ARRAY_SIZE(step4));
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index 14eedd1ceb27..bb06847f3a63 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -301,7 +301,6 @@ static int camif_media_dev_init(struct camif_dev *camif)
 	struct media_device *md = &camif->media_dev;
 	struct v4l2_device *v4l2_dev = &camif->v4l2_dev;
 	unsigned int ip_rev = camif->variant->ip_revision;
-	int ret;
 
 	memset(md, 0, sizeof(*md));
 	snprintf(md->model, sizeof(md->model), "Samsung S3C%s CAMIF",
@@ -316,11 +315,7 @@ static int camif_media_dev_init(struct camif_dev *camif)
 
 	media_device_init(md);
 
-	ret = v4l2_device_register(camif->dev, v4l2_dev);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return v4l2_device_register(camif->dev, v4l2_dev);
 }
 
 static void camif_clk_put(struct camif_dev *camif)
diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 870ac3c8b085..6404eb74db32 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -987,11 +987,7 @@ static int mxl111sf_frontend_attach_atsc_mh(struct dvb_usb_adapter *adap)
 	if (ret < 0)
 		return ret;
 
-	ret = mxl111sf_lg2160_frontend_attach(adap, 2);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return mxl111sf_lg2160_frontend_attach(adap, 2);
 }
 
 static int mxl111sf_frontend_attach_mercury(struct dvb_usb_adapter *adap)
@@ -1007,11 +1003,7 @@ static int mxl111sf_frontend_attach_mercury(struct dvb_usb_adapter *adap)
 	if (ret < 0)
 		return ret;
 
-	ret = mxl111sf_lg2161_ep6_frontend_attach(adap, 2);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return mxl111sf_lg2161_ep6_frontend_attach(adap, 2);
 }
 
 static int mxl111sf_frontend_attach_mercury_mh(struct dvb_usb_adapter *adap)
diff --git a/drivers/media/usb/gspca/jl2005bcd.c b/drivers/media/usb/gspca/jl2005bcd.c
index a408fcc3a060..4988fbf5005e 100644
--- a/drivers/media/usb/gspca/jl2005bcd.c
+++ b/drivers/media/usb/gspca/jl2005bcd.c
@@ -148,17 +148,12 @@ static int jl2005c_start_new_frame(struct gspca_dev *gspca_dev)
 static int jl2005c_write_reg(struct gspca_dev *gspca_dev, unsigned char reg,
 						    unsigned char value)
 {
-	int retval;
 	u8 instruction[2];
 
 	instruction[0] = reg;
 	instruction[1] = value;
 
-	retval = jl2005c_write2(gspca_dev, instruction);
-	if (retval < 0)
-			return retval;
-
-	return retval;
+	return jl2005c_write2(gspca_dev, instruction);
 }
 
 static int jl2005c_get_firmware_id(struct gspca_dev *gspca_dev)
-- 
2.43.0

