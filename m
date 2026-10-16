Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410FA1DF736
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 04:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123277; cv=none; b=Xxs4y6BW0lWAT7W5pepS9/4P/eksviedCPAIK70z9P7AadG0H7AGbX7VOk8KLSedMsLo49KM7IXkDxnZMVhzMBgIELCSQ9nNGedbpBcKdWBynSvfbO8OQKnw263FeSC882K4bo4CC/WCF1JFnnBWAj8BIaxBMWKUK7XCLAm6UEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123277; c=relaxed/simple;
	bh=kz6hWgoXjwzN/plzsOuupJpm8SEQMOhxfOMvvFLoLo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F2rHRQDqG4xcCgfV69/OpsnfvZ14KhkTFXP7FgCIzVsPegNTCzI5e0sptBd8Lvq7nV7QaGIuhg/My5TXcAqNdzqnaAIG4PUeJ6Xjd50MjAyYLxYelRYjk1zDsjX/VKeadf0v8mGf9DDfgkRXAfUz6RulQfJyEpeqIB8akvJafKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiU6kWI3; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiU6kWI3"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so432556a91.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 21:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123274; x=1792728074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Qhe5E4dgThyJhSYyDtuQ9hNBBoGOWOTPXhOMe7iZzE=;
        b=YiU6kWI38o7n8Ng0a9H5qDIsVqCAnrHCHj1sdVAJsUntfAoVin71Cn3xhsDnYP/Exn
         pcZYJ/86txoykL0YK/CjwFnX6J9y+wBaG5FO1sKU/6/amBr78Qs8jXJHi1FiptgiM9+M
         ILBrXV3rcdDaEZinW8tA7y+yGf/RIEj+VDMQm89ey18mr6j+yvxpibG8qGgxaFPvQO6F
         svObyTy2lSHy+sgyySDEspbm9DJqRqkL0Ce5lJD2BcNfUQSSIiKo3ums+6bpcfBem/Tp
         IhnWn8kdo1BAmkQMg8YDJlLcmiXHpTpCqqmiZXzE2FFE2Jf4pL6WBF+BjGLoGmoQYu2k
         Spmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123274; x=1792728074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Qhe5E4dgThyJhSYyDtuQ9hNBBoGOWOTPXhOMe7iZzE=;
        b=U8qxnfZGsCE46j0TQZV2Ksyi0a1K8XHa2C9SpGkqwOdjwIVMYjS1koKF2HIE9GkZmM
         WGhECqXsE9ihmgNLcSKWr3siT6Dee+uIaAPW68hMuzoKaxy0ckPnWwpOxB1gbep4fIBm
         b8RGGc+W4Jdm6DKrvjKzqpgMjOswiPGkR2TceutDGTA/mH3gT6F03T9ra6uiN6f2igJn
         6DAoEWvBcapwYuR94a+d+MBAJHRrs2K4ViYorfaliP9RPuwYjXbizw2GhLfLW3ngAAD2
         90bkKgjJH3489ZbvPzOGUy4Y87wGz2UvS7V5T6/Tf01lUKieF+5+q9dj8sSxkFJqMSBN
         PxoA==
X-Forwarded-Encrypted: i=1; AKwUvBy1ACNPgn1dRsN2+INwqsnWrS2HBxUmgpIX5En9GJhDSDKlzQL9FIwkNs+rBq4Wp1UrUxRcCRufIthWmUXz3NL6zw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJKLMKIBUFyOcPvDy+Q9F5wMaio8m8vZfdQ4z4FrMPRVLVBdnX
	wnxTjxQQBQx3BbKlUUgVamLzZzCK4EnZPrRylIhtKe7WPQmKMlI4ja4o
X-Gm-Gg: AYBFou23Kqjo2Pyjk8YM9CHsDRh9BsVlFMFg1IvfuINhBJyQV0sk5S9LYUPo9B5XkJt
	p72uNW15ia+bcUo1j01zgNc3UlkYBqM2+LayQ81MHvfzt7F6am/GTN1BIXc4Z4VNi3sOUVlHLoI
	ANInzCj7oAOl6JVYf1R5lxFCZ+J6nkwNURv2l7yghPICDUp0hpLZxPS9ROK3gu5mYlovXX2SRiG
	lZn2w2cA+f91RxMkYZUVC41cV5diYWxQuLr19WFLMUzMtrBZANiwWJCzZabUesImW/EdCYHuxA9
	D4+qXJqdDumLrvJTjCAyG5+bEFyvpF7fA3bKIHXV9La3sAcMzpwr39X8rlBzuL5Rc79PFQccJ3k
	HyzlUg3Jev3a9pU0ijbYqC14TLoc/fR07mJHPfdhvqYXupq/9b1lHzcP9Ie2vraMRJcv4pJVyxk
	thzXJDdEfCNI6o/Yln56eRL3D9xh49xRm9ApX1bnlLdRfs1pdqPTBjD3N/btfg9xi1tSmE0DB79
	AhxGILsArt12IQvYlRZp3lcC46gDltl4ZWJ1U9C1QGIGA+vzO/XfckG/p8MN/jINSG/NV+XwVJl
	1kjJ1kbj/7+sR+o=
X-Received: by 2002:a17:90b:39a4:b0:3ac:b764:8521 with SMTP id 98e67ed59e1d1-3acbb9255ccmr1718768a91.38.1792123274359;
        Thu, 15 Oct 2026 21:01:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4872861sm2304450a91.7.2026.10.15.21.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:01:13 -0700 (PDT)
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
Subject: [PATCH v2 25/25] ASoC: rockchip: rockchip_max98090: Mark the link as started on success
Date: Fri, 16 Oct 2026 11:00:48 +0700
Message-ID: <20261016040048.506531-1-phucduc.bui@gmail.com>
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
from rk_aif1_startup(). ASoC only marks the DAI link as started
when .startup() returns 0.

This currently has no functional impact, as there is no .shutdown()
callback in the relevant snd_soc_ops. Still, return 0 explicitly on
success to match what ASoC expects and ensure the DAI link is correctly
marked as started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_max98090.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 426506a8e18e..de392b420ebd 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -191,12 +191,23 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 
 static int rk_aif1_startup(struct snd_pcm_substream *substream)
 {
+	int ret;
 	/*
 	 * Set period size to 240 because pl330 has issue
 	 * dealing with larger period in stress testing.
 	 */
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-			SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 240, 240);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					   240, 240);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI link as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI link is correctly marked as started.
+	 */
+	return 0;
 }
 
 static const struct snd_soc_ops rk_aif1_ops = {
-- 
2.43.0

