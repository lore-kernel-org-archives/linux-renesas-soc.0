Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B692F39B5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028734; cv=none; b=rDpYEIn8G6lm1cwo0wEgaQ8RPPW5ot1Su6JSqzdy529kNOHuDIX+UjbxmLK51Mih4rKpRvXZPgrUcEEs0+AM7dehSRV2DVMGFDeKHc80i97n1S7DZdiMdSo49ewmQ3n4CGhWlokuKQ36KtNjODwsfO11F4zfqgLa6KIZG7npbf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028734; c=relaxed/simple;
	bh=42Th3Qj56b43dUmPcGDSjuTLub8jxmLc2kGADA+KV8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKxfE3gdCjlTR1+VCs9SeaTdkyTucUsNRMgWcoZ/fvVD3WRdMvBcW5plbHh9BIE5boYCAtuSY6pg3yWJQH662WN/qNdVY4HzRRBLAhqvG38Y+mjDTZqZ5DReKIY+bQCDT+RgrqunMEHIKs5B0ZcGoTVts5gfcaNTTAD4yxlOXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfZT7RL3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfZT7RL3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e82462a3f1so9142565ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028732; x=1792633532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eK8UF2f8kXq1TEqWl9Zyp8tJ5HPyvJ/UCpsqtpYFERs=;
        b=TfZT7RL34QVziHDLX+Fr2u82M+Y8QGdFLCaZPpC4hEoaNYzM6VlbCDl8784/HENI9C
         s6k4/dHainJ1Fv6YY046VkIcBQam6Y2C0MUJcjiGBPDrS8JuSOOg0Gr5hbDyQDjJ+Y9e
         BLXBmvTSV6OmMc3CtK+4iDeitNB9kbr5YAzxm9X5/0jRXqtNHjgn1MDzRMjbtI0fMAsD
         w8IgOx3EZ7Bycd301RWbTtD3NUQfglJ/24NFc0kstsf0jId9lxxfq4mEZh1QhjD6GmbZ
         gDd/oY/uQK576Ue8j8Rzo9Gs+ccpRTCQrja31R1bU03IvPJaqACttZ5/jtkzuAZthlu9
         PlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028732; x=1792633532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eK8UF2f8kXq1TEqWl9Zyp8tJ5HPyvJ/UCpsqtpYFERs=;
        b=CqkOSLpfcLBuOj6UySUPQ8iyktLHhEyBs1R3iOyUIRhDwxQ+YTZL+eihzn/J+yM2pX
         vYdJYdT2Y+4WZv+YmNdNpta9LUrukmxNEoru8JKdImzh2Sv/CkUYlUA44oVSP2aKGXjy
         zFU2+WNLL9D4izsdWlSKPN8oML6Ha/9gwmi2BM68+wi/rdckhKe+aq+NrxKGSkHcextE
         ZHoQ9qyOM7H7y7+8BEpK1ffmsjSgkuTswXIOLplkcxILId91uYlxOEzuzZEyUTSxxwFh
         5yU5VzcVOAIYPCQcuGC9R5mpPt1H7HYIX3dOOtskZIP+UkDBsEbWo9l2/BSeBJF0ngrW
         Rs7w==
X-Forwarded-Encrypted: i=1; AKwUvBx64982vX4w7TcQwWwspXBo8JhP4cH1AO7gWYmHeo8fZVVuttfoDlpELWtSexRH8dwqJ1O3c+Dk3kz6EC7LGcP32Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJu04qmOMhgrDwCW12TqIvMfgLFiQS/jlhYcjccy6BNNCI7ANKW
	Jpsi4kclM5KTaN2WZDKs5imDhgf1Mf2POv+A1VDOM2DtPgffKl9otUi5
X-Gm-Gg: AYBFou3aEsrMWOuAOAJ7K0XNkOZRvtAVH66WlCNGQDrx9McTCScb8brDRVQ4movtTO6
	Y3RepWVomc66JMc8YuP473bg8+iTO4BvzquvixiQE++i5ALlt/oG6h3ruB+51AnC+kzG8zfx//E
	ggpplG7FDfGoayrg0mQt0R2B69Gb5o79vaxFx6ZEL3AKJQNsPwxxR8ZHUVqsbmKMp5RrbMo5fiu
	OUEyMlSRAED9g4poS7JT3Y9cUkYEjv82sg5jn0JZyC6zUPHzcogWANlczOkKRIBikhzkuhi/Go+
	KQhywj2oxm6/bbRYv99gRxd7efi5a2wHaTypZpxQrwoqaWBsGlLgYhsVc33YAogAtRPCurfMYFy
	yxRYXdZaIsTlgIXKw5zBtDCrHJpJLOcMfrwv4NAL7uCH0MfaZ7OicUKcbRK3PVgpHte7+4uHHQC
	FzKMhN9ItjGQMFKE/8MB0Apk9Hawu53BYSW0cPZMjbDtgSb6WOSppX2yIW0v88Q5Gwqgc6UpYCp
	jzzxwJ7zK8HX3mleWPY9IHl6V/YsipYU2qN2PXbXVHGKtJIr1epYnyPyM7m2CUi6VUADYuPW+82
	xQt+N870uQazag==
X-Received: by 2002:a17:903:19e8:b0:2e8:79d:15ec with SMTP id d9443c01a7336-2e84280afc4mr161680265ad.6.1792028732357;
        Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
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
Subject: [PATCH v2 05/25] ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:04 +0700
Message-ID: <20261015014324.5569-6-phucduc.bui@gmail.com>
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
from acp_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4a767b1d039a ("ASoC: amd: add acp3x pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 3f59b753243d..89dc60849c06 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -233,7 +233,13 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp_base = adata->acp_base;
 	runtime->private_data = pdm_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

