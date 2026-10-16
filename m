Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAAC31DDBB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 04:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123811; cv=none; b=G5lFE0FdPbR/y5GGyErdrK6KaugwL/ocGQTQQvDMUaUw/nZQtNGZdcoC7YbajvCcoOxLb/rOZnueTvUFWiuZTdyYSnTkOh5GG526+AUsQWswV8BbNMdFR18vnhC24eerK+sP4tYbQ9fYVE5Nm6RQDQKIJUEJG1PJ5J8d7RE3SIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123811; c=relaxed/simple;
	bh=r3T6KsS5uqRgrtiSAYChS0Ck5zpfD1Or1gG0Bl9B9YY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KFwI2WVFR+UZi+gTLeTUe4coNp0uDWdrZCCM1AG15C/TrU0GkaAKTjpzZATypHp9AxCxedXf1PNHyY05SBXreUTsyjmywXqEjY9tz3pEtHCg+4ECxMB9fuxthu6z/qR4suELqITGvxZ6MzfWq1fkzc/OWzy+yLHDJbwfyXsdn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sml8tb8l; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sml8tb8l"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e934449bb0so21407755ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 21:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123809; x=1792728609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYnQxKBL88L7bG0SnRsZyN/ibAKxj/QjIVLFKTNculY=;
        b=Sml8tb8lzGkYEv2SUFTYh/0FtPwal/k4AqOSIHw1TYsCbQoZLCy6mRi4NJkNpjolMb
         731BAmGhHCQNLTHbKhIMiZ0488FHeivNbrPnn2oFjvIFG1JbT27V2XzWLku2vyRT8niB
         t42PLXzDNaqthmzSI8lEw+SAl3WdI421P5YyRiieI/2WWCzVl7BuWhl4+uwyq6zoXc4s
         4ulku9fCuRHFZmfpjQlSq3f/AMmLzIP76QemZzYr/Pvz88tmYxZ9ymg7uOxk0pny88BL
         51twx1ftCSo6w5znalpNa8Tf/QJyEVO980gAb4HGicVauxzXRXpRDkTQwb4seR+CYPIt
         SD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123809; x=1792728609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYnQxKBL88L7bG0SnRsZyN/ibAKxj/QjIVLFKTNculY=;
        b=zFoxPilvt4a440Lcch+Lo3UZ1HI87/F+zYBh8YIytOy9gNwHjqm73imj9uyM1yVBSR
         d4wkvRB9uEYs+v8VcJv/OtkYZFHM3TfxZ/NTBMR3nuG6HnV70pDFjaB0zLy78eMEwXJp
         3dP5WSNmCxwVRyCdzmPFgnpsBv6biWbBvef2mFKVPQW6g4ub6wCfa7K+eh9LnCvd+qnJ
         KsJQUWOadJyDtGHFFtyNMMGj1qU7hKoos5QMn2QAabpTkwSNkQE2zuiMn+x6Mn++EUzA
         XrhbVU3jARgGCdg8CclfgZ8Jyeryv64chLVQ0CYTC7fvvjSHYzVcLzTGzNZBTp/isAAP
         L9hw==
X-Forwarded-Encrypted: i=1; AKwUvByPMIZLxgMsDWCLBkagsd997B+h6u0qa7nLvxup6HhmvzQIgCJ9Qicc1p6L781DIJqlpKEeseYK0JaFmBBbI/IYWg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhFvm/coJ1fkR3zqpq3175P/8nXqjo4nyYxAvhlX5C52F46QzM
	XXApAquhzDO6wrSgxMu787LgCEOnS0/hIBQYbS3zVK5H4sDMrthqeb/Y
