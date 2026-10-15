Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B922342509
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028904; cv=none; b=QuK+HVDsnEHVtY89OnC7prKsOKYzTwMyt6BkTI/Jpc7qqm6XH7tjtDdgJf9IGmBSsjmBVvVUIi5shB0NkCMjrhqP3AtdgIvqmw9uWHPQnwZ8eoHCZtY46KaGZvkeTHEz4KNhwKihzQ15pCvTmlDLIEizqpcA4jjhflIRmpy+7/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028904; c=relaxed/simple;
	bh=tEX34tHuv9Enx3BSXJsLezOkH8S4dBDt6DQw1nfmw4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5lXgVGUCeDbaN34OAtTEHyzKMPlI7YxOcYEq8TrJzcO45CxR3mN5w5qkv/oTPiDtfhf26Q9d5voo08NpottsRS00rZjZ0m4YcKfZPd5R660HThppnH4+rzlInD4cSqI4zZW36vpmFI9Q+6f++xJhsVuqwAygmYzdhtYei7y540=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9gOYPiB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9gOYPiB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so25017665ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028903; x=1792633703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6Pl3gMBQYmN9D7oerWQplIq1HLxsu+OxdUd7erjjPU=;
        b=o9gOYPiBpejUuVT2YbkQLkXwccezxK2AL5nnaNEN0ODux/qD5V2vOBAdcDnKcK4hD6
         mJ3KL2CfDCqPWiP6LcWdAR7ZjxyEh5bYZon7j1urFCl5hxVuNHifCC1f7LO7qC2G7MZG
         cUyYm7pKG06G19Uk/SpoYvtT5M6+xLy2AaUN4a9pr7jkpnKOanp/rsMyZXkuEMqlJu3/
         6UrdQhI9LM5QSzI+mGLGwML2+fwrD5mngUGwdVxnsE9c5rMv4LFzZGa2wt//c153+sJb
         RsIe1QD11l4UuxJzIGgfrh7/s89CtrYOu0sodKhyBNz7NAEckqpCvLJoM/s+0v2/gbic
         qptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028903; x=1792633703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6Pl3gMBQYmN9D7oerWQplIq1HLxsu+OxdUd7erjjPU=;
        b=ww3BuJFfLABOJVgEixVefrPe4xO8M5aJKGHWsxSm6TAYx3KQ8XhmQm8DAcvv/9iHoz
         sThj/C8bgeVCkt0RT2sbbPTNB3lYLnbKPHARyBsvc0S2PBECLSz/VOAEgqcTLtwDfFVT
         bbMrlGOr/6Miwp9qb6zUlhjrT+LxXnLt6dhQKORZP4XYib7Fyx7ncP78d55hNjUV6RuE
         Qws4bf9i0cK+wm+Ls+4dgrg42n9uZs+/OcRP756/2uSs8kq8ssHe3oHAUaL6tk2pKw/q
         fUjuy3gIGn//48ecbI8IRTYw0zBTBsY9147rmW1fNzDww7uRTOgjR+xQeekOx0fIX2fH
         18yg==
X-Forwarded-Encrypted: i=1; AKwUvBz+wTOml5RClv6B2x+/Fhifq1YxVZLaNFNQPYZL9+ZIzJ2ce/9XtSKuQz+7Ygdbwkksm6LoAAzT0ObtvHByKysrdQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKslZ/sV1nEPH6YKmOI68SSf0ejKizMKENan9vFEehrJQED6irS
	Hs4EimuyrPRR80HGjktI883ztyljhO2KDmQqK/VUME9YACbfTRrQ1lT3
X-Gm-Gg: AYBFou2U3KsAOxDfCqiUF4dI8CjUM2LTMwZpbIjx2MVKnYPNi9meJpBfYltTFvr3YJK
	Uv+/Dedxvdg752VdBO3W7gLa6PRj2yi+Hyqxpo9LJ5luGQ80beIIADmIC7BP57F7tAd08fqQeu/
	fLZKYUb2FGPV2j86VVbfpG9Qt0dV0JgpL7mU9x8hMDEoWSN1n78k2YQUYBlljC8SlPiBdMhL5na
	Cvl6uf+Tq5xFeH0JI7U72WP8PpMlSb62I4VKhcKf3atOXdL8IcpnO2leqgSjy6iQM55mtyBwxGr
	MMbpxA+WdMubEvOoz38evHszQrWJZyy7FBDIBIY4DCV/e66muqn/GV0DEeSkO93dRCkd+7whVcl
	U014lmTzvEqBFF6JTubuWuu2i414KINSQ5C05FkHEFOvdSbSz8SeQf8huz+wOfa/Uz0hJzKPXeK
	WnAl+4Sc4YkctfaDfo1LKQ5JpVOscAfydLTJxypABeaY/sPqTnxz/tV1hKSWhsu0lbPqDAoGHyA
	0UkaWqt3+Fyj1EMYs2tMjDEJ9TYM+RHyliZCqEFa4yU5PsGwzUucWf4oqRHpBgb8cHwTd0l9kFc
	dza//kAkmRUbFkQ=
X-Received: by 2002:a17:903:1b06:b0:2e9:5d1f:dfee with SMTP id d9443c01a7336-2e95d201631mr3403435ad.25.1792028902474;
        Wed, 14 Oct 2026 18:48:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:20 -0700 (PDT)
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
Subject: [PATCH v2 16/25] ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:15 +0700
Message-ID: <20261015014324.5569-17-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from wm8580_playback_startup(). ASoC only marks the DAI as started
when .startup() returns 0.

This currently has no functional impact, as wm8580_dai_ops_playback
has no .shutdown() callback. Still, return 0 explicitly on success
to match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8580.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 9bc5d1e795dc..cee80da8f753 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -852,9 +852,20 @@ static int wm8580_playback_startup(struct snd_pcm_substream *substream,
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
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 #define WM8580_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
-- 
2.43.0

