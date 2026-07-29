Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94503D9DA0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329749; cv=none; b=Rr8QOlOQnNf8zEvfc8i2sz3h57dit4LhwYZBxru2gYd5T9Z+ItYqy6ebRz+OXP+vnW64B6Eh78ucDY9atYda3lZJZ/Ch+HvC8218IywxGe7yY9DH01+o0I1sQQrIsCimV3Rj/UpSYVSpd2F1UHBe+Gsiy4G9FYinMQmHjjH2xxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329749; c=relaxed/simple;
	bh=5d6qdq6FcGJNR/+MHZHhnEH4hoZ78kCW+JIha79j+s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mbp+qsE4hBwhXmk4pC+wwE3qz9ND9Lq3e4ohUTZcWDd+HhQHwqEbVdRB067ntcN/o3k9r5BIoGyMJU+3ophsbriLHO63Lzh1W0AT89ijCwoNbaYVgHMO6vjNRhXK2imQtwLKB3asKyxThB8+WZ3s0PDlVqwn7fcURV8Ulx8SlxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl+dvmq6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl+dvmq6"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47640541585so707515f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329726; x=1785934526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QYl1GSAMhd7afswg8X62zSOp+YGZ6LTenJec+EYIzY=;
        b=Hl+dvmq63p2WunSUAg29FbtChCTffgHx4a60dUaQQd8Xb8QyJZN2arYKArM52KzPAS
         7szMXRlFFtzITBycqTr9jR7LvA3YgJ0Ak95uSVb1BVv225GBWNTFK2SRnBJF082/koZS
         lNvVOd1K6UlXiU6N/t7oK/noZfU9nnSw8Pc9r+rtHHyeENsq2DvaCbB616d3Ln96Qyo+
         z7FWayloCp0LsPgABza5nF7qYIVsdghS0VVogNVA8vbAZl7ariyAG1qBO7JChgR28D4B
         5FhQZ+hFknfR7BgCa+MUTVACy/FUBNNo++vB9WVaYo4lqB8oQuDH5FCpHWaPC6hGc1xS
         zuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329726; x=1785934526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QYl1GSAMhd7afswg8X62zSOp+YGZ6LTenJec+EYIzY=;
        b=ssuzhBmnrvXvpAq2nwwPBY8Wr7tWVGKpu0JycXXZ36hHF7VcZcBXZoHBbp6X6U/XOj
         g8V6bgGvGuSuzhcF1haPXof1b5QIxnubaaTD1FgX+GvAfWgetjdT75L4ouVCx2g3t0mn
         6lrAZqNkNlDAe+WLTa8sLnHAyKBv4Nw8vcGD59Pw/Bo9Derc83JvjoqwwzP4jXkBOgT0
         csWxI4G8UFSfSICra/w+QvJSQUxnRVU4UrwSaaNgUJNGcF8IRNvemxztWk3XQVIYuXz6
         3kdUt1UGP05oLsPUHkjh1hPNNuUga8hZQ5M6sFOpXt9l0UppBC2JdsCghsrQNmXjaOEM
         53Hg==
X-Forwarded-Encrypted: i=1; AHgh+RpyLgo/E8fHG/jd568ka2d0FgYbAxG6JcWBmUIUVSulasSpco2/MzcjtM2nG4cob/GGDQl5NbuPhPr5SGHLgGGtyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHlAh7FUZoKqKh9uL550slyXvoTawEAC5Gha1gc5oNifEGA7dL
	MvcM+hIszsAAQ8p7GQjYZ18APBn23hUM6nllE0eufg/tdG9/mvJ/0tLB
X-Gm-Gg: AR+sD12TpAPMwcrBBAVHP2frh1KQSV3HfkOyaVdCTad6RfgNPMMLkuCXTojes/PBvL7
	q1MBBOHnUj91mqfNELmdvD7hjQbKNJP0fhbaqvYvcsvbjX7ZZqZ9inKWgOP/fPXnLqCqvPZ322g
	aB1gQphJB7vTHjzXLfe7GfGzG9kKiWFkDViRx4Fy1MwkCbDjggPEnYyZ+CEsl9cnfcaRTWf7rTp
	Z5qehoaydUoa+tt6U8K7HVLHIV8vMokgTTkx0nHx1gplguIXJl3ZC/is+Yn9NZMOifbmh1dJMvJ
	34YhQidabfrL7l97vf1H9nHyzcmZ1CqinlT8WaWTiTr24OVBTDXpZJRdl5ShXbvU5Dx4cVI8pEx
	JBRVx2NQE2n8exPnP2l0KYiVkq2JKKRgoSeqVmOE7YemvrxsyhFBlGl0SxeHfF/yzoIOjPRcgt1
	xsoaTiKoluHcPj/c4Mymu6p0OA5q894AK4iVx8ZClpvUz0M/yh8tjZCLNwjYgbch+JgRurcnQn5
	lHn16JbudrdHgqHlvjest+n
X-Received: by 2002:a5d:64e9:0:b0:47f:93be:dabd with SMTP id ffacd0b85a97d-47fb1f1013bmr7516301f8f.28.1785329726087;
        Wed, 29 Jul 2026 05:55:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:25 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 02/16] drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
Date: Wed, 29 Jul 2026 13:54:54 +0100
Message-ID: <20260729125516.230757-3-biju.das.jz@bp.renesas.com>
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

Move the DSIDPHYCTRL0 initialization value into the hw_info structure as
dphyctrl0_init_val, allowing SoC-specific D-PHY control register
initialization to be defined per compatible. This prepares the driver for
supporting SoCs that require a different initial DSIDPHYCTRL0 value.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 0590ade96b91..2128fd16ebc9 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -56,6 +56,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	} cpg_plldsi;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
+	u32 dphyctrl0_init_val;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
 	u8 features;
@@ -493,9 +494,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	}
 
 	/* Initializing DPHY before accessing LINK */
-	dphyctrl0 = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
-		    DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR;
-
+	dphyctrl0 = dsi->info->dphyctrl0_init_val;
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
 	usleep_range(20, 30);
 
@@ -1531,6 +1530,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
 	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
+	.dphyctrl0_init_val = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
+			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
 };
-- 
2.43.0

