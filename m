Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537884;
	b=xiz+ELXKnPHw7iiDramsnNNePTjivXfH3e63VxgwCY27BKK7mhBugM33885QpWt+p1I1
	 s3Y7GMn2jFfdl1sBh4EKVQxjE1qN648k7yJeBIzFuma6e/hVnz+g/5pyhWWFyO67iLHu5
	 WWllX2NvwDnL7flFetKCNYPRN3ayTXgkiyadLoYBZxbBCdwKk91VU/3gkgTF90DxZAfM7
	 KVF6PfcRBccRVUihsysd50psrt6jrx0U4Pw2m3NYhforloG0FIIuYBx4YCX+/GU3y5E48
	 5Y7gqn9mg2cSOW6vQW8+QMoENdHXnvMOQsWde6oyXs0xoNmeS5fXnqBYXSgDiJbRllQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5PVlPBRThxX67H9TTtVJx0hv+Td+7iCuwsI+GnVhog4=;
	b=xpead906alNC2ZBcdsE0D5cy+x7Jta9qNv2eAX8SnFSSdedWnCFiybrU6BQHcWNAvtat
	 Z57/bzpbTgBeUkjBHj8LP4CIA9DQi/3OZ/E67CAiuzkDzsScqol0mURbsx9B1dVWA9Xcu
	 KzV+ddyc+5TmEt6Y8rgI1CuMhgJxWSRCXCBpQ9nNSeog64e5HE7eS1yNkTz4bQ2WcneeL
	 vvn8U8uUPwRtW5j2U0Qm1uoi8oXVp1T1v5Sz/fxCiNb/YVofTr5MN7+j8yr6qPQeST0KY
	 aX8mhySi75HK9P0BDce0CZBQhajr/sDiu3dDllkZI/zTlzWC6AXH52GVS8HMKk7wwkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoBjn5+z;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70568606A337
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 16:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70568606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoBjn5+z
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so40924185e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537883; x=1796142683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PVlPBRThxX67H9TTtVJx0hv+Td+7iCuwsI+GnVhog4=;
        b=EoBjn5+z9vfyRMolB7sHPK6JX7M1nDRZOPpaW2AZ+ohoq4W/bOyGLvEY93MCkdAL5H
         AwZfgQPMcUzD+/Q4j6H5uk9/GTm1IMWyHGfxeKC/BHTyorm3A7tTGBqYyjmtDuIbgVSI
         sm0SuIXR2iRUJnbAvd5fzsCB+Gsdh/6wis6wLIWv0KUN6fU8O3AEe2414h+q2Kvf/FKu
         2Kf3RhX5D91DgxHzfiEyLPHsUBORGKWQSWXfxkLQRQ5V/dPezE9r+ocGK2RXdWD4afFp
         ljz48Ladd1NLkRFja3P809REOQc8IJ88UlwdkCTk31NhwnwJdDTo7iL//jXjWiHaSzco
         J+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537883; x=1796142683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5PVlPBRThxX67H9TTtVJx0hv+Td+7iCuwsI+GnVhog4=;
        b=lpfxwpWKS08WPl/+9k3hoMeBP3ynnqOcvbzOJgOBdg1EXjt/RYQX1XPwfmWK4KXH0c
         U21ZMDYq5TtvVZJD8YvTvLqYq278pC4wdO8v4UWvvRq9yuTVuRrXxJV/p+H8AiEaUShG
         GEoEKgDlAg/al/ZRlFVfFXpLJia0ouuY/N0CsPHwo4Zrdh38MmK9ohi4fbzrOuqFek3b
         r7Pu8/Houv+nn0YZruiyOeDBA+7pLIwKiQ+6+Ede0WuvSGpMPNDVVyGHTu2sOkqCeU07
         bEgIjZJHrERUxf4dkbmeGtiF8Z1f6SSBgoH4+0u3yumkslM2WWSkhx2FQZ969s5fpuvU
         CNIw==
X-Forwarded-Encrypted: i=1; AL+hErGRvGNvRsA9DXfxT8cYiLvH2DEwkjgU0ZSCm3OUqs2DLpYKWWPkODtNxNoc0/4XkGet+R40whfd9eLak5Hv1jmjyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0dl//4o7i7hisp1qnZpbtIMTIg9a0v9lsmJaml3hdY54W26Ir
	A7/T3w4Vzd/sv1HorNkJkky8r6mrO+H6h6N/zqxvHwAhRGLQO7LPXXW3
