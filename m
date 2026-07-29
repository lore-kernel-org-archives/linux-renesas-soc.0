Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C86485CFF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329754; cv=none; b=B9SyDTCJ00s3yP91eyfFCDts3VpUrOetNU/WaD23RbrMw/nl/aIyGsajLOPkTHuXeVbOdeDteSElFwo9Forsyv8AGSj0Ne3keMj/toZ7NWQjDXNF48TFq9o+tHOLQyyng6AzsGDFKmNrJsKIkTpa6TTBoOXszZZNfARR5pwEUlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329754; c=relaxed/simple;
	bh=9jeY6sBX3EvvqPb0wVpb/aXOj+QG7syjPR1ESPCtcIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4IE+G9uqzmQV/2e3AnshAtiu1gc5afQSjj/ZEoIlYN/i/e0WYB5Tl798PYfE69l5++Z8QFCfRtngH8ePAuOLa9DtcM29zq6i+u794kBrRnil6FOfy8ZKcEVXdK77SnzMAPBmTZt1qwkC0QCUj3hjp6tIs7VjsshS7PQBhC4Iu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oa/2pk7b; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oa/2pk7b"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f703a9d05so656208f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329736; x=1785934536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHJ7qvChTkqHT1PONJMbm2kO6eeTHCVgWIzV8QJmFO4=;
        b=oa/2pk7bsmi6s7JeTJ8R883+UvQsp0teG2lFlr0rpzusqPW5nZY2kXY0b7ElAcViXA
         M/FGEshkBXlu6P1Hw5k5GArG+h38TkBehUim5uzqFcfqUT4mPtnx9PDagX7FyLgKMnH+
         KFrsT2cy5pMIRQDna9EgKZ4UF08dUe0YxbuN/IGsjD6LBdoG9MptJd+WyaBlQfmSL9IF
         qfk9ZbmKOU8dXLHexlBdq4S9YyDIdElpIVbp7ieFg8zhMKrnFx5cxTmIfkgoszVoDnkR
         3Hwb00wbWyqBlXWJ966FskDnHe+mjq31xLNVnDcS8RoOaXFMLeI/m+JHuw6dy+aP90vi
         87Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329736; x=1785934536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHJ7qvChTkqHT1PONJMbm2kO6eeTHCVgWIzV8QJmFO4=;
        b=bapnWuC/FsRPWeFZlHsHXDbMnZUEDYdySXZoZ7RAAq6Hvj4fqSppYsz5boHHBekh1J
         tFqUqBQKTOfxH2X0Rh4JA7eFxDD2SufYVdnJpjSiBQq0o4Xse1KJ/M6ztMYHn3ROZzxj
         Hd/SUxMBujlX/kX2gYS1ICz/owfcNOD+QyAbgp68ca3umDPKea1kwZMIoD0/FyPbG8Bb
         LBlq5YGMMAUwj5VavNuBmVtR2EbmFYi52wDPU4jtZmKJ2G5kcYHdwH2lbT+tF8T5Ox+O
         L/cxaRzu6pWt3o7bHdeFqTXsRTi16HVIukBumEj2agVFsjY9tEhsQFBmQNadZz7OGqbv
         1V3w==
X-Forwarded-Encrypted: i=1; AHgh+RqmB8ZtAr0DQPPSueny8uyUlgVu01x3SjaYuWszR+mi5VlMDQmtkQMfb8MipzO6qT3aMVb1tk1bEt7FL4WRqSzz+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZ6friZsICtY8A5XqFnW6SIyVimE5ZxxzdEFuysa2zoEBmk0Y
	GE6CMH3NtgpfPHsYNebXS6GHZuLArt9oskcjj13UEzTQCYqr1Yb+LjuZ
X-Gm-Gg: AR+sD10fO8Z9BvX7oY3FhPHQsQwOvLkSjXruqPUzdQJgqT6pvcxv7lN4aFm5qSypyMd
	4C7M77YB3zbq0soAC3VmD4ChjRBHHQUtn23heTJxJCSYAe0DRo63eByhT4nxDyOQR7On9msUFlH
	cR2SRUkoO2thOWR0C5z/ryXKyhmuPQEHXaJy5E/2SZarPSeFi/gw7kcU6+7166reR88wbm+EnLw
	LKLUdWYNHwAjeA+GNkX+6AcJQInVZgT03cV0ErZ7XpvH3vIY7gbK1N7I3u1PijkLKnerdrDHfUR
	S7zLSWoaDQfnKxkNyFXv6N/Kq1WFRaqr/V+WWrB6jsSl4my6HY2OQfC9hDMLdnaOGB0EZ9bMjNm
	dG0BqkBsBC78pE7AFFCETkA1kMn+N8MfF4JUZOEyLoFqhbVBJcfNByvkMvXVZr0NpAH88n78KaE
	K6/wWi+B9tIZ4498Meqxq3wa2HB2vszRJip1gPHwA+Jutpab2rk/kGc/+h3gMFa8tDellaGUVIV
	4ShIdemBSK+cA==
X-Received: by 2002:a05:6000:4696:b0:47f:bf12:b14e with SMTP id ffacd0b85a97d-47fbf12b196mr735103f8f.34.1785329735742;
        Wed, 29 Jul 2026 05:55:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:34 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 08/16] drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
Date: Wed, 29 Jul 2026 13:55:00 +0100
Message-ID: <20260729125516.230757-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add Display Unit support for the Renesas RZ/G3L SoC (R9A08G046). It is
similar to the one found on RZ/G2L, but has LVDS support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped the macro RZG2L_DU_FEATURE_SMUX2_DSI_CLK and RZG2L_DU_MAX_LVDS.
 * Dropped the variable rcdu from struct rzg2l_du_encoder.
 * Dropped the variable lvds from struct rzg2l_du_device.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 22 +++++++++++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h |  1 +
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 3d13f61d3c97..a8d841421a0b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -55,6 +55,24 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	.mode_clock_max = 83500,
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a08g046_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -81,6 +99,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g077_info = {
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a08g046-du", .data = &rzg2l_du_r9a08g046_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ .compatible = "renesas,r9a09g077-du", .data = &rzg2l_du_r9a09g077_info },
 	{ /* sentinel */ }
@@ -92,7 +111,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 {
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
-		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
+		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0",
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0"
 	};
 
 	if (output >= ARRAY_SIZE(names))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index baf076d69cda..7812f36edbe0 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -25,6 +25,7 @@ struct drm_property;
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
 	RZG2L_DU_OUTPUT_DPAD0,
+	RZG2L_DU_OUTPUT_LVDS0,
 	RZG2L_DU_OUTPUT_MAX,
 };
 
-- 
2.43.0

