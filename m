Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB2E30BBB1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028675; cv=none; b=WBVCV0pdgdh1JI1Ro8ACcXwXRpj12uKTbbwgFHyus1l8pehzAg6AvHiD6rFveWA1gIzM7/eJaSn9Eo5cNvSZRXQa3x3rKU4UT6ZjolrByczRZ6uy3yeu5ywT+y+8ZGbVYSZkk/yEOcXNM4Ty/9tDBo0zjCvoHwDLdLfVZiwJ7U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028675; c=relaxed/simple;
	bh=PxltNMQY4Mwf0miBiwGdcHoJbpALYxNGOELj9h3ky6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpgWQqjPzo9rROhalT7oC+cEU669GWITylzShyJg11DO6eZ6IMuFRjy7b5IWriVRSH29ptKY/G3E4imD9VKYh8vLDnELlrdH2qd8PbIMOzr6o1X8k4PxZV6IQR7DjaIfksBKr1HoMdMglh8bx2Z178SHAmAQiOQECy9SoizAuy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZcm/EgJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZcm/EgJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8d2574fd9so31373755ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028672; x=1792633472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f9CDxT7c2yfniMxJX6Z2S0DK8dovzfteRrAqStY2sw=;
        b=NZcm/EgJGTSoahrgTYvpfiadxJl+YHkpB+p8KiElUaDciTrf324yATI6v+OnJ8RtMw
         ASHiO3SANkEfAH1pgWknUhvZd6x2TMKKt5UUa1vRIK1+feWF+YlnpoXpqDPROMWQn2OK
         hmtZWyG5X0E+asU6QlFFZeWYdO6X1oIY1rxhap44qK6wUHhOvMI/DHIerJp/2MkCbJid
         1O1x1cP4a4OdGmXdyePj72Re2I09bluAiKtMKaJZ9fwIEf0sKdKF5h4bWatmNWFmFMpo
         EtA10jlYaZgPxEc/3jONFAdp00pPPUlIUvbgaWFwLX04ZzKE1q1oEv0kHYKhAL92HecX
         kBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028672; x=1792633472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f9CDxT7c2yfniMxJX6Z2S0DK8dovzfteRrAqStY2sw=;
        b=zIpy2tbPFJvZdpzcjguN4zFB126V12367yjUAW+xAO3McCISwWDdr17IGHr8pemtZI
         Qa9RgRmLgp+cHJoXNsSKxgyOcFaghA3gCABYO5l5E0zurUH6wdCH27ZQCc+aMLEJI4Zm
         2Wuf7I2So8GxZ0pZsnHnyg5BdEClBCiqLUjuoA9Pxtrn4cik7aMNhFax1cw1DxiCd4OH
         sph3nxkvW9gn0RQZkDdOd7Or6mPSwrqripI2D9B70Sp8SMwcrTm/5JVOfE8vRJCeViw6
         /lB6Bjx1qWKD1eNJe6lif/XZH8IHGTw4LZSrXKbeG5q3KCdDDTjS0QpUi1FG4xtEHAc9
         2u6w==
X-Forwarded-Encrypted: i=1; AKwUvBxtN2y3ASj/2RwgLN5jOV8mjwk/KMYGFO1mHmev/XDuPw3+kC72Nam391QT1LhI+pZOR3BkDwdfGfbnGjn+B27tDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIeWvxqikbkry2XVxyJooIoKNYeGvxZncELTbveT/bU36dD+vOj
	l82wUeMcDDQXX1OTZg/PtacVguw7UTt9awR/yhSa1dje/AFn1PYsrFbl
X-Gm-Gg: AYBFou04KURdJMtR7ErTK28IAdWS7tLEPEYudQ0dsA+SuEhJAs8PD5iJybpC/YLWy1M
	kQEQyxbgue3+AVKM3zuC0cavIxl6T7LEjt0u4ZUDd/qN/iflPVk72y55rC4xLodS4c6eGAjlEsq
	nNV9tMNxRjK1TqSbLjIEyxnaAbnZrgjT7wCwtqWO2cKgQDOrWMobtUtB8iMpVC3JlpdcaZvjamW
	iDX0ZV08rhATaaRLFHMQ/0JcIeCyjrbGxz0wmbz/qU3S0hrqYLTn6lJlWLlFSxynRFwHWPE/rj4
	b5/jTHwVSTpdypL4C4OH90cH6nwOp1qjv5WprdLM2C0F2cWkCuQoi9bueshCpo9ejZbOL+h5frW
	2ejpzo00eiRXL0J/yMi7IVwnugqZGHSzk3/NA/1W1be9L9kKYTZ/DmutgdemOdc8hqbbRaxtKsx
	QfH3zgVriiSexxyntt0GsYVr+vjBqyTLqIXO0fJzD4NOufleuTLhdte9Gp7NdFpcs8pvL6yk6Dm
	OcKqtzhw0z9RodLt7fn8eJWIEZOk5DpLEpRhaMaPxrSDCj4iOMHodD9sTJ/6K1vBgzgg/PS4QfH
	XkcbWYz+gzn9UA==
X-Received: by 2002:a17:902:f541:b0:2dd:ad73:c938 with SMTP id d9443c01a7336-2e842abebd7mr158700385ad.25.1792028671728;
        Wed, 14 Oct 2026 18:44:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:44:31 -0700 (PDT)
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
Subject: [PATCH v2 01/25] ASoC: amd: acp: Fix .close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:00 +0700
Message-ID: <20261015014324.5569-2-phucduc.bui@gmail.com>
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
from acp_dma_open(). ASoC only marks the component as opened when
.open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 623621a9f9e1 ("ASoC: amd: Add common framework to support I2S on ACP SOC")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/acp/acp-platform.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 6b1e18b31c1c..f2c8853775ad 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -248,7 +248,12 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	list_add_tail(&stream->list, &chip->stream_list);
 	spin_unlock_irq(&chip->acp_lock);
 
-	return ret;
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