X-Gm-Gg: AZFdTZebZ+gU3kyPHgHka1IkbUE5IvMb4s7DjeIScrlUz6XImYEeLFH6I+CtZrbxcPa
	0qTk6my0h5PPajiR9hBoYwK3dUckCqUJ7iw9HnBYB+tBSg9uY7cZPMZF3CiAIASdCA3yyVsyiqf
	k9cg0zDJ4cni4MCPJssh8JnO5hAdbJ1hMJrfxDgtRM3CH3WZeo7T0zqfxM+f/VcJZXof+/clmFU
	H8fneEjhscjRD7gZnZBW/QWCrgI7YZgwoNusqRA/TMSOrdhVLhLv8vTttOL21221Jn66UhB/aeX
	hlo/YkWsBuDPMuAc3Cw4wCO3XoA8Rh+1kI+ES+NU6B8CgYKuIJMEdJmBWJyg4HDN+vbnEYRI/ne
	Qz0EHIba58M4kgx1c0Uvxoynz0R/HcyonpcAFNeqx1RtskTdZ3mDDmoD3TsZLSk45F3MiLUoJ62
	dvThvE5Fu0uv+Kn9aUCeUXXGNUIe3D3Wyu4rQzYB3qScBr6NXmlR/rLYiEiRSUZj60p8ER5DcSY
	M/NC7u3KSi+BiD6K51RweNeEySLAbeZsY+j9YxVAhuDl9E75yB0iWYbfKCVota3yqMiikIkGolX
	hsjXmK03N05OAJ5H1JcijNMtuQxjDox2N3yAhUte5GZ8O4e4n15LgObti2gm2hUbrA==
X-Received: by 2002:a05:600c:a11:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4bb888120famr315786195e9.16.1795537882758;
        Tue, 24 Nov 2026 08:31:22 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm33058741f8f.24.2026.11.24.08.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:31:22 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 16:31:20 +0000
Subject: [PATCH v4 2/3] mmc: renesas_sdhi: Make HS400 OSEL bit configurable
 per SoC
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
Message-Id: <20261124-sdhi_hs400-v4-2-df452ccd9bca@bp.renesas.com>
References: <20261124-sdhi_hs400-v4-0-df452ccd9bca@bp.renesas.com>
In-Reply-To: <20261124-sdhi_hs400-v4-0-df452ccd9bca@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795537880; l=4140;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=uzoW0FnBY7lsUObZbuxqWOsDbiHEnxLpgnRmU8ynFUU=;
 b=KvBXPiVvk3F0FXZUfyq2iW2tY7tkdQdK5VfG/TFS2+4FK1iZXZDItLjCEpby60uoTlQo9gv7/
 VghwMVRPnhvCyGtBGUqVJ97uKeoeL/h4zPBHQOH8byVAE/IWR+9pL2L
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L and R-Car both use SH_MOBILE_SDHI_SCC_TMPPORT2 but interpret
its bitfields differently. R-Car uses BIT(4) (HS400OSEL) to control
HS400 data output timing, while RZ/G3L uses the lower 16 bits for tuning
delay and does not require the OSEL bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
- No change.
v2->v3:
- No change.
v1->v2:
- No change.
---
 drivers/mmc/host/renesas_sdhi.h               | 1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 6 +++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 ++
 include/linux/platform_data/tmio.h            | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index a93e613e9821..8ae2ec04bd1f 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u32 osel_tmpout;
 	u16 clk_div_mask;
 };
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 56286431fd2c..7dfcf7f970aa 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -333,7 +333,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
 
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
 
 #define RZG3L_SDHI_SCC_HWADJ2_1_8V	0xff
@@ -484,7 +483,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
+			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
@@ -621,7 +620,7 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
+			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
@@ -1233,6 +1232,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
 		mmc_data->clk_div_mask = of_data->clk_div_mask;
+		mmc_data->osel_tmpout = of_data->osel_tmpout;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index eaf21f93f5d3..37eeaa52f011 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -124,6 +124,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -140,6 +141,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	/* DMAC can handle 32bit blk count but only 1 segment */
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rz_g2l = {
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 99b05c8c840a..501ca4355c34 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -72,6 +72,7 @@ struct tmio_mmc_data {
 	unsigned short			max_segs;
 	u64				clk_mask;
 	unsigned int			max_divider;
+	u32				osel_tmpout;
 	u16				clk_div_mask;
 };
 #endif

-- 
2.43.0

