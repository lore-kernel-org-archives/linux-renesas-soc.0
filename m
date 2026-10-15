Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6432F39B5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028776; cv=none; b=TwxOxRM2BKs2F6hVSjwqzSeFodu/ILkB+PxubtwT7VB1wf0mw4rmOpoAGicU7i0Aue7GsaPty0/LTM/jy4vhlFomzg9NYVZzHoVryu30W6Yf5d3dy+elvgHr1CU39ny7kzKWhouxQ5cltxHyg83xgeOJIUdqzfQs8xjQcUzfQdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028776; c=relaxed/simple;
	bh=yyOhgd07c+cxIzNpWT9aCbeZ38F5m8HPqyV963AJgU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJkaEdxuOmVr7tjrZz++Ul00kcLtCya0mvUN8mQ0qkwcHbDhlzH83nhzXlHpFuB1Gp5Jf23In6lbFepr2oe/KrkPe2702+VdvDnrscPAv3bV+doaIYKtOUChQhWL5nVga2GcxEdT+RasjjopfDH0w93tIds/0lJd/JK+G2Tx9KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXGzP7BS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXGzP7BS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e86dce4510so24244435ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028774; x=1792633574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUuyyTReTSIMtXgKEYicRWK2Sg4dljNH29dcQFqlL0M=;
        b=iXGzP7BSbNs94RxPtyeSJ5Gau8VP7nk1AW5pbIRSAasb5Zj7SClkKqkHjGcI2/STmC
         EURBcvHD+b0geswJwaWD2XHthls6gn8g3/2on1/deJTQypOdD9TnULzHXkTTeXpaCTzw
         rZa51H8C7pMxc5QCe+41Rkvw5X7WlRYRWcJAsPmELQa1r5MUvUdBcSjO7iLtE8ODAMyW
         aKN00z62grjsheCKCsP2xWu6OKosVaogqkQ++35rtb7Gs8pjXh0STpJ6x9j+unbGKmkT
         Tc68jtPOc0yg64Lp07L89zrZQBhg+YVvh2Rs0o499Ke5RjTGQFjWy3RrMZAaftT4Splv
         70gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028774; x=1792633574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUuyyTReTSIMtXgKEYicRWK2Sg4dljNH29dcQFqlL0M=;
        b=WNgWl6YGHUYkZToCWmN0Jf4yzx4v2W8NIqOiW4VWl0UE3K7fTHm1foM6fbwHTPq7vk
         T/fB956Os0aXEy7w2VYBMIAhAofo0oKCwObyVW1YgZ+0YZoduafSkuLBycRWbCVIXGPI
         JCsIhe7MUgOzCPDHV+NukHQxUE+a+c+kjy40mNAttURcKtaFaUlrLAE2lhTgh5BT1vvr
         Pa3G0hOr5IweUxhG1sLMX2iTe3HMwk1h97g1GE4fOsvsG+oyOEy4+sKafPIrOtTeOH34
         Pai5uduYc5cQdH2TAb3sV67QefX3UB5tw1/92eV7rXnLMYJluPxK1unIjy6v0T0+ox5w
         7mPA==
X-Forwarded-Encrypted: i=1; AKwUvBzYkdX3WsF63aMtrLF7p/vX7IM5LSH65iZqK8elKH/rI0Y17EruedwQXa95DbnFhTNYPt63tYjFNtcnDye6ol6xIQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/b1w51Krt/5OvuXZNXEa0tcprN0L0dgZ0T+I80apQ28rUDy2P
	LR9SaSFGw0zFz3CR7RdHTqnUqaWM4ZT6kUgE20BPw6mEVQFRrWlaK6Xg
X-Gm-Gg: AYBFou2K7vSGLMufhpQAUpSWooLJZ4OtdVhg5AGBTIiCSUl79mF7ypOA/u77O52IjaS
	ghvmTSfmve1eU7Sp/6Hz2pjGPObFvHA1bDO4OuBG2Z7d/P2xSQB8XmHsj05tnAIywF2l1u05LO4
	TndWb7Nmk0tsnTL/in90HRU4ky93dLW43bIn+Azry1xq3Aub1n5oizoN/ca3fQ8hfx+WEeovu8t
	72xhxsNyk+dOR2br2kwk0fj0HTkecA+ndrkgDRG8pKCR8QUbH4KwurAhXUjK2jiESaEH2VlY1Fi
	V+aKHHO1iqPFb4aaRyQunCR5zRYdGErGHmlwdq7SGsm7Q8FJl4n/VEpS/cR3k00zFf0s6fpQPAi
	Lezx5K/QDpvIOfo1+w5Svs0Gbg+NTK1E0/ojuCucgsvnL15uHMd5z1G8+y7MmxdMmvhO21G3gAR
	QEda/5D42TuF86xwmACsiKO3vnPpH149sOlg8ILiJL2z9HL4SAhue3+Lv4hLkCC0N82gHQR6mvk
	OocdQcZiBWbUR36LJKA6DbSmUnCGAPgMjBj+NCU67A1L3Appx/Xq1YvmiOgR/Edj25QOxALcPqc
	zuBNHaHMOpZmwA==
X-Received: by 2002:a17:902:cec2:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2e842e02a57mr138459075ad.61.1792028774224;
        Wed, 14 Oct 2026 18:46:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:13 -0700 (PDT)
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
Subject: [PATCH v2 08/25] ASoC: apple: mca: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:07 +0700
Message-ID: <20261015014324.5569-9-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from mca_fe_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as mca_fe_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..26022a42a95e 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -516,6 +516,7 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	unsigned int mask, nchannels;
+	int ret;
 
 	if (cl->tdm_slots) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -528,9 +529,18 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
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
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int mca_fe_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
-- 
2.43.0

