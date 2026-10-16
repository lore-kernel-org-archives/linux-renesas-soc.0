Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8CA374E64
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 04:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123899; cv=none; b=lMDEulLFnSz5kODx54uQ5+8lBYpvagndCUBPaoEgO50vFOZXOgZES066rY0kYHRiUn3nmPgca73H2/a7QE13MyVjrG98m4L6PJKi/vN88echjbhXt7eKGUQ7k9LOylooyYhl6wwCGPUgDZlhm6K4IshV8Lc5jzxIGdhmNzhSmhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123899; c=relaxed/simple;
	bh=uLjOWXpOgCN4Y4ReFAuUHvuVmI9KZ+NG4nVknG5Mu6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mX8oSPocSAew/PTazJu1Dt/iIRfO4ZRT1gkSI3LfpF7uGh0ec7mmhrAc+u3O8J7SIqtY5oFotngyTouULsuqfh4a6ia1gc7St8vdOrcKwSCuHRU0MjopMkH6vxfkAfajwa1o2sIwHF53f78AlNuhZjne34KcwN5iNap327tpoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce2TBOEZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce2TBOEZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e87c66e556so3196105ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 21:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123898; x=1792728698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AfJhOKZbdns69Qk3jxc+qI7b+rXXsiPaDqc4PQO3Hk=;
        b=ce2TBOEZR1dCHGx/vxoEponfk20xOlHctd83T+o60GbAoEfvSs5Dcjyox9YpV7RtLz
         8r50LB2jiBz+Uol70mHs4TgSsx6brR9tiZIeP7lW3z3ngqpLV+AHugRH5pDI7nX8iybk
         6IKtlqdV0hiNPozz+SoZUf8ZZpNau/Qhdqn7Q6aUIgbFEORNFChjKv6gu1ksEN9kMbFg
         t8r6HfozNCb5e+v64//zyyWv66ZU5Sb2KYnpcWjhztM3Lufjkbr3t3oR4+uQpyR1q8kd
         LG2+nPDSdNgDqrC/VK6V+OCLfuf4TjXuhsPETr3lsL2GtFObIFvAeTYR+dEcbU3hHCHb
         J+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123898; x=1792728698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AfJhOKZbdns69Qk3jxc+qI7b+rXXsiPaDqc4PQO3Hk=;
        b=QARwM1WncxtDYvjEY+zkkcl+3II63d8AkV0nKHDoyfvIyDqcu9RlJ/8GpN2oUfnHOq
         VvdFtO2xgteoy7xuwXacX+DYb8bLj6imsweRrzPORXkzyWOnAIdy2mTy+gqbFr3FWW7u
         1N7cZ7FGj+VW/V7YjtAmgCFdZrlG00BuAQIFcDcXzMy1BQbdnVolCB3avPGPmvMZlV6S
         Z3FD0Yu7PZER1uV6WqTg/WwP+jOB8z7475sRMpHebIjgw6I/jWGINMPCvwPZZPU+0Jjo
         b7Mpks0ENCAiZUMgMYPzqLlCYs+POFhLV4dMJtSjbalDQf8CtNIRJdMSydFlPogyNhmR
         6vPg==
X-Forwarded-Encrypted: i=1; AKwUvBzATswB7fBZez8xG4wMAEw5KoSD9ZAYKFgaQuqNfAtMkNOScvyFKFMUpjpwz5h/fG2LqF3fRi/TVHX25WBneUxb9g==@vger.kernel.org
X-Gm-Message-State: AFq9FYISCauTFLnlAcB+zksPQuFcK4lUCd4oNIE1LVJGsPwHhKyOQxnj
	60ykpJGWew42i9CaHbUH3O88IumEwilHvrL+N8qu0Acp076rYsJvQ3Yk
X-Gm-Gg: AYBFou20h+ffCdDhuRv8A6csOzK1yG7CGA0UTGtdZtS3Ic+qdbCIjjfYsgABAh5ZZYM
	asNzjp+Ga2Z+2ezttSpOk9XJEjTdwKTlLux+UeYH4yS43Fir3zJxZeSQT5Ei74JuxVr4p2dCOw1
	P6OrC71zbN/MAC3Mk2gr1J/GipMZUoecoBryOG0HlnATaN8GlcdMNk03w+HOUdOwbbjxRhrlRGL
	I8PcasTQrzb0Ju901bCXsVYkkqiSZJNKj4BldcpC8BEnSAg1O9EGJ/9qB2icr9DSoTWYJSoIt7/
	qiegxnTEwVuyy22rHW32JwqEaI/V9tnRjpHT4/AUaCMyWDRO3YCFt1bn3miTx7naptU0KOuWCSe
	rZfUqNxlkiN6+XHBh7DFitY8J4RVvarGJBHErr/+QEZBCLSNZE9epkOgpEDkXMlO3RO3/gJGPKM
	C2PoL7r8GljjmXH2jA/EO40riIZoqShV4Edkrqr/UIO4BAUtLVo8XjNksSdKxWzXqtFThtmYG0V
	WOt2/wpSJF/uqK20ld5tp7mv1d9q/IU/dxQFNgYyBFipyYWUXP/uzturIarPRxFxVA6Quelz2mP
	RIL47glWPPHKAg==
X-Received: by 2002:a17:902:e54e:b0:2e8:3b2d:c0e1 with SMTP id d9443c01a7336-2e977597291mr13010325ad.41.1792123897928;
        Thu, 15 Oct 2026 21:11:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:37 -0700 (PDT)
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
Subject: [PATCH 07/11] ASoC: renesas: msiof: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:42 +0700
Message-ID: <20261016040946.521195-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add a comment explaining why .open() must return 0 on success
to ensure the component is correctly marked as opened and
prevent future changes from reintroducing the issue.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 88618e4b052d..74e2ea002fbb 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1820,6 +1820,11 @@ static int fsi_pcm_open(struct snd_soc_component *component,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure the component is correctly marked as opened.
+	 */
 	return 0;
 }
 
-- 
2.43.0

