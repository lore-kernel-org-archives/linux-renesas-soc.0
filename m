Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C112486635
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329757; cv=none; b=VQQoQXlc5+aM1cmGpwK3hOQRre9E+E7slH00u3bcXdaq0P524/M32sRVjCPaHw9iFs0RkdnGw1Fwtg+CcKa6TfpSBwiam9uJ0tBgKtkOC5QRoeKjQJfG7Ux4SuYQLeqMzGPXliqhIQZ/tllE3BuV1vno7xth475HN513XkYkGTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329757; c=relaxed/simple;
	bh=6aFfq8eO/s1G2pj1KpdcwJC2lfQ+Xg/2T26far0sK2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjHiClYPLA3A/y4GQfhPND7WV7ylmVddLvnuVLU36NpN0rJMIZTN15NmB5HFwqX3XL54lTxyF9t3Z4Eif3pggprRe5OanVtNk/Rp4laCuGfba0Z1KiHmByEz8+inMeuSqdRkmUd/UmLm5UReL+2iUGj58I35ft0g0HTVrd4mqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPuqHvo9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPuqHvo9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f752b3423so592179f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329731; x=1785934531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJ88tlR3PQHW+zOWbGYqc/0EZpxNXGTOLvGqYwJVskA=;
        b=rPuqHvo9icYo2Ual7yULtQtZkvExMT8dvNDi8+A6ORiXjAcWcMSUZi9S+s8ye4eANI
         Z2MrEtGF0mxBCRa4eTH66hI8vpzy2PcKle6i4/6QJapAkUng7hB5YWDXuOenj1EaCZtI
         0wKoyRvXODRYfg4PQva4ZAU5STcrTENV3IgW7xXUu/XIxtNDFUbtj+aAsZ5eSqs0BtET
         5BD0KbTdHj6nsNmA1F3DwrszkTDjOiCknYyPWIlK88NqWz4f7qLqTbYbUR639Bqr+FhH
         UCwI9H5X59F7EG0KivaL9ggKZQC8D6Vavcx9ge6euQBrXywLz7NXqY9kgpYhLpFfSRsH
         x6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329731; x=1785934531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJ88tlR3PQHW+zOWbGYqc/0EZpxNXGTOLvGqYwJVskA=;
        b=aer+0+Y2ohv+fvMqh8IZyrUL0vCpQgW1w2yiipVUdc17dLewOMThgCnAU5cMS01KOL
         o7NNkPoJI8WcQanuAMEgmcPnQOyTSktHSQYlVMdFYjrrDK0VcpWMOK1IoQnvSdcetvo3
         dPLFknQkl/UZgqo8zVNGhzavYyWWuj3SUBJuf9y5CLJvGeMjhCw5GSgJvuFyabZkhSBw
         GKKxHYwcxOfrAIb6kmc8iLHEv8IMpXGf/bYV/CLNFJVdvPEefRFa6k6tZq4etGN/XVaU
         0OdJkuPMLDhmxDQvCmMGZ0Jn0XVqJhGWgAF0KNYyxQ7cvyqlyKOtIJ2IvN/Nes491CWl
         jPOQ==
X-Forwarded-Encrypted: i=1; AHgh+RofFOOBTC2CUn2W1kzCstLblazSRBMC0PDwyXRvbJKE1pt9BG0IZdWr0+kqP97QlU14acvT8q3LhNaYZSb4+x9pLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVFzDm4PQx1oeohZ41MTRYn8eUl3iDVOU3UbfR2iD2XeRPx/yl
	MBYFbfUYByxwiqQR1TvOsNHRpOeRp0FdXLNSqUL3VyJFtc7z/Ac/mIvV
X-Gm-Gg: AR+sD10Qg3xXAMtWR18IW3P55gpWcYd6TvmXHte54RrVH5onkTnNjMZAPxSq8PhYAIv
	PRsX2ydwrxIbopyk0ucnQLseT7vd1EZ2WF/VatwCsyHdyuPXMbHipYxBgPr2Lk94Er4s77DybRy
	dEc8hSDVYJ4BFrI4o+Yv4Op6HwyxS8CvepA7iaDBepICcXdiMVPlMuvR4BkeUugdlNSnBVSpCoD
	hZN6wDc9FmnEmywFNL63CPhTSYO25jfYyiNDO3Bbl1MGTY3GDTkm+YYwBgBAXWpiBIas4XVO1G4
	6sLY5zohpHGaNNaKwGWbC/HxCMzitPxQK9U7WyLgzj4l7k34Qb1/My3sgsEDpyF6yK1HciEtb/4
	o6zzw4qguzpOU7hrbA9CCpLZAR6FtpBqHWer/+05Ysgfu+TM48wC/gE33YOe/EB+EZw31bs5RwT
	qrD0u6ZMX67iLJeVGqFY6jRQjRPl9XOB8nBLAE+VDAqsuk2htIbjxPX4aijsVj1pYg4bSRBL8oi
	ERoRWj/AjEVNA==
X-Received: by 2002:a05:6000:400f:b0:46e:7f72:b6fe with SMTP id ffacd0b85a97d-47fb1ed8623mr8294416f8f.19.1785329730769;
        Wed, 29 Jul 2026 05:55:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:29 -0700 (PDT)
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
Subject: [PATCH v2 05/16] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
Date: Wed, 29 Jul 2026 13:54:57 +0100
Message-ID: <20260729125516.230757-6-biju.das.jz@bp.renesas.com>
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

The register for controlling power to the DSI region is in the SYSC
(System Controller) block. Add support for controlling the DSI PWRRDY
signal so the driver can efficiently manage power to the DSI region.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Switched to power sequence for handling pwrrdy signal.
 * Dropped header file regmap.h and mfd/syscon.h
 * Added header file pwrseq/consumer.h
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 180384c10264..7fdcee98450b 100644
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
@@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	unsigned long max_dclk;
 	u16 activation_dly;
 	u8 features;
+	bool pwrrdy;
 };
 
 struct rzv2h_dsi_mode_calc {
@@ -87,6 +89,8 @@ struct rzg2l_mipi_dsi {
 	struct clk *vclk;
 	struct clk *lpclk;
 
+	struct pwrseq_desc *pwrseq;
+
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
@@ -1396,6 +1400,36 @@ static const struct dev_pm_ops rzg2l_mipi_pm_ops = {
  * Probe & Remove
  */
 
+static void rzg2l_mipi_dsi_pwrrdy_off(void *data)
+{
+	pwrseq_power_off(data);
+}
+
+static int rzg2l_mipi_dsi_pwrrdy_init(struct rzg2l_mipi_dsi *dsi)
+{
+	int ret;
+
+	if (!dsi->info->pwrrdy)
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
+	ret = pwrseq_power_on(dsi->pwrseq);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dsi->dev, rzg2l_mipi_dsi_pwrrdy_off, dsi->pwrseq);
+}
+
 static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 {
 	unsigned int num_data_lanes;
@@ -1454,6 +1488,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dsi);
 
+	ret = rzg2l_mipi_dsi_pwrrdy_init(dsi);
+	if (ret)
+		return ret;
+
 	pm_runtime_enable(dsi->dev);
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
-- 
2.43.0

