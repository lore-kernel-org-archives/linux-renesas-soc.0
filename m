Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC636DA04
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028981; cv=none; b=mZf1E00EsEtcK5V3ILytVEFDcmSDS/sX2cZyyFgoeK3rgF9XOh1dmTDURV1bj+bPzwnbX3MSQOuuzstVqsasHUzLN9ny2Ec3zBTh3NcBnpzaRHSWjPqNd5a3oeGF9T9D3aIXUL+OX2x+qouNAEuShzd5alKSm329sQtLlvU7E50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028981; c=relaxed/simple;
	bh=jlEb+ienncM3LL+BnYDTqkV/y1oGhTtwElRku4Cmr6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KeATSsM50vWA+OFEV07cOfFb1LxoXQn8lrPEbb1UwPxsoVXqplD7wA785ZH9OxwA9TlNT6rsf2HT5unvi6l4tZIJyfNpE1syCbpSA2ohQlZpWGkPyFAs2AxdCGB+Rt7jaDOyZZwUVumcAc70hFBXYnI8ge52aIM0KQbmUieSKPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4+BOBkC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4+BOBkC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2dd76b1361dso11015725ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028978; x=1792633778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVU2me1+3bnamRCjCl3aeaOsDD74U7zM2YYw6HaRgfo=;
        b=V4+BOBkCcVFDOF1oErC3PeurvYWSyTu6yuYe9GubVrhefUyUQMFa1XYlu0vwZvcsha
         DRTcoyiw2GXHmwfcdbRotSfR0/2ejJ85tomLYYCFeHIPFurFSlwt5d1Onp/oZX/JhHDw
         PGZsyhQgMIqN1Qwwhapl9SPj0Ym6unO9BMFdwDAGBw80vJ5X3McHjsn4zYBN7ehNQOlo
         g5TS9xLFTup3+d6PoQ7pzDAXV8Kdn4vZZc9p9sYfqCPIUzwEZJVD5eIPIh2avw6X4x+l
         /Nzs4BxenfyQa3BW8bLn/qpDLMMjm297eFfQqA/PHZC6De+/7aoIKk+Ahu5yi6oGtfi2
         B2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028978; x=1792633778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVU2me1+3bnamRCjCl3aeaOsDD74U7zM2YYw6HaRgfo=;
        b=eFzI+kpdvJ57t/ZK6/q6bNKznekXof3wIi9YNGrg17UUijV+7aCzLXgBrytamnbUF5
         I2btIOpbRQ778Dx81wDtuDLJYpC6vM1D5EPt4rLzWu06gaWfSJK8BxD2J+c+wP+3fm1V
         qbJ34AmXi8BRp5Kct4UVQREpwAdba58S5o2OYP4DuH6oLEsFosQ93MyYgbQwCXV/v/Au
         mLw5Usop2IOe5a9/yvoeWC8v6ZynZcTC1jMdq3nF3Jn3bBsJ+0U2Wx+5RuShvr+hLzOl
         QlL7jvdLXcgiaYkXASe5gRKBdTsicwoTIW/lS3qzsdmXgqBCoXGcEVgk1m3Qn6IOi48I
         7BwA==
X-Forwarded-Encrypted: i=1; AKwUvBwzZ6G0Do0S9US9eGYj5IG3K0bcSfRjuYk/T1dpSyqvJlhIJ2KoMQWZOLVTCrYRUZj47MPZCD53TAFZ2vRdG2p8Tw==@vger.kernel.org
X-Gm-Message-State: AFq9FYISlr+ot1F88p/KOhRf9ukGOggmkwjfPwiXiAUu1g+DgNf1QzBn
	Nyt8ROofLgmSowQmJH67U/eU11TjCh65ONH+6Lz3AvK+LGYCF/Pfqh4R
X-Gm-Gg: AYBFou10adTtvEDjLCp2eqQBAFHpKvPvK3xPMyX9yWeSlCVgfywjOmOLSes5Gw9n8FI
	jPophzuPXEM+3bSKBdBsWxYJnWGeGVQtnYPeNUm3CmKKbS+5NMqCDnLGBcIwVE0Tpq1prHN0DdB
	0IE1RiFIr5f9Z8moA+p8QCfxgAVcfhINU94o7nXjXTFtMaw8B901gQVdjA6jgV9klLq2CoLn2Vd
	HMWtNI8N2cwi00d4kOFa56KylMNF5GoFulXchZwhsjGwkOrTjVUuUf5wzpTPONA7NgWZs1/OsTo
	jbmdNw9R9YuezTm8LgmQUikOaXGzFs2ZW2O/BB6CCHtN5QAR+1cvOnF0otMoaHJhyOfvXZlmjcI
	A45OirxXYtL+A52yD/bRPWkdDslbWvmuS30ftTxqnVsbfKGvnblxxVN+L2IiHkw1H6X/nGexXkG
	jxJi8pOpEY+p8gygOClJQ2sOdi5Bm2CZYAr435u8taWQFTeuGW1VIwdkM/lWNOfQkZPzF6vS9lm
	G3/oDsRHasySGOwm4KvGHwfWycURTmTVRFkojndnHc6EsIsGFffGaxEnXSKy1ap4Dsl5mMzNbOS
	3mAXmWyN55LqOA==
X-Received: by 2002:a17:903:3243:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2e842bc61a1mr152460415ad.27.1792028978441;
        Wed, 14 Oct 2026 18:49:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:37 -0700 (PDT)
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
Subject: [PATCH v2 20/25] ASoC: renesas: fsi: Ensure the component is marked as opened on success
Date: Thu, 15 Oct 2026 08:43:19 +0700
Message-ID: <20261015014324.5569-21-phucduc.bui@gmail.com>
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
from fsi_pcm_open(). ASoC only marks the component as opened when
.open() returns 0.

This currently has no functional impact, as fsi_soc_component has no
.close() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the component is correctly marked
as opened.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 23b7e63596d3..74e2ea002fbb 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1811,14 +1811,21 @@ static int fsi_pcm_open(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret = 0;
+	int ret;
 
 	snd_soc_set_runtime_hwparams(substream, &fsi_pcm_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure the component is correctly marked as opened.
+	 */
+	return 0;
 }
 
 static snd_pcm_uframes_t fsi_pointer(struct snd_soc_component *component,
-- 
2.43.0

