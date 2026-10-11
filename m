Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2FD36F905
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Oct 2026 21:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755095; cv=none; b=FOuaLfYd8LOwgjo1QWhQeUHp73Vx3DDu4UZJxJQ/Tcw8Npxfy0l4WCY9OTx5avPo+HDCDgliDwWyy8Rs7A5ARUl6acUeZtwvwyzx0iDConzx9c1eGPxIcTX9/7kmZ4CXlXAaKcTfy+MVepK5Z0qYpTGWcu21xmQppM2QKTz1x0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755095; c=relaxed/simple;
	bh=nGW8HEyQNRFx5Jts5KN+whE3Only3xOK9HiWcXxqxFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KLnwsozlHkvh4tKyt3BOaaeKDP856N+tejUYro4mGXPXy204yyOF1RNnCQcCtSbe9YAwIvhWFouEs/xY+qYVKdKRTcFZVLUha50SYqhuVirBP3QigNe13bgopJZLTJzIGufj89sTL3oTxp7yKfHY/fEInkNf52XuF4d1f5fjycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dj/1kwSZ; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dj/1kwSZ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5352a876d5aso18690671cf.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Oct 2026 14:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791755092; x=1792359892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCERBiOuWhVjqN4P+s7CfX7jNoo06JkyXxoF6Ee2bns=;
        b=dj/1kwSZcuMyHm99ZJZb6Gik7txUFk5Yes7z1zrn00t940wqhSBG9S9tIowqhwv9OA
         My2Nbgi3o00AIvCx8p084FdXQ73zi+FBYEoN6iPdOG+TIXRhM8jovLaTvHKjtoQDV+E0
         fGP4Nkm80cdzfhgP9bAduO4wveq2arvQnvabuOn3qygSj+ontiQuC0KIyjnyXKt9PP5y
         EYPa/SK46OvlhlLNy8+cDleQwNc0vLVG8pLhQZRKqjIFmL8CLHy7s2IrJNj57UKZX2i2
         wYG/LkhUzC/8xeUIsUbO6jAHD+O5EbRyzxC707e74/7Y9N7z2k0kfiEZWp6yJ8pwC7tk
         HzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791755092; x=1792359892;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hCERBiOuWhVjqN4P+s7CfX7jNoo06JkyXxoF6Ee2bns=;
        b=Ojxvu9sj87/g/roLvRxuzHUWHS2X56sVF6qhP5lGCr7Hhk1Q5Lrm8AaB4BeJZjCvuk
         /CwoFtbKQlI6zrbvGxnieOBO2O0eXVfvZY4MMDhQjVI31Yo1FsGuwjYthWnKEBi5/lLh
         EoPuTFnjbMKdV8SqjeK8EDqp0leWNoiMQZxV0AaOotR9pvOrsScWgWOA3z/3Pdrf33ng
         0iokJjuv04uuIZInDDaA1CpMIPXMDFJWYLBItbyFTmtX9N8yZwfOo46+cz7p7pBNeqDk
         K6ll+OZ1NOmgIlBKw+oLTujDj17SOJRJcUZy07FUwXuaIKqcTqRCMF8V4E3g+tKl24nI
         nVyw==
X-Forwarded-Encrypted: i=1; AKwUvBziarTHkCaTeV4UBuJ2QY8Y6VD1syRizHonYM7fpwm1pNEaMSION/v4jsgI7ClJucE1i97L4z1ce87dKAkeB7KcUQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKVROdvz2n9wXlwhPnuP7wzQbzK+IBkEI0647TH58S1kshwZ5yq
	f4TOLiVwsh4XNdHHTPMGXTsLGphcKCCiysMw1ZErzND3bRE8kyYMfFI=
X-Gm-Gg: AYBFou0nEIGnqoiKUjAK+eyCa/212qseSVoe19nUvfLHJAWrmiD2i04/NG7LveMCvUH
	2+NVFKxVsvyOWyCdeZgYcnCKIfV1pO0A08AHtl0xMuHOodnNbkh2FIj1VGO+cIwSaDtP7J1+LGe
	OaC9SrnkrNrZOG1DgMVTRWSr0c5OmCf/zVaQq2ZlGBVwdz6H6ZplAv6IB5cKLNIgF92q4sSJHz4
	ClaEnNvhD8vR2Qm6WXcVLZr/YwbC93WEGekW1eEMwHEPpznTponGz9MTWInKYTy1xmhS9lXn00t
	wDw9Cz6z02XIugXrvGxjsd81iKkr30GRqfJC2RvVnJj1wjpQhCqw0bmx1oOVMP74CQGMRCRfHAu
	XtJolORHzfpn/oyTqAjcsMZG2y4/6WSnJXBCq4pRwZTX7F6mmqzpIgu18au+1XXNn/hV0keOMs8
	F4EN8Z48cEhNn9waGZwBlm7FkqEq59BZ1TQMy+Cqvtbn/Bm8onCxrAFp7MEPKsLYG6uCACVn5ix
	S83KbcD4RYUR/49D0ZA0vovYtH3GzfxXR6iFRTc5hzF9UE5ZYjEM4p0Y7M8Tmy1C5SIshjf17pX
	foB1i/MJeybK1X/ZXvAAy/qV16IS
