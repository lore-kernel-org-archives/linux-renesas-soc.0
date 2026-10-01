Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919714CDDF7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847653; cv=none; b=ex2VFI08zV1RIEwPTCaxgVAyPMxfUm2wbwMzY5lo0nrlbGMLkgTnQnR3cN0qWzTmVwsep37GnX73V6d00OwN3j8W23uK3JFX298apa69syJrjo8h6hGQc+Iaxz5VuFVZA7Big5UOPnRlc/3Re0ksQzRFVzC7SSqKp5rKcqIvcD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847653; c=relaxed/simple;
	bh=05CUp7KZASv7VAw7dKfffS4b0cRggUpo4aAtE3WB0w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SI6Gp3jimjUs9AablpVtu3CU5gRYBpRF8f+5X57SKL/Jogn5DGfDVjbKi54avzluI5fMgSEUBO6OBjyQLQ0ry2nzCnBTcsi9yACSejnYz08hSm36kxyn1B2dMEVrMEmxYJ4LHhs1tkBw68xyUYsRFuM2o5b6Qk7iqU0zoGU1EX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8cvfGOK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8cvfGOK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so32786835e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847648; x=1791452448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHkWO7aBhfER+SNZ+kSaAkHEYBGMw8cJJ5ZRGj4410k=;
        b=Z8cvfGOKd2HFM73na7rT7oeEBfIsVoIEpL4D7YbWNUH9RZiLvi0YDNCbBgPtZ1/UK2
         REH/zaXNNBfiza4oV+9oO0M6Sev5nzH3cqxWD62F2bEGgfbbCF8tKIlp0vn8311Zy5OO
         4qfjy8RhAI6mtGjDfWQpuK6fKKh08b9eJG20s7dKWdbY5rTSFHmUT+vWsxWS5zqPz7t0
         m1PTDwmvI1Z5LsZ5UMVmXPyjnLcY6zDi/vHcfwxNHONLzSesrMmXcQIkNW5BnNuYiON0
         qZvcGcpFqBd8HaBECw8+6P1MeZqafNG3fSHxg1lBoi65evX2Hdz7zHlB4QiWB+aqNIeJ
         7zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847648; x=1791452448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHkWO7aBhfER+SNZ+kSaAkHEYBGMw8cJJ5ZRGj4410k=;
        b=RgPATmVXke8BOeu4a7lJ69/NH9evdADXrouVs8fK3vOhdU5sTfiJMeaPv2BBYXUqg1
         N0kKcJ5JQmb24q0mYFCKN4PTvt/dGwM3YI4oF0XJPUD+FBaf/vy7c5I77p5sRqXriS0+
         Ikn5fgjTggbtkHh9vfEqjChb98M8F1EZNmRpTHr4Ejx3hE0Ok1qsXL2RLeEL8/T164mv
         sB7p7VEFwQYh9zhD2TH8zSmb9Y9P8prv/6q8l93eryGpze6DuEiywdYdQfkieNrnW7H1
         BgD2jF9jafJlErHG5pegTLVz3p+EVx1jg+sPioU5Qy4NKG43t3LUZgycUS5EFgVIlBdt
         wAdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwpriMiv5eEBEmupGb76EIFWVci3Lzj0n0jReokEKP7duN1X0eDjePlo0qia2LwkBHw9Rlct7LmFEWHisd5YfiAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mcc44EH1nCFwX6HClbHvCZuOTTT6d3Yc93YzZSxOPI9AYJ14cs
	mV8ogR00JPrLCiJWuGfOTdQDjKeIL3HsamZL1761k6RxlC7vM5VOJa9w
X-Gm-Gg: AYBFou1ZAM6ARQd6YmhoA51GmNZihTNiyxRVlJ1V2939OT6g7hcpd7CpkatUM038jXH
	MBhgQqtxxrQOxAdhVa8ChWikB84wM7RDGsVkcILz0HYDcIZkRRjiFvSMBLPSZpLJQPoJ+clO8+z
	BC1VhbIihBnKl3xYS4mKSirQ7TTlx9zzWpbpW5Hyl3u8c5n+/Y+aIclCeb/gtXT2EsmEM4dK1K4
	+MfpFKmKYIMaL1YehBNohVWklcDg4U2nJOM7ZMUlNeS0cRVAmf2bqLwZlwFw0KDU2FQdDUqLqWV
	tnw4Cza6GKN0VM1LDCYfnSbf3ogmrQg5LzEmqj8lWlU9coM/h1kFW5U9HmA+pn03uc2aDy5SAz6
	yNjwgFX9UVUsmxsaaRA5G5XZ9Gyto3LiCmp/xLVjKWuheR2HuG+2bluPMylKQuGXKnjaHQqVjeq
	YlcZbnTo4Bqr3Rv2J/P8KwaThEry2Khm4lEM4EwTZgv9vaeC5GKMDNbnfgPgxHZGd4TfwzfzAms
	q3Z
X-Received: by 2002:a05:600c:1c28:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a01afec062mr78985955e9.12.1790847648194;
        Thu, 01 Oct 2026 02:40:48 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:47 -0700 (PDT)
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
Subject: [PATCH v5 4/9] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
Date: Thu,  1 Oct 2026 10:40:19 +0100
Message-ID: <20261001094041.135697-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The register for controlling power to the DSI region is in the SYSC
(System Controller) block. Add support for controlling the DSI PWRRDY
signal so the driver can efficiently manage power to the DSI region.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Collected tag.
v3->v4:
 * Dropped pwrrdy variable from struct rzg2l_mipi_dsi_hw_info and instead
   using feature flag RZ_MIPI_DSI_FEATURE_PWRRDY
 * Dropped rzg2l_mipi_dsi_pwrrdy_off() as it is taken care by
   devm_pwrseq_get(). 
v2->v3:
 * Updated powerseq API names.
v1->v2:
 * Switched to power sequence for handling pwrrdy signal.
 * Dropped header file regmap.h and mfd/syscon.h
 * Added header file pwrseq/consumer.h
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index d67e1230b70c..5263b2b8f1ca 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -18,6 +18,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/units.h>
@@ -38,6 +39,7 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_PWRRDY	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -87,6 +89,8 @@ struct rzg2l_mipi_dsi {
 	struct clk *vclk;
 	struct clk *lpclk;
 
+	struct pwrseq_desc *pwrseq;
+
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
@@ -1396,6 +1400,25 @@ static const struct dev_pm_ops rzg2l_mipi_pm_ops = {
  * Probe & Remove
  */
 
+static int rzg2l_mipi_dsi_pwrrdy_init(struct rzg2l_mipi_dsi *dsi)
+{
+	if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_PWRRDY))
+		return 0;
+
+	dsi->pwrseq = devm_pwrseq_get(dsi->dev, "dsi-pwrrdy");
+	if (IS_ERR(dsi->pwrseq)) {
+		/*
+		 * This platform requires a sequencer. If we can't get it, we
+		 * must return the error (including -EPROBE_DEFER to wait for
+		 * the provider to appear)
+		 */
+		return dev_err_probe(dsi->dev, PTR_ERR(dsi->pwrseq),
+				     "Failed to get required power sequencer\n");
+	}
+
+	return pwrseq_enable(dsi->pwrseq);
+}
+
 static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 {
 	unsigned int num_data_lanes;
@@ -1454,6 +1477,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dsi);
 
+	ret = rzg2l_mipi_dsi_pwrrdy_init(dsi);
+	if (ret)
+		return ret;
+
 	pm_runtime_enable(dsi->dev);
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
-- 
2.43.0

