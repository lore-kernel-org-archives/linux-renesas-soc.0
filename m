Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0FF38654F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455995; cv=none; b=gXLV89f9i0SPxaVAcxQ9/jsWSMSVuY2k4PHutApkxg56P4+rbdEnb+MJJTNJ74IxDJV3r9d3mRjeufuP4Pr1ziR4fKAj3V4pfUYX5ZARySO+Rvuwh6QVLZl/OhWKORnbrBMw7iwND9Ixt86T4KSODO/r29oz6FoRUsYU8As56H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455995; c=relaxed/simple;
	bh=xzwyXU0svYILi7ZURG5eXIdZab9K6St2c6iN68qi5hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNQelLtVEGuoJLYdEZ77eQIGJqA2BN4OeATDwpartpeZIsxTUd7rD07wIKLztt3Nxf473rqXIC6xtB4lSusOsfkcaLPrBhIFE6UwflZ2d0fj5THcbIV3Kkf82Wg4HGbqH4BG0BusHJtAkhx0ldsGSzhrXBAKpmQkzhklkIIPjTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InfXuhe/; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InfXuhe/"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30b6dad2382so6456316eec.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455992; x=1792060792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFcTZ+kGWiuWqdZS5yC9jJRo6WNRtV/WgwZSDkO0NF0=;
        b=InfXuhe/12nFPm7KmD7iXxOo+6KagYCF2jn0U1wId0Vd2eihi2uONyt8pbJB+4KGlB
         tNfV8wCtG7otyRHZKdezvRYYC6NvumQxXA+8E9B2QnISuM751TF+GcbA8RJsctlmyH8B
         lp6vIlOtzYY/j+G279Vv6X0Qjx7fuT7RJXlgfSHBhFxeaf4iAa+bhSzoNSj7srUOeNst
         M1LzctJeY++ZEGjmW/nInIzfCoNVrKDNyB7NHwj/GxfJ65IewbX8WO/0hwQHNoBQZ7B1
         N4Mazk1iWxNvK6JEP1DBNupqqnEa5ePxhfHZEntRznJgNNW+H4wQkL/sDld0rUUTWxsJ
         +Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455992; x=1792060792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mFcTZ+kGWiuWqdZS5yC9jJRo6WNRtV/WgwZSDkO0NF0=;
        b=q0hljp2DOzKTlYAVK1jwxFzuYGCI6A57kxqCBin6bGFBpnl/WSQAEKFYhP9xx+Wm+X
         j6UQst+gUBECRYlxP0DUDeblUw2AZe2epH0f+fGQS6u03ZEeycu6LNrbjj5RVez0bX00
         R+VHjyNcy9VhVoKw8e7+bsGpn1Obv6J9FTGp8UkUWJ0cA+2a73l2Vhcn+WiU5tBurAvo
         6v3AG0D8tKhF5B5faUNdc5l7cHRDSTTpMjpS/UAWnmtCld7Yb4e11o/OZG3UOje2lSJ+
         bMRmeDLC8LnsHwXgNCki1lgGVwz5AHHwg/PdbofkJsEM2Vgui0ieIee7eaw+W6om0tSC
         xVZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ7TMcoezJ8Rry7I5r/ZupRkOYL54Aq4QMAi6GFO48uu/ABwonNmRHnDfyUWPVgi5KgFNpktAuCiuYUhnuSofUIw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLFNsj35696aIP9qF539/ORek3SPqyKy4hGtFf9IUAwbYXgBAQe
	FEUoo39UKZPHjhyeVjLqlolmiIl9ZaOK2Zosf4zmtcdp5IG5tIzo0bm5
X-Gm-Gg: AYBFou1FH65QgldRC4k2oLNmSonzzRSVgtMH1ojQZzuTktwYnGtKEeIKR8T2QBdl9th
	soMW0ig45Ks4BjUxv+nLnzTQuynDJxiw6C8/AVGLVG2h7sbuZexMSl4OpmhcspqY4jaMMmPPopc
	8mpkgXubZFLkvQYCG8Q4JLw+RRG45BCl8jnBF7624kTaaq4cD3vZ42wFWTZzJC++B1AqHttnYOj
	N5/1lfA2WpzW9QVBETINCgROfktwZpDHJ2masPF9O4bZjp8HN+HY52LbKcrSM8KdhrVzlONpsuP
	nbSx+jTPldHqpwXDm+g7b+7evv79ou/9V0zEgSdp1LULnxuCcs8BnmIJucOEf1TX6rQL2zGiT+V
	egeGgzNx0uCMaXXJHyJLRMmfjxhFO1tzbBDzUznpERKS/sukcQwreA9h0Dy+iu03oFxx0MAqwz9
	GuYZANzVXmj9iPk0r4mp+5qf8mOOFXsqgoPp2XBThZYwpSjuUPUWZ02WuwrlCvk4jfwrjieQRfd
	eR0vFsdVGUsHY97JUuekZXe3RwQjeAt5kuJGgXCh2AaOdDkky9gSjCdTCv5709PnmoUtefbirGJ
	tHRpabqUpkMSdsY=
X-Received: by 2002:a05:7301:3d0e:b0:351:5112:ec4b with SMTP id 5a478bee46e88-3515da5dc10mr5687961eec.2.1791455992008;
        Thu, 08 Oct 2026 03:39:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:51 -0700 (PDT)
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
Subject: [PATCH 03/24] ASoC: amd: ps: Fix acp63_sdw_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:10 +0700
Message-ID: <20261008103831.542533-4-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp63_sdw_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: f722917350ee ("ASoC: amd: ps: add SoundWire dma driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index f27ebbd21379..553fe11a2e50 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -337,7 +337,7 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	stream->stream_id = cpu_dai->id;
 	stream->instance = amd_manager->instance;
 	runtime->private_data = stream;
-	return ret;
+	return 0;
 }
 
 static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

