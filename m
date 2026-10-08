Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA0C497399
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456282; cv=none; b=u4AwcwdvarvTTuqrRw0c2RplLK3/Tpplw05SSh4MoFugNxw0hWLyF9oxEXtAa03PRVX9rkC8IkEaN/7himEzQwPsuMqUCf5/NP5P2FfC9jtcpCBX5MGVQcut9a39X9J366bUj81E2vETUWI+AzbAVHyrQfkygALz4RfHqMDkeKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456282; c=relaxed/simple;
	bh=/jRAX7L3FDhAWoeg1edR/HgTCfkk5hY6WPOCZODpekU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wh1vss5ADdxY4qm6xk3OJl/zvbLKoGBy9ygxhHN4PtxRv3FGtNTrk6Gw2v4eUrpA+mgBwwYW77Al8EcLpXKkSu3x/SvZK+TmP0zUN+GDti4TNepJj0ch+H+V+Lt+FGMnG9tB4ZGhUFpWF4utYzj1LUvWf2/fUu4iSaeUCd7SAYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO1v4tJa; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO1v4tJa"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so800566eec.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456281; x=1792061081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vINDjRMMYaX6AakE2nE7lJ054HdL6sHwsDn4uy023fE=;
        b=AO1v4tJaxwkzdM4IZ+7TWZ+XfabdxVVMjNxPIULvWcvJeWzdu4AKdB/i4Iro11vLBH
         GqByD8c8i1ykuXKES+sTiN765mu52lHluAhUdoxA0Od8//Z1YN1hI2vx5FWlQ43HfV2U
         JMlrmUPpU5nWPKwLOywL4g+TfCyETj7PWKjJx+hY1uNZtjljRNt9obWImP0/WZfx1AmJ
         AMp6ezrX1JXvPfVPLVMlY6W1ULiEN5BzeXPfMkKZnhoAEcp1uVBSqoy9OhsrrA8h2KCI
         xjTwbxjRFt6uXNE6F1zvnie0+1z34sXkpf2DgUCW2EodPje8Odbo8vIAEg368bcPXmrf
         6H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456281; x=1792061081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vINDjRMMYaX6AakE2nE7lJ054HdL6sHwsDn4uy023fE=;
        b=mU66eAULi+0DL055zEQyBEdvqAyz7kiraDKitWKERZTqxhvA7NVSRofQacAS43/nK8
         FS2FLejKYM6R8Ha2hnXtzZa/MV104g8m/mu0pa+pjK2aO7Y1XF3D66PDt2KlqRRwKdgR
         vRfYb3myRPn47urOtGqvNexWioeaDVPHoLgoBLpT3ik+4JBS1jXRy+esI9j2mb5ooq3u
         kalfiqZ4G//X0iXfRKm27eA36en6KN46ynj9QqmmdesmqqvwJoQOp37LasrP0JuwRb+Y
         c055lf4R5ZvWlMmq9PzmZYYXVXjoMgHfjVh2tH2rapaBK4keGiUoTg/+6u8yWZpzegrF
         8fcw==
X-Forwarded-Encrypted: i=1; AKwUvBzs8t0DJH8vTVQgclL6/cikYenYlyz5XwMfsmTVlCpKwaFw9SJPobikwmgdgW1CS7+4YJqnJ7r4RTXRzi5ZRMHh2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIzo22pzco6ousahSNEUN0wqkCsbRRCqUo0cHdV4dbWoEXRhCIv
	Gu5ncuUf8i0pDPy/k/unzeDS/h8oTfVvUuHnc+kqXV3ysPpTHo/f0Fx0
X-Gm-Gg: AYBFou31gVrtrSRjJH9z3CzUjk+3G/rpZCD0IwjzLSkTWVGaLBTDz6EnAwsGu+044wK
	reuxU7ILxR+lfx8WNe7wh2dBexihPMhuQIzUHi3EqHjX1BCswfwHXVErECRSuc70/Hyi8fd3lKi
	BHHRVsjImA3g8iBUrUG6mT074h+kk2axqcCN8xpVpZoI2cqAVjqEpZncNQWzS9fuASAgM9V9A6/
	L0gKiC+JzR6WqQHg60gsPFRBjKxh4zQ3ubfW2/CZaJC2tbA+56eLBYaGp9Lrwp9ZOSqLNPUYLR2
	UHdtUt3xkfFToME0qw8fW9/II/PguFQiGRxpPNtndQYjdW+COm+/+3g7aqBXW4HSzW82Jfh2EUq
	onoDq45IT5+QsQxkUlAwiGyQPMxMP92zzNCfFm0ax3qfA6SNzXflfwWoy0i3O1VZjnSGFPMDw9e
	uRRCLQ7v17bXULyPxrBb8IPFvfQhP8bjG1VGMFjglIIuuyHRk5H3317jJtNh3PIgStRSbNsOmgV
	QbXCVwfIYG1nlcH57O9NcxRsrYIjHXXsTVV77K/NVKnTV48RQAlxsb+QkFc5t51ARdhFi0PJJyd
	MyGQPKIUiUaZ2CcGq2BZktSe
X-Received: by 2002:a05:693c:8801:10b0:34d:861c:99b8 with SMTP id 5a478bee46e88-3515de37354mr6607922eec.21.1791456280856;
        Thu, 08 Oct 2026 03:44:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:40 -0700 (PDT)
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
Subject: [PATCH 22/24] ASoC: renesas: rz-ssi: Ensure the component is marked as opened on success
Date: Thu,  8 Oct 2026 17:38:29 +0700
Message-ID: <20261008103831.542533-23-phucduc.bui@gmail.com>
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
from rz_ssi_pcm_open_xx(). ASoC only marks the component as opened when
.open() returns 0.

This currently has no functional impact, as the component driver has no
.close() callback. Still, return 0 explicitly on success to match what
ASoC expects and ensure the component is correctly marked as opened.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index b1587f499cb8..2e297f721bb6 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -937,17 +937,29 @@ static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
+	int ret;
+
 	snd_soc_set_runtime_hwparams(substream, &rz_ssi_pcm_hardware);
 
-	return snd_pcm_hw_constraint_integer(substream->runtime,
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
-	return snd_pcm_hw_constraint_integer(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_PERIODS);
+	int ret;
+
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
-- 
2.43.0

