Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559EF34B1A3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028706; cv=none; b=CkFW+nWbrx4j4aRFi/yK5rapId2RkUJUp3zAiZr5XvFVqRCNdcR6WkfTp1UuqqBtz6IO5kh9HW+bx2v4kuBq44PQ0GXiIdKW7tGQj3lZ1kZ7RePJfWaJS7mvGvoidJrjjQZYl5PP+C05P7IsBJVSRdKTstrYw1DddEM8Wyu7D38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028706; c=relaxed/simple;
	bh=GOpvHClNFcgwMbCGA4S9aUo3sNtP7+Tu6UirQoDa9Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzedcG+9+E1qvq3MaOikGM89C4yUzeP4WpOqfpSpCjMwRCy3REdcAUZBfV/xj8LMT152Cj+98xRZYM9qZvKRO8M7NBjqkqGO8LF/pBTbsxhidYcYytXQGlVpqGy1yc7kECJo0LAc67ZdMeCGOZi9cG4OLpdx4ATmOyDZrKKH9oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pWe8eaMz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWe8eaMz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e95b3b52f2so1418655ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028705; x=1792633505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHQEAftjxeSOQpgNapgwf4pKKw/+LL69dyB2CtXEGKE=;
        b=pWe8eaMzFM+2VJHr3s4G3R8lHZ6Wxq4Ic+on315yTHcZJHk/60cnmZPrHjNYJX7rBl
         vtFOGCdvxcPpVWlNk7cbsGHDv01Mg+2pEC4Idsp+IoKt1z0VlNksf8th4bmdRLeLWYpL
         PQ3ziUbSK/hjIoFgVL+GonH9SAEy5YYC1AGJbXJDfUdFEbZf4BdxhJdNs0L8HF9Pnp8J
         I6kDeN+hLxGboyjyEjTHgL1xWRr5akjTxy8QK1gj6Irvq5lsuQL3JJEtlA4aXBcpmp+e
         TZmrxDuc1TmklT8kBJlUFT+jdvexsX4sMzZrCZmtejW55O1bUEPC6Bhx4fY+vIOCm3j1
         qyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028705; x=1792633505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHQEAftjxeSOQpgNapgwf4pKKw/+LL69dyB2CtXEGKE=;
        b=vnfdGQW1V27Cef8CJTpfx2Pe9wvcCEImdxzQAKMcMbJ18Rbj7IA9rlPMpqqmR2tQvF
         xxUSV/4UMH5y4XhVh75OuF0vZiWRojibNVHoboONVbI+GBPSjakbjzPy+pVn+XFHTxuN
         /G+vQy8/2oWMi9llTM1pGAKV3UcQAOEStE9OnNDzwzBvKJ7ZLyf0Zb78477GihPeAOJ0
         qkUkGhOuBDOcVQlHDq+oNaeu9KD1Lri6FqxVg3BHR4mTd6D3CpTkp7xKcx800l/2cw5W
         D0mcYyDIEBkof7+HhIeKAANxjCb04b+VIC/L2Lc/Tq+l8S0Xu6+aM1UOTjkDekpXxaDs
         XTIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8PVWb3t6a7KraxT1MFGQpsOy4UxQZaEDszgDGoEAnypC4rVPSOunjYO9DDBSMv7g0tACVgNjroaEOByHJc6cxjA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKf274njjbV9QFUzcJK/rnhC4FlsMuLc1ZemvO4zEcnbsp21V2G
	bhuSpzx9lD4xS4j/egkPTsmgkWszUpTkCKhULJfv1VjjkQwSYxIlyvXgtgPNuA==
X-Gm-Gg: AYBFou1k5itXCvwykxjkjRzuHvI1KglMl8q5ZMsp4fwwxrQLKJSbxG7Ke1sAvjYQ/hI
	Dz3875hM9YRhIZoPKRM4DN7KCVwnps7wQaY554yVEjBzCIq+jXX3uzdt1xQEhW1c4AukMnen2yq
	1AbIRmz+j1pxR8OEeRP4qkdd3g/g6+2lLGRDEzQFO/WzkpgdGK2M6cNTxpAfywPPPy//BwCfSxR
	4I/es1X4WFgewMuJJhXSqk14quhX3sv3sHarAifieY7Emj71b9LBifDAxqL/DrOx02O4KbpbYMo
	eMVFfk0gcpnTc2kyK1c3SgNFHwUqFVhf1/tYNgwU/fUU7WHiNX9JdnFH7wU0p4xuyKnA2XGaLRl
	Vr4MJ6iU9nPI+USViB+OG9mGpY85meOjxpt3Qe7jt5OQn70lQqedFkdtEtw0mZ108K3lE80V4ai
	HkttX47I94aNv7Vr+1ochE9NT+JRfJOlw1Ntszby87xIUv8kAqZ8ISJmCifE3joqCNhLKeLLdSy
	LGH8WlHMCgHTckGwBujrBEMdWVGdZ0G2UxkFIGbDeDAZHgi5XImUcVKlc6v/tKv32NGhDlYRZx4
	6WIXhtkvEuHY9Q==
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr50722885ad.55.1792028704623;
        Wed, 14 Oct 2026 18:45:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 03/25] ASoC: amd: ps: Fix acp63_sdw_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:02 +0700
Message-ID: <20261015014324.5569-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp63_sdw_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: f722917350ee ("ASoC: amd: ps: add SoundWire dma driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index f27ebbd21379..c2640985f54c 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -337,7 +337,13 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	stream->stream_id = cpu_dai->id;
 	stream->instance = amd_manager->instance;
 	runtime->private_data = stream;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

