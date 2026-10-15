Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364F2272E6D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028693; cv=none; b=JJh8rmm2ZkJZlA9dwXe0k2wu/fBNl61CN9qDftsIe9fHJRMHHr+GAvRSyR5MaVHh4iQPFMAWcDsNFDNfqqd1mE5XvJpmGh1M2LSfxtQAPoA9s6owQxVA+OXHOY8WTZIVLMPJ18Fy+82HyCURDXeSFs+MtG9zAbBy/l2NnGHiD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028693; c=relaxed/simple;
	bh=Km52EVNDvQaSKwDMYVVG/cG2sOqJGio6RIBlU/DT6nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icaYINKemUhANHUS+A9yidhNZHUud9LyeKUqhWRRhDkCrHf0U5eCOiJKjIkBWyqOS9VTOh+p+vKj7xDRH9qCnmXREg8SJlVJX1DrHKmc15x7kGb53hcKPUEAA2jbHBrYW4zGH9Szm6n/Bqd/vy/DIOFvdpQ1w8LRaFxVslblpKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPEPY8oh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPEPY8oh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so25005845ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028690; x=1792633490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmTMAPFx5up6qhPC8f6eIWZ+fqRc0pF4DtGB7TtfWew=;
        b=EPEPY8ohDKviNzy7dfhjRCQ0o9Hot1Yw2Uf28WHydz54n4T2A5IpXM6X9KTK6569KA
         nfn432Ggo5eHnR3vWSzfg5sZuRRJ650YXWWQCnMI/XDSfGGOBUVd7tz2rl/4fNiGqcui
         y4nn+VXGwO2tSMxxdB97TAq1s2j+lgzs4JwpKM59MfKMf566+NHqf+R9I78n+Q4pTIf+
         4Li30fTygfPbCrD7GggYkgN9nuOE80FDFyNXcHd9C03yhZXT0Gv+/DVhwklNqprxLTgL
         bUJu9eMjwjzwI8gJWRx7MAM63jYn0HHHoSZRNCH/+aLt7e5BfMtw7VOyxSgKaSzKTaoW
         EdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028690; x=1792633490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmTMAPFx5up6qhPC8f6eIWZ+fqRc0pF4DtGB7TtfWew=;
        b=T3H01KwuPH//0Rpa6C+3hmPQ1QoHLVpiFXCEoTsomO8jHCpVKg78DtgI6VKdpuYYRr
         ratMje829i530vRTxWKLahyHAXJRvt69WEmOo09q7BXNsJTVd7emSSgdEVqowGT3C+62
         JRZcL1gqaGAE3d5D9+yLhiI+M+/U14BxJp6oJ6ysdnBYxFvk7NlhCCgc8+NEdTDQMXbR
         k4tnIWMFicScWnBFhDqMu1kU+MUHfbjjQ13BkrT7TT1vzG3yoHFg8iRk/g3hCmx5d1Um
         2TeoGo0hod7PU7O+pJkGStLootSujyys7jN6+n0N24MVxj4powVv0LL/aMGDxygTkk8M
         H6vA==
X-Forwarded-Encrypted: i=1; AKwUvBynN8lNIQXgsS8rAR6YIOgb9HE9D+4UB1irTVwbLkYiSNPW6KXt3SgmdMlawOowTJqb9j9ClotR9J6aLnfgUOHtgQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwYc8vUpVfd1iCMsaa5fhgoXZnCiY3UIFAZBNCyK69uhZN8j0i
	V4NllQ3/lY+w4Xz9wrDF6cjk50BFv9E/PcOgQa/1AwlBvK7vXVI+S6wR
X-Gm-Gg: AYBFou3/QQhl4WV9K5X8+e9fDKoM5XEIX4qSH/y5QRLsDzC4KsEgSWz6vE9C6lR3nn8
	jLij0+ugK0g7v2QVrogSPKufHHG6SxDKVJVb1Duq1oBfVcfJ8CP2ULfia7JcBJc75CbPv6jx4NB
	bVgg1WDvwW8kzrkV+kkG8Xe5soIvYy7UZL0FRwKD1Daqri8LwEmBsmjAAY6WVBWf3m6OomZkObI
	5HuvHtY2FK9k7u84gfO1S46AilgUnwAj91MQz55/3L1Hlhi5ZmLnzbL8hRiRhG7YA1wIkSp5Wpy
	lcGqJFyzBzQmCnwh+LLMqOm0+pSGc0lx8PdCde4VU43nd6d+eTKexMWF8Qw7Zarunchs4i19LX9
	2PeFRzol5aHwS6yVtc+fAg0oUfrOsMRWZ59/NcuAkRsgi1AvMnGAaxG/MWSNMHiIy/lCxpvv1pV
	ZaYOn9c02z0FsyCc28bVXUeYnvWvxArgL75vIZGW9+FOiSUfoXNbU70WUqRtq4/ABa9hPXusHUJ
	GEH874I0vEIEf92ryJJcOMdWABmr16Tz4pAPSFl4tb1ZdvDcOjCF5PqgUkFr50sWZ6NJrPGVbe0
	+DihD6zCaA5LUQ==
X-Received: by 2002:a17:903:3295:b0:2e8:dd9c:99e0 with SMTP id d9443c01a7336-2e8dd9ca60cmr47644535ad.40.1792028690053;
        Wed, 14 Oct 2026 18:44:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:44:49 -0700 (PDT)
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
Subject: [PATCH v2 02/25] ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:01 +0700
Message-ID: <20261015014324.5569-3-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp63_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 5137305662ef ("ASoC: amd: add acp6.2 pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 04c014349347..12c341e89bce 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,7 +211,13 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp63_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

