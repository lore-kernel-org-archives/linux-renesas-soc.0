Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630B52C0298
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028791; cv=none; b=fb3/zjt5Amxme3oNVkWysutr/EF4yvqIMEzbv8gvNbc0cHbsA5dH40NeVIrkmkJg4OB8rguRA4BCzeNrPAQ6Ms1jHZh//rajnmmxv+5TI3u0zblq54GvMe6fN9g2CBgIinEcVir2Rl+JfQIiGvoJCMOcvNy8WYxuBOF+kX1lkwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028791; c=relaxed/simple;
	bh=JyLcEpuVNYAJZZcS3MtfM//iTF4DoBGRH1sMBv09uo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Br1C43U5DJgQ18u4qiSW5qedc46feh7GIrGAmMhVYJ9sVJyPEaITIvtSkj+lBIqE//oSz1FdZNb+XhAO7JDqpjUap8YMQi771GsOQDoBIEGTYe9UUX8oxYqUw8N8nFGdaYs5cRc3XOgGWOey9Z/T9Oc5bat1cRZvVw1eK7lpUmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sui7pE9l; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sui7pE9l"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e60f9af6e6so12927245ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028788; x=1792633588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVoaE90uxAa4MGE2u5YmtFWHqpvVUok70EqIpA+eTKA=;
        b=sui7pE9l0ruWCQ45xTBS+mPN14NATdBzveKMgrwr+LLMCcx4+yXA3xDHoedWk6FvDM
         tXPMGe+ukdI9CzVCyl+SZbeIffszPdbcjv6nNQp8eoM12o3BrUwNZoM0G/IGQuH9bnQK
         9YTtGtMrMRlL8XENCY5g74xHcb2tjI/UHeRVhpvbg8co4d8jFdOJuaK3ALfuvED5/fw1
         K6ZFn3POWGR/KRLscqJwgxxxBqB73mEXQW+Vkb07d9i1xJSWKwPojzYy3Zy+cN5QUyzR
         n3E6BazfYjLmLsKFPC6kh6YTuMxK1tMub15QOlmUL+DmAD1XGhJfiNqTnpRsU7d1N6IY
         gWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028788; x=1792633588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVoaE90uxAa4MGE2u5YmtFWHqpvVUok70EqIpA+eTKA=;
        b=v8Ygby4qhD8FmK1NtVsQZ9ShhEtU4KisKyApA01gVDvNkLuqVakUAs3miLwBTyTuJ/
         uj4zbqP9bheKOEaKiQBYncQrS6T8ubiMaVF0tUoFrI7CL80pF7xOGBAn36G9tvykJAqi
         Yo9TXA+mXHZgoZHw5Hi3AqNoe30oRceKKJaibxIt1IRTTnOKCt1NisjSS9wrxUOHRno7
         mucYwMWGUTs0Hcn5QXqxpU584xWUD/Dbk8XHH7/SqyZwQkdB2W1tT58bZuItJM2wYHeD
         xz1bvNesboQwK5l3YLzrnISvuPjWxc+GFI0ginITvFyOtaqeYMGqpEsxV6q4bvRoMoDb
         miOg==
X-Forwarded-Encrypted: i=1; AKwUvByxG5RxNmu8FFYyT4mJhXPdw2SEMg1XyYU+fl1+8Y6zz0Mf3UpEuJ12JaDn6tQVTxMHTjbM9sFWHbJT8binmsEKLg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL64Itno9JAKO+CRd7DwptyXLlOfnf1dnNfuM2vR5He7gl9iNiJ
	fSi0PClbkM4aPJTkCkOeBGgnBJ+H0o5Lq8mnIepGXFwuGbTvO3STAcH0
X-Gm-Gg: AYBFou1wUjoXU5hTzlu9Pq4YiReJH0GvjBnC+8ynm8Zr4/T1RWNupapgWiIDgUhpuSv
	yMfbGL9XYq9pgjNZ4a0YjiIP/33P8Q7h8tEtvUx8Syc62v+XfyCqcFzIsiqePZScUdM4gqEDZWe
	o5YyGkHT0uuuPCVbGPCSpUxit1rPa0Oz8bm0Sqppvn9eFYYwhmDpQjjmFBTbFRBOdQjhGOa7uUF
	W7EzmgvffMUw1l3NQof2sVggfw8gjczLWD71KEq8hX+Ru/qjRfMraUQL5jj26v6X7C4RXRyqcb7
	TL+IB4UlPyWp1Ds4WkHta8hlwaxCnlv0YDH0NziAsCkdK4hyQHdn9D6Fqsqsy8IgCMm5q/dVc1h
	cPY3v2Y1WCdJ0a0ze3BTgxKzcRFtqbgazHi1jG6guyz6orc1yhHmvU3zgG88X4Nhs0yeWCbMNdB
	QBcbx/dbIyqUk+d/+uSeYNyeAsWwzpHzjJ1E+w0p+ekl4x7uQN0fatl5nKk6LCItaC6xvSEfOWA
	6JAfCQkSqAVB1GPgOR7LGuVuCP4n1Y7uy4bBjttGDfNYmdXDUU0ioI7p9cDzslfZP5qWEi0dr9C
	yB6vl8P/kKcSbw==
X-Received: by 2002:a17:903:38c8:b0:2e5:e3da:be04 with SMTP id d9443c01a7336-2e84304792emr134212015ad.59.1792028788486;
        Wed, 14 Oct 2026 18:46:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:27 -0700 (PDT)
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
Subject: [PATCH v2 09/25] ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:08 +0700
Message-ID: <20261015014324.5569-10-phucduc.bui@gmail.com>
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
from atmel_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 92dfa6198623 ("ASoC: atmel-pcm: split into two file")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 374f93fa6e0b..4cedf2ad934d 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -295,6 +295,13 @@ static int atmel_pcm_open(struct snd_soc_component *component,
 	}
 	runtime->private_data = prtd;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
+
  out:
 	return ret;
 }
-- 
2.43.0