X-Received: by 2002:a05:622a:4d88:b0:535:a5fb:6447 with SMTP id d75a77b69052e-535a5fb692bmr127458581cf.65.1791755091758;
        Sun, 11 Oct 2026 14:44:51 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm65811501cf.30.2026.10.11.14.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 14:44:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: rcar-isp: release the core interrupt before destroying RPPX1
Date: Sun, 11 Oct 2026 17:44:48 -0400
Message-ID: <20261011214448.2043581-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

risp_core_irq() accesses the RPPX1 object before taking core->lock. The
interrupt is device managed, whereas risp_core_remove() explicitly
destroys RPPX1 before device-managed cleanup runs. Stopping the video
queues does not join an interrupt handler that has already started.

Release the core interrupt after stopping the I/O nodes and before
unregistering the V4L2 device or destroying RPPX1. Request it only after
RPPX1, the subdevice and the handler's locks have been initialized. This
also keeps the interrupt out of probe error paths that free RPPX1.

Only treat -ENODEV as an absent optional core when core->base is NULL.
Resource probe failures clear that pointer, whereas failures after resource
setup leave it set. An IRQ request returning -ENODEV must therefore fail
the parent probe after the core has unwound its resources, instead of
allowing removal to destroy RPPX1 and put the VSP-X device again.

This issue was found by static analysis.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c      | 13 +++++++++----
 drivers/media/platform/renesas/rcar-isp/csisp.c     |  2 ++
 drivers/media/platform/renesas/rcar-isp/risp-core.h |  2 ++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5adbedfa..6bf1dd650486 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -802,10 +802,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 	if (ret < 0)
 		return -ENODEV;
 
-	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
-			       KBUILD_MODNAME, core);
-	if (ret)
-		return ret;
+	core->irq = ret;
 
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
@@ -887,8 +884,15 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 	spin_lock_init(&core->lock);
 	INIT_LIST_HEAD(&core->risp_jobs);
 
+	ret = devm_request_irq(core->dev, core->irq, risp_core_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, core);
+	if (ret)
+		goto err_destroy_mutex;
+
 	return 0;
 
+err_destroy_mutex:
+	mutex_destroy(&core->io_lock);
 err_unregister_v4l2:
 	v4l2_device_unregister(&core->v4l2_dev);
 err_destroy_rpp:
@@ -908,6 +912,7 @@ void risp_core_remove(struct rcar_isp_core *core)
 	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
 		risp_core_io_destroy(&core->io[i]);
 
+	devm_free_irq(core->dev, core->irq, core);
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	mutex_destroy(&core->io_lock);
diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 53ce47020d17..73bf7e42bad2 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -563,6 +563,8 @@ static int risp_probe(struct platform_device *pdev)
 		isp->subdev.internal_ops = &risp_cs_internal_ops;
 		break;
 	case -ENODEV:
+		if (isp->core.base)
+			goto error_subdev;
 		/* The device don't have an ISP core, that is OK. */
 		ret = 0;
 		break;
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h b/drivers/media/platform/renesas/rcar-isp/risp-core.h
index 627a762d6b19..70432cf4a88c 100644
--- a/drivers/media/platform/renesas/rcar-isp/risp-core.h
+++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
@@ -112,6 +112,7 @@ struct rcar_isp_vspx {
  * @dev:	(OF) device
  * @rppaddr:	Hardware address of the RPP ISP (from OF)
  * @clk:	The clock for the ISP CORE
+ * @irq:	Interrupt for the ISP CORE
  * @rstc:	The reset for the ISP Core
  * @csrstc:	The reset for the ISP Channel Selector
  *
@@ -138,6 +139,7 @@ struct rcar_isp_core {
 
 	u32 rppaddr;
 	struct clk *clk;
+	int irq;
 
 	struct reset_control *rstc;
 	struct reset_control *csrstc;
