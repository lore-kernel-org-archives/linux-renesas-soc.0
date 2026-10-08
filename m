Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE783EB7FB
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456010; cv=none; b=H3XlZF7y7HHdkHXplgPigAoZL7q62XRsxeCItIeKkFce8xkpNOhJ21VBMg+VyxFellP0lYEZmrdW2AGy1unTA9o0KuqY9E7OM//mp3rWU50fpwy4ulgN/KZSHGTKgdhJqv1lST4prR/ENZnY3N6xcvNN4FdjBya8E6C3t+z6NOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456010; c=relaxed/simple;
	bh=DQpdidc1ReLLfSxwfYnPC+Bi6IVnbVwubPbLgmRRb1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOZz/DyVzsYXaCwNv1uWtVWZqRJYYvS2W01nw6NA7xwCXqdxxALhbfwtNKsKdRrVIWqX8Ow7al73RKnOK6eoQWX3CkdYN9aPTLCTGI6MI2j7Sllz6ikUO4QwWSC+0uYNkLGZQc6+uZ2RJW8aDzyyvfqN00KzKYTMRPvvaWlwEvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PN7g5SAE; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PN7g5SAE"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35154cb9de2so4039643eec.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456008; x=1792060808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9nxhJUopT9Lxb0IcO/P1HkSQbbENhmHQ1cr6x4IK+g=;
        b=PN7g5SAE7stKq/t29EwylNCpnZeYW5k1Q4K8axf+cM57iDKwOOJ9uBnTE1Az3OZ9PS
         XrpQ8QPqPRzLrvvsLEQ1aO4KUXhtLc93qe5qUYqKipTTl2lGWwTDvXEQJ/9Gb5NpQ44I
         ZVQWgQBgNIvRFKgWjZ/x49V5Tp9nBLJ105aCc3ID5+ukS4Zsuk0QFkYRApWG5w14CtXj
         GkZToIZsjVWvbGPtOIXQJTMbw0aloUi2cZKDZYKx2hKAvuUswEV7EPty4aUnLy1D11uZ
         hdKa3bdNfNMW0uOed/Bsh9BnbMHo5x70pmiGxv0G+HnN7tX9tFIn4FSvt47JmnKbYsY2
         2vPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456008; x=1792060808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l9nxhJUopT9Lxb0IcO/P1HkSQbbENhmHQ1cr6x4IK+g=;
        b=gYZhpESL8i/tlwamkpU2qw83SXtg2r90uNWuOdNFyrdrKm84zE/Vum58I3wP/YHWfs
         x0F0Mh2DnXtffUeHqrTHjF7T4ICNTew3O57EFn9eWE1xBalxxDY1RyaefnfqN3yPjKQI
         JjKj2i0INzi4pI4SztCMQ84fiVYzAtM1dKpRXuTE5iAu8oM4smpALRd0tPk8dHqRcd0G
         5RslQuXV7FHtZUbyQbfwkrSBFhQH/aVBNLK+kPFqO4aunhu0hOLYaE5mF22d0RdJQZMx
         f3ur+wqUoMmvr+bp1TaKVSJNBMT8h0qoF5HOleexRDBhzqFhk3pPjNWSi3JKOIP0xGQo
         zm3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzeDai28P5WTQBUW0SLTif6/WSnKezuqET7Leu0venK6SZr+G2IXDv5rApe8Q5HfHbPgQwKH0FRPccQWVU5rihgfg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIcUA2HD9c6/pToRYxV8i3X7YWg/AfqSWXDM+oai2K/C7mZ/Uqh
	GREwEeXhgCRahG6Se0WHGUrmhRrPzvBlkXrE4t2+uz8xNSP+83ykyHeZ
X-Gm-Gg: AYBFou1XRNr4RmNG0R0rFyFqqshp4DQnQyft74OoqbzH21I3ljO7NVv6bbw3wBjkhsP
	TT5FJ4yxGAtoGBTNC72/Cpg/gjeP03A+Iz79+l3JKadBr/MjXlFmjpaJwMMb4tYyCJJfDPv2EPR
	fASfnSqFu60YFeJ68A8RhkoFHYBt5bWM7hGhgDiz+pKFpHbvkZD7h0MsX9pTRvXGeDAtz1U0OC5
	prVVbYDqUFUY1lvrdtLnvDUU/zAGwBB+NgtRguFbSVl3ZaBFynBbHUjq92Kws45LQopBnkW5pp1
	P1rcBbOPV0nSWceq/B1SY2io1LfoMEP/dreLI/6ucZ//1qIWQd0tWsBA78tmDKEfrbjNANPV/63
	o7kmJk7PEwnxTT1KgxxgJDekYeqMyVR2pTPIw71DEq323zEi4LU6KZZarkj7uZrM1NhKF4cCnKO
	iNHiK8xiWvsq0ePeqycGdH/TqbY4jEtVtoFHm7vRlXyNMyMqJOwCVIPfI177Tsvrt1XMkSe7blk
	jAXQxD2xaY70GJvb3KMCuL3IZ3/6CtLTI2V2YBZV6LsAhSv3T0iyI/ZYfM59yoozyy9Emc/ZJjR
	AUVvZuYy+P0FPQ==
X-Received: by 2002:a05:7301:1e84:b0:350:89a8:5598 with SMTP id 5a478bee46e88-3515ddb2b12mr7233126eec.9.1791456007627;
        Thu, 08 Oct 2026 03:40:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:05 -0700 (PDT)
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
Subject: [PATCH 04/24] ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:11 +0700
Message-ID: <20261008103831.542533-5-phucduc.bui@gmail.com>
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
from acp3x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 703a6e22888b ("ASoC: amd: Enabling I2S instance in DMA and DAI")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 37ea5c572eb9..072f3dc35d40 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -237,7 +237,7 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+	return 0;
 }
 
 
-- 
2.43.0

