Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276353;
	b=jMY321OIzidSp9RtftVsv8jhq0bTQ9suGR4ZWD8cqquk3uxzh92bod1i7Snq8rDUh1v9
	 aMfhMx6Gm4NQLjv9zA+VIMAruLgovSzoax9ZA/TfAYmjjNXDiFMg+uWl4XNm96+MBxWBS
	 jkhA/rwoaFxrhRHY38tFtLRmEebHLOPyWESHqen3ydN7cBM6XV38c+NUmDVuu86VgE50M
	 S/UReqKSANfFfo4T2176bUwjz+Ynz1z0aAXtnB/zRoUTEsRe6twQ5CjZpz+PTrIs478bZ
	 4OVpPYC1Cxlpt6wrBWjzxHawWdWfy3SKWMm4BMcLbI37wBEnIRKMZD9BPU/48U+H1vA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
	b=2FrM6uUpT6WWq1XCM6k7DHSqENZ6p6SXLisgbccVtE8hcjd7qS0cPQePOKDUyvsZQLBi
	 I2aDkHjOMitnt7pxXrIRUMr/vjl52qr/E3AKEFzQtd+k3bHjE/654DqzahpUJdUn8a6EE
	 QjQY+UYNMGr+5wilEuua8FSglNRCI9UNvVHBFeZKoyIp6khMwlrq8omuisw31Vr8xIqpQ
	 zjw54oREhMAmUFyYcZZI2Ww0IDcgRvLwaFMHO2TjBKB/TeypBHvuNJxFiz6+tzZZeXaof
	 da6dclwvvh+tZBSHD+EsvWmkQGhJysMou2QSXhQZGOodFYgDPRXFfqgdcPm7L9TWuQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=miY8TFcZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC933606A321
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 02:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC933606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=miY8TFcZ
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2295702a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 18:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276351; cv=none;
        d=google.com; s=arc-20260327;
        b=Qkb/bsvSStt+JjV3gWrEE+YccEubYHMQorwf0pEU08/ciUVVZ1WtsIa8NvGUpmi7kW
         lgTJ5+nV+ffMbMuq2nQgRj4kjHWjGDwFmb36cnusNZ7b9YKcLThO07QzBfvQ8QuuTJgr
         Dl97PchyWsb3BaIHoDyXBnEUg3XBF1xHL+PcmgirJolKLehg9KFE7LYz091Hsff7C3h9
         NOOlrBzW9ZETeto+0QzQJOCnoBMO46hCibiyXKxA7cOvRDoLEBppFTPdrZdnwL9o6Vmb
         eMT2FtvzAPGbMkiAHdwuEDZ9n6+4+Yn6lckTkzH3Bqj3KEnOto0njmQq0ZycLAF1JF/J
         TQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
        fh=Fmbl3QwIraNsqFEGbVOpA1DJrB0Fx2fOjN97Y2DCsvI=;
        b=crC98HKGUQiSIaHJWtKJqAwM3NTTjACbTprb9Lw3+eFNiTufIBEmOqyIsTuTv5m12x
         UJ8ARztp+VnKJo30fE3T/0qgYUcMWRq58o0O0UkmqaZbRiI/Xo81sJE/aoKwElVOy8KO
         i2tIsiwJltLii6qPbd2phoIUiMcoRIdWgvWjNxqGlSHN3v5ZysKsAvm3mDXyeHglrNxq
         c2pcorVRHXdLcGe61liGL4e5b4i63R+e52DnsNEIF0/Yv21Q8QFaWQOfC7nG5goEiA9E
         hdpaWJKFJX171vR7zdZwIcHi6lekg0OoT9K+Tz5KAx9daFE2aK+baPYj+/Rcke65SrJe
         rDLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276351; x=1794881151; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
        b=miY8TFcZ2rbwMLQkWSsDD7zmZ6ooCAoUOcq86QZk8i41fGcql9y618JRlOnqnT6ee4
         O6BmRN4/erPMZ3vJ2i/O6d62S1w2jX3dbdzsxEiZZyYB8fi/+1t1s3UcBW5d3Ksdh0K6
         95qghzTlJWFatSeMWJLvfN19lDgMS/BVwtC34gHX+ShHcvFloNUOqf3GxU4uUyEC8w+p
         OxMqCx9Lhbz4p8taLazb5es9R5363LgPZYAEubiybrtVCXDd4SDeu7oSHqph39dFRBzV
         EPcOlyobqmHCKTnD1RgVIc3AMtlnKbC7I5FQSEIezQUlJWhx5SIQo2uJgYvueq7FdsI/
         wEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276351; x=1794881151;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
        b=ZL0y82UOP61Bwlr+BJpqP+eeNcnJdRs4lMyybI9VMrXpT8JoL/0QC0zejO3yTY2y/L
         I/5fXvo7uexoHYQ3UaUFscZnO2qYLqS6IcE1U/68oMNOFFEMAFBlCHh87+KAFwptw5bt
         CW8ev4ZVsZKInv9zP8nigjqXIebe5ej84xp0mFi7X0cW1JojV9EbfOz0yGfdrYVVJ3v6
         55zfnrWFhZ3VCCzmDXffp9fFMLumswVyZInzmpk2lNep+REgeC5VFbz5lIrk8IKSv/dU
         BngSNp7D5G0THB1AlwLZ8slFFJYjM2EON6oqO/06uvGXMrpMC5zggpLJh1H3wzH+utCQ
         CBdw==
