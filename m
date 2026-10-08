Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC9497B88
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456297; cv=none; b=o9q1Z8I1sEMevjJXf5p/1+r6Rh85+YLmQNWLnaysUX4ya8XZJTfo7YVWddWcGUh4qRoNR+UDGVuCMRL0eW82guhgR/ZuBELmlfvECUU+88yobVqCJKFKVbeQ5oeh5Y2Jg4mDqoP2JajbzBZIZs05BLyTXPDEpvRd/LXll1QbyF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456297; c=relaxed/simple;
	bh=f8CcWoO4sZy/Z9AND7TTLaeemfCybBHCm1tDpN4e8XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cafTZ363D1c5TUKKys11YUwpIEkz9Gh3k2ZEOQvFFU1l3QHsilOfJFbehOxnqx+hjUUp+YLTcwxAe+whuxTfbrlvSo9ScvsOxqU71eXqvr/8v67pVx4x0+9pZbZ1WWVieOUV9mOxNMUU2YNKxg8i/LAAx3I3NuCvROTciYyOuUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkPLdyxP; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkPLdyxP"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so4403791eec.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456295; x=1792061095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuCt8LfoeVxeGP9EXdKyFEToJzhlOF5O+NhVLwPyMgM=;
        b=bkPLdyxPlKZJ6UoQZVrpzQ98CZ7sB44mduLnmgwU8jv+cleFB9rIAh2DKm7QewtvjT
         TbqkKNBCRcjq/SCWvLhZg5MD12rUwnSZjB7Nvv5UzrUoMZ975DekI2TnSR7dzRX6oEyp
         X47/rm5YYfBlfvBStHAUNcjwG+9d/OCBsvHMyLJ7PqGDTUcNVrSeXE4ZOD4Gen+wlkVd
         sZOBg4QgVwY0TaFBmN4Nh4Bf5p2WYa62hDdb9A5AOYCRvRVFu6096AJDDXLOcujFQL1o
         KFO78Ws14X8iDEajdEACNyKOFN23ipiGWY8LvLLw112NTzVb4xmFCIq9X7r6YMd5Q0HW
         uPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456295; x=1792061095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuCt8LfoeVxeGP9EXdKyFEToJzhlOF5O+NhVLwPyMgM=;
        b=vx9rMrMCFaLS/EY6ZADw4W5fJN4vBe+YkDAGnW6EbglfI8ik6pjoc90xnzT9nHxjuh
         A0GVYOi6r9B8S8iF8ng28JegAXPeQmD6Kja15uynsu+L6GW9KN2RUnIyeRRz4Ct9aoA/
         CeL6dDY+fnjOwDrupmiIwcRMo4JdcZwGvdR/+p/Kr9QQPpUyLLnkf4H18FhuuBODd7LZ
         oJ0bsf9V2zt+McIkHBvS9vvBDDILKYCfTP33p3QKn5KgVk12u3omRtsANbKarLSGRn+5
         oNjXItp6kODx3JrU4STHA7rR+/ZYNHpIyeENFUmNqO5GlpeoPfxXoWnwFJxh7S3neiY7
         JUlA==
X-Forwarded-Encrypted: i=1; AKwUvBy/X24IB0BDCP/0qTZMuOOPC65D/nRmB78G1vNTHk4rS63q6g3yL1+sH7pKbUV0TEJiX1rbVodLMPgZfqY/vGbSJg==@vger.kernel.org
X-Gm-Message-State: AFuF++mhYz7ZNNevq+vWoFeCDSxcsXzqMcX7hWklBM+o94qwShQ49rW5
	jExu1ZnEja/HfPCOlk+QBAOSCkFvhP6Oglzll83rw32Mpv233OMLfWpx
X-Gm-Gg: AYBFou1EK+RdbHJiXMoPVF0H+EHOs9LhkaL30aRY7GHKokN9RyvZzsL7KeWYYIJpkFK
	i+BbFbpNhIu4WZjU1k47v0OnkyhLONJHYpLvmtHc85/Ys8YDrByibZ3js+yr/48lrhy+RBwXwFL
	hEfPc+0eLD8Y3XcJ7gaD3o2BrkgbcWPuuxAMVUuyLYxWXhcqvijFcStJ/JRNAlzy8ABaQxPLYgf
	/YB/bHyPHxk8eaKujgI+R0vg99+bgD5CMCyl43LWDE8sXXXIsBoI/aqt7BvRwzN9asDWmTMt9PB
	o+Qm5ig2nOt5y07m7Lr4n+VbavJ0lOgoYAyXiCpA0Z5CFgWqHPUT+jW8qYKs/NwBxdQEKK59HQO
	mrNvhB/DUME+cW+4d75CpuV5VDm3cDxVU0RXZEM2PQ+4tgAJVQsR/kQRpM2YZx0tzEQff46zjXj
	V5QlpRZbaoBKN9RtghzBiSP7l9fUEq9Ol0MkOU4ywoHKpQVhU2yj3F6IxPd0oFlw/idwgSsAp1N
	IF81+6DIgZu7V34urCee64Ggx/CDu2d/8FtpsibIyg12kjaRzP+RwmL10kRjHgWA6oJmfITy5Td
	WTOW5qT/GGh93g==
X-Received: by 2002:a05:693c:88c6:10b0:328:3944:ee53 with SMTP id 5a478bee46e88-3515da28859mr6112721eec.2.1791456295330;
        Thu, 08 Oct 2026 03:44:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:54 -0700 (PDT)
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
Subject: [PATCH 23/24] ASoC: rockchip: rk3399_gru_sound: Mark the link as started on success
Date: Thu,  8 Oct 2026 17:38:30 +0700
Message-ID: <20261008103831.542533-24-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from rockchip_sound_startup(). ASoC only marks the DAI link as started
when .startup() returns 0.

This currently has no functional impact, as there is no .shutdown()
callback in the relevant snd_soc_ops. Still, return 0 explicitly on
success to match what ASoC expects and ensure the DAI link is correctly
marked as started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 04e7bed8275d..0ec80a4b8c59 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -258,10 +258,15 @@ static int rockchip_sound_dmic_hw_params(struct snd_pcm_substream *substream,
 static int rockchip_sound_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	int ret;
 
 	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
-			8000, 96000);
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+					   8000, 96000);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static const struct snd_soc_ops rockchip_sound_max98357a_ops = {
-- 
2.43.0

