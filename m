Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5841A9F90
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028965; cv=none; b=JLdKPb/HvX7Wq9pChlRRHlc/rIseE6B9N6++cpGg76mDEXEseLI/zE64dOaRW9Y6kMwpyeLxV5MB3MQotxhgQ8kSFxMKMpTcs/9blPF68JOm0Nh6wo3aMvost4R/Tj0polH+lETI7aR9muv+UCxpIh6D/OcUzjTa1qxwrGlAXQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028965; c=relaxed/simple;
	bh=wpmHgU/SVIYOTBhjMxKFXWaiqOI+cwOYjPVM8h1oB/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfThXQtOGTedDgO/5o6t01tMbJJS8oMBUSzMjo9qO0mnmq6Cld8nKOnnE+a2iQbppeK++RwEEg0s1GY3DVU6C8YibBWh7sZ/rhlo3mXXaILvMGie5f/kqgTaAc5N+fSjN9OHOuC+uompjk5g05kQ//egOz7fEZKykVp8Gq6m5aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5O8gUOR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5O8gUOR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e95bd1c14cso1962135ad.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028964; x=1792633764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRhw/DGZE60v7F2bKWHVZMO73GmaBC+Vm8KSgOideNk=;
        b=r5O8gUORSlU2vLVAogybqf0jb2URV9XRYQ78gmG1pQExcpsFq5gsdRwLsjWCY1p9QT
         VPbjGAF4qRqntWBf3/Drxl5XkZODSTa5eFnr7xkJ5+oN6KReMrDrRKl9swE8lvRto0Vu
         cCUZVE7sgaoZWaSi8Eglx0cGl4l3XO+2isdhvTiLxVYZ3SXC05xQxKDgZzPW6w0OE8K3
         xeyev3Da2aqSKrjxWy5ZI1Da0vTtYs3n4AIpuO57ibPmYn5cZLuV9it0gq0TljmuQZLQ
         yhd6h79lhaJnMVbdmcXWP6DrzvFsOqO4bI4KNgON43jvHS87WBC/i0606YVzJ3yog7Ts
         8gGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028964; x=1792633764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRhw/DGZE60v7F2bKWHVZMO73GmaBC+Vm8KSgOideNk=;
        b=AqkFc1c8IRnWKAsM1c4WZBZr4bjzlXE4WtTFpLQWxTD8uePEHJ9GZJyeXRX/D7hMaH
         efGFlU8qaZml0V8MiK9nPVva+jAYqxbSldvm+xyHMEM4wW27W/LPgqFjlNEPO3LCFSXm
         PBFT3zmBJTEVn+7cBx+hu2QGVH6z5d0FwydWeTwMlLj+gALiBlKIam6dgaDrdlaT0lRW
         +lFMjuW+xk+eV+eHAqWXbXH5FtwDFaPgEr94oMKikQ3djUUSijDsJIfdM8pzaFfOYmip
         SBWfLzRmu2pcNXSv36mBYUdQ1hoMqcBzakj24FfP4i6SW3BTHjJ6wQRcQubjSyMkFHXh
         VRdg==
X-Forwarded-Encrypted: i=1; AKwUvBxZBRD07Y5CKrdO2q2yjCVrXta7Uuvmme2AUgEOjyaX9rD+461+vzMvVMHZ1YQlrVDO3OzCunayNALbA7rIe2Wfvw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLZhV6eUFrtlJ9x8BEd0BFdAGRZMlQOgKUjV1qoDvo+wDhhGWNk
	6W+lbhg9aKzYGZMYIni22uKO0Jo8Y9T3GKAaRsC19gTgRSDtYXhqTEYO
X-Gm-Gg: AYBFou1i1hEgmqqYet9wxtoxM6wtgKujlXARGAF6Y0r5WkaC8xwdYQ3uAmvUgXItgK/
	TAQTRllHjz9pJxyBQ8OWm+W+c9iTq8Amp6GQhs9o7IfJ0ANF1LhrCsBY2BQkkdDOHskfe8AN9gM
	c8+ZOPQ0lQSEyWKC11shzruvQysQRGfIqRcxUMxWOjVA4Kih4oTWMEUeGelksSYQwTcbwl/k//d
	dux+2YtjwHuehYelJZyadBSrcwUoEBo2bkAXqHTCAq/TCqxm/79i18rDWj5qx0bBudPEhkddAOs
	od1rnmzQvjFL8tpZ+6U1NcmJx6W8CHKYbWsaRvJ/5VEj0uLLNDBFK5nj3eo8iwqy2CWQnGgkaKy
	+ZpPqDr9hV5RUllW94HRTRT4n9e/nb1NgZIo5ITw587UAKnEJbA7C3jVDi6IJJPqSi5DUuPjx/b
	jEE4LsIvHVrKrArOcRitvWh2GaXrrQwN6cp5CfsMB5GzlWuTIQRwAKSk/1ifxcTlrczS57uEI9r
	btpDLC0Qd1CcEmbXW1CFI2KZAKfcmCHtz4JOYCz0vESHYPy6m6u9TSzLVJWZyim0qGl48jtMlYo
	fC3mgIGdA3t0MA==
X-Received: by 2002:a17:902:e548:b0:2e5:54c6:e5a2 with SMTP id d9443c01a7336-2e842820581mr176747665ad.6.1792028964152;
        Wed, 14 Oct 2026 18:49:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:22 -0700 (PDT)
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
Subject: [PATCH v2 19/25] ASoC: intel: atom: Fix .shutdown() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:18 +0700
Message-ID: <20261015014324.5569-20-phucduc.bui@gmail.com>
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
from sst_media_open(). ASoC only marks the DAI as started when
.startup() returns 0, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4889a8a73f65 ("ASoC: intel: atom: Use __free(kfree) for stream pointer")
Fixes: 6cc0f4e63994 ("ASoC: Intel: mfld_pcm: move stream handling to dai_ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index a4c8cbfba096..58681e007abf 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,7 +341,12 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
-	return ret_val;
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static void sst_media_close(struct snd_pcm_substream *substream,
-- 
2.43.0

