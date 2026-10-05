Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EB141A903
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199142; cv=none; b=QnBQHLbYeowAvkP2yEhwSS2IVo8ve97F/TT6rTDRx2b5eaXHex/J6Stwcdr+0eNvtYBVxlbnQzHJ8QMwrOMvJtQFk8U0eA+k8fHlCIvYItxj8CJ7I0Nuds59jhTyMc5cKAdlWVcUiieRPEzwCi+T2QwlWgF7zYt96pd4GJ6GirY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199142; c=relaxed/simple;
	bh=+2GJdfyGPpCi1bcpLcGM1fSRsAPWDQ4uLIeTVZGFlDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnUZfn0+wGQIBZEU5Z1QHqVUslT4Uxl5iWiYt9cQp67mDcvRq3HMJyTSncxUobIGkluPdS4GZw84B9U/AObxCpGZXcWKpCbJYrh6hoMZPTwngpOYR0cokATQTC2+zMTzf9/K7BnqLmbomFhYxtAPkLlyryJaIZuxCVV9Owze8Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mg9ltvLG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mg9ltvLG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so15855005e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Oct 2026 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199139; x=1791803939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlYflhanCvnXQMeFN3czAfm8W2VezSHi0GEoSS0wXlk=;
        b=mg9ltvLGfvZAyACYOKes/zBMpSY4T5hSsgzVRnCZiWZRLr9I2uByOJ9DOxevcjuoJs
         gXpGg/XM6PBt8HO1TMqA/XXqEiUjI3VJYa5fWvt9P0E+v9/xyKcB0K82o0xtDPqlWxEy
         2SJBjEYfAM6pia+QrxTIWJrrlBnW2ATtzo59f2Z4a/MRX7U/ebEVrU+ghUqEhGrGk2Wf
         CxnYc6m5DswUh/akWVqr87EoRKgu6SbJatkCLUvt+97qqNwWIVkoqimfGBb06EwuJHzq
         3PMdAszn0jWOU74zunDb5H15qy+S0tjDWDdsNnxTz6kLynVK7+OAUrokdyD0Ehg/wEaK
         19YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199139; x=1791803939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlYflhanCvnXQMeFN3czAfm8W2VezSHi0GEoSS0wXlk=;
        b=wooYy1zUQMLDmJ7a0ZmHQ6TtZ5ia1EW2Wrt0yWiQHhk56NnSO2HQx98/mM0p/IenuR
         P41VlSQN6uz1diHy3hRYRRw8ZYx64CrxyWMZj4Ucmu9tCxvFCohSLzRdr3u2NsyD3udC
         tOTQ32kC8H6K6akaP//+ekP5c7W3BZU095DedsPamsOU89g1RvkDh2oPAqa1MsLGuMBI
         l9of1gweIoXwJuQjbeNJ6kluy+c2kK2xF5ftZ9B4H9LkJf4BP68Ks1GYIflHaFK5EE/u
         rstNxdsW3h3Re5FtzcT6JJftpF/8vce9qNuE8k6M4tNiQflU3N4hG5uiuPm5jVsQzJgO
         qbAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNYOtztYXd5idd9fJAuvdCmOcVAXypq/T180DAQ+I+bXXBWnebs9iOxGdLzNaVK8LnMjlOq429WEedLKx8Yopnqw==@vger.kernel.org
X-Gm-Message-State: AFuF++ndiAQVlTqGvJ1YkYjwiGoiPzvhONxdj4j/qfcq2oc39J+jODiu
	dbF5FdpJzoyG+XFnazDueN+cCymYaOfRmeI7I5MUz0l629xj8M8PUlwE
X-Gm-Gg: AYBFou2Prz4eLlOcFHOwZ6VMcfKL/+EGBpcpnZlZ/uCD5S7anhja9fudN/qTVRKsrVU
	gTVsbQZCWyU3ob4zyixturtnLlnBEN2r26Fczn6dGj0AkuwinevqBvSVWr+3MTkwVEx1dmxbP18
	78fjxf2xLaJpKpP01391NeMkh3M5KQ5BHH0NJ1rdzICBNDMzNT5VLJCJj5Z5gOn/BnPxxauhY3Z
	xHv+ul40pAgdaY/aUA1nvmZ1yekJIDLIOX3pXFh5mf0gJ9Zn7PLJXZpio9r3GxnI5ozKkLgEdwq
	fMKqMhIkkE7n/XONOc5emoOMGL4eBpeZSnXRtuZbpVevayylPorlppslG74LGr990i2DKELuj81
	Fd69U7Os2tM+FEPMMSzw3Wf/JrMsxYwIrQrFcwlnOEXzopeZyJD7K75xVHSmYGXnrzPW45It++p
	XxVpoajD/23j9LajGNDk3PaOYUgh4x/IBzLz9bv4H35eyjreOT+Bo+dDrEqysGCx+TofsahS4VI
	KX67XserUMYSYdizKdp46c=
X-Received: by 2002:a05:600c:8518:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a1773ba805mr1788005e9.7.1791199138994;
        Mon, 05 Oct 2026 04:18:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:ddf5:4eec:313c:43f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm355884865e9.8.2026.10.05.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:18:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v11 1/5] regulator: renesas-usb-vbus-regulator: Rename platform device to rzg2l-vbus-regulator
Date: Mon,  5 Oct 2026 12:18:27 +0100
Message-ID: <20261005111854.275120-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
References: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Rename the platform device name from "rzg2l-usb-vbus-regulator" to
"rzg2l-vbus-regulator" so that it fits within the platform device ID
table's name size restriction, allowing the driver to be converted to
use ID table based matching (struct platform_device_id) instead of
matching purely on driver name string. Update both the driver name in
the regulator driver and the matching platform_device_alloc() call in
reset-rzg2l-usbphy-ctrl.c to keep the two in sync.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v10->v11:
 * No change.
v9->v10:
 * No change.
v8->v9:
 * No change.
v7->v8:
 * Collected tag
v6->v7:
 * No change.
v6:
 * New patch
---
 drivers/regulator/renesas-usb-vbus-regulator.c | 2 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..22fcf0d10c85 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -58,7 +58,7 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
 	.probe = rzg2l_usb_vbus_regulator_probe,
 	.driver	= {
-		.name = "rzg2l-usb-vbus-regulator",
+		.name = "rzg2l-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index f003b360629c..f90fdb7e6ea4 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -241,7 +241,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
-	vdev = platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
+	vdev = platform_device_alloc("rzg2l-vbus-regulator", pdev->id);
 	if (!vdev) {
 		error = -ENOMEM;
 		goto err_pm_runtime_put;
-- 
2.43.0

