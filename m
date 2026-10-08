Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24F3493D34
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456067; cv=none; b=JLSizxYLGoK3M5VwatcJ78ZngKoGdMH9OZsxM78bG8BEALnFh3ysMnD1pmCL4flv1IKyX47AKm78gPXIPZcwVxcCzdvLIrhaFmt2jbceSYE+3PCBdqX4tBWbmTZ+N83ujsMsriVB4ObptswrJP+Hey5xp8MSS9AxVT0uodJCjjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456067; c=relaxed/simple;
	bh=Z888BsRACHc4khVghw71yqQDS3j8iLQcHLU2iv4UfaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRwWO5yoD7NyoKaM4PL6txR+mXyTaTenmF54wEOOu+KQ0EkEO0apEy0s73wp2W9olCnRt/E57grmXglshb812iQ7wKermttfZzHb2SXyb6vTaWjJ4PeFZMdm67Rtok+vjWYM18N0+SkHJzJf/ubOD9rcW7KU+wppiQfkKw3+Cns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbNm8Vvh; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbNm8Vvh"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35154cb9de2so4040955eec.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456065; x=1792060865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTcgEknypy3JpI9J/G9mPIrbfMp+7I5/710LUj+4UxE=;
        b=KbNm8VvhkpiCrKqc89Fq4x9OFB+UNKL+d34wYccd6XOILhvesojNO6ZGOWE3YlFruQ
         IQwVZtXJ7YIv1iDtJ3vSYtCiYoPp6Uk487ypZOJi68zwYu3XLls+Mt2b68GVnGT2LJGs
         dhgCVOGZjqTWEYGrfUgqGt1TCONEB/Zhy33T71LL79sUi+VBgwXyXMAmfQO1z33xvGvV
         H5UqAaZkFDn6UZ36FYSFGTmd1d5CaKrlEn2x6YmqDkstSiG/3epK2Unmgf5JwwGnbB+u
         Bozz0Sy9sjW5Z0ef6UIGnqIHrFg8PDJA6i26vuP5S6+EmXy9ZMyTR3PO2ZYHUfddxLPV
         Wptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456065; x=1792060865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTcgEknypy3JpI9J/G9mPIrbfMp+7I5/710LUj+4UxE=;
        b=BjCZ+A2zz9a6YNULqDDMHLxZp8bhB+Q58AXPoAoXLVycVYu1pkO1uAu0IkFl3PiSjv
         qI+aDTRDHMIp6DwEX8HaevfSBYgq0QK6hW2EsNRKLzqQ5Bc37O36rmMAQ+SqUjEYiNVe
         ujeUI3XOdbtUeaPMJmCR/OpqaM2AtdnwVGycAYNI6UmXjY8yacArUrHucgdxG/7DAuoJ
         MO1MNU9HH3JAvgKtL9MBgIMJ166Jn3ba/lEnt1FojUay38S9xvOc9Cal5G8RO6WP8rll
         CRjlrg3FTRHFZr9nitBqWX7JwefET37iAPE71ubgUIoTeCzoU1J3jT5dW2/OwNSBejEp
         cCLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFYJrBztaBdN9t96yxS+PohN1OxLnJzeD64FVF3gEoDgdw6HbdsCVCLi3aDPHLb5c47ffGM7HbNxh6QUAd3ICs0w==@vger.kernel.org
X-Gm-Message-State: AFuF++nbsOCzsJoguiSmGrRGR0r9gY/kIdWt0k7kmCvyWk2/GnGYykp6
	ApASvZA6Aq6ok3MCgtCsTPSMUiOIqhJGeeETKErDe4CBMo85rWIOdiwF
X-Gm-Gg: AYBFou2dCWRjv7JtnNGig1cePsD9xf+jEfgMvPD15QvfFMOAV7KdKW2ABYL67+hwyY5
	Rxe+4BWk8xf0MCT6wntSeLax0O04luDAjQGew1mzDerZ97PiEj6amJv4XPNV5MpXZ0x11h/2abj
	0BjiWbI3XX6SV3o7egHJBfmkNIIUSiQuXCaF4NXFO+J/BhN5ncI5nnPSkUJGGX17b9+OZ2x7cH2
	Xp+AchYjYSuEjg3FXKMAvQX2tRvcuYEI2ncTjlXsUccudzkM3OtItppqkWLJ7fOgvUHJc349Lsb
	kaZcL6P3NxtJpdYAtnyi9Qzu2GkdrFN/KfTaG+ZN7rrZA/ey0d8WyQIiUgJFqnZkX/v+N3FFo77
	czvVho2z1Qu5x9HZofcYYS0Yazzd3E52NpEMB+9t+U1rf8sH1UF1b+Z2lqK7itNR1VxW43Jj0eY
	33Sh7QRdigYCizINzi2GwfF/bEks68BdLTbdasyoivSn87KunqzXOCd/QxbjrHdcvU3mlBjsL1p
	4WF7csaBPCwA2vgbr6bv4NMvQ+iPb9yGr5MWS/U4EmxNEAvmT+E8ED5pu345D/UIIBpvpMaxsOu
	wBhYcG3UeoWWSw==
X-Received: by 2002:a05:693c:880d:20b0:34b:f279:2c16 with SMTP id 5a478bee46e88-3515db9190dmr5490986eec.5.1791456064946;
        Thu, 08 Oct 2026 03:41:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:04 -0700 (PDT)
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
Subject: [PATCH 08/24] ASoC: apple: mca: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:15 +0700
Message-ID: <20261008103831.542533-9-phucduc.bui@gmail.com>
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
from mca_fe_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as mca_fe_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..3585432ad49b 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -516,6 +516,7 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	unsigned int mask, nchannels;
+	int ret;
 
 	if (cl->tdm_slots) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -528,9 +529,13 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 		nchannels = 2;
 	}
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_CHANNELS,
-					    1, nchannels);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS,
+					   1, nchannels);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int mca_fe_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
-- 
2.43.0

