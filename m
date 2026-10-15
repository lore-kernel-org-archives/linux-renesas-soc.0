Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FB735E950
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028805; cv=none; b=NEml9/oAg7lw3MbqHFcllVCpRYiM0aZXqU5xUTqYl9LQEfS/N0hHwSC1OPYDkdTTGbwkX1FVOSHPlupsUhrZ8hUQL9GQClbEJCvSi8QsjL5L3zjsipzKnGHiv1GGXxWw8Ezb8S4BOZAyyZrYAYIjjf/cnLouXzaY+7QuR3BYvAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028805; c=relaxed/simple;
	bh=HEnoir5YUU9pRtHiCZMnqTe7yfBh5BOFRRnUCPqrwfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwMTCA5kClSV5xeATIeOyMoxUfibl3uoHVQ6ponX9rJjc/hpxzH0DPZ/RwCGFawNalMw9fQyxsZLqjbRrDPfbw9N2azL1iTZG+Gc+aeV3uUQZzfMfl2BwB+B4EdrB/EydqA0Esy+whBi4BkYHd95/vs+9PExsM+Scf9EzlkyS74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLOUHqYM; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLOUHqYM"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2616107a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028803; x=1792633603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNKaoas0suhXoNZM631qYPKJn33cxyMQnmMBR8n2e68=;
        b=iLOUHqYMa76XKfsdwncdnvFA6++Fw7bgclRFGIIVUXcqtGOSB6JW7uRG0uy8mlqiTY
         Y75O0M9L0cpMOnN47n277djnZbVu13dWNF5ISb2jx3Roc6052ewiIXtDUrgDTKnrYOIQ
         NVtwWEB/scZ2WVDi9MgTqIVzgQJcciam2X4hXHWAvNOZe81XGcazO0ecenaH+nyR6S5a
         xUL76qqIXBr4xAWGH6rC7i5PUwjPLuuJdcTJaiz0iwgRG1NFb+22yjyziT+IMzyUFg5/
         ddmdJgpquBgdZ5KL0ZCxjj0djF3j4mo0kM9TDvP9Z8eOygE3YikA8pl7KEo4zo9CkQWt
         ue4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028803; x=1792633603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNKaoas0suhXoNZM631qYPKJn33cxyMQnmMBR8n2e68=;
        b=WeCGDa5qWgOJu4xkrmTVS23IbcKk7ufCPQ9xQzLLxsE6g4+dCQGcWN4NRenCtVg2rq
         httPf01rg300gSok1erAs4DiApqTXhoZmrdye4Nubg+m0YebEsiESguqeTfjx+Z370MV
         pf0Rn6ch03IiiFproPolQom4ju8tqQgLB1QbjWq7QG5qooaOJlKAMx9ivFK12SEuTKth
         x11PPzmjcikcn0MdDEfNuUbzYX3FuSH4PfWMNaPziU7CKH3ANMV55o3G3axUPxdGe40l
         tdJkfXIgXydRl2S84XuPAtSSFsqgDlwCQVedQKpYqNAMZtrIe/8l8kg8lX0w8SsW+pAL
         UHWA==
X-Forwarded-Encrypted: i=1; AKwUvBzlRGuFlYkjZGdXarcs4jB1wUTR23FaxSBY/LpieehuFAFi8gAeWScWAmSqfrxUapPwhS6NDe5r8o88+FrjdDgjbQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKgyeTfxN+MekAPZ8tqpmXar9sfY3D34fi3Z4tfSrbD9a4mya20
	9Z1rl7rntB92igInSG4/hgGAEHaI6COhaTO2vuuArdwX6MHpJtgHQ4QW
X-Gm-Gg: AYBFou2WER2XpmcAX2gSCx8sZxXWVuNl8yHaQrq64wEbYkcfZ3mScMDQ0SUy6hgtecV
	xCeh9M5Qyi/gYBcbYzwvEfxc7Bqn4wbvkV/ObekUmwyc/FXci+1EVAdtCcdqtslD3EKf8VlUZUZ
	/CxxbZooWPxSacYNXCN3b1j9OP9iz8UBh7wVVnCE8Nz8NUU6BWO+ZqAoGNPJkI9GJAp9b8Z+CMp
	975zB7+ONgE4M/EQUIUuWc7BsOeHZtqXrtvZXYMO/hDd3uo985OEhegXNQTfYI70NHkAfTnMfHp
	+fNXcS7SXUSssvt8jzXnS7451qbHn9+Kbg4TmqDvnTpdNvJKARJK0XzqsjkGX4vW2IUahIJe9c/
	2bat2IhpjjcrYfhkD4wJ/7dn3D5iIajKoH+HWPLhPm2T+Y8rtTyhd3zaasPwSAIORE8zKRAA8T9
	AHLb2lnbZUHBfglUseDwbIJ2rXy1I3wf+uEu3dWvnCEK9oP1CJj3Bl5F28YHf5GZt6G3agq4D0n
	OywJZdWEEql7si45sMSv8r7OxCqpNweaK5OmNuSMKxXsKPWpUKQwttSe2WJYRRsFPYl8W9xKHKK
	Ii82djpuPNYFTQ==
X-Received: by 2002:a17:903:37cd:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2e85857ba34mr106063185ad.10.1792028802766;
        Wed, 14 Oct 2026 18:46:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:41 -0700 (PDT)
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
Subject: [PATCH v2 10/25] ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:09 +0700
Message-ID: <20261015014324.5569-11-phucduc.bui@gmail.com>
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
from cs42l42_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as cs42l42_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..18d6cb9bfa2c 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -890,6 +890,7 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/*
 	 * Sample rates < 44.1 kHz would produce an out-of-range SCLK with
@@ -900,9 +901,18 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 		return 0;
 
 	/* Machine driver has not set a SCLK, limit bottom end to 44.1 kHz */
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    44100, 96000);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   44100, 96000);
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
 
 static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

