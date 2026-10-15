Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B7536215D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028721; cv=none; b=IbnqDCJWlQbM1dhogXSEStScHnM6oASOXfAPU1joCVdyPCU6Yqn0k1HnvPIaErbB6j7f+GFz+mpsNeIGjU3cUbUhmSsLDPOJPCPvzzxPzOFsP5eBpv7n4C4H/Ab1V7pxn29c+7W2ekESPfrxrWX4/8JRoTj7ZpuNCtQqJ3dsBIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028721; c=relaxed/simple;
	bh=jqJ5MSiUT4wmuGEu7gmmhxIxMq4n2gfyS3RH/x7Sng8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LApYgxvEIvkDkAY1UrY4R09YvvR9Derzb3McAsao+Bf49c3JBaGPZ7Nx3WzOAYzC8I5sSWROKPXHg7G017KNTyIWKatYr7wZiT8TNRJJtDryqW5OF//BjR8N3IqlztI73pEOD6czW+aUE2S+w12XmwT8zI8om/ObSYv2aK+/5RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRLedoTy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRLedoTy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2df8c28a0b1so22288465ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028719; x=1792633519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LV2XZk4JI85UeqWxHMk6K3Umo8587cjHfY2RFPxWAV0=;
        b=lRLedoTyMV31PW6xlzkmSc+Jl3ZYaIvC6Zk9aAVnG+NTWxr8tzEUraMx+Uqnw/+C/B
         sUS8FtoGd3kXhuflLy95LPgx7vmNcB3kXY8fH0T9ipwu/iW3rNfNCWy4BWQ/V329+A7h
         LMZDE1qEgzURTQyjmuyU8TvoG3vYx9AQp6qeQfeV4y++h5hSIttgrl1DkromJ7WDQrth
         QbXLrvx2RBIlcKxL1FVL/u7yohPhCmwpF4VkTpJexVRi8CGQPLjDoJNn0QCmqeVR85Dq
         DgfRjx0sGceIxMSJdxVa7ntLefdsXlcUSRG67qTXPl6Vm/l0VHbL59+jucbS4HwQmQT/
         XuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028719; x=1792633519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LV2XZk4JI85UeqWxHMk6K3Umo8587cjHfY2RFPxWAV0=;
        b=xLmT1zInqCw+bxmOuU94G2xR8T9Zc0SUud6mb5dcUbKFaPO2ESqgDh+tACHbqEfmiU
         pMT9x10RBkHyvLCkbLoJgGW7si9LDARXu5lZ27YVajp2esTXzgICeIF1P73ICMVYGw4F
         08tJ8iMbZn5uj9CaGgC74H/MeOENqQJbne09ypj/5PkjkSXrwvzO9sKKlL7i8g7WeweH
         LW6zkCKnXoPLCw6eCJTSv3iFv1L/dgjD2GiJp/OL/Zuv88YXkiNGl4RVfpi9TmII3PFp
         554hMsX2P++gZptLB86WkIT9Y7fk2QXfWmQtg6Rp280J4w9wmdiIJJLuSMq0v1OP4IYH
         4klg==
X-Forwarded-Encrypted: i=1; AKwUvByIFyaD7+Iyf5bO/fLDf4G1BwhAsnzEuN5kNxfY30BTHqyFjaSGWI75mfY8yie+FKC3ZDCXVBZYiqkbzp4fX3UBYA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJoBCBq5Kbo9uG+cs5Giwi3InIFg2Bpkb30W0GxBz5eYABTvfRZ
	xvZlR1mqTcIU0xbCEWbnVV21V4GDxqwVbqa/Pjrb1n9BQvKGp5ZOwVy9
X-Gm-Gg: AYBFou1O3dZtPtNx/azatSOOGwX1R3dBbKsEnYMJI1Ei3pt2OcfheWgnH1qj8HdO7XL
	oRbl+gIqpR1zo9UYjj3urXhe40rwtJhizXG1/8FZ+gHlsKMhpXIDhFN5eCDiXNLvSESd7Iec0zM
	Wgf44wisVURNs+N2A4qkW/siA/MODWhZpsCEClWeIr2dtGYtufAGx4qRRbKcHDTe7uhbvfbodKc
	BXVME8BLfAXaCkNtNE4lRenbt9qTExE2MWFcZbx/iym5Lo4S6ZhN4lfTYs3Tkeg/Kd7w4pXBPqr
	6F7tz+/oiCTOAvlxcbt3rUyGPwd5mDf7WGLMHxOqQIVCO4hx9gea5ESju6+CCcMRyWfLG/JjV+X
	C+AMsfENk3ITThsGEDlN9rlQj2j7gbA1EVBqZdUjsZ3JfEuMA1muz2CtxItgBKs0lD8AWeWt1mX
	USA5fZGpnkcg9r8jT+4qt8cvm+WVenQY+iW6fJTdfRFY+3eTchhJC0hBge1NbYTEz7UsOc5JHM6
	+P4/RLeaHmVJ8jW5vhuJ2Rz/4rNSJfoVU7uqOySK9c88RMDzcjYTTwD/0y6o1bHd9egnGvvj8Wz
	rR1uPj32KKUYAw==
X-Received: by 2002:a17:902:ecc3:b0:2dd:ad73:5b6b with SMTP id d9443c01a7336-2e8429ab7acmr151706215ad.27.1792028718870;
        Wed, 14 Oct 2026 18:45:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:18 -0700 (PDT)
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
Subject: [PATCH v2 04/25] ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:03 +0700
Message-ID: <20261015014324.5569-5-phucduc.bui@gmail.com>
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
from acp3x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 703a6e22888b ("ASoC: amd: Enabling I2S instance in DMA and DAI")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 37ea5c572eb9..765057499021 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -237,7 +237,13 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 
-- 
2.43.0

