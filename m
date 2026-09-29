Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147EC52268C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 12:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684670; cv=none; b=TBSwiveoIld+CodTmz9dupsf69tg5NTtdZE/foH+6O6v61DxOLuGwcPpxaFMR/XolKrbyYoH+V1sdIN1wlyTR9+pRR6SNhPjsXqRF6tzcEtQIOaQO5JOHP7OVC5vdnfwT+0/tEJWovB+CAUXjZ5yBQzk1w98S9s8vQgn0UgaqUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684670; c=relaxed/simple;
	bh=xPyRjwfyilCcyeFg+vatR1rOEVXq+Oc6Sf8alsTW/bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQC9h03v1D6o4BPkVsqkqotraT96+l3TcyVXHwzmpgCkiCPxQX+pDyiKMnhoEmXjvtGOTz90Q0fUWfRCEA6A4BrU1KR/XdgAaGvgIdqbeBfRyAmkWXRECBgeD51o0S6Fdaz45GidTpKFiqAzDHUbnTJ3MxLCThviCOY/plzfcTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jua+9kxT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jua+9kxT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso31062575e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 05:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790684663; x=1791289463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=noLRTkEou4q4y255qEcc6T3lEUPxoco+dVf+qITIb+s=;
        b=Jua+9kxTCF0yft/xR0g9AActLz8CW+Yyt9k7L8vb852LJbVgafHAfe7jhBrKySMlmv
         2HwiLVBuaBZ838kdDqeFuplAh6+VTjH3OUd7WrW3LUrwf9aXh2rv6qH6kpzU7+f6vJQP
         F0+gM8LrJlhO2/p/trAQcVehFRCfIZ1cVLLe51Fi8bBwcErJLcAw73QBtBNivHaaxQr4
         fwGHWWhamjdP6Ku7t2+EjwmTa9TXigxDW/duO1tkDoLicu91nLa/pN/6PI2h1pEzpVUZ
         lyIztKy2lGcRPFBNq6FOne6oN8mChvrakn51vj6A6itpZIcmq/x07oVtfsghKKuGsEDY
         CUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684663; x=1791289463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=noLRTkEou4q4y255qEcc6T3lEUPxoco+dVf+qITIb+s=;
        b=Q0waN4XR0QiQBjLXLNHs1eYhK9LEiYwbBOFg315AkEOvgVKY9nDsU8ZQYzUVPRY8bO
         VQ35VILlkEKR7SvSPvqqsH08p8l6JxSJKvAAbiSksvcVM1gfx3UI5bgJDSqagXpdUvrq
         wUln83H0pWvKRcdxj0J96AhcntHSkZbNl8nlkZyMKwJTGvW9ynjNG81MpwuCWOrjgN0g
         YoOXtLIv0qS72XQvkQA4SO1CalZvxZc+0fAQiFoL1ynrWg1Sm9tU+Yja+sNk0IlrkjQD
         uH2UTEwJQCED7zzC+SZghR6lyuMSr111eTBPP2VWA+WhspoGT71CaxnvbKd7JF0JaH3c
         +naw==
X-Forwarded-Encrypted: i=1; AKwUvBwAGvA9F/hyMJU9haJ/MDUZhMIIU3ZOB7PkGc5MM7y4jfzxd26RqEd36P4VeG/P0ga4s2kwDuzwb7TuNBZhrFJdSQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ngGUteqBEtytMCMm6OZdBjrRKFTxHp+lUzTQOq39+FAZ2UriNL
	XJbSpFW2VjSHWzAbUDxm6yU0eY7kTHJK7HQHQAAmgJlrn0PKBDbao+OK
