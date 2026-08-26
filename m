Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B007A455175
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766559; cv=none; b=ugUsKJnqPP2k9jatpqXNKlp28nTq7oabyxbMBShCk54dmaDKPm6KjGI4KxeQT3iEaF8C17+10fVRc+a7TDO2xYuai1KqPBYYNT+tci6rCuth7Q4nwk1m5Cyii9d5aESyYk/Og2NBoQoQ8yJYFQR8wE4THnhU34p1Uk+t9vdntRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766559; c=relaxed/simple;
	bh=F0V9lHgfoJh7e+vZQzbKDIFn8yOAolI4DkEX6HNIgEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L42ClGZ7Su142Afp7KhjCxybg0qpqAS7FnJiiH5QPu2UrIcHbSuGNorA3HgMrRRs0FS6dNLlHQacArqL9mp5ATrjbrdWFKfaj9edJXkDDrkc+6fedW0uKnN6HAKIXcsdLzxVvaF/7DAE6v6zpklHFJJaEGcyGZLhsV7fcCfKDIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwsjM/ER; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwsjM/ER"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2020421077so194305166b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766542; x=1788371342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wefi0qFeMhOmINeqEFWhtcGoedNIJiFtYqNbodY4QM=;
        b=pwsjM/ERyRVBJHJpQr1rqR4unRSthMU6wC/lDtD+Po0PrpF1uZT4U0fE7x5SvCUQ42
         iqA7dKYFC9moPYNKJj9VZcRxABIPPHTmMMNbA5qxbhILjOLBP+n7aHn76VuJ80uFNlHf
         K3xUYF0Pj2uVUiKlSOAVvKAHkXTQTMRMKycSh0WPUi+QEuz1K7c2dpVQGSP2pHmXWYOg
         P++32UXfGqPwE+7GdNeCGd6ToYaB9FS5yjJjXOL2FuSqHvIzjL67vTkZbgZntgUufN2o
         wNkQevZoSbi0vDSnSo632G6XoU6Q8q50WGYyZVXAiCdW2CoH6+EciOOJCDYNxh7Mo+fz
         mtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766542; x=1788371342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/wefi0qFeMhOmINeqEFWhtcGoedNIJiFtYqNbodY4QM=;
        b=F/K6sGxEu7r6it09XxYIgM4TgKjbIWU3uuW/9m3XT62sWfBKPEEbtBTDnWtVBdAq8O
         Nc7LGy8/L6jqHaq0jQctk26DXdlMDWbmyxmSmpk3PIUg5EGtSUIxR5+Y8cg4LYgKSZCs
         nCzuxceJbRr2sYNHlVC3sMyxITqsHR9PtcNeu9Og27nIsdOnuxXNvrzfcfLAYaGnRwBU
         4qktgigWj34gb6EEAEFgiYtVbk2A2z5XRWgY7+PYFafUTeTOB0mur6MASf6C8mqPW6Ex
         1elWhPv6UEkK0bm9afWz08RCe19B7D91zqQAoMCtaODZwG20WqATTiPCN2+aAhBqdxkQ
         iLiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrxgf1pFfA6rIzf4Vl8LNjofVBEJvdKzit+oZVEGOcrGnErMQTQHQTrJsFkg+2mSjuELXMvRnFBjbsPb4cguZWdmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kyzOo/vNEMOOlhEiVCbk0bNAUppxqY6BKOu7ZO1oaOMSj9HmUi
	I8IZBPCvQKOwZIE2sZFSn0R2YQ14GAnkCTHjyx53qgwj5G2jSyhQ3m6b
X-Gm-Gg: AR+sD12Q2vRAm5qFQ5dstCUKd7S/RkCgUrRoWPGErUCTvLcFciSJmdSBrWDqG1d/fhK
	3/sJyR4j6bxVgIKEs0Y9m4Uj0QULPH4p8qpi0/v3Vor/W6qrkepfHoFn77ajIGlBQh0bbNNq1YN
	Rck4FUX4XlywynDN/fB9jWp6Rpw3cxgpYAfusTKKMY1Is0MT1oSOoFumLLbUzunkpVPe0E4VUTC
	XEclNI3ewCJn9s6NMqK56VbE4YwNNEz8Ymov1NQ4LxM/Atefk5g5v0XLpW67mEctUwPVov92MEi
	TPBcuBb21Ms1nTikM6bvQG2J4aULvVaQ2ouByJ3SZmv0hLjykq6FN/73IgZhrgw7rNl5xDyyju0
	9AuCqJounjHr+HVUxLO18UX3ezMDhxaCF3eWPTAMMPqQdyzdQUXduMvOxyp4nVzaR/mNjK5JXhx
	mZz+0FrHUDxISjtSdkP85SJH3B7dUk9S8LGezYIcfRsHZ236KOXx8qXchGnsq1FpwupbgXb20ly
	HGSiYmndtg6+g4xb37Ih1ot
X-Received: by 2002:a17:907:1c86:b0:c20:edda:ef5b with SMTP id a640c23a62f3a-c250c595d62mr954414166b.14.1787766541633;
        Wed, 26 Aug 2026 10:49:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:01 -0700 (PDT)
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
Subject: [PATCH v3 04/13] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
Date: Wed, 26 Aug 2026 18:48:38 +0100
Message-ID: <20260826174854.199139-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * Updated powerseq API names.
v1->v2:
 * Switched to power sequence for handling pwrrdy signal.
 * Dropped header file regmap.h and mfd/syscon.h
 * Added header file pwrseq/consumer.h
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index d67e1230b70c..7df5f4a4161b 100644
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
+	pwrseq_disable(data);
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
+	ret = pwrseq_enable(dsi->pwrseq);
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