X-Forwarded-Encrypted: i=1; AL+hErFFDJC6hxC5mu794ZKjemtEjduk8ugW+ed21niKwjwvmLPjA8u/SNf9ZbsUfnICMJb+19XeJFVwglFQ6RCo9qe/kA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9av1jhYvLRPV47FTWPGbkiCWkaK+/peLXX1kaeDle5xqGxC5ho
	edFGOuuStdN1A1/PbG1T/JOv5A5GVJGUBQN2YxaZojRNdWIw+jZUzf5hvUE6Yxs5WsZ2UJXWGIv
	beuEdRcv5KWogDb4j2WMTR7JbjSGHtg==
X-Gm-Gg: AYBFou3e07Zd7kSk3GE8AayVbQ/YgFkoIOXHlWi1ZbM0Ezo9JTzbjeQOQBR3Bj6DALx
	c0+EMgEx08hGFmCPN3g+9s2KLAE/H6t4p/IeaWEp9ErNviIUjVTmu4/hQ1x7LakuZp4VvWlJZ90
	3mktzOPIXIl77SlO24eaNAczMQeYrmdbHBrI+ulVQs1SraR4WE6L9TCujyU1VlqF96M6fuwe3yv
	0XRbKR/m2Aahosuwkua/rIw78WlAUhmMjCY52LeQ4U6aArHjmgfjlQPW4YVXstlRGsebEZsguqm
	EzVGtfaPepae6MlC3TO+jLn317nZqpphbiSEF5Zd2/5D6zRM+yWQ2WotJxmgS7ADNBACGUPkm8s
	XQVXrDvVkz8Wrh5enqAz6eHYZ05F4Krz2tp1yK/9QTiHQFaMa1l9Yf0pcVJjTDXN01h0cuuXatz
	xFT8mINMfbPFMDPaOPM6PcABTDXdzMmGUPQy0pOHM4FHYj
X-Received: by 2002:a17:907:3c94:b0:c40:f89f:d91d with SMTP id
 a640c23a62f3a-c50495b3696mr78780966b.28.1794276351043; Mon, 09 Nov 2026
 18:05:51 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 20:05:49 -0600
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
References: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
Date: Mon, 9 Nov 2026 20:05:49 -0600
X-Gm-Features: AclHuK9rTjy88XXbmF3NgOYWoI2XaAbuNurVjlZRMzsYFXvkTmaFvaUM0hy8Db8
Message-ID: <CAGEsz8Hf1rpg-6spE_S98i0CKrOHrpGHeTZft=UQyA-0FChq9Q@mail.gmail.com>
Subject: [PATCH v4 1/2] media: rcar-isp: release the core IRQ before
 destroying RPPX1
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

risp_core_irq() accesses the separately allocated RPPX1 object before
taking core->lock. The managed IRQ can remain registered after probe
failure or removal frees that object.