X-Gm-Gg: AYBFou1W5pmH6tKW6U1JgpKv/WmvV76QaYkcuAS3b/i7nvoh0d1/Hj7EWffPt6/Qgtc
	jpoX7tgM0AVvoKYIa2HIMm/MQKbc2XVfimj3xyeAXPXpkda8k1wJZyjYEvaLNKa8in0gdIOo4/W
	z5Hq27XcIANfOHZKSCI4QIlcS35z/mHPJiW0jk6gaemps4QvQwE0HqPf67Otd4p8F70mdZId4sF
	RtLqDmLFLTepchwTBn0oAT+AjAo12oFmiyqG3tclJtRFCM09qJiwUhzSikC/wm53miHTFnHKXfj
	ztR7Zcc2Y8FLNJKgfEZMSTBNsSQd7QkKXAjBqEZuXIkllz0KtC6J8Ryw8+NjHxgOWvs/t81TRpr
	G1rT+j1l9cOg4Iu7R0aq2goDXgeMf1nsDAaEGsJ1w8RnGQUQCcxKcEwGJfPmTezqgOpTZy0fDFc
	2qnE6V0oChM+ACqr5L5r8GDHAb1Pub3SqRh/XiuesALWCks9IKVpEmTd2Kim5EMo4xNCGYe7FG7
	AXjRevIjodPX7vcGfmMRZQJIYmEGW463uEbvmhwuUNpCzvkNQ0Kugj+37cCCRiksKiO8gskuppr
	C1rkQ4JBRUlPNw==
X-Received: by 2002:a17:902:cec2:b0:2db:7941:9e11 with SMTP id d9443c01a7336-2e842cd431cmr197979565ad.9.1792123809100;
        Thu, 15 Oct 2026 21:10:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:08 -0700 (PDT)
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
Subject: [PATCH 00/11] ASoC: Address remaining PCM constraint issues
Date: Fri, 16 Oct 2026 11:09:35 +0700
Message-ID: <20261016040946.521195-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

Since v1 has already been applied, this series provides incremental 
changes to address the remaining items from v2:
 - Add comments explaining why .open() and .startup() must return 0 
   on success to prevent the issue from being reintroduced.
 - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu, 
   and Acked-by tags from Morimoto-san and Cezary.
 - Remove redundant integer constraints already applied 
   by snd_dmaengine_pcm_open().

Link v1: 
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/
Link v2: 
https://lore.kernel.org/all/20261015014324.5569-1-phucduc.bui@gmail.com/

Compile-tested only.

Best regards,
Phuc

bui duc phuc (11):
  ASoC: amd: Explain component open return value handling
  ASoC: apple: Explain DAI startup return value handling
  ASoC: atmel: Explain component open return value handling
  ASoC: codecs: Explain DAI startup return value handling
  ASoC: imx-pcm-rpmsg: Explain component open return value handling
  ASoC: intel: atom: Explain DAI startup return value handling
  ASoC: renesas: msiof: Explain component open return value handling
  ASoC: renesas: msiof: Remove redundant period constraint
  ASoC: renesas: rz-ssi: Explain component open return value handling
  ASoC: renesas: rz-ssi: Remove redundant component open callback
  ASoC: rockchip: Explain DAI link startup return value handling

 sound/soc/amd/acp/acp-platform.c             |  5 +++++
 sound/soc/amd/ps/ps-pdm-dma.c                |  6 ++++++
 sound/soc/amd/ps/ps-sdw-dma.c                |  6 ++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c          |  6 ++++++
 sound/soc/amd/renoir/acp3x-pdm-dma.c         |  6 ++++++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c        |  6 ++++++
 sound/soc/amd/yc/acp6x-pdm-dma.c             |  6 ++++++
 sound/soc/apple/mca.c                        |  5 +++++
 sound/soc/atmel/atmel-pcm-pdc.c              |  5 +++++
 sound/soc/codecs/cs42l42.c                   |  5 +++++
 sound/soc/codecs/nau8325.c                   |  5 +++++
 sound/soc/codecs/nau8540.c                   |  5 +++++
 sound/soc/codecs/nau8821.c                   |  5 +++++
 sound/soc/codecs/nau8824.c                   |  5 +++++
 sound/soc/codecs/nau8825.c                   |  5 +++++
 sound/soc/codecs/wm8580.c                    |  5 +++++
 sound/soc/codecs/wm8782.c                    |  5 +++++
 sound/soc/fsl/imx-pcm-rpmsg.c                |  6 ++++++
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  5 +++++
 sound/soc/renesas/fsi.c                      |  5 +++++
 sound/soc/renesas/rcar/msiof.c               | 10 ++--------
 sound/soc/renesas/rz-ssi.c                   | 19 +++++--------------
 sound/soc/rockchip/rk3399_gru_sound.c        |  5 +++++
 sound/soc/rockchip/rockchip_max98090.c       |  5 +++++
 24 files changed, 124 insertions(+), 22 deletions(-)

-- 
2.43.0

