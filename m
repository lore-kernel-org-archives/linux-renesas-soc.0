Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C9330ACF0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028995; cv=none; b=oQNq9sbQ7MEQj3IIq4MRIAAtgkJ4Pgux+bCtnkCdHPqfoliOGiIqYHxz0VawwzagVSfvL2KorRVufc9S32uiE71UYEHHMlqio6SA3ssXRq0WMdD3wG5gBurPwm9/cVtbmKjaBpIgwc82nKZklcetUoLtj/AzmpObCD0P23wOgWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028995; c=relaxed/simple;
	bh=AsRVQlxF+563JjvP+sFHOx3JXC5esmyVVxsSsw++eA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhZf5jaOOyONNMjIu0jUN1DMzuyhDWehf62jQr7h6N0ahGbO/CgeuIpL6YUjGkNzOWAO6RV63sN6DBiRMF04Eh1catxDRo2a7jST9Yfs0cWmyzAJzFlWqDuNjtnwe0PHvwkhGPmp1qwGdZi1hQAPq0x8Zo7NNr372+tyLb0so5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkryIyzC; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkryIyzC"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e5fb79ce82so26378765ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028993; x=1792633793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8N5wvVyB4OZfrBnjP1FYFZJGH9J4CpZz0KjhM2upoM=;
        b=DkryIyzC+tv082WDmMQVrsewKeXzE+KPZ/8Rtaq55xHkoolmBLF6D8VQkhpDkg0yaX
         9urOZ0d86+xDQyQF/bsvafRWucB57vuCF+QHRewLl4IP8cLnLRERa+kOXa9DSDQ08K/g
         0CpIVlIGoGgbAx+ewQGE+reu+FSmknkzmwtzyzB7IfbRDhNg+7krNbddFWa/xyuGONXO
         E6LmGZrVUH4+BF9TSKjblghioSp0R0qxut2ay0ZEZJxf6rnYmLBlCMBkemVrgyxLeKZc
         vNQQPYkuuwhBZKo/kOP5Vlr+qV95A/Sku2JGzWTN720DL0We0k8+JiIvEkWbgg++3lkw
         uHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028993; x=1792633793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X8N5wvVyB4OZfrBnjP1FYFZJGH9J4CpZz0KjhM2upoM=;
        b=iDqDpdZNlqSua04PR0IsPFlqx/tDa1Pgqm+o0FhiaXw9me09DTJ94qr5hTu5vvzg7C
         ivhJdyrUhPxtvIAycOfM8lUQSDNs2FQ0TWVmHHyfQEFiiAVlwKfAxJ3aYNWnYg1XAnIm
         niLHQ+oI5T3KEXCWxgmAzZ96NeHZ+Mzj0XITrlmByd4jyuNysWa1+MPUnGrX9YH+mV/W
         K6ACpk8h3dcdPY2l9c04EiXz9lsTMZjC4uDTW8SuM01hUwfdbTf+mBwyQCD0eb7sc5S/
         BtE95yfVe+Z+JThOiWGWQYwn5WjMA2iyh6cM6GzcbrhXbSa1uU76JMuxH/4pdkuF+hmX
         y8FQ==
X-Forwarded-Encrypted: i=1; AKwUvBww3Chex9YXKm0Hifv9kF9MSVEBhtzfXw1X3gAHNhKsm7+knAje5aF5GfFzGYc7fzAMtAvhvpWXbXskjJq3RHl0lg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1dvcIGriFPXsYlHgVPTO0SwrK9ZdpHPjUt+KdUbxyYOsJuk6e
	YuwEYTCrAl97pOmmd+90dYlvjWl6Gi8A3ewlXvilnVh+mA/Z1i7b5Pao
X-Gm-Gg: AYBFou255xrSn5HkvkFergpPl0y+AtAWlX6Np3LFmDSLJe9fK6TNNbC1t+H4lU7SbXa
	/e0ZVPwjhVeKwNXKS1ZAFa1YHGQpZzm+r3l3J7ITwomxyCQvJQtUSq9ZVQPJLKVcA76+dblBBLR
	9/CR4WgF91m3z0CGZ5cIAuIwqd5EhTZIWzFS0aTU4+RGq5YCjwSFPQGd2b93ciy17NDgXy5BWmt
	iodRGDHbcIOr20sw84EAsGcKU6lJgqiS7dp0quvyVQVe5HOQrdivm+WURjT0zt4UIxzSNp/mzZd
	S6r0zXJkiqutJlf/P80Y6xPdn2qa6rwSfOEtJp89rq1SVDnC7vHBqW6oLuHsMQbpvHuuedk962S
	OCbe46TMqhSkTDviDWBz3YThkqOm7LrjgqD5nrf3VFcAgZ3/EwQn2eWquiU2Vfe4n2y2A9TYyGs
	JMDesqUU86z0EtkFLH9oibEdkcdlKlj5ExWq/eJVD3U32Jft0fFHyn+WWM3H6dwz1xEn5ZMFLiq
	LviFVXt0QK+t081lH/4R5U/5cnzjkcFs7wsCTLWeA7gcnx4JWS9+nu5wA+25UC33JhO9cuUHdxD
	ci7aCnEKkhnieg==
X-Received: by 2002:a17:902:ef4f:b0:2e5:c563:c0dc with SMTP id d9443c01a7336-2e842cdb0f8mr158108285ad.42.1792028993312;
        Wed, 14 Oct 2026 18:49:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:52 -0700 (PDT)
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
Subject: [PATCH v2 21/25] ASoC: renesas: msiof: Remove redundant period constraint
Date: Thu, 15 Oct 2026 08:43:20 +0700
Message-ID: <20261015014324.5569-22-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() is already called by
snd_dmaengine_pcm_open(). Calling it again in msiof_open() is
unnecessary, as the constraint is already applied and the second
call returns 0.

Remove the redundant constraint call.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Remove redundant integer constraints already applied by 
   snd_dmaengine_pcm_open().

 sound/soc/renesas/rcar/msiof.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 128543fc4fc9..11a6f22ec0ad 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -419,18 +419,14 @@ static int msiof_open(struct snd_soc_component *component,
 		return PTR_ERR(chan);
 
 	ret = snd_dmaengine_pcm_open(substream, chan);
-	if (ret < 0)
-		goto open_err_dma;
-
-	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-
-open_err_dma:
-	if (ret < 0)
+	if (ret < 0) {
 		dma_release_channel(chan);
+		return ret;
+	}
 
-	return ret;
+	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
+
+	return 0;
 }
 
 static int msiof_close(struct snd_soc_component *component,
-- 
2.43.0

