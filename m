Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7A6492E2D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455947; cv=none; b=aRL98CNykmGi+FEbf3sYQdw1yHh1muFjEgPF+CihBfGc52YS59FMgwqGBmaHqtmDLpSecEK8lR8E5UCdJtklOYtTtNYKA4WOY+tQabijgVxqj7yc8u4Ds4kqKjjreC3IvBtQnmOxB8k3uSVC5D7bQnWDBFhKNbOqvbR4GTFP5fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455947; c=relaxed/simple;
	bh=dtrga2aJHDAstvyuSs6qpZWc6QvyFtEPlzZuunhkMfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BmtNtADdxpJItp0s0hebHXQ2lFBIrmLl/C2S7NcTj9Cz2S0zlLZRToMQfnIqUT+U44eMpHZjKRZfGAjT0UPwW8M9b0E/oGKdV21PwJLkSIsfj1fdPw2BtqLmNqCVEqgCZb+NqbnXL/DTgU9YnEo2hlKyBp7szfiUD8Rt88wPbUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKR3vity; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKR3vity"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1898611eec.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455945; x=1792060745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hpUwEsGMPkIBbYBiNYjLbx5Pg/A2Eh/bQSXX+ThuQY=;
        b=UKR3vityW9LcYhaDzuyltK7K673JMJH29PrQtl4pSHImeqxzg98R9e+a6IE3jwXC/L
         uLgY9+tc3HPDtYPWPgPnkWTC5UQTQyMjpeaU81dptSeICkm7CNpE03A96I9+xT0f5icw
         RVE5Wv2hltHRuUTi0yxHhXdRJMCdmvcU/hoo1s4Fqcdk1WbrGmFtpo4hGTBAsQSdZNER
         hFJuOd1bVqpvXw01J5hrvZ9F2v06YSqfW1TA7NQlNPJnGRyIJIsGw5Rt6HHoRHBjWWul
         x/JNgmSPhv8u217ZewsUS7obnctiW2Sgk1y1E3gFI9Y7mskl9NXGHmI/W9qtBA9UpNMO
         PzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455945; x=1792060745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hpUwEsGMPkIBbYBiNYjLbx5Pg/A2Eh/bQSXX+ThuQY=;
        b=wFOI5Rnfm6wI56KvQUVfaJCj8CEpbFj1LoF3w9gffeYW94Op7REVm71Qer3YDdXBck
         +Ttk+iJNQSFa8DasazcZSv65rQh41ZJbYcNPQFRyju8D8rzHDLlAsqaqgyx4J5+J07uB
         z5ggcQSSJvMJcx+OX3j8vgSBInv3hzl5/kyubiHr/H1+wOXKV/GIRy8qVJyLnIflRP/u
         ToQMCIrlhDdgQq4+YFY0aKSjaTfjUMDB+r0zasFzj5s+KDWrHnCv/QtwtrpW+m2pxSXL
         NYRNcuY+bXtXDnHJntjqHQXFIqUN37s4y8K/eQHeWfBKhDMCmB+X9F6LYKNC29rQDyd9
         RVnA==
X-Forwarded-Encrypted: i=1; AKwUvBy52XcE0aG+x9iNPEdvUZlT6EZ4qk6/5FKZ/GtGS18RA+d7vLuzB707gVIILd4NHsG8aeEWqZDElQm16gUF436qAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lYi3olgVs+2h/bNHYAkedqbnGN+tFgOJYce9hBMt6+sv+A8n9P
	yRR8NNUg1JEv6F+iJKNJxWSFTR8l/m8DS+1A0GY3z+RQiWdCh/VROyU2