Request the IRQ after initializing RPPX1 and the handler's state.
Free and synchronize it after draining I/O queues but before destroying
RPPX1, keeping completion IRQs available during drain. Unwind the
subdevice and mutex on IRQ failure, and convert -ENODEV to -ENXIO so
the parent does not mistake the failure for an absent core.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v4:
- Move IRQ lookup/request after initialization and fix its error unwind.
- Apply before resource-error changes to avoid DEBUG_SHIRQ cleanup
  with core->base cleared.

No hardware runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c     |   27 +++++++++++++-------
 .../media/platform/renesas/rcar-isp/risp-core.h    |    2 +
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c
b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5ad..14f3c8f 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -798,15 +798,6 @@ static int risp_core_probe_resources(struct
rcar_isp_core *core,
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);

-	ret = platform_get_irq_byname(pdev, "core");
-	if (ret < 0)
-		return -ENODEV;
-
-	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
-			       KBUILD_MODNAME, core);
-	if (ret)
-		return ret;
-
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
 		return -ENODEV;
@@ -887,14 +878,27 @@ int risp_core_probe(struct rcar_isp_core *core,
struct platform_device *pdev,
 	spin_lock_init(&core->lock);
 	INIT_LIST_HEAD(&core->risp_jobs);

+	ret = platform_get_irq_byname(pdev, "core");
+	if (ret < 0)
+		goto err_cleanup_subdev;
+	core->irq = ret;
+
+	ret = devm_request_irq(core->dev, core->irq, risp_core_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, core);
+	if (ret)
+		goto err_cleanup_subdev;
+
 	return 0;

+err_cleanup_subdev:
+	mutex_destroy(&core->io_lock);
+	media_entity_cleanup(&core->subdev.entity);
 err_unregister_v4l2:
 	v4l2_device_unregister(&core->v4l2_dev);
 err_destroy_rpp:
 	rppx1_destroy(core->rpp);
 	put_device(core->vspx.dev);
-	return ret;
+	return ret == -ENODEV ? -ENXIO : ret;
 }

 void risp_core_remove(struct rcar_isp_core *core)
@@ -905,9 +909,12 @@ void risp_core_remove(struct rcar_isp_core *core)

 	dev_info(core->dev, "Remove ISP Core\n");

+	/* Keep completion IRQs available while streaming queues are drained. */
 	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
 		risp_core_io_destroy(&core->io[i]);

+	devm_free_irq(core->dev, core->irq, core);
+
 	v4l2_device_unregister(&core->v4l2_dev);

 	mutex_destroy(&core->io_lock);
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h
b/drivers/media/platform/renesas/rcar-isp/risp-core.h
index 627a762..9e057bf 100644
--- a/drivers/media/platform/renesas/rcar-isp/risp-core.h
+++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
@@ -112,6 +112,7 @@ struct rcar_isp_vspx {
  * @dev:	(OF) device
  * @rppaddr:	Hardware address of the RPP ISP (from OF)
  * @clk:	The clock for the ISP CORE
+ * @irq:	The interrupt for the ISP CORE
  * @rstc:	The reset for the ISP Core
  * @csrstc:	The reset for the ISP Channel Selector
  *
@@ -138,6 +139,7 @@ struct rcar_isp_core {

 	u32 rppaddr;
 	struct clk *clk;
+	int irq;

 	struct reset_control *rstc;
 	struct reset_control *csrstc;


On Mon, 09 Nov 2026 18:05:28 -0800, Myeonghun Pak <mhun512@gmail.com> wrote:
> Fix the core IRQ lifetime before changing resource-error handling.
> Patch 1 delays IRQ registration and releases it after I/O drain but
> before RPPX1 destruction. Patch 2 distinguishes an absent optional core
> from initialization failures and preserves deferred probing.
>
> Apply in this order so resource-error cleanup cannot invoke the shared
> IRQ handler after core->base is cleared.
>
> Both stages: Clang 23.1.4, ARM64 W=1 object builds. No hardware testing.
> AI assistance: Codex prepared the split and descriptions; independent
> Codex agents reviewed the code.
>
> Myeonghun Pak (2):
>   media: rcar-isp: release the core IRQ before destroying RPPX1
>   media: rcar-isp: distinguish absent cores from probe failures
>
>  drivers/media/platform/renesas/rcar-isp/core.c     |   44 +++++++++++++-------
>  .../media/platform/renesas/rcar-isp/risp-core.h    |    2 +
>  2 files changed, 30 insertions(+), 16 deletions(-)
>
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
