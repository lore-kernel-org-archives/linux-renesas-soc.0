Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C54B26ED3C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028891; cv=none; b=HWKsWKgwEej3WDbOWjwSR/E9O8pjUv11DCoxvk+I78ow7zb2IBf5caqMXdqAK/GkKFnesV7+rf0/yhvWo3tzQG3Fz7NkyfMxPUskY3PEES0kS5Ms8m3RI8/HG6SUQNRT0+FxUTNxUQM2GsNwBRX5yzmBuFV42IP2neXahCShj+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028891; c=relaxed/simple;
	bh=h+aUqaPj9vowNjoKv8XZBklyZfSSufgTE4gL6idJtRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVt9yXtGhCFxM6AyihX/DJpU9nupevZewRk+a1oK0pwsO/ifq2G5yqw3/VftGIg/sM1+Bm3OBbbZ9OiNFvefdOPEnXSGBI4VdkYrVIwF0uZ9MYtHT6cX8pjrplSs90Lm1y1KbGResL/BLV2LuOlPqCac7DQOUmUVMmJ0xgQzZ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCX4NWCJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCX4NWCJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so25405445ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028887; x=1792633687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8bdFAa8/cOYz7HxAYkPZAcubK8qZlAfIypauJAM7ak=;
        b=HCX4NWCJsGA5NHDhxigXerOZnl6MgMuGSF/IdTWFeEEbRGXFvLdYwyzlV0paJajwoo
         Q/np/hZjo7c824XVuo4Fg9MDaU6inYmcl/V6OdsYc0PYmQHRcE7A1lxQOgYRDJ3jxLPF
         lr+ek/HjOUQ+j2d8gHf5FAM6/ghyO5zI6ezQVWNhCAzyczH0rwN7XT4jnb1qD/DNA+l1
         /AzMW1GnlCQubitGguvTXehKk8DHg28Igy4XfUjuIg/0LXY7TLNGz8qc4Bhr76Dj9aTa
         1CcZ+hpu0VW34CNdisfBUVnys1xF+Ng/pB4NKq/r0BaZWbD3/e1MPiZnFk7gzlueZoyA
         9GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028887; x=1792633687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8bdFAa8/cOYz7HxAYkPZAcubK8qZlAfIypauJAM7ak=;
        b=Uumj1BYyQNtqb1qcCBXoFA511Spq+z3YcnuDPruVpkVH1Z7BSH94VFITZULT06pfDc
         SXLWBCVKpCs2b/Frsg7NmlzFWa6/8vBe/mEIebD8gjEAzsPd9xAzGklzRSX7gafqZh1f
         dgKlYf+pNeLAUnoCkLhAblzcCm9HYXaiWC6QSWHO2czPxw0esumGIl532LSGST+94rYu
         dI1Smnc0sRhCqVM1s8k6XOTBjX8aVJ9uJvQdCcRisOPYJ5laGSlYx2/jMapeQO8wzrWA
         BvygUhLbE4wrRxvYlaMP76E/eultWTy/RF/H1KQa7pVo+OgO7Zd3uFVvFa45nZShVO0x
         S1xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxySp+8FIJUxWZstCMO5+9/St4Px4347FwVRMWPQuvbwcpLtPFDruXL5eZ7iEV1Ps78+KRyArxDOT11unVseRIh7w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKCD1bCbS2RjZ03ssWWMUl4a6JtJcGRuMp+Pw0puYzOV94iwJqB
	Jh3uDHX2px56o0FQIXNlRJ7d6oFJ0+Z2rmtQG2fPSwwQ4VRA2P1vo+oD
X-Gm-Gg: AYBFou2b0EAPVwKec+mDKzb1JecNw8bCSvmB7cdREd3+gw18gr6AyFRd/Oh7Fq7sRFd
	Y/Z1V/JVCRNdKZHoEjBo9/D8Oe6+JBiVxKFIkJ769XPuHYGyNXYxo07gvMWcv1pAZW68dyp9i3M
	cGnhuwNwlIocNQBnRZmJdsXGPXkrpF3HwnNGUlVS8vya/Mf7JDm8Ll6Ar5MqU7pl0wchf+lcZbQ
	hYvL1ZeorU4vO3lTeV9z0VZRNhGwt8VjLffuamyPhnx/wRqCHeOpP9QVXLOeSkzSF9xZ4U3LGQ9
	eM90ukrM8fKd3h5BLHAwcWJz2od2iMtpxsA/b2I6VZwRZMc5YpoglZyqASHltw5TteaXM1N4wVm
	NkQFF9MRq55yL9sqRyia/8zIWlg4Dgr7K3GPGvvp+XqSW3IyWWMAaGxImBfhg5voY11+YmiC+Aw
	+kDUFM0V50rWILR355zpOcXsjDOkzcljT+phUHyeqvb0awz1oJfuEcSqAwQ40mlXupIKWhiGS/o
	tXp4vuKwOpelKE5Qez0fokIVwemef46hsxVTclXaRXXtNlXid3oK9CHO1A6I/fQ6CMcQ/oK8rsi
	umKlcYcj8gL7VQ==
X-Received: by 2002:a17:903:15c7:b0:2e6:1a6c:abd4 with SMTP id d9443c01a7336-2e84280e026mr162256675ad.2.1792028887036;
        Wed, 14 Oct 2026 18:48:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:05 -0700 (PDT)
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
Subject: [PATCH v2 15/25] ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:14 +0700
Message-ID: <20261015014324.5569-16-phucduc.bui@gmail.com>
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
from nau8825_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8825_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8825.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 63d927f31409..af2a49c893d3 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1261,14 +1261,24 @@ static int nau8825_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
 	const struct nau8825_osr_attr *osr;
+	int ret;
 
 	osr = nau8825_get_osr(nau8825, substream->stream);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_DA_AD_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_DA_AD_MAX / osr->osr);
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
 
 static int nau8825_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

