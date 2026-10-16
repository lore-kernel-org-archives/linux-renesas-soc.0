Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F25638DC60
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123912; cv=none; b=iDoKbhRTpY0IgoJiqj5FFPlYPUyS4Dv94EeypFUUnxp2WnonvcSCg+AnEnIft2hxP5FwqI4LZZgAzokBc2gTrSOvGbbzMoBmZ9XZX/j2CyR1wCwnb4IoDKgEgpi7vRZH34LlmX4M2fkURD3a7co06DuzGe7rmBophdBXASoZcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123912; c=relaxed/simple;
	bh=4ChQc4DpaiRpFVYZQOX6JdbhBOh/CN3kyOWjnYuDL7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQ8bXvPw7vDexLKzg57EfD60yGyBDrTFdNSaMXfCH0nMOeilGmMeddop8r+x8OAe499p8Hd7bysuIKjwD/085DoFK+fuTLEPlkAaHhk4A1c+nc+RZNa8UiB43UQpd8qGdywGUXKMonIpaX1BOP+2HLITYWxIbG4nYeBAUPoYFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkSLpo0d; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkSLpo0d"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d6e954afbdso13640775ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 21:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123910; x=1792728710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnS3efznOy4aR/sEoOKiH1O7kNcA8JAEG4dTp1VvwAA=;
        b=IkSLpo0dg8gDTpc7uXJgGQtTQah0S3KSH+fTDrP0VvdSOPv0+YZwwd4RTMSreURrhC
         n8cO88xjNHxVLGmzkgxPLWX+k802f9Ayodj0odcf6WlosvVdPCEH6OADiE641kq1jEqA
         ulaSBc6iKoTgqUmkU69ADiAxmjCwjV6TUsFy/v3fRKm2p6XA3dsqQVnZWYHvs9Gv+C0t
         QuGujpf4WlyxeMJQAg8E1oruJZFKUEamICz9VMn1RSoKXTNfpmCaWAHxPZs2PHAW3uBb
         zAW4ABENh5X3SgF6CmKjPaFpQ9HV7OHZwwJicWacrqyxjDOErCjBEHUj7k9KXRR02FrW
         kmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123910; x=1792728710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnS3efznOy4aR/sEoOKiH1O7kNcA8JAEG4dTp1VvwAA=;
        b=PMv28ZAor59/hlfWVRmw1bbMVxMIEZ8wcKFMItbTT4zLlfXfwsMBFLPTHmEqwcnkBW
         HjCsFvI2hF7Ba3I9qUZ0sDoUWoFN42L2Y2uwqokjAh7xKLf2qb4286C5jdJ798D2UG7m
         GBMUvGgLnarNFIu73EqV89PhAbzx9OxSLZYBRxFzA1bVzEfY/syZIEtTjzDnkI39o7ve
         +DL3xuWyBGvlaB7LOCmI6rhdU7d5yV8kLf0HH5Jd9OOV/2/hBTEjtm1kbqb49ls/nL7f
         REKX8hCREHlTz6ai4pZgF5vvLA80EQnyIYNPRtbys2J/zeJP2UkXu+ojujFRXvuXYgGt
         MmHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7miNi8SbR+XZF6t52B4cH58ifqGXZP6t3WA05wC+LmVu3uP8afQs1uPU1+Xi21sfsIJk9ICuOS83kv25jBfXxrw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK4PlWmtxIrRKgZShHbWGx/2yum9krCUIGZCAXLG9xgKN1DEUS4
	gJATosNeoiVC1CbcqnvI5tGkZ6anYZIatVGfYbmOhI6iWnE+WoMcf0cx
X-Gm-Gg: AYBFou0KTfe7RK9C4HhieCqLEdxBpu7Mhi4/vuf22VNWYvXx9umwTBQI9fMUSvpiXe2
	aagMl62K7XsBeeHssvpX14mApJPMf/IrbonfZETe7s3P4gSplyCD9EAmVC0bwnLBXQ4rF7rywbr
	Jb7x8f/geDMnYBnePH3EVO04VOxcdClVrhi7uauH/PZbjleYp2EHgw2l0jVdsj64/S1a1joimFy
	5jS8wUsHPTded0NRkxq60At/dJFDqFuhAMKK/EbHN0gN6aomauyKWlP670FW6tPDtd3mC/li43+
	qBm5byPmU/hmFVl7XvlFK4nsPFF41YHv8bd4oPWrW9U8Lo5IeZZmnLnnjkCfompu1fsupCVNbCZ
	N5zz/LXfzSPrar6Mtzq+ZrCU+m0MNMo/4Ma3VA8tTNQw9kxqoB0CDl5bHOF1/9xdJDk7hx1dZzP
	JfZ6xk6w+8gUrakVHMI7pb3Pz+8/dmMScDNNyRHJlaPEvjSawLPuQkOYoeHR4IW+E3iHrTqPBYY
	hwd8eCWd8MhKCZjmMmtp5dBDc3OOv26Y1tVC8hd8Q5Rk/p6qa0CdL92ImNvCt/f6COyhMHHRH6a
	uQGLe9jDthq19Q==
X-Received: by 2002:a17:903:38c4:b0:2dd:c100:4257 with SMTP id d9443c01a7336-2e842f11875mr181177615ad.59.1792123910214;
        Thu, 15 Oct 2026 21:11:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:49 -0700 (PDT)
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
Subject: [PATCH 08/11] ASoC: renesas: msiof: Remove redundant period constraint
Date: Fri, 16 Oct 2026 11:09:43 +0700
Message-ID: <20261016040946.521195-9-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() is already called by
snd_dmaengine_pcm_open(). Calling it again in msiof_open() is
unnecessary, as the constraint is already applied and the second
call returns 0.

Remove the redundant constraint call.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rcar/msiof.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 9fead9a22cdc..11a6f22ec0ad 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -419,19 +419,13 @@ static int msiof_open(struct snd_soc_component *component,
 		return PTR_ERR(chan);
 
 	ret = snd_dmaengine_pcm_open(substream, chan);
-	if (ret < 0)
-		goto open_err_dma;
-
-	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-
-open_err_dma:
 	if (ret < 0) {
 		dma_release_channel(chan);
 		return ret;
 	}
 
+	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
+
 	return 0;
 }
 
-- 
2.43.0