X-Gm-Gg: AYBFou0ujnDiwP0Gx5meKIqBArZGfAO79qM3wg90IjlCayV8r6MrmuJkHQIJsf5tw+q
	9KqelREFgeDJ3JUeNUTjwZTZZA6ScjcaSCfCRnhsmnvdIn76fzdkaPQjCkYBwTlAvQnXp0bJ0Ra
	oKvncPBNUf+lAocV5ZXCxie1UEeSnEZ7/F9zISCQ0mmMqPA2NLWMigh1uwfNmqgzPmfLiHKSIcM
	z3Za4KOYTG2y+ZKBK/K5SZGW0gJBiktZEGn/vNGXG7vMGAFKK51SNH3ny59Br0lksqMd+8t7lu7
	tycSYFgcF0dXhfTtZSJfRqxpaEw0B3d3NyiY+jst5pss8ZJrBgl8yFxXeL7pMIBoU2BcaZ9esfN
	GnggeU0geAtincu56M6JMtZ1xsHZT+53BIlS1yhaDbesOcOF4BPKpOdc1GP3kLjkiw/41hU084N
	QxgF+gxgxvpol5fKYWF8FmsjzbkxUslhJ9RQ88sn7o/tBbQ8h/YpM6ha8yuoLnAlzyvdUdJuuzO
	m6ksyak5y0JGP87/a3tbJG4iiXddDvivkBFBlO7OLu3+iYdL1tW/DYMGx37gB3R+UhrSaW55kk4
	9a4pQQgtIMvYHK9CRrI=
X-Received: by 2002:a05:600c:3511:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49fe66fca74mr259377975e9.23.1790684662478;
        Tue, 29 Sep 2026 05:24:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfafa23sm70994965e9.14.2026.09.29.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:24:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/5] power: sequencing: renesas-pwrrdy: Add per-SoC probe via driver data
Date: Tue, 29 Sep 2026 13:24:05 +0100
Message-ID: <20260929122407.219448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The driver only supports the RZ/G3L PWRRDY signals. Other Renesas SoCs
use the system controller (SYS) for different power controls, needing
their own power sequencer targets and consumer matching. For example,
RZ/V2H(P) and RZ/V2N use SYS_ADC_CFG.SY_MSTP_ADA for A/D converter
power-down.

Add a struct pwrseq_rz_info holding a SoC specific probe callback,
reference it from the auxiliary device ID table's driver_data, and
dispatch to it from a common probe function. This allows support for
further SoCs to be added by extending the ID table.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
index 743855620501..0190e53913bf 100644
--- a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
+++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
@@ -15,6 +15,11 @@
 #define SYS_PWRRDY_N_DSI_MASK	BIT(1)
 #define SYS_PWRRDY_N_CSI_MASK	BIT(2)
 
+struct pwrseq_rz_info {
+	int (*probe)(struct auxiliary_device *adev,
+		     const struct auxiliary_device_id *id);
+};
+
 static int pwrseq_rzg3l_set_pwrrdy(struct pwrseq_device *pwrseq, u32 mask,
 				   bool val)
 {
@@ -122,8 +127,24 @@ static int pwrseq_rzg3l_pwrrdy_probe(struct auxiliary_device *adev,
 	return PTR_ERR_OR_ZERO(devm_pwrseq_device_register(&adev->dev, &config));
 }
 
+static int pwrseq_pwrrdy_probe_common(struct auxiliary_device *adev,
+				      const struct auxiliary_device_id *id)
+{
+	const struct pwrseq_rz_info *info =
+		(const struct pwrseq_rz_info *)id->driver_data;
+
+	return info->probe(adev, id);
+}
+
+static const struct pwrseq_rz_info pwrseq_rzg3l_info = {
+	.probe = pwrseq_rzg3l_pwrrdy_probe,
+};
+
 static const struct auxiliary_device_id pwrseq_rzg3l_pwrrdy_id_table[] = {
-	{ .name = "rz_sysc.pwrseq-pwrrdy" },
+	{
+		.name = "rz_sysc.pwrseq-pwrrdy",
+		.driver_data = (kernel_ulong_t)&pwrseq_rzg3l_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(auxiliary, pwrseq_rzg3l_pwrrdy_id_table);
@@ -132,7 +153,7 @@ static struct auxiliary_driver pwrseq_rzg3l_pwrrdy_driver = {
 	.driver = {
 		.name = "pwrseq-rzg3l-pwrrdy",
 	},
-	.probe = pwrseq_rzg3l_pwrrdy_probe,
+	.probe = pwrseq_pwrrdy_probe_common,
 	.id_table = pwrseq_rzg3l_pwrrdy_id_table,
 };
 module_auxiliary_driver(pwrseq_rzg3l_pwrrdy_driver);
-- 
2.55.0

