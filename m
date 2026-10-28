Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191893;
	b=eIxsXQF2T54NUNflg+3zFsviMJanwQQ6KP5cTYeCVe9Nf5KOKIjnajZUa2xgWDeVM07T
	 0fEAaJFMUeI6rGteqtmRkecxTRw+8EoMsHSa/GfrONRXkI9Is2Owmx3rmPt2vd6gpjHOp
	 K6gPeobdvnqKff5JfTJ9YHREKmFlMsIYXFuVq1pibHIM/NCtkctnpxXc7cg3BaTGRaDpG
	 /ff0XnPYs5fwwscpqg5Xs9zga8pp65i53K9gUUS5miGGEA4PqtmuI+SuSAWo/Ek+VkwS7
	 22zsEpgsWr0HGNyrzAfxTmstASyuXy+wjUjteLY2PeDNhHLHmcUMRPOpeZKlm2kX17A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xoqWy7MO/c6N1qFdA742uHez375d4m56xLpj2LgHpLA=;
	b=QOHGipPRWjiWmDp7wdC4fMTDq5/gU9dwYIdLhsLyFu0+oZWS5V60LzX4xV1H+UrdMzAI
	 6mAcwDc9gqa0nMXeAtDJqgmwDcZg2NfGrZARY7dXPHBMTfZbJI8ZlSao22plHZOK1ujwb
	 i4QYtoiAt4F7zKR/mxvgMf46KXEvDGiK5liV8WAtrquG7JtTZxpWwJOYTyUfJeXdBFNEY
	 hyw/8/yvG0mW6a9Ufk1AvjVgaA2rKf/Ytk4Cw7+nCgjN6oLkSzcfcVme67yRcyAATMAKC
	 iXoXHUFAG2fBK+QNQGYDW23LjUs6lGHqL79UV3819SM35dUXj5GepfC4lMEUxH3ofAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlqpEYJY;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951960A261C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 12:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9951960A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlqpEYJY
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso7860375e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191891; x=1793796691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xoqWy7MO/c6N1qFdA742uHez375d4m56xLpj2LgHpLA=;
        b=HlqpEYJY6SeU06ZVjmrQxi16ZthOhhVqapCxvG8plybQOMFXdacYpjPCirWx6S/WhV
         06xLJjJphsq1welDkMCCYQ8x1n14sv5suP/3e3s6kxRLzPc635UhxyOtguaV7pMlnt9b
         qEaZnaY1dcdnSxHk81jERJpB8JNJYq++AUKOqJOKI0/94sIhEc6xy0boIKnE7MZ74wlb
         QBnyRwjIrjKI/qgZoRcCddF4V8W/z4+3w4zIcS9+cjd6YW3wBYJrRza/rubCCfCmA6Nq
         iPEX6NLW3C3pShttrghSoks5t/B9WDlR05ooYOElE02svDeSLae+F96GeKGebGJKReaF
         ynkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191891; x=1793796691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xoqWy7MO/c6N1qFdA742uHez375d4m56xLpj2LgHpLA=;
        b=d+Vn6GY/KpSp49tWO1qqYOHdct+n19DGx3Be2pw+VymoWeKByzUp4in+bzi/p9cg/X
         5JIlrEQScULg4Q+Zu7ExvuQfu0yOa94eOjooU1JDZ36phprpVAFAr/ERL+t1E2zIjEMv
         aqdXfv+Jo1/Go+a8iFd6ORG36UjSLTSSg35auyTe8az0PzwHgbOcJOxS5E9a74VOJzQa
         vR0Z27t43WJhnQqM+wt4TDiipcoJpY3Rv+XpGhQl9JVJdpNlfl/Rl/tG8YweZz8ZXZuv
         Z8i5d2rjHBQS3gNymSNwzdkn5N1eNWirUsrxJuPfuQMEZQLCQ7A9XXOZv/SqRVwPZ3e/
         rXgg==
X-Forwarded-Encrypted: i=1; AKwUvBx6hqo9Veys2HVqb6E7Wb4CptwlduhbEjcOMwFFesVN18WH4ftwFx6LoauGTUgEz5xFYrevgqWMyU2v9eYbD7YONA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbRMPuJayYUXhwDav54iKPAcGgGJV6IqbbTTVDLfMk2H7cfcro
	2s/7Qn+ns5LjxCZFPKu/lQ+HP++aQ1yuJQzAUDLNV62J5X33p1Y60WLE
