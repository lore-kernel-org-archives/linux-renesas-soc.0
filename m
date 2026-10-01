Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F07D4BE43D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847652; cv=none; b=VcfgVDnfGs23YWByRh13T5oPSADTHmsF1ZI5pSce6WHe4VbRQi0xYNmw3Z7kslpFxjfdpTloT6BD+vGil1xMYQnf9rOwieig3hpfOhNLXGY00Jd+lZS2rLmLmR8Y8vnXQiRNbxpMPILp7mxv9jfvAGp/S7H/8sGwzL9RVi+eTy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847652; c=relaxed/simple;
	bh=xrtZNTI442sn4UYlmsAhqNFzv3+O/q3n5I8T+Nlb/QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZHEM/NYdKJOwxxVyYe8AgbGHSrewiDwlaigD0XoilOLxg7ME52c9HZI4GDShtg6vE2WAJ1KjXM2sGmKw8aKlUZ525PNwFZtTwveQ0ek8BCnwotY9bF+mk5xL4quhqa7wO5SOiX+PrtsRMALWeO9vIqK7N6+/EM4WRsbSrYPXBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gd0uH3W9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gd0uH3W9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so34429665e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847647; x=1791452447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4W5NZM4ccedNa6iDSrM95gMMfTflIrpPojWIgsdmsU=;
        b=Gd0uH3W9frtpGg17B1lMCp21aBT9B/P+j4jPx7ha4UKG7MwNWuzMgEP8jx7MSmjunL
         YjUrCLVdJXLwKVUXBfmfI2fo6RWPb6BxzSJcAPHcobhZhCuu0Drhg7BjG43NE3AAU/2V
         UylHpSWttl2nL6+ifIkimjeiDLAPGoMUNd7QHFZA6Vykwto9DGK4TWSC9nVg6aap6NSF
         rVIjHJ67UUWSzYaJ7HvUFi1oIDrt+3wuwubNO77l3W8IQudZaOsVaJnhErOFrZ21G/hM
         3RESt/b9yH6W9K85a1GvXnHqpaZadnZ381os+kq7DfliTk1XVfGvPcVt81ekI9OvNPyj
         8x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847647; x=1791452447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I4W5NZM4ccedNa6iDSrM95gMMfTflIrpPojWIgsdmsU=;
        b=l1tHShpOcwQ6ZCVoJmIpSoInz++wJ81SzOFSXyfJhck4WfYJCwR2aT4dFm7XW++lBX
         AmXOtttUnSO4n5vC3JV4X54KQ9GZCLucsxSqSNsJAPhKwB4AL6cXgprQvVOWm4M/CbYA
         3XFaZ5KacANWUNe0xFAbznvD4UFKEsO0jin41XbuZFnYCPKM6ba+b5kMlGUSUs9fgnEm
         ToGwPcB9ZV6nqA0eBEM7iAYYKG/mEPIKxhcFMrcQRrLThz9NY0G46ldD2D3FSg8Oar30
         4cqIjDOGfilkXDm3WlVGEo/PshcQ08WaNWLa5sOLL6tystV+g4ouD9weTmuyBGU/6IOU
         dtGw==
X-Forwarded-Encrypted: i=1; AKwUvByFYpgWwSDTQQNklvTBuxqTFP7X5acR/7yaX3zK17ahqLY/QBUtjpyAG3ytmwucXOiJMJc9avNrw2a1QE5JnvGm8w==@vger.kernel.org
X-Gm-Message-State: AFuF++lhlQhsJRtAw72vQbJUyDaxj8Icxi95tFyuyYXs5j4KO8pXZyAb
	cYMrkdHWV6QqDqCltuevgyyo6fPABB5RxXGQwQTiz5zB6+k0OKECRNMd
X-Gm-Gg: AYBFou1U9S/cHvunoevjQvMF9JRmML1vmIlojuxLzs1cK/XcR7TzfVnL0zoeGqpAeyO
	2BlXDlIuelim/VaFd8FQqkf4/QPWITi7llWzeuvJZxiRdiBKkGkFl0B+FioiF1Dg/nVWcey6lrB
	AFqiO3Nfjtjb9a5rcP+UTKlsfOwHvu2r1k8ln0Q/9qi5Aq5QKTy0aSBn/SJSzWDjuIAuhjahaFO
	zjhVFfxoUBpCrYv65s8/rXXTH3gYsqWLSNsmdDJuhokXCVsWIcFu6in1Y8mNVOmB7Uzf7OkMvWm
	4zP7OEr5cpaZg+8x64obBRgczJPBk0dTAmYioVqGS+SAsmiX8njveqtGZ27wHhiHLwnQPqv58J+
	4ixcapexZHUyuVCbiMYQJd9hDag32lVP5H/CW68KdQUuAa6Milsvl8iRb2nhTcR9knby0PFrH1o
	dudTMnWCDjhU3+o2xMhIFaV4mgL9mFJUR/W3XazD6JTl1Tfn/IErSyDLBJTXRMVOkUv/dCD2FKH
	R7r2qsJt5Rz/RI=
X-Received: by 2002:a05:600c:c490:b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-4a01afeab70mr67040295e9.22.1790847647365;
        Thu, 01 Oct 2026 02:40:47 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:47 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 3/9] drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info struct
Date: Thu,  1 Oct 2026 10:40:18 +0100
Message-ID: <20261001094041.135697-4-biju.das.jz@bp.renesas.com>
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

Move rzg2l_mipi_dsi_global_timings and its array size out of the hardcoded
ARRAY_SIZE reference in rzg2l_mipi_dsi_dphy_init() and into the struct
rzg2l_mipi_dsi_hw_info. This allows future hardware variants to supply
their own timing tables rather than sharing a single global array, making
the driver more extensible without code duplication.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag.
v2->v3:
 * Dropped .dsi_global_timings from rzv2h_mipi_dsi_info as it uses
   different path.
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 1538eeece2b5..d67e1230b70c 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -54,6 +54,8 @@ struct rzg2l_mipi_dsi_hw_info {
 		const u8 *table;
 		const u8 table_size;
 	} cpg_plldsi;
+	const struct rzg2l_mipi_dsi_timings *dsi_global_timings;
+	unsigned int num_dsi_global_timings;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	u32 dphyctrl0_init_val;
@@ -488,8 +490,8 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	u32 dphytim3;
 
 	/* All DSI global operation timings are set with recommended setting */
-	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
-		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
+	for (i = 0; i < dsi->info->num_dsi_global_timings; ++i) {
+		dphy_timings = &dsi->info->dsi_global_timings[i];
 		if (hsfreq <= dphy_timings->hsfreq_max)
 			break;
 	}
@@ -1530,6 +1532,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
 	.dphy_conf_clks = rzg2l_dphy_conf_clks,
+	.dsi_global_timings = rzg2l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg2l_mipi_dsi_global_timings),
 	.link_reg_offset = 0x10000,
 	.dphyctrl0_init_val = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
 			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
-- 
2.43.0