X-Gm-Gg: AYBFou0E44WCUFwTaEqKmo5CfT1Le7F8J+rl/8dS+yQ+O/O/ffHjEslpCs5oy4xURXf
	KQyRdMWi0kcEkA0ETxW5De0XGoWYVB15C4a1q6EZyPRbEjZtHC6KAeTpkSyCICM20H/JomfwdYJ
	Vowe6CvSuEjz7V1EQ046m4lXyh1JyiRCFwXgJ/rTcVwSWS74zAZ1mc7pIOFJEUvtmlPjoaVhRqh
	+kCJPycA8DMpxWwaV4khRk592m3d68DEJcEqJq1UEv7OoP2AtnbcDGu8tcBRCF6azE5obsS08Ww
	EhuRaoGdyRFPmrG5qZv+Z+kyGQczub2uNOjg2AdAwj3HQukn0vBSvyoCakUcqEQxfTBWj4U0PVG
	TjrYpJEzirbwHL98pl0/PY1ptAX/lwxsKzItwb/PiZBGPPVGR+imtGKnbrgKn3EumE793pEayB6
	KlpUdBFIKZzB9je8L7EGwUpFkLksFgmyWRpWqrwRtO/DB1uycRa99ZPeL9apmfCrqT3A3eg+gLZ
	X7326jHC0N5WvJYOd1sQUuA7J5WlKma4jBsd/CZIE1eJ9V4TISrFTTVe0D62jO7RfD/BlDnYmT1
	UCX9zZ4COQE2CQ==
X-Received: by 2002:a05:693c:8819:10b0:352:2e15:49a9 with SMTP id 5a478bee46e88-3522e154b4amr965099eec.33.1791455944704;
        Thu, 08 Oct 2026 03:39:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:03 -0700 (PDT)
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
Subject: [PATCH 00/24] ASoC: Fix constraint return value handling
Date: Thu,  8 Oct 2026 17:38:07 +0700
Message-ID: <20261008103831.542533-1-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_minmax() and snd_pcm_hw_constraint_integer()
may return positive values on success. However, ASoC only marks the
DAI, link, or component as started or opened when the corresponding
callback returns 0.

This series fixes affected ASoC drivers to return 0 on success and
properly handle rollback paths.

Found by manual code inspection.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (24):
  ASoC: amd: acp: Fix .close() being skipped on rollback
  ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
  ASoC: amd: ps: Fix acp63_sdw_dma_close() being skipped on rollback
  ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
  ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
  ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
  ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
  ASoC: apple: mca: Ensure the DAI is marked as started on success
  ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on
    rollback
  ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8325: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8540: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
  ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
  ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
  ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on
    rollback
  ASoC: intel: atom: Fix .shutdown() being skipped on rollback
  ASoC: renesas: fsi: Ensure the component is marked as opened on
    success
  ASoC: renesas: msiof: Fix msiof_close() being skipped on rollback
  ASoC: renesas: rz-ssi: Ensure the component is marked as opened on
    success
  ASoC: rockchip: rk3399_gru_sound: Mark the link as started on success
  ASoC: rockchip: rockchip_max98090: Mark the link as started on success

 sound/soc/amd/acp/acp-platform.c             |  2 +-
 sound/soc/amd/ps/ps-pdm-dma.c                |  2 +-
 sound/soc/amd/ps/ps-sdw-dma.c                |  2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c          |  2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c         |  2 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c        |  2 +-
 sound/soc/amd/yc/acp6x-pdm-dma.c             |  2 +-
 sound/soc/apple/mca.c                        | 11 ++++++++---
 sound/soc/atmel/atmel-pcm-pdc.c              |  2 ++
 sound/soc/codecs/cs42l42.c                   | 11 ++++++++---
 sound/soc/codecs/nau8325.c                   | 11 ++++++++---
 sound/soc/codecs/nau8540.c                   | 11 ++++++++---
 sound/soc/codecs/nau8821.c                   | 11 ++++++++---
 sound/soc/codecs/nau8824.c                   | 11 ++++++++---
 sound/soc/codecs/nau8825.c                   | 11 ++++++++---
 sound/soc/codecs/wm8580.c                    | 10 ++++++++--
 sound/soc/codecs/wm8782.c                    |  7 ++++++-
 sound/soc/fsl/imx-pcm-rpmsg.c                |  2 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  2 +-
 sound/soc/renesas/fsi.c                      |  6 ++++--
 sound/soc/renesas/rcar/msiof.c               |  6 ++++--
 sound/soc/renesas/rz-ssi.c                   | 18 +++++++++++++++---
 sound/soc/rockchip/rk3399_gru_sound.c        |  9 +++++++--
 sound/soc/rockchip/rockchip_max98090.c       | 10 ++++++++--
 24 files changed, 119 insertions(+), 44 deletions(-)

-- 
2.43.0

