Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFAD4F96AF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775200; cv=none; b=B7Z2v/7Tq3fOyUqHMVSsf2r2pzyHMCAcwfkY21r/uRJRB6otdDMINI62y7axDUeDN/WMS58bz5abBGdKiWQRhf+tHwCSD9AtcoHrEhDvG7Ux0BboTsPTtx3/B+cpRVUw6CQg048IMTUCg/NjoCfEYKhn6lywxcXIMg9hnQRZ7ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775200; c=relaxed/simple;
	bh=MxD4gGPvxcHb6+fSLgH47n4PC/Hxam5NGSSzNaOZ8j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJzgrSqWKStb+pYtpRjDy2/AVak+lOeGw+Tq4qdWm1wDdAm9IqnfzRotq+0S2wGruL5c/lZpRg5FzHp6oA3X7uYh4ZBoscFhoy1fVms/V+svgC6e3/cCctIbXWmkJbKCu6oK5j1BWOV1mN16I7b8bhTIcPMkvzZhclQR/aQPjLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyQveqEL; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyQveqEL"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so3275919f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 06:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775188; x=1791379988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orKEr4pkx6Zt8Sr9/e1yt+mrcqNsohd1zJEtkEI7wlw=;
        b=NyQveqELkWBFXa44n6JPeb3u4naN02fmE04XCebaDXKkSvWwNYwDJhNK4DChsmRadL
         47SpUNOjIr6mN/roOi+yiA6Iv/wq4dDs1QNTlUcu5gidYs+gqnafL/BoZiLN8RtCzgvz
         zyE+U+AnbMP0vZiL3OVPqIpvxUbfGT3uGLTpEufhUpYzXDqxiUTP3LqDm4HCqGhrV9Nj
         lv0fZVz8M0NwbqAh4ajMUMthXQH/ChUyGueeTjZS7xaHT82oUsBTU1O4b/fwEAmshQf3
         JdveoDCZiJ2IzeGAq/zmbUbYCEmdpjvIkYfM/D422KqTzlsfe3MqyU0ItlGrdZIkfo72
         x2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775188; x=1791379988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=orKEr4pkx6Zt8Sr9/e1yt+mrcqNsohd1zJEtkEI7wlw=;
        b=eBgOcujwB6/6sUFcS5ARgh6QwCklRxbEagwVBDdQ9ryElyUbGkcolA3GvcxrvBj+tj
         u50wPtujeYtKyP6nzFkX1hYFV7+GjlFVXURDZPPyAVvofcVJkVIY2uOvj3cbwNwqTlnK
         BREerb/UoeOpf4qnCJguQjyGp9cKpz8F/Jky1rpXdjRHdWOvXRl5qgdFGfp71bizpDDP
         csB9IeHmqf083m1CuJHSOfJhDWAdBVCz0HdotZjxK3s2tQC1OuPxUKq1ACKzUdusi84j
         Oy/SYUgXFadj1XNi7Xx3jww1fCnwG6uh0ANznwoixzUzmlqk9HHHiuot+xaImpq7YW8m
         lSSA==
X-Forwarded-Encrypted: i=1; AKwUvBxZd0USdYW/rQMBGOAilQ0tCYq48TvjhiZ3Vkr/SYdpQKFB44pOPTo9Xpu9qblIv0CJ8p688doMESfXfJdyViSlyQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLCd0FZE1GH1Tcxh4MsRSxBcQeMcvduLByWK0VF1CuUt9irLBfl
	qh2hOAMiPMQO7Ox9I/CdXgpZA7PsHG1Bnc5QnQ56qF4kfo3Wtu+CuHYytvLfaw==
X-Gm-Gg: AYBFou2HJWuJvxZ6oN8cHgCI4bezuS9Xn8CxgmQ9yN2EzrgalQB+9BC5XR+gWjAFSYE
	p/b0i7RDoYG1bgI0irLEA0I7nGl1ZzNS3p/IpvdfgzHqgFTMygFeob38pnhOij6twqwXVKX1QVB
	Cd/rYt9ceE+8xTri30Zs+Vakn0bVmCRAVtyP4lCkFcWXPpUp9GtMlZnMTKHfFw2hb8K96nwsint
	sElcp6vvrGJL9ilc+QtVNm6jDWAKntIW48TDmLciZ6UVC8pQtlXvEBbkaVWt/mGnIQYsEzOwwIk
	D/enZjLIKc/YqVfHrKF9/5Ic9Sj4E4xagKn5lWuuNvmFkU7oKoClAN6Eb6jMIkelL1xCW0Q7bEU
	JP0D5tVIdiUC8iaP3eEN/bkGvgPrCaw6xuuj2zGNPIzzzA76jSWxOopC6HMbTGAwHhRFfj+kpqq
	s29dFF4L+IHxKu8INJj56lGRggah4a5R7uxmNgH9aTfzDRm5ALWRxBVyi6drV85s0+jk0KGwD7n
	MRY7q0Qj/DpBkF5QKCX+4c=
X-Received: by 2002:a05:6000:4807:b0:48a:f592:fb63 with SMTP id ffacd0b85a97d-48b050badd7mr663766f8f.1.1790775188127;
        Wed, 30 Sep 2026 06:33:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:07 -0700 (PDT)
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
Subject: [PATCH v4 4/9] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
Date: Wed, 30 Sep 2026 14:32:46 +0100
Message-ID: <20260930133257.23210-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
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

