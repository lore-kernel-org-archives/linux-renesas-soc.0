Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E9E48BD4E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Oct 2026 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939837; cv=none; b=lH58+x8eYMyn6DxhcSjLVhgsk7kmXXfAYN1DcU2m0lafOSQ2AkKgibFbRgMvafYH6RtC9vDIAiavTn9MGpQhMTIfitYf03tS5tHps0NE/EVkqOvjgY5H3iEBATm5E57DcL3cpSwJr5QAdh1iH8sSxXYB0xv86OgVzF3mYRI48DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939837; c=relaxed/simple;
	bh=rBMneOdi8JPyV8Mnv8EGLgCvjIhFZ2Xzf281WEFG6Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfuOMi73RPU373isFC76MCV03PPetq4Vb58yx60qbXfNgs0DpXMnoLI0+XwVqsWZfUOsSqrSdxQLx7wCdMIGSZf4DGzB/yLscTVUvRCKdKAbw24Rhq5DIW8LqQD0vdVoXB6vtVrjOsOFDACpbaGNnidex2NiZB+uF+LnGVkVi9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrXciLr5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrXciLr5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so36337945e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939832; x=1791544632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=joybcb6kChYlvrNtjtCUkO8OtPi3RWeB2tHiHzMcqiw=;
        b=XrXciLr5dd6HiHtiTLKZ/zRzx7Bzyu/aX4aiO2EIp4mavTRky+o6bvBMLQfcG2WdIn
         wm39JzVHuHXmysU3aMrsmnYegB0veu2zhaNMH6bI7GzJiKYOh2jcoxYYlv8Msi2cc7pX
         UvAqsvuNyJ8wgFH1HwlaFdNSyrAvScBNzb7nO/NiKTn5yuwIixlmOcmXdlZwVLTa+RFw
         230p9smLFao7EfXrfhkNjGzFRXYxwUewNFUJ+mkuKwMKLDwQI8iPa4rt7DZlD92s0EE/
         tHGiZfdlDL26Q4eK+y5Z0Z1wGzBNutD3caogpEEgs//a4AyL/uCfBIa8EEm0rTgV0Z5f
         hLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939832; x=1791544632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=joybcb6kChYlvrNtjtCUkO8OtPi3RWeB2tHiHzMcqiw=;
        b=SpYhm5hLsr6nyY1s0dglvHcxHgEVvSKgJZj8JBp+lGMqefujIsAkH32GD524cbXfiX
         hk2Aq/ThG/gYpShpd8LiGYzUwWmLQZGHg6EFF0Sm+9rWMOjKYTq9jbfLLDvL6rIBfmTs
         HoDeTiodF2FELTlmO+1UMWReoNchwunGCbBtZqz9Z+KKJyegYK66kNVCotpXZexNZNkO
         X5y6K4+OJG7LOaAoeapumPUj5sb5dvCwXACjSvuKkAYhJgSex06u/L3gvHNzQsLeXk1f
         i2siO2i1hc7klvFOhLUWoR2OYWSBJPSNpqrRJYhUVYu13Ai4Ay12TmDE+68+WYf0SEkP
         WGWw==
X-Forwarded-Encrypted: i=1; AKwUvBwN9cE2y5orK1ECUlB2LzcinXRiYTvKWh4Q6Bzx5ki/JCnm2XgzVvmLg30TvAxns3ZNm11B6jgSpYlnXnHvBiiyGA==@vger.kernel.org
X-Gm-Message-State: AFuF++mr7OcWSWHLjNzc3rQ1HjQKmP3lacHUZ3kd7qL0RE7svYpZsGXm
	0qYbUWaSHeuMTT/jrHt6YSGbbuP4zL+rw+3fm0vCe0wPRdpLgiS0Exkj
X-Gm-Gg: AYBFou2s9vwUBkJ1Qbsl8Jw0Oqs9HXuzPP2NzII3MOqruqCgkpybQR/Qx4jjSak3Dx6
	CWUMZGOshYoCCcuuN5VkkR2Kc8KtPZl2vIpCXZR0G4PDWu1JiQb4IsKbY305LetJ0gOIKaSmks3
	1zDTjaaPfTwue1yOrrNOaibLHCDZ+oZ6ILdf2Y4MPtAXuYXh8BK6tRCQ45KZfTSIGSbeQQ7EboW
	d7I3JW2ZXjp/mepL8+PuuFwpfONUthcRVpR7uVT50eh/bUGxnU57Vmzk0EWqGZMZnIKCAAFgeSs
	jE3E5cWwQiJCrXc5cSx2B/cavlhX2EwZT52h5V5bEf0eFv9TALdAMi+eN9MvSqIQp1FqoiDN3B0
	M+pMt0iNA4NLweKtkQjPYOZdnpk5YNN0xRiqqmHCj8e9bxk5qo1iE1xcTJFGX2nQYv0cSWKI5ei
	vPwsz1R7xWi57CyU9mGXsSi3DAhe7uP/9xDg3MNcui44ZiQgw6N+9BIGUYKaWn5XR0g0WYBWCje
	k3NUfU=
X-Received: by 2002:a05:600c:3493:b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-4a02754310cmr45746985e9.8.1790939831816;
        Fri, 02 Oct 2026 04:17:11 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:a3af:1973:c597:abc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm73324205e9.1.2026.10.02.04.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:17:11 -0700 (PDT)
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
Subject: [PATCH v10 1/5] regulator: renesas-usb-vbus-regulator: Rename platform device to rzg2l-vbus-regulator
Date: Fri,  2 Oct 2026 12:16:56 +0100
Message-ID: <20261002111708.234957-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002111708.234957-1-biju.das.jz@bp.renesas.com>
References: <20261002111708.234957-1-biju.das.jz@bp.renesas.com>
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

