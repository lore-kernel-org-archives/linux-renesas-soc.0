Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7878830D3E8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456156; cv=none; b=qUBKRS/qcYAi25jcpbABUpAMeF6HBYhtg98Jm0rKLJMMJrc5xRPPpClo3Xto6sbvbB/DFwW4RxP+I5n+kUzOuZdllA2gbuflpOOf8SmcCSUQG9caXQdGOKfS5Czgjqbz97TdC2/8Ic0YW8TZIjCTHdP2CVAB0KuD8jvqlp/Mk+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456156; c=relaxed/simple;
	bh=jz760ztqgga0RO/+vAvDuVyLPPNpmX23pq1M+Bivpxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fU5efp+hEe0e3JJUO366XpX+hwgNaplDkTPgoWebk8lmvGb8zF/V8gt8d6+wFYzoU/0crpu+JbB9rqihVgbatpYUyTk2f7oQlDMC0kL5Ih2p+0UUtNeiN4+D9mHtG9DcfGN7KRKuYSuG7WwYkAs2H3X9xrHTvkcxnAlcCaw2YB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1/RigIi; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1/RigIi"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so796555eec.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456155; x=1792060955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uc00trQPX7RuBM3kvjd0hrBbedJ5QhnOwvfpAMsSqmQ=;
        b=L1/RigIidDe9b6f1eq2d8lq1qPCC42BcSjCm1Wqbe6Rnhg7fTQ695jWveXlQx515bC
         mP+Y7FrUqiPmKmIbz5qx/bGqK2DVBMWpt5JsYKxcJhxEK5CgrodWfnTwf4f6PWdlGrIt
         rgFSjPdZuuk6admcjRXBWJQ6pxShwL/6gulJT3bOr/ReEvmKH3CeJ1+mCckm6A70Cbt4
         V2AUB+qDPreuEMFpzEc/RczaW7vvBHC8yref9DddyhK0kmgmGm8rBu62HtVK4+6t7J2B
         F2HNyXW22o36q6kRdaWlEKuxAuhXLkQG08bG9aamTl3U41lTgfLAQOR3qVm016Mfa1GU
         Xk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456155; x=1792060955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uc00trQPX7RuBM3kvjd0hrBbedJ5QhnOwvfpAMsSqmQ=;
        b=rZbIrGIcvP4u3uf+afjWVe3dDxAucvcF6hz9Xvw8ZJyt2qSmtktQuSYMyGdW1/w8p/
         BLYem5rGwzsvFeV1V+KFFpSTG0r1lF0s8NoTp/dpgPER8igKzGqAk+1N14jrUng4MIps
         g7tvjXs1IFAQCJyywWlumKgO/GGpSJVK5jof0O0h2Fs2Rq9DJVw0674NY2/TyQqrv7Rr
         89yHgfMobfHP4v1xdUQ75MV2MGCoCVxRbaUiq5WcN8zX6gG+HntdA4x/B3MrJ2bvG0zv
         v3bbgb9SQNnQKVwZ+HF8a6LzWjBUO0RvvcsTxbRRb1IoSY53F/soEarHp8+i952SOxQ2
         2JuA==
X-Forwarded-Encrypted: i=1; AKwUvBzrw+8dMJ6hKp9vH6iLxWDUG/lEf0OuAd40SCdK9brzEL/28nvMu8eGkF2iFwy5GGvMQ9uAQIdq9k5zUDkgHfC40g==@vger.kernel.org
X-Gm-Message-State: AFuF++lwHCQ/TbwEus0I0zQsMYM6FF07YAv/fD0PgA4aDW8Vkju9nqF7
	mAmJV407MuYpsdbAX2CR9KCOXRBmlWiD1Q47SyzR41Z1QWH0ds1i8ovU
X-Gm-Gg: AYBFou34xgkMVShfN7aTQ8ZYAe0VmvJwohUeMqYdjGyXoKyQnnZUVPJkkLvpnRltREi
	aJNg/xNS9m4en/Vp2NPe9ol+O+pFA6UU6AKpjbiKeh95SzV1iz4FnlzU0Jy+3SL1ai4VN6pJHbu
	wA+aSIBazeQH6AlJEkRS8/Us1yt1cX2PPDChO+TR9D9knVGny1tmwpMBBou/Ya7yYzvyVkjYtbT
	S1HmxfCCipH1stAjsFDFKpqdxjTs1UUqeBaKpxD5JGvbRWquBbW2Jn81NAtSl1C2/hThAJAcmdr
	CljsgVW+PmVfj1gxdPLEb5VVekkxwPF3oq9AWcZ0/TVkSx3f0kSQTJAi2M+a7Ekkk3xSDuKVLhU
	zAbtnJNERjqrsCXGm8J74BwIWOMXl7kG++5Uig0Rn2B4Q+lbk3vQI1mRLnWxERk3BKVsmKylSYE
	06aBivJbs+xrN41vdlvrT5yY/joUM7B9+0Iwb1McPO2ZqV7NFjVsll+xU9DFpUPAOiYrEm1Pe/C
	gw2SHx1ehuZBwYPUZUn4bCrZbv5XreLmyt4Fi7OGnzMQ0j0V7fvTmv75OYBReaISkMH4RRBVv92
	eGPdgBdigWuZBg==
X-Received: by 2002:a05:7301:d194:b0:351:28eb:8cd8 with SMTP id 5a478bee46e88-3515ddee11cmr6279341eec.18.1791456154501;
        Thu, 08 Oct 2026 03:42:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:33 -0700 (PDT)
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
Subject: [PATCH 14/24] ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:21 +0700
Message-ID: <20261008103831.542533-15-phucduc.bui@gmail.com>
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
from nau8824_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8824_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8824.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 853eb9472af9..c89889aa420e 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1061,14 +1061,19 @@ static int nau8824_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	const struct nau8824_osr_attr *osr;
+	int ret;
 
 	osr = nau8824_get_osr(nau8824, substream->stream);
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
+	return 0;
 }
 
 static int nau8824_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