X-Gm-Gg: AYBFou1KEtZH9sQcdV4JHxc+qbgt6NXtDIeXHREvCbNHZ4u9B5kKOmAD6pBQ5RGA99/
	9qX+AsS0KMGW8RaeORhRQUiNMkqWAm6S/siVHufm/C/dHCGpuOxWRtl/0IWdxPl5elL4bx+as+3
	TJLOA8zJaV9lzK85lFl6eXNrcowan5Yykmn1d+rzS7o9GbCZVr0dyXsDcfhgbupj8n0+DUvCuqD
	Ltdj4bywPhA/34sFEcyGC5jIZMGpFnXmvuEw5lwGCt9xXrfCs/H2bYp0ooozSAV5VQGKx7K9trV
	AT1KxxIq5hwAZrvknnJ08GBYbLJdNXNf92iDqU1BynVMho1Ky5G9fGHIGIpoW/sEVqH6DuPIns5
	fxgV52tPwk1Fb0f00SJMVs9yHZTbooHUh3S9eR1Hw7NHrNjGVgYRkbeuA8a+Y11w3QKDq00aAKT
	MNGOgczw3Q6KfQeHV4p2B+pyLSyl1P65qj84oI9hVxNgWRWOUF33lYIuoHPRIP5EG6o6K7GGdS2
	dSUcsFRwQmVv1GHoGRydkP+6xMJ39AacMeg8Y2cIWWHkJ8CWyjmHN8/wtRh2ts3Cy2O/zKny9e+
	CNf7t5tY6B+voK7oDUve/mTMhDQrA0po2tPUXmAXP0uArniTWxjAIDAkQJwjkK+Svcg=
X-Received: by 2002:a05:600c:3b1e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4a9665870e9mr51619735e9.15.1793191890986;
        Wed, 28 Oct 2026 05:51:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:30 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:26 +0000
Subject: [PATCH v25 09/11] mmc: renesas_sdhi: Add optional axis/axim reset
 controls
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-rzg3l_sdhi-v25-9-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=4251;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ofWNQQh7eeVtC/0QxqS6eNcmDhEtAhULNqUDYpDf2i8=;
 b=2dB6KGv2VbGSis5Wl9Z9RT5ZJKhkOY9qnEpDRZN3gUjWTX2kjJPuVV1agZhObhLJLBnRJol8P
 qQOj3U6MYJnCurHjqiuoqu4n3rdjZVM0yfMC7WdPgi1puLAPAtFDVIo
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has axis/axim resets compared to other SoCs.

Add two optional reset controls, rstc_axis and rstc_axim, to the
renesas_sdhi struct. Both are acquired at probe time using
devm_reset_control_get_optional_exclusive_deasserted() with the
"axis" and "axim" reset names respectively.

Include them alongside the existing rstc in bulk reset/assert/deassert
operations: triggered together in renesas_sdhi_reset(), and managed
via reset_control_bulk_assert/deassert() in the suspend and resume
paths, replacing the previous single-control calls.

Being optional, these resets are a no-op on platforms that do not
provide them, so existing behaviour is preserved.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * No change.
v23->v24:
 * No change.
v22->v23:
 * No change.
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * Fixed the ordering of resets in suspend/resume paths.
V18->v19:
 * No change.
v17->v18:
 * Fixed ordering of reset in renesas_sdhi_reset().
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 3c991f6b988b..4f8ed1d8efee 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -102,6 +102,8 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+	struct reset_control *rstc_axis;
+	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
 };
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 3a1a558bc98c..e897328d5b70 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -632,6 +632,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 				sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
 
 			reset_control_reset(priv->rstc);
+			reset_control_reset(priv->rstc_axim);
+			reset_control_reset(priv->rstc_axis);
 			/* Unknown why but without polling reset status, it will hang */
 			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 					  false, priv->rstc);
@@ -1151,6 +1153,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
+	priv->rstc_axim = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axim");
+	if (IS_ERR(priv->rstc_axim))
+		return PTR_ERR(priv->rstc_axim);
+
+	priv->rstc_axis = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axis");
+	if (IS_ERR(priv->rstc_axis))
+		return PTR_ERR(priv->rstc_axis);
+
 	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (!IS_ERR(priv->pinctrl)) {
 		priv->pins_default = pinctrl_lookup_state(priv->pinctrl,
@@ -1404,13 +1414,18 @@ int renesas_sdhi_suspend(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc_axis },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc },
+	};
 	int ret;
 
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
 
-	ret = reset_control_assert(priv->rstc);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		pm_runtime_force_resume(dev);
 
@@ -1422,15 +1437,20 @@ int renesas_sdhi_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc_axis },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc },
+	};
 	int ret;
 
-	ret = reset_control_deassert(priv->rstc);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_assert(priv->rstc);
+		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
 	return ret;
 }

-- 
2.43.0

