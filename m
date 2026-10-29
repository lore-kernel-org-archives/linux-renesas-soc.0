Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297484;
	b=npcO+cZeN6kJFLAxv33fj16U/53M4coX33SmJionH4MVZ1mbLweuyb50jDG+3IDYiMum
	 AggsCGyMLH5GvWwFcYQi9SFR5482JNrQ+KFP4H+MR1m6Es4VR8ndqhm66z8yLQp/X6iHp
	 1i/EQtnkOlV6MgSRkazqThodu5Y8yS0kS0Qxp1/Njq67SewUdpy0+6hRvJpC72zVqcLKs
	 P/jCWrS4GnC8apGAk8X24NqPs+0XKt4xBEGMQFuPu9bZNsHz5W0pyC8pbz+tEwRM8zQ0e
	 B8GUE0sOm+Z0N6qSXiUoznQxBKL2ks4wX4gQQ4d6S70rvUu7VGwTrq9x6B2tTyQR9Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+z2btZkpJ+TluBaKBtaVuSDSAiYPrkTDeeGPI5tssnY=;
	b=KpXxMs/RUyeJAOqWH8dGPliqaFL1bTYJ85IIeZP7mg5s+4c6bZgX20W7fQZnWO+mdYSs
	 9bm3lN+vuFkl0q02IF1Y/y1GNb91JuHj1z/J/FV4q8p4oq+DqMeGhkmkUxkvFOt8O8hQE
	 Eq3S6/+HYUGQUZW1VgWb99+X0LfO/MhRyGxShohoAHvu/GIECjSnYXrfQHFcdyS83taQ4
	 xXyWISOaHMn1ibxnegZbxbBS7hlc9dqmlOt2xsMlHHMM4xac7J6hiTNPKX8xxj74PXJDA
	 oP//MtUxPVoylCVuKtx1ciJKWImyFQpPM5Pg9puB2sG/wnGkoPg5Bs078AjJCahlJIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kA8DGoIW;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364DB606A31A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 18:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kA8DGoIW
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06454116eso1349114b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297482; x=1793902282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+z2btZkpJ+TluBaKBtaVuSDSAiYPrkTDeeGPI5tssnY=;
        b=kA8DGoIWJVfUg2+8TEAlcr02qRAas1WamLEw9se1oDuyAL6mB0+SBqZ2Nhf1/Oi7P5
         jFugVvRpoyquphZi3pDahK3ndHBy/oE5v06JdRDwkay2AeKYOORoFPjvce4cv7PaMp1X
         gUrvj1xqKfMRUsf18jwuv9+Vue98Z73xAIF9CN8thmdFPVOdmtWcGh1MsXhOhZMUqjz3
         6leC0g094Fei3bu+gg08o+MdYiksIjlO1V5ixDt4V88mcg52fpP7nk7f72jq6tXFylV0
         r3blh61v2dWDbXvIUUlR8qEBGQYnA0rwpXClq0YGbejOjFGkRjzzaMOaL1qHt8DYmcw2
         Kc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297482; x=1793902282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+z2btZkpJ+TluBaKBtaVuSDSAiYPrkTDeeGPI5tssnY=;
        b=WYKDN8hnaRjtGEVdm6MvPkhjbpPJntha0a1yWSvD6dnUw9t/NC0yNE72lG9hp664iv
         UaxcdTAyHCauMlb5FrEDVEOr+xpogk3fm1wrBzfZiFuz7pE7Go7xcr4IU0xDKFMSmIOD
         Vp1++uISpsF02PoX5aOkmFOqCAkGQy3Gz1EaYO93lgoakoMMUpqqqWO1bzY6iL1fAjEl
         Fz5ApdfzONwHRLl7tOPOCo31iKBzur0Vv3O9hcmZIrQr7x4aMxuNOnnZ4XElzwDMNhfq
         /5vGTR7y3dXTci9/f5k4QluiozY2j4eqB7uFPeTfK6WUTKwcx/+O+0VqHrwgyQm5mCqI
         Nd9A==
X-Forwarded-Encrypted: i=1; AKwUvBxE+Mw8LomqnSd2Jdn8xhPE+oQjEiPCLB4ZxGDUl7vz5CIgJi6tyUV694vvd7xQmYxg2lF4OjR6N4X0O5EWqcOudw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKiThKt5Z9lSchWG6x00OoTymokGBzc3Kj7bxnvYPMJo4wooS6c
	bnuXhihpldK+q+v8kwLaZjHLm8wmW4xn0MZXlNCMnuhvpsDsOUzaGM4=
