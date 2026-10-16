Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971B3815D2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 04:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123887; cv=none; b=a7YdKSaajYd3Q0Xb1dYqH7Rie0HNjZ1hfCJzdgWDbP0SEZP1Rffbsz1uvLaei17CzReGXSgUXkM3CanRQZyXzo+pz3CsugzPIkZie/zFwAjZFDA/8qZz5majp4TbwleE8r0kOQFegKcdDi0Reh7xUiTP5aFdI7CgIIlZ5rfxtUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123887; c=relaxed/simple;
	bh=8jX29D2gDGlcFjhAzB8ItddONnlX6s2Irul3cotnAzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eL8Wh1GUmkPAnRACLCAF32XxJtGZk2bLst+a6qzfIawzMVZSvBoPEgZElDw2er5TEUaVFhr8Zc8I9bhwlU2l6F6MumeUuOlbm6hLTokrY05cyyNbosottw8NfLdjmtrDciJkCZdKbqlQSTAdSxbYBPOUjMV+UQ20ZFqW0X0NcC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J52/XoIy; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J52/XoIy"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e49fbf92aaso35797225ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 21:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123886; x=1792728686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFZz4n9YWSVULVEw1Vk7UW4bxuXJ2XFPuy179wpDhwk=;
        b=J52/XoIyUsku4lGTywabafWXjd6d7yYCdKd1xaJ9iocA+dCoTDCbb7WjF8Aeiljt2z
         xlo1qh2bRSPnY1tURj74frmVpZvzcBD6jLCiEz5/zq40q5lZ+6esFy1LPNuKm/jjhPdo
         K2cza0icSlU+1nVU+6jcOpPgyMVLwX9i/ltW40icm5ctxXV1p1LYgAv6shvsYamMwwHo
         06pTjCR2sVDmoPvukpNojAt9BDlUbqYneQnAYwbKGxmfCyVaZwH0EsBIeI+D+MVd/1QO
         nF2fsHU8VtVDy5/AfohP0taypfgStFwmXg3PXCXzGRZmDgCs13nzUWxJBJAhBRqSvnwo
         xy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123886; x=1792728686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFZz4n9YWSVULVEw1Vk7UW4bxuXJ2XFPuy179wpDhwk=;
        b=ppCeWaoJ3r0XdgP7vGw9ua8nQDupOnVKs1dsXfvPP3tScgioLsJneA8Hm2Ev32lPb6
         ERMrMkdICHWN2f4Q2qgQmyhWX2FSiJNJXcD3UcJjLIfJqUs16LAuexhlcMGJc7u+Bokk
         5rwn88kUqP03GoYvpcDSnFyBuNORYGvN7S9fQBuvvwI10XY/gLobJH42NouKqrbQORq3
         mSqcGOhh8mtzfA7JXDX7YDgyyqpc27HcgALcUam1+osnnMH9jyr6n5JvqNi9KvHL1eH9
         eWbj9W4Rtq3F0ik6SsSiVYouRhd6di4ARZ2pbYdu7n+CUMJaCFJsphN0mHa+S7UlWpqC
         pe8g==
X-Forwarded-Encrypted: i=1; AKwUvBxb4s31+j1jX2AL9sI8daE2K/Trr2XzOSQ5zgUYoPnzoTXryoUw4kia+S4UZ+GIgZRwk7wVXeqqJdIh+KRXlOx8hw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIMcWOMyReYKX+CjBeyC59e9I/bG7mBBN8XQnwj5tYHf1LAWan/
	wC4CsfhsANXQfCod7X0jaR2rFI6QH2eiTsC9MJTOpxr51y9TJ7zsiADC
X-Gm-Gg: AYBFou0hKoDjAIhSomd5cz4WhYfuR8JNNxWuc+ce3RPIxjcykO9CoeZGkqK0DgvXo2d
	RmxOE/7tyDcg5GXqceoiFaqNHFDPmKf5PCpbuHv/fDvuniiij8Smv+c42PNUCjYbuWpJ7Ww9tbL
	N2YzZcssPMEKzGK6/akh3PXhw6TM6JYIeB/61tvcnDuuUjI6GLr5GOJy9zcjA4XfkbiVgt2/w6n
	de7R3x5smF3tClXKbKhZGwZuyAXzlSfuy9WwOpyprgHZXuIx+79aY3eDHMYHXwsckJR2ySs25cS
	M1jsaOWMl/YqCSSnt98HttiWeToztZmQTXKGfv+NEor7bmygCHXl2CEXaQAhTlJ0PQ95Dja8dki
	N/e+mTlls4RQOu5GKNr69PvmoL2/x0EmosPXTH0cFuYvwV2i+GegX0L2RTB/p/tqqQqxwsYWHpW
	Xr0YOg51bgE1gNa2ffkHljae5W7T2JhOqa2YoUo6xPxVGQDHwj0NDHKpISLJdt6U71MdeW2Mmkv
	12kIwdFkSTQN5ifPdceqGuKw9KRSLuyERnhC9nnOLt+Dixh7OMsfKrAyAxRHn/Sbo3k+ER7bZj8
	UnGoQww6Oo0+ng==
X-Received: by 2002:a17:902:ebca:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9401ffb38mr56691775ad.16.1792123885664;
        Thu, 15 Oct 2026 21:11:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:25 -0700 (PDT)
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
Subject: [PATCH 06/11] ASoC: intel: atom: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:41 +0700
Message-ID: <20261016040946.521195-7-phucduc.bui@gmail.com>
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
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index db1fb3b26909..58681e007abf 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,6 +341,11 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

