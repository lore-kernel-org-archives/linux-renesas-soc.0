Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF47C33E35C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 04:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123826; cv=none; b=QaOJq+vRiPIgg/kcMNEWlAI8wrgDh1d+UsMBG6HYD657uHwjGQbYzl0uDcyQ13sqXai95n9OntwVyYFjyjpPGvs5eqhSQ4BCG8zV9aUyzplSanq8buPkhsci9CbVfslrXv9GMxgcLg3tLKViJRaQQXdQcTv4tYxE0OpjD9fizlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123826; c=relaxed/simple;
	bh=V7YkcGOeqeXCi9lDzvM4uEOXSB2T7RzqTJxl6SF+/ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Htrp4ICFnGLEab5RVxQAgg431LLpOnGbOd+WPffvGe1+ro9f60m7fSz2xLokPlHDTYqVbVHmW6+Ef5wDE3CO2136oYxb2leOblF3TCDZ+ud2o33nKDE9p8CUkx9ovYBIIrMOkgu+l8hDtjetx2L8peatDqf7Ebgm0whg4xWeRnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YflVaAAr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YflVaAAr"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e977109392so5452685ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 21:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123824; x=1792728624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqPJpnpDl1bjZy/2WTSO/k4hLO3gGJGG3iYDq3mgh9U=;
        b=YflVaAArAXsziPvBMprjpAbieMG70UrNkg/TnSDm0GeXf5+YaspqrI3BWIoY2tlW+r
         R0IhpEKotol9k+uExAjA2//bqN66vb2OiXvN4wSOBG46/f34SvIfxb7govjgSk/tgwzf
         0iNZ+0kg4i23ztloLBQh2qO7m8q/jHySfT54ouvPxilHD/VExnDLMdgNF1Ib2PIFwdvf
         IMdq4NKBf84jUNcmIzLxfua7fgVZVB1uoQe9maEw/tzeIh4LdMlTSkTGghy5Z8t1i8iq
         rOEXihW2LjhV7iq9fy88WmVhgONRTM4vV9Rmux3yRbkbSKu6hbGkk50ylEw3qxA19ID3
         sNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123824; x=1792728624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqPJpnpDl1bjZy/2WTSO/k4hLO3gGJGG3iYDq3mgh9U=;
        b=jp8NUyXK8Q3RneAkr8cp8Kq6WcLmqgBXWzm5beKvIez98S4y8r31ur5wlR5Xf0WG6z
         rMYlswmBoAAFkzYNrx6CnVX0GyEfUsTAFsCoET2zUtRP4CVDA2jbpzdqLQnN4GmXxmbh
         UottQAr6FoLQyOTPq/xz3MqGTCDrQt9AyZC7A5OzoiXMettCW9BwggrJzPZKzGJy3uaf
         MbGpyCWdZzOJWgCBx0LiDA/3eiSbz03Aox3fZLTBgbtyYdQJj5hH1wavZaIvFaK1Uccs
         EAhKgsNLCGSDA9aOudxSMrhaEfArUK0r0Ybf9FWRZllgOWuf6CiRR790Iy0hY2VF1Pv5
         n1Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwk4aZfIi7GTF2taeudAsmarZ2dbFnExfj9z4ami8Ijm0SjkoIPnKkDkYrXtz9/p9wDBKoXegTRg0ZjtG6MEci6jQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLG/YlFOUlltpieKotAXZ+SpAN4l3EtBUgVP94OSmzIB6V5A1sL
	NQRj1G2kMjjMtlEO8ZIlIfURPXlQKoWydQZdNcoUTPusFYi+is/OJOgt
X-Gm-Gg: AYBFou2nTkS/OwaJgx+FEqahzE6x5mFkMkqiM9ZwlYhaoxzseBdtCFdnbmVJ7mVa08O
	E04WToyzRchvkd1kiXLlFVRF6E81/mNNw8saUY+4peQdL59043CDv6bh14DODkvHxu8ZxHJK2fU
	8gx0lpozJbQExErc5tGxE2jb5rmuUj+53nWD2wWHg7d6J6pFHa+chpVZdukYV6AZbsehohDxRw4
	YHBvtXGCTyoOLrNfynxG7La6KlIuK8kvQC/xOBYbI9FDMPQjwGp45xRua5PxG47RvX0ZMtMlO6C
	y62hfAD8sOziXUqU0YYRl+evE8qXpfxFcR9Ml1b0tTwxkjgtuywQCVYtZuDd9kJFpQVqkgV4wdw
	cQHa+Cbcjw7lTQgzSB1szTQA842hGTtj1AyL7yq3OfxhxI7O22kkox385Z+Zknrwir+aw5EGcYe
	xHDaTu6IOYBvyD6yCGtj1gixklmSbtV7kiUcnrJ/QxWfuvyMo4O2qY5yjzlQhrNfJu2yB1DeQxE
	MvsEH78APeQkBZ8JR4vguSvzPmvpe+BLWOeuJiGOeBH+P7bX0GqNhYtJHZKZS8W5gP/29NUO+sF
	LXnyj++wSBLs8g==
X-Received: by 2002:a17:902:d4c8:b0:2e9:970c:2c5 with SMTP id d9443c01a7336-2e9970c073cmr381995ad.39.1792123823874;
        Thu, 15 Oct 2026 21:10:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:23 -0700 (PDT)
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
Subject: [PATCH 01/11] ASoC: amd: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:36 +0700
Message-ID: <20261016040946.521195-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add comments explaining why the .open() callbacks must return 0
on success to ensure proper rollback handling and prevent future
changes from reintroducing the issue.

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/acp/acp-platform.c      | 5 +++++
 sound/soc/amd/ps/ps-pdm-dma.c         | 6 ++++++
 sound/soc/amd/ps/ps-sdw-dma.c         | 6 ++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c   | 6 ++++++
 sound/soc/amd/renoir/acp3x-pdm-dma.c  | 6 ++++++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 6 ++++++
 sound/soc/amd/yc/acp6x-pdm-dma.c      | 6 ++++++
 7 files changed, 41 insertions(+)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index ba6dfe8fb6b7..f2c8853775ad 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -248,6 +248,11 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	list_add_tail(&stream->list, &chip->stream_list);
 	spin_unlock_irq(&chip->acp_lock);
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 28e0686e9373..12c341e89bce 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,6 +211,12 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 553fe11a2e50..c2640985f54c 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -337,6 +337,12 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	stream->stream_id = cpu_dai->id;
 	stream->instance = amd_manager->instance;
 	runtime->private_data = stream;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 072f3dc35d40..765057499021 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -237,6 +237,12 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index c0481a9ba858..89dc60849c06 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -233,6 +233,12 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp_base = adata->acp_base;
 	runtime->private_data = pdm_data;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 33d59d992ee0..72050fa2de80 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -231,6 +231,12 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	}
 	i2s_data->acp5x_base = adata->acp5x_base;
 	runtime->private_data = i2s_data;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index afa9f66533e3..cba2509faaa1 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -209,6 +209,12 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp6x_base = adata->acp6x_base;
 	runtime->private_data = pdm_data;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

