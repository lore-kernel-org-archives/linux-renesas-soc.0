Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6BE2472A2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028747; cv=none; b=mu8yGjx2MHhzQ2iActPLfCWMhKhq7FOYSBq5d41Xy8NLtasUJL1iUatycBAamSFQZ4QVwEeGpFYHX68ms+FwJ/5cZ0lPBHaipCE5b+SBoC/efhBqvADId/NRfOzmKGRsep5/0zQj0w2/seoypiQZlHb8Za9h8C1OlTVBer4wMys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028747; c=relaxed/simple;
	bh=Qod46+lJKzs2otcbuUwfMMYT23zkjG47R07TZKGmCbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcbKcNN8EvK8jnJxaqy8NbW7DAfdUmCE0t4TveX0O4I8vXFAuJ5mC0QmB3VDEO+DAPNLiZG+N2qdoRWPLbRklnGHnde+vN0Y/ehJYZxm8+cmLBmW35Fgix6MgmXeA+wggjvjpno6xdSGAV6pQWTRLIcolECc8oOGryz/tDCfQUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1Olehx5; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1Olehx5"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so2934017a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028745; x=1792633545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/n4smlFZhMXZJQElrsN5vEKX5hOiO4PseO+WVYrBqMc=;
        b=X1Olehx5rFnJlLHc38CfGpk5Eyk6Bcf0neVNP4ZA7BumYKwUEHsERkFiMZAaUyHJTf
         VNt1xzNrdiNxI5ffsbsw1Uc8nEU6BbYyKqUIA2jIdh6cNuZpWLIGbmhh42IEB1F51Gx3
         iAp8if6ZM4sf5kX8s1njowabmCEVByw1aqpeBpQLZXevBxz6aN3dPTcToz26KhN5KbwY
         2CdGN87l7pczkwglO3ZEzBfU2Lqiou8B+BOu/frUdBmrSrrupEPHhGydVG1eZIQLxnzn
         93BHirP5W2C4fb7WKjuglEYEj6OwtnJPHFqDu3wVmNjbsoE3zp7rizuwXbwPa3xihqeC
         4oQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028745; x=1792633545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/n4smlFZhMXZJQElrsN5vEKX5hOiO4PseO+WVYrBqMc=;
        b=VPYuce4F1qblT1fNMzDnooft0Ar297A6pw/3SkKxKGiJnoMgVDJKErbjNgS9ACHJu5
         Q81sxM5bpsUJ3fdBzdgLhkCGJAbSnq3ZEdxOpDgM2n4efKW+szRu6dDVr8UsYa1Kk068
         rGnb6R6Wy2mGFagzW6t9IbQl/jpySv7D0LI3bx79i03OuYR6otmX5fe+Af1nE3H5vv/m
         5f9NBDuHTAqGGtAGZgl36HcpWWrPxd3QSkmkeTxswuKuBo0XFg10p+/1i3eyp4R9GUmL
         mOIziutaEqvM+8eeXaZ61kM8E4L0ROFCbJ7nUvdOQpp4jRUy/dHbo9lgc9lOBn8GVVdV
         qQ+A==
X-Forwarded-Encrypted: i=1; AKwUvBw+9UTBWK73zhysbE6pAWKPiOGkp4oQ0RrrcEjpb/LmiKyOQNc9GNsEZNMMhyC74hjWzxvWty8bH+o3DjbH333gPg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK00S9+ThoUlqvIp0/0RlFV4vEOe5oXbgjv8S9uiZtUYpf04Xwz
	TmGFwX8mLMtSa4Mu4CCFV3RMQHIyNyryxuVT7XlCKSfEqDSxajZcvmd2
X-Gm-Gg: AYBFou1O3xOvqHSXGZi6dSMd4uOiTHw7fsED7t6amfB7Y1hMgXvn6+vQjhc+e31ngnL
	AoCdY7/4zt6PVhNZhdMWlSu5Y4U3MzOS5GmVTy5DC4Xgc/5PDf/BKs2/DTwfjKg/LGEk08fZ+yA
	+DNEdnm13PBWNvEKHs+6wdwW3y8RyGS3QW1S+T7P5Q8fIP7zUFQDwBauJcBuaYHAzOaxEQ5hLox
	BWZSIwSL4vXa7/oIUwqt7PJG1ozVoF1a/AeFHBMaqEM3RCciyh3c2XJA8NI1Yx+/Q9XEHo6SRUx
	uJactJa2jcVNR7qiysUK62dIT9Pdp8Q02GB3GUU3KF3IbsvhUoqPMFvi1dk0oKOiPqP2X2EVYqI
	GyKEC3V3gOcyupi2fh1/fA5++ToPNHiyId5M6lSih++Vda/pm+sokF5BnAdJ9d5EXo0FSik0TlP
	7tSGLPxAEGiodezEgezzV4/fjNcNV7JfDt1cVxGbG6HKCdHMg4tHHYbmp1R+m+NqZ/6Ss1gj2OF
	JsSml1Cbmc6Gvtnxywr8p9RsIJkWBGAuOEGsgEHyhUCs2i1MUrC/Rt0c3Pcdit3iGFrIh3/Rg1C
	fN9DwpYmJVDZUQ==
X-Received: by 2002:a17:903:1b70:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e842f2d257mr110492185ad.41.1792028745495;
        Wed, 14 Oct 2026 18:45:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:45 -0700 (PDT)
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
Subject: [PATCH v2 06/25] ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:05 +0700
Message-ID: <20261015014324.5569-7-phucduc.bui@gmail.com>
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
from acp5x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: cab396d8b22c ("ASoC: amd: add ACP5x pcm dma driver ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 831e30e9b042..72050fa2de80 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -231,7 +231,13 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	}
 	i2s_data->acp5x_base = adata->acp5x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp5x_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

