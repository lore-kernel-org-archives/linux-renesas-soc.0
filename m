Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E323BB133
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455982; cv=none; b=ldevyXnkcjRLoGnROORqXzz2N1a678Q/HsGXloHmmsQm1n7uJnAX6zS9xanmXeUpYrVCG9qEU1uCYlV70Ar7l5ED3UJU/i1lrRx9+3fWtmrLj0BW+RC1Nz1hN7+VbywVniKruxMnF7hJPopRWdFr21dcqnvBAIA+IxYk7QXVYpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455982; c=relaxed/simple;
	bh=M5phZ5RgYLMwqgmoz0IyXZlTFh80R5DGK+A0fLhzSx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HEaZyORRwBKAAZZpyeBiXlNA3OUyxMOpNgsVp/SsuTXOs5ANL+o2UHCQIe30LVnLZ4IFH8Ecsr0o7vrzS3m5nMvJKtU8patstu+2RQtCuXnlxsyhLCwRlxQQw7SqPkdmFMDY6HlcYy72ueTT0lVfCNxgO0sFVXMim8iAJxYWXxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM/AVxvS; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM/AVxvS"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34ceab2900eso4961869eec.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455980; x=1792060780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX2YDjC9CYpjnGWLfkYsSXKBPsqSscsCNhhIkMB+OUM=;
        b=XM/AVxvSDQDhf85VF6krxYFPdCIdAwcx1mBTtPbZoSm3aIlP+IRkjbVaenMQ5Aszcr
         cKTirgjda/xwdFZJzFFE8nZzuyu1awQd0LhNz5Lg3R4FW9zxk1GIz7JYYGU5ik25sB3l
         xdly/6K4DRmqqr7xWpUFbYRuNlCmMyZtkDwbSk+AGuvycC7neFrSCao7ZgkZIxj52e+b
         b/mAE6rNr6Wa94iHDz2NBQ/+QLN6mhyUAYBt4Fabz1n5CbKap686hxRS+l41RseudeVY
         eGYtmUm9XWxK8dqJF5QA2WIQn3y7KmIm0b6M7B++cv0OFyNeyBQxUfdGzPQVIP8pOW8z
         sWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455980; x=1792060780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yX2YDjC9CYpjnGWLfkYsSXKBPsqSscsCNhhIkMB+OUM=;
        b=WpxjmIC+uptDNCR9wT65MGTdk9uTqgLvxlDqtyT6LzGBh69bJ199RLR3YTxiDogmv2
         PIsrVRZyYEE37IJ7P/7UhDfC6KfptCFACC0hF4JQwW3pNpx8/lDQfP+C2X2nS3VPuGE8
         h4epDwLZsKZX8WdzKx4jeRLxwFCW+/la3j1XHvBJG2+Z4H8KUjSORXyyX+tfvS8CB3mq
         rjZsBUMyMHUt8dXSFFau8eFpNuARYhFWsjX0dEo+ysn6jpxhWSr8+XegNsJo7CDDlZ/1
         gANoG4nNenI5rkJtYE6Js5Ph4fO+N5T/Ddx8dPARLcX4qA3dMBhvM3UYiFVZgFquXPLW
         OwwA==
X-Forwarded-Encrypted: i=1; AKwUvBwv964N5ytJz5AtdKDyaBourldG+P2V5LBBcs1rhbokumTZoeJHstAr8QFw9UyQ/WKYIeSxmi+AMiHak7Cwk+7gGQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJgh4AgxdluI4ArfgTeZVgjbrG1kFdAdIv2zgTyBsbhbqLFkuJD
	Dy61gMdNzfE+gAyEUydRjxBLDbxXF4jthT7XeRNNbm+DYeuafa/gCZKj
X-Gm-Gg: AYBFou3s87pzD/1qYoRFv6VcaVUCPrFQcC9zGGUFQ9UBdorU6lMDjkUfNR6VRhcYjxC
	aAuVAS1Fph9ty/aEGeEeCdGF3YpgeUxjwghcyCpiOMIxzSVxzhJh1V9pZb78pNpdcVgrgFtloEH
	N4GOGXfwDLY7Hosn3uGX63GT3d8dsSsIfeUBfJBhRDdEc54faH4OTReFX6ieibQ1ORP2Az7inqR
	A07koRMckxFFcD4l1gYqJKS2KxJCCpq8IGKlZoishLzSNLuN/kgfNpaFzIcmtZ9f18emaTv37nv
	ZedHydWcTgtGN3JIHaBgjmGs7w3KCE/PT6yvkHQ++3LV57wjwGzw4AzvSHvu83fjY2yzS0Ilstm
	Klm3yTEXmZ9U0s6d9RbLbAmFHn5KuHl3ZV38UnuyC0nNy14LusHsBaWJGVGwK0SAZJyk5HHXfUD
	Ebnxt4yNVQckWCQcEZVsWVP/5/CS5ggi/tgB1Nwk2xb2fa9UymJA71oQaAlRldPiT7GcYGCDc2y
	8N1q0BJkfIpaRsfU/hThLjI+5diJqFKlq1RKfh1D1tfplipfVPSTzMYJAvdzPk6nIWp/CbmqG8O
	5JE83qDrHV+WGF7S/kEZDHk0
X-Received: by 2002:a05:7301:1e84:b0:350:89a8:5598 with SMTP id 5a478bee46e88-3515ddb2b12mr7231654eec.9.1791455977867;
        Thu, 08 Oct 2026 03:39:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:37 -0700 (PDT)
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
Subject: [PATCH 02/24] ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:09 +0700
Message-ID: <20261008103831.542533-3-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp63_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 5137305662ef ("ASoC: amd: add acp6.2 pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 04c014349347..28e0686e9373 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,7 +211,7 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp63_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

