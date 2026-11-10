Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279551;
	b=qH0IKBZBPTnaJwHmUpWEIBPf19CnPa3I5Pw8h6VKACDvousPGIm2GMW1GudDYR4xwWdS
	 DpPGX80UTOt+1KR3/6NzgToddDFt+kQrPg0D8txxs3WLX7N2pKzZYb7EKxBy8WGIED76m
	 rPv4y6HXdelNZrHuG7btPweKGePm7yG/AyL89NntJ+iSRZdgXbQ11tRvFEToQ9qKP0baU
	 M7kGtScDQAKYDQSnfUk7gHREN0Al/iJ6ECXeqks4coq3+azUWO6ypEYn1tSBBJP+7/BnT
	 nnIzNCbbWARmGTGIG/qZ/1L1YxqE43EuDZMGT5Tuh4nB18dkYyAjD7hhRIuuv0TYTBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TKEXE5ZQs3KyTFl688A4Kvp/MS9lnzYMHmvWusn80YE=;
	b=44/SH/bazb1uAVgRM+CBw/vpHYAgocV9/C2BLBe3mUj6MNkEVMXVIWlud/NgbVl5127P
	 WXIGfM61k43kwFXeZ0BONAI44Szd1mByfpYlmkcpNBXNKSsH8MPSt/C3a+od4MQvwxsFY
	 kTeFWZ1ONzXiWEM1IIFQKOMC428P+JHdRfFVy4iMux6hzZ14FdGrKVNZn0OhCM4pYMu3O
	 NVUl3S52Ejfhv5vfDw4VwHfJ3Y6SD5ULhUmkGZZYzTTZnCGYc4bl/mt4fFi+d8VZ79zJI
	 ypIIzavSJ2IGUeKf57VXICrTo2W9o/iDtjlDfyYHyHDZynwf64VzP6WakWZKKX+7A3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXBwXJJV;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0CB606AA28
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 02:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0CB606AA28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXBwXJJV
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53fdd2fb171so17494431cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 18:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279549; x=1794884349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TKEXE5ZQs3KyTFl688A4Kvp/MS9lnzYMHmvWusn80YE=;
        b=eXBwXJJVTFqzqtNddRZbUr0xNa2mBfpHs1/Uoi6yAeEYaah4nhFSHTsHIKEhVA2Db5
         8aMpSnDE9ThzHF91BumcZOmS15bh6HyopLnOeObhZENBNkU7thUBqtepEGROjhn4oO69
         ut5pkwxJABjP75JQR8mA440d2ze87RgC6RYKDKDc8JZJB0xpq+HIEQwtZTTGccilWxD1
         jbeJ26dwzLhAaOE8wMvgiWkwNm0s8gWMYFCc3zEnQSQDjsec0T86udpaWhEna7xRpiVV
         m6bvnYT+v40UgwUsQneO/h2cTHbHRN4X2FblFQPn9Ddh5hvHHV6pBEIbiECXJ7UFu4AH
         s0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279549; x=1794884349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TKEXE5ZQs3KyTFl688A4Kvp/MS9lnzYMHmvWusn80YE=;
        b=jLuQHaYxByQ+cZDQsX2byI5zk4HDz849/Jz1GPlRYvc999uwd+/EHTsG1UpHWQ3Z0k
         ISmvM+42tx1uclEXa4/ukxuWErtBB+hVshd8kaq3vDXI3pCwd+cze6rmF2mhMcLhowVJ
         COEJgMNz/WZxTh1YI4kGeaQeqj0O9Zo0kaqLldDI3nLazqSjbrpf1z6p9s2OuxQP7vFx
         hptbh/UiFmGgFU36WQWveH/jhF7yM0iUA7yKLrbqzT3Say984yy0EnUrtxgxj8RCcfpq
         S+q+qy/uEMUxRVYIa/kaSOYkU65b4mV0mTgf05fduHC/CBadXG+yjOESGgh464mPICdU
         HL1A==
X-Forwarded-Encrypted: i=1; AL+hErFzxVUeCCtcx54/0FRk8uwb6VUO26UVv9HFIYiERSRjpRdmfvcwQYchdMSRR0IBDaSk0Xzq2YDyhP3k6u80+JGW4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9TIqJ7QkRoppd4tNLxjrueXidy18tu6DWCl6Vu4+cam/m9zdmg
	uNL+iBeJk1TflPoNJhx4uYKB/mn2Sjh1uw318Hxn0Gdfk9yCFtTd/5I=
X-Gm-Gg: AYBFou1sB4FVhwUbiHENmFybCtMd7XWxQz2wAiAymvhFy5BhMhPJA+caKEZyhHAWPFK
	HXgqetwM/KTqb1LLuZz7L8f+RKWczyRVKIH57I+kl87v4eFUXxKvT+6rCpDoOCwicr8twmBsi4N
	Og4yFRDImlAy891T6St2sO2GDKe0z1D5rCfaNUU7VqvrXaomh8X/N+TFFpXmk5/pR3x5tqFMeUf
	bu/D/2V9cTSdOPeEZTSMcGYfWkTWjVojRMzfNCn0muqtK4nhOonGgDHa8T673DeAOOH71IM6Mj4
	jategjfXGndlf1F+lzt3QfDT/7tbE1u0rOW48G1x1LzOMlhMq5K6qZav3hak/5W4SHLCCxJge0C
	DegqjCD7DcurMuSuwetZNbVI8dQXipxZr6/DkKIXWXDUajvWia9kM9ibGBc1D3joHEcmT1tFsmT
	zFSBpWgLx/7yG9NKTbqqAl+62kW/a+ydYfxdyTGMI6vzsmZpO8Knx2GmXfR1eE8FJSsmC2QLn94
	lq225q0HheKisOusExpVOhBelozuutxOQQnNIqGdbnYiiTP0A/OkznhI0UiCvdnc8sbAD164qQB
	PJWXSJ2O0rfrBKkwhCDYkoDC/D6OnexkSdnUTwl04gWy/mISvTuJJbJ/kK4sBYtV0lDkiF7l4mp
	EBj2xJiGtqyw/ry5jcYZvGhLYJH5YrGGcQXGuOeMMSjVhWnQmmghKZAm5RhaxDce7
X-Received: by 2002:a05:622a:588c:b0:53f:8b6e:5380 with SMTP id d75a77b69052e-5552af4cbf5mr18843441cf.62.1794279548866;
        Mon, 09 Nov 2026 18:59:08 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550c21e1fbsm12601771cf.27.2026.11.09.18.59.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 18:59:08 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 1/2] media: rcar-isp: release the core IRQ before destroying RPPX1
Date: Mon,  9 Nov 2026 21:59:04 -0500
Message-Id: <3b33e5cec5d3d046b67ab7ca31af0d63368da120.1794278853.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794278853.git.mhun512@gmail.com>
References: <cover.1794278853.git.mhun512@gmail.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Changes in v5:
- Regenerate for git send-email; no code changes from v4.

No hardware runtime testing.

 .../media/platform/renesas/rcar-isp/core.c    | 27 ++++++++++++-------
 .../platform/renesas/rcar-isp/risp-core.h     |  2 ++
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5adbedf..14f3c8f3505 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -798,15 +798,6 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
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
@@ -887,14 +878,27 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
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
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h b/drivers/media/platform/renesas/rcar-isp/risp-core.h
index 627a762d6b1..9e057bff4ee 100644
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
