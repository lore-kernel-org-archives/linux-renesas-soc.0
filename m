Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B7D496D2A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456188; cv=none; b=upHpAEKmsQrKuhFvgvvsGXS84uQF4ApcIm4AQmCUgfu95vZy0C9NDBMmLUK7n+eoEcXCj664k5d7sf9kLea4VrINAksIosCoy4ovdxV85c4w83Req6t0d2zAtEH9ixEXztHhhlEn7/HQJTdUaUZxbOZvDySPVjUuXMT4ObXSQK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456188; c=relaxed/simple;
	bh=4NCY4WcF1QlkYiyC8+OHrV0PoUi/1+lM3FPBnwvgx8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAl3waJPKZ8GiDTIIrbCkm987q/S82tv/CNWGRt8b2FMjXG9gLFUvGqSz0QoIYW5yPV30smtjqGF+UonLLMBigfy1DfNDIKszTSRURkHaSxNKUGkD4KzuvE6Ce5j6/JUMtubHANccXUrI2bHD8Y3uyierURuYVYhWkgoSAWIFR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=an3s2u8p; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="an3s2u8p"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so4401528eec.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456186; x=1792060986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/ErUb+BYhJoBzVefBGuzS4rmfVbIr3TqgsBxZ+R3Yg=;
        b=an3s2u8p5OY9ozjikxopfvD2s2dvThSZJkSZpYCmzt9KrB9ckSxWzVQXnzMNuYN/La
         L6mIFkmzBAgJVxCTDJbTh38yQ9RiW74I7L61/i4YBkTTBCRKXONBmuT02t+Ri4Q7NDqF
         wBuCcFqDKt6lgbUXckopGm6ZZUB90NOHhmoaS9Vi+U8iV8VO+2Q162Zn09HYgY55xEPR
         huAm/5UGfWVgGaWKSFENcAUsRiyFPjmx7S5wTgY3SIykwCbLhvl26yAKa/Tnu5rL9IUo
         8T5Zi9MlphRLltVbh+MV3pj7VRTFbb1TBI3XkB8xcGmsdaA/VywOeeaEeupkjG8ensYf
         7e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456186; x=1792060986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/ErUb+BYhJoBzVefBGuzS4rmfVbIr3TqgsBxZ+R3Yg=;
        b=xKV+o0Y6UPuaqHWJnU4GKgMsts0gVtufnT+LIVMc6pIGU/miQDZDBTVsfNxjuhjFae
         J1rPmLc5IVLqlWD1xwZSD528Zi9wlJBYaqOs4RpkYQspgUnNaI1EJxoDEjRbNPZHK57G
         FZVxXSK120CjiRJYuhUw2KzPJCRMTcD9M++Ke/yRXm2qzMjaHt5zGxw4B9wecHn6UH4y
         vLt215eqQ4/Luf49RYXUXtiFAvdB0lBF0yHkFVaCe4xJfJ8CSCjL5nDdN70NueQq8TId
         4VEG/ku/1dXvko6PPguxWvH9ftN/FR9dDbnex7IpOnQpB61MB3q7nPNlcqKYYPHFU/ZY
         7/Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwhbZ0kLyC7+M2AS6NUKGqaW+Rp/OuwmiIqYSMNDC8pvxzReYRy+FZm/wkoeKPG4iKL0HeueRe5koDFkuYxnU1EDw==@vger.kernel.org
X-Gm-Message-State: AFuF++kZtvryXhUcrydjJcMM323ipCqawCA97Nfu2dsGGgspmtDVxBNz
	kURdn2nvFqOvBlLI8mYWAkbcPnqtJqSz9/5IPEtx8EYXV9uYeBnhF2vH
X-Gm-Gg: AYBFou3OyueX7RW1KM9GzEh6b9L2wQmlsrif6JcjLPv/BpLQ15MQyU2y3/tfo6IIjQc
	ZfhvnvHR6521o/NUppVeJy3ZGd543t+LzsKAHYmza0ZgX8NTQHL3Z1N0Y9JB9npYs86ULlMX2y+
	vUmBb3XAkjM4faWmbjhcDcOgONN5tGHHfUBJGHACrhICXnt2ICAWddFT+LrVedWEVHg+Pu9hfOM
	8JeXSOOmosPnv5j/eVSZrAm1AgchyDJnGQn6pB7ai7ddxhoOP47rWSd5ivO1mzwiF2NqfUmHh6S
	v9hSnCLecPXixcvsd2517C/0ekUCm44N+L+qdJEDfS8N/fV9yokS5ZwJvj+GBOelIrF7GFRTYZ3
	pXn2bQ0oET8tSPwbqcLlFx+KBkLP2q3Oep5ZkGclpv+r2p9T67Lu4DLRcV4XU1wIUKtOXdB7ZeC
	ultFLxuwmlwlsm046ByvlGjrzX8skqo/rTZxnfYuqJcQpvgZeBe742Q1ThJEoj7CrKKgrhDt2N7
	6Hsq30jEEHkS74vCd9B/BCPAh9hO7XS/gWweJHysMGRcBF7BTktoTojQhEepvw+dv+HPf4gOtbu
	CMkOhTP2dduQQLduCyAvg5Hy
X-Received: by 2002:a05:693c:88c6:10b0:328:3944:ee53 with SMTP id 5a478bee46e88-3515da28859mr6108352eec.2.1791456186115;
        Thu, 08 Oct 2026 03:43:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:05 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 16/24] ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:23 +0700
Message-ID: <20261008103831.542533-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from wm8580_playback_startup(). ASoC only marks the DAI as started
when .startup() returns 0.

This currently has no functional impact, as wm8580_dai_ops_playback
has no .shutdown() callback. Still, return 0 explicitly on success
to match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8580.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 9bc5d1e795dc..5343d445c322 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -852,9 +852,15 @@ static int wm8580_playback_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8580_priv *wm8580 = snd_soc_component_get_drvdata(component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-		SNDRV_PCM_HW_PARAM_CHANNELS, 1, wm8580->drvdata->num_dacs * 2);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS, 1,
+					   wm8580->drvdata->num_dacs * 2);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 #define WM8580_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
-- 
2.43.0

