Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0189F3BB133
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456053; cv=none; b=oGki7NDv5ZWCqMOUwKKL8vWIQ1F0fxQh17e0JFOFQCO4XHOy/8Hgzx6l6N+lQ7bxg8VrPrQ+scq8lk6kPkqa6pTkItfWPMS4XMa72Tn6Y1OX7+/TFo+ofhkEZGnZfI1unCZlDomJwMt9t38GQd60O5ZtNavGG7VDO/BrCaUdxIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456053; c=relaxed/simple;
	bh=sAh2gdTD9duOj8WLvoGxiHxj5o2kOrdYeBV4NBuiVSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bo3bFv7YX+HJZ+vFF9mlBmZS2ZOu86XwkJviT5OI9pwomEhetJB1F5rvMALdmaE9SFQEAuPUOZ73BLg43UW4u5jM73FFyQaf6qSkgYOKntGVAe1TCkIcbxOfopro3KbjUZN0d2306pLuUWGdXwJvg/9GER52Ju8aH0LJG+OM3w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5Cfxy5m; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5Cfxy5m"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35120d43ecaso7720257eec.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456051; x=1792060851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3hFCOdGFcpARJPE61Pz7wx4lXLyiEMweFG5G2TuDs0=;
        b=O5Cfxy5mIDM8VmdPakK61HLiUvgqI+Gp3+lLOxj/cd0sCfTrDvMpdFI6ogQxuIq8XH
         Vdi3eEgcyRUK+LH4FbR1IdwdpmNtKK5yU6yldJyOFUe1PTHmanBZmOmWOjVUWUonCnNO
         gQTfYYn2l34y8ZVivQxY6QYgGM6sbAQ9dr4wIhXp6IibsLRzTWkA40LMaEce11NBsaN6
         /KZbcr0ioMroT4PD44mIezUxdy9oxMYi8cYWxvDAYsqQIPI/GG0S1WYoN9dh+11FiGoC
         ltyhheaKCTnp0bXTj8G9st6NLuVZnEYudEpINBFw+NnoEYaSe/eGs1i2CirtozcW1Hll
         5Tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456051; x=1792060851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3hFCOdGFcpARJPE61Pz7wx4lXLyiEMweFG5G2TuDs0=;
        b=uR0wmbL45LvtBH1FXrLTVilY964QXxJSimnSU0YOZWqBY3gO8BwuXF0+VCu77NUNVu
         27vYiwSfZ9oDe8FFf3KKj+wwsWPLoh/HTN0wVUp2FBq+bbRuOduE3mToI78Yrumkwp8U
         204nEt67wVfFtxSTcZtJ/jMAPsUEcoeY3QrXVr5qGyx24OpEHL/hNYGnyOf7pA3uWpXI
         Bg+3/RgEiuYcsWr/tr/2LiGdtlYYaN8G2DNrCP7rmrXmZB8iPpPvslyXwi1VWpC4gLGv
         dNxkQT41V0puYgBZNpo8rPtar+Yv+KP9XmK+kmOE3DZtLAzAQ4iqT19gSJSumFiMAlUh
         Kzfw==
X-Forwarded-Encrypted: i=1; AKwUvBz0podOPOIL8bhMVgWpm6coyR/dyBa6G07BRGKjKd4/WtyVcIiI5jhFcCAFj3BeB18AemkivCY7Tvs/7BcxvtCpQw==@vger.kernel.org
X-Gm-Message-State: AFuF++mDIVZjg+6I2pICq7zul+0+/u8qWOtVG/BpTFmAPVqxgPqcPYQC
	DhCDVxZcsJ30sKqjN+qjkVvs3ToLSN2NAf1EuwF3tYnybav+lTcnJAt5
X-Gm-Gg: AYBFou3YxJn1qbnTQJlSW6gOU0ImD59JYIJZbsG4LHauAfRxWQe7d7X/1wqc2lt+6vv
	m+q+/BYbZz/ItcjEhF9PV6g0MYaQkyyn/Oa83KitO59EPZ1zjXwi+mOJKwvUkEmwsAL6jAV38Z5
	1I2AsDSqQ4SPQkd7Lv+aLKTi9q2dGz0zTco5z4Fn920iNA5MTh5kV+rr8BqOFDJHCHx88aixVdv
	z0owY8oojs98/eFH+uExEq7JUu4X26zy7b7K/haAu6V6TOAAKbqUxLn+utMsL8xn6OrYdJNpi4t
	mGB/4cn1hJaBYAB4vemWDGTtEKnMzwEzNi+EZNW6EVGnHlFjKHfgHPSQ9nIREFC9FyektgeXgde
	ISEHWTrxco7Wtd3cEs2+lCtUZKF/atkicyZNBevkXl9U3MW6WAYfMaQFTGsifRdsqecKve+bW+c
	8vFsr8IeXuxXlrDJdMvX81xuEAa2A9cBIMdXnrJZFrI54CwlXRNAXWV548FemAcjGMdAvCWpoxk
	3mCOXDUDkYcawYsnCdvwGaqqVmqaPDmWz2phWe2RxD8qI7MU325zRRh1wQZTqJsCFfjyNVQ/DiG
	BobpdCyJcFgj/75o8oKANIKS
X-Received: by 2002:a05:693c:41d2:10b0:351:62fe:62 with SMTP id 5a478bee46e88-35162fe0200mr5293677eec.19.1791456050997;
        Thu, 08 Oct 2026 03:40:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:49 -0700 (PDT)
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
Subject: [PATCH 07/24] ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:14 +0700
Message-ID: <20261008103831.542533-8-phucduc.bui@gmail.com>
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
from acp6x_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: ceb4fcc13ae5 ("ASoC: amd: add acp6x pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 40c4d833f4ed..afa9f66533e3 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -209,7 +209,7 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp6x_base = adata->acp6x_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp6x_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

