Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BD533939D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 04:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123851; cv=none; b=Zyzc3I4qClJsf5lyur3MQbqUUwxz7Whi2mJ1aJ4EfGKyVpyfCB1pshQvJVsdc6JBKbe3OBweTb5cTy+hYw7t1noISBMC47xF4Y7PLOcbit5eC9h4L2Fvhey9MYjDBErMF+XUc2xw+lOKJbfVd2d5Wv2poQ3JdjMSD9HmQsZzhkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123851; c=relaxed/simple;
	bh=vdLtUhxLS4lGvufa56SD+uGcYjQygq5MJ/eIX5HtXec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmX1/ItI+5cZFvl0VxxMdoSvKqTarJF7lYgwffyjoL3e1JWX1PBm379H6FWqDd/uMagb2ZTuoXgY2kcQS7kO/vN4ZKVvaKSk/oYv62MkGy7nufgQTTN7n6Dle/ZI6fgkW4utUTZOv/IT7jOCsRZvAyAjsqYte20UW+8zpWPDzaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrXREDEy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrXREDEy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db80fcdf8bso35126125ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 21:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123848; x=1792728648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRXMnaMYG3V2xMcW/3gwqdrm84/mm5oGaOhlRKzj2Og=;
        b=OrXREDEy4e8LCR6YNk+OfX5+0ZepyfMKD485p+FFBs9iuoNX5695HcxqHjBfUsxjiz
         tKZdaK62mKivx4RTknU0w4cu2Yq39hfUhn+wzlJyHSZ1BIW9eK1RqpB2DxPY0k0n2MEQ
         cDSPdezfrQj2AFFDbLP7CPml50PPcPMqHAxKQ+zfeKhR8JsmnVR6P7XxageoaMeLVflP
         rFn7USMVE6uBbImbYbHcaUmrIv9ejQ9TBd/2zu8hKArHTKSRXLSwgNcGDHhZRqsy6gnr
         xn748H0ho5iquKqM8GGa4ikw71Db4EBFzNeHiQ1c2S0nPErR76rnXGgSDiN2pXUFvPfe
         o9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123848; x=1792728648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRXMnaMYG3V2xMcW/3gwqdrm84/mm5oGaOhlRKzj2Og=;
        b=Evq9BJ6vVjyknXp+vTEVP9itcfD8yXhEv+Aiyw4ahZ/Axe1g0pq3pDORyYXEXFcE1T
         HSn84muLQVvm11v2mpH+ZWzWXAWG9aivWvamTCT60csTDfGjcbZPzIp15H9pesMUVP0V
         7ANm9qe0t0v7zpLCogo0AsiW05esUJ8YwWda9eoTq7wATrpoxbYQxSDWgNxF2bGydpa2
         9tdtUvQ2v3P/fgJkJy+IDtot9rKoDpP9CqB4VBRcHlH1s1VrtMx6yA9bJCPH4zt2Q3tS
         0RXjDXUA/wChtGFlfMKXK4r+fIUQq8HHpYKDxCbfdoZvZc5eezstZkgdwsRxvELSAZqU
         YpMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhAvbf1uENB7N1ygKdT1uUzOQRx6XdM2gj+q7l9vNeaKveF6YnBiwrKtmcvnuLcCeOFIeci5r+wuOeXp/duJQRiQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKpC2R5gwuVJcn8xfj/LQ12h+2zi0vePDgGmp03Zi2R663D0b2V
	5izJzKyiRKOuXk864B9oeYPWQF80ZTMt07kW9cqNe3MFgaA+i+YeJAwF
X-Gm-Gg: AYBFou0Ai2vJUa9IxO9Qjyjql4Iihq6WhtGHM+WJn0iiP5ybzBFJo0Tvlzze8Zdca2b
	Uz0NeaEpV6LIW0ZwW6nBOQMikK0TKE5Pm4+V3ctddimZbB15vOXW8aPUQ6+gqM/FwQIOsv68G5Y
	TWKzT0uLbuVtQGAHy8z32edLHnuCttdTqEbpDLH4+kgbEtlYa/gbmkB5MkSv1w8llCFtMdL1fY6
	OQjyUJIzY43FTvrIavHMXMWIrOPUK54C+wmzfv3e8yBQWyh1giP4mUJHM16I6ok9sq/dY5ItHS0
	uui0ekc1WmlGCfcq/mAX2rckfkzGTjT2dQawhO9w8y5wCaUSQFUJAmlsTkA/pGFkZDJddxjN2VT
	QWKwQi3UH9V//ucR0gWvMuDLjB1reU2PKI+qwlTKxmKbj9tGU0jEvBPDs0ytflxFggkvuKOCyIc
	94Eeo1mdQxjv1yCmHXAwNvITO9zPJuRiPmXRJCLLh0fwE3VllsPxi52Y+Z9ybsplBt9Ij7NKJDN
	nMH8VRhLqE1Q1iGCrrJE6of6QFmAY1XQXXBVRMH/4yQYoiVIA9n74gQ3+O/dVM+QuvScVGDcK2e
	UP6LcK7QGBYL1Q==
X-Received: by 2002:a17:903:181:b0:2e9:842d:3c34 with SMTP id d9443c01a7336-2e9842d3dd5mr10658595ad.13.1792123848458;
        Thu, 15 Oct 2026 21:10:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:48 -0700 (PDT)
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
Subject: [PATCH 03/11] ASoC: atmel: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:38 +0700
Message-ID: <20261016040946.521195-4-phucduc.bui@gmail.com>
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
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 552bfa30d4ba..4cedf2ad934d 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -295,6 +295,11 @@ static int atmel_pcm_open(struct snd_soc_component *component,
 	}
 	runtime->private_data = prtd;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 
  out:
-- 
2.43.0