X-Gm-Gg: AYBFou2s6v3vNgx36vWxYoob1H/lbR/g6ZE3hvWXxMYH6eBPAE4AZn9oPhGiyNY484N
	fR9Yi52mGxTEpmxJKo+0yV+5VQW8tAL9rrS0SveyoXcjYPn1hr+RlSNGg0NgXSTReHoxTMMkayq
	U0aYr6W3a3Jt5rmCC8wpuNuIXwHUqOBJdCmiQxYeiKDiV6FrBY5RMoI6iv0q0q034t1HIEtMnwN
	LxTNQvK7lJEecqvI9mBJ+Oi3WTTiJ294YAWmwco7YnSzq5JtrEotF4TjESwpdg3LLe7fH7+bN/l
	85D0cZYQiN2z6XQMIL+aK5TcKq0uLnjZMLiyUvni3tWPFEbsZRqz0oMbDLWoZ0XGjvuwmXWAoqZ
	MqjCgOHUROudEXPfybQm8Iw56N0svmJ9KwHduuWw5y0AgLC3Sk8wfGm7v8RqY7OTjb0kbkn16k2
	1cVEOhYpbee8mprCFTJepKWfP0bGXj5/1KtmW+6HIIdgi/p0DxrM7XtCSGX8wFR6utluoBrSfpa
	qDfGb9odKCy1urO8IfekeHtyvnZ+N9UfIWBIznf2IXp3juVkj0z7YHFBy0mlTuvv3JdARTKv18m
	56wgw0877SsD9NES2hNQ4Vmp+O/hE8Ujwv8afyQXyquXYT3mzY4XHeuIRGOkcOs9F1ku
X-Received: by 2002:a05:6a00:22d3:b0:8a0:7573:4f20 with SMTP id d2e1a72fcca58-8a6e471283cmr5172733b3a.4.1793297482533;
        Thu, 29 Oct 2026 11:11:22 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:61c8:985e:fbe6:4d1e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a98643466esm200114b3a.2.2026.10.29.11.11.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 11:11:21 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-kernel@vger.kernel.org,
	geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] mtd: hyperbus: rpc-if: fix an OF node reference leak
Date: Fri, 30 Oct 2026 02:11:13 +0800
Message-ID: <20261029181114.78137-1-yigejiang86@gmail.com>
X-Mailer: git-send-email 2.50.1
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

rpcif_hb_probe() gets a child-node reference with of_get_next_child().
The HyperBus core does not consume it, so the driver leaks the
reference on registration failure and remove.

Put the node on registration failure and after unregistering the
HyperBus device on remove. Leave hardware initialization failures on
out_disable_rpm, since no node reference has been acquired there.

Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Changes in v2:
- Move of_node_put() before pm_runtime_disable() in the remove path
  to match the probe error path, as suggested by Miquel Raynal.

v1: https://patchwork.ozlabs.org/project/linux-mtd/patch/rc-review-20261023-ai33-33-fd231771d138@gmail.com/

Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
CONFIG_COMPILE_TEST=y.
The object was rebuilt from this exact base with v2 applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/mtd/hyperbus/rpc-if.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index f448e23f9260f10abe17842849b312365dcd8294..ffa6578b5d399d19d3cac27d7769cccfceb0be92 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -145,10 +145,12 @@ static int rpcif_hb_probe(struct platform_device *pdev)
 	hyperbus->hbdev.np = of_get_next_child(pdev->dev.parent->of_node, NULL);
 	error = hyperbus_register_device(&hyperbus->hbdev);
 	if (error)
-		goto out_disable_rpm;
+		goto out_put_node;
 
 	return 0;
 
+out_put_node:
+	of_node_put(hyperbus->hbdev.np);
 out_disable_rpm:
 	pm_runtime_disable(hyperbus->rpc.dev);
 	return error;
@@ -159,6 +161,7 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 	struct rpcif_hyperbus *hyperbus = platform_get_drvdata(pdev);
 
 	hyperbus_unregister_device(&hyperbus->hbdev);
+	of_node_put(hyperbus->hbdev.np);
 
 	pm_runtime_disable(hyperbus->rpc.dev);
 }

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.50.1 (Apple Git-155)

