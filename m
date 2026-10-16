Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071F337F732
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 04:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123838; cv=none; b=XDjewJlQld+0YSSSDXDAXoaC0F99i0AhOGxGyhcC1BDTM/xFBZbkqmmawgzNryBRzuXjNv/XIHFiDYEy6OzDWab7l3+jA9l5v1HPPh9KaFYhhA3NY4kYbSXcKIIC1miaHyacpXqJu/bFX6/FcHTnulCK37MATxGT9MXZvB8tKkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123838; c=relaxed/simple;
	bh=6DbU/lmMa56vZUldhssy3WWvEn6fSDga+TC7sPaI04Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BB2Lf8FddwC9mrZH9uNbJsmtpwlCgqiDIOqmMupUVWwtyP8g6DPE3el+/ioCWRmXXT5LR/0roDRCnUTGo0fwGfTJSosj1TWJs6D8jsoCSsIJEwKtkNSly/L5l4DkjwGP6fz0E+M5W30fJoaM7IUJQb4AaqgQqja7AVNPNriaqqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/mtWPSq; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/mtWPSq"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso26853685ad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 21:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123836; x=1792728636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFH69Gbmd4pLwYRTdAmCw0agJokE4nomqHT+KuDYM2c=;
        b=O/mtWPSqVqkqW2KAaz0BD7lHiozjm5O8Xhd3n2ZaXt2C4y1QqMgYoinNz0LNblv0zm
         H4ny7/WzbEmreH3/52WzTofJeVUNnSOVexPg6GnEnI+wyMzYuu0pErvkBPRBzlLH72/l
         D/I71YKL8HHxregDpZWntCtdWrE2PJ1qkwvbkAv9zukfELyDG6GNacFJXHgkuj4TR/6i
         Wo/0dDIhv1NykhMFNN6pglBbPSGnVO5dtdcEggyQXcKZdEPg0AtWrRLXCnLuvs+WpRRR
         sKzFN8wyp44xHzBdIEtty3F7J+MVlGUxa5WDZioMJBLvtpWiNgGEFjWgzY9mdKLdjSYT
         ZDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123836; x=1792728636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFH69Gbmd4pLwYRTdAmCw0agJokE4nomqHT+KuDYM2c=;
        b=f/t65SYMW1HVFqp/eMhbqi9+wkwQR1fQmx09L0e8XeSm08aPA8v1+FAXQhHORKGg58
         amA2uXFKJ/j06FUyEBGh8wRwJSv/A6Wcxfw4U+w88PkICr3Enif0Zxm91m/LUGIlkWuL
         me3gh1VJkf4dWt1M9TKS/xD33aXcO+MJ5L3Ew5nK6OykHZ/zGRjxz5wwJnMbLFdiuuvZ
         1P4grZgl1a6M88zTm0zMId+K98GaxQXGaQHcUYubc2U4QxLO3bdazTs/EAcefV2bzC92
         2yT13VDAp8ftBxcjSA5wLhTy/Ez2hVnXHX26thRwvhKTXUgK7sDkMdm8wT8ZOZsX3hpi
         ZBaA==
X-Forwarded-Encrypted: i=1; AKwUvByFt0b5jHYRA0TO/KuiKsJxZbPczbosYakEPZC1GhGAeV9LgcSfNNEVUZlGA+61oP0nutqcBcGDHjMsk1J/sygOcg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZqBLJkcT5kBhkjk6m2tNKyQQe59Bc7aS4HrcEIQSFoOGU7jZh
	TIoNoZgHPffdWJ/PNnSCQilVXvt049DyshkcN3TSVF1soQBq67/2CR9P
X-Gm-Gg: AYBFou2G/T4NeLp9dgtcisrXu+WRI/sh+z9sq1nQsOj8CDQQLb4d3Gg0wI+nAPrdaUg
	APTmkOt0XV4Trrb3LKOF9GIao4E/W0/MTJBoeqII3619Rv6Tw9yFJfPugn8NJue5+1W0691T2SI
	/piI8F81V5ec0y36cAhCqcb7MQsTOqVL9jvWCWLLbMv/2hYt+EHdTwxv/Dw15+mJHU1lYilXELO
	4JiZXNQYReRIxz6FpzeBOK3wYqNaO9DIs7gJwFaslzMNRHct0JqKhv3S5cj/MVzRaZPyKdDGIrR
	9z+RizVaqp2jPW9nZcMpIxOLT0NTsHCpfJpAzzJoaFDY2coRL3sa/T9ioxJ0ObKiv/uTjw7kH38
	ujhF+oWA2OyajQuwEQRr+7ML0nwukhS7vl+xB+lRqCSYI2LZYU6Hon40wOQlY5QOPpvJ/LiD9OY
	ped6Ahl3OIUjzr96vXdEb+PIqTYKkISE32lPzR9IBcgUUgl829J2t9buk9KeuUcOui+dRQHNfQW
	x3ZgDmrOlgCTxH2ixGJcv7Vjs/okz8PyTD+GK/3tmQFH1+hWJ7wYW5voyavJCBep8gblgxIO/eD
	gbSiQSzyj6d/TyYecvR6HI4s
X-Received: by 2002:a17:902:db0b:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2e8427efd9dmr210035865ad.5.1792123836136;
        Thu, 15 Oct 2026 21:10:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:35 -0700 (PDT)
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
Subject: [PATCH 02/11] ASoC: apple: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:37 +0700
Message-ID: <20261016040946.521195-3-phucduc.bui@gmail.com>
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

Add a comment explaining why .startup() must return 0 on success
to ensure the DAI is correctly marked as started and prevent
future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 3585432ad49b..26022a42a95e 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -535,6 +535,11 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
-- 
2.43.0

