Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348C3AC0DD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 06:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528659; cv=none; b=ucUAFu8SOEn9dlkH/jm4hHNlRwkGLN5HDQaK+VO6A0fFBsOvCmVLUIoJU4Spuv9UGa4uVMq2PEYjwVhYX6M2QKYjtvFxAV83HbeOBh0WJzlAGAFtPNMF+sjr+Q9jrF+tsB1B08h+JQ6RIzC1Xa1S+kM+v9b8uvsoftkeOG+4ySU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528659; c=relaxed/simple;
	bh=4tB+67YMPAYA+Fp7hKThmFDs4EE5gnppfw4oTodipEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JQoekNuQeF37EOZXobm+1hogXAonCqTUxVW8Eg6UlKkfIOLh6sBM3ANEYOVd2Yg+0pVcqgJdRvimbjycPyh3b45mRb/ZgJCte/SJIO3dcIN/a9dR95ZOomiA3ioTSKmG12dXze3MRQ7XAQeeoBNvW+oeekSXaafXVlo0/e8BoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ue52SB7T; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ue52SB7T"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso5787435e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Jul 2026 23:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528649; x=1785133449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/H3laF11WeRlQ2NHJchQO+2MbI7YG6ixP9fYh5lWUc=;
        b=Ue52SB7TxbO3W61zGzWLAcMt9V27YiogvQ0Pr73/T6azM1EZ91RhgAgnkIqxRwdqo3
         CEpqFFJTjU/8D7UFmNY2M4m2D2MhM7wCvMjxDYAdobrDXKCMBvrbcth/B5plSJdQO7B4
         4Uk7yhKOUlAjXV0Be8mCZLFMEyUpLubiOxv7iu+Pjdl7pDndARLjpdhz4Nu0nsrsKoml
         6seMvQAf8YE+TPbULhb7Jgi1XRFil/t6cxTeK6ezjEBvcrsmeWalccCQMegeOXDXWCgD
         bJ/fZp62+p6MFwjPWqH9C+ilJoQuwlHJwo2FMoaSCO1HjK51wEFAq7jFWUUTAYGdKFnu
         8v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528649; x=1785133449;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G/H3laF11WeRlQ2NHJchQO+2MbI7YG6ixP9fYh5lWUc=;
        b=ZdpdL9o8GXAPEVj8jdiT+SGYq0xCqu5/3Fu9NE0ip9+nB8fsyM6IDLp7wAABsFguqt
         AMFul0dXYG2ElVB0aqomSSl1/RbZbG0gpY1oTUfWemGEtavEU0UEW6cpJ1yKUT1qyGBW
         rQZX78G4gJhSmQtHo9vrb+DVCRkemzeYywTfF5D9QYu4BXeBoHkcDQNkSUw7MrXlZPw1
         SFQoylFFOQug1R5qgRukPbRMh0v5afYi+Ou14YPkwLBc83l2S/i8/EUP7dJHwnIslpBn
         8LdaqM4XU3foluKniXBpBAvELY7EXeM0rdIrfokDQBm0d9ekqRhE54y7YEBbitOROpMR
         ZfPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqBtkSeQH0ePEl2tmeA593DgcdLah2u6mQSCdHXZalF1e0JgyJBxWFypKiFh78YiCg/qtGcCtIYPhMmUPC0DB2ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWdQGRZqAavb/RDUQ57VS3awoUzJcbexHqaKfJu/qqN2OiirKz
	16KhKv00CblZXMXLsjbrwRGkx3OweZm+9jzM4ahV8M2KoIfYXaFK+Xn86Qh1duzQjN4=
X-Gm-Gg: AfdE7clZ5Fai7OMS9PCKD5rUJF9GgKtXizFyguCEt+IsbVOJcrmZJOsu944G8ZHg9GA
	6KuTvb6fFTJpMizIJ3gYvV/QGbvOpxB41JnhvfTEERjSZYX0rQAa6Xi6hWTEurNNXVqttinw2Io
	rgPRbXxwPKp0G3QQBDPcQ8FH1livX0/KdfRnTKuPuVEI0s62pZ42w0dF/bhhTLDAN0r1zxVOKh4
	hc3Tu7Tx0dcGua1sQxf56JJxuxBwzNLwyGdmJA4Qw/cdU4O88CpD5c678eG/V7RCyUPwkL7MmXC
	u4hUpO73bkRZ4/ilkmZH3ugqF+wJKnYxn9em1WhfA2iwPM++7uod7cHtmj4Zwc5uU6TlON2xmjT
	a4Bz/Y7Q1fCLJmT1HkYUuzDgDoU03KjZvrPavsEBsNa3YfiqebHo5JRXagO3WVsMrBkK2XAjSvc
	Avslv8heC5J51QpoAH0Cb428SRsKmF
X-Received: by 2002:a05:600c:6a08:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-4954a404528mr88685635e9.20.1784528648411;
        Sun, 19 Jul 2026 23:24:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2e83ddsm243760905e9.10.2026.07.19.23.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Aaron Ma <aaron.ma@canonical.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hasun Park <hasunpark@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Mac Chiang <mac.chiang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	patches@opensource.cirrus.com,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev
Subject: [PATCH v2 0/6] ASoC: Use named initializers for platform_device_id arrays
Date: Mon, 20 Jul 2026 08:23:44 +0200
Message-ID: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3614; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4tB+67YMPAYA+Fp7hKThmFDs4EE5gnppfw4oTodipEM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXb7wZqEDAgS99aNcA7ppupT1jNl9C2tgs/w94 zfkKA6R2EeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal2+8AAKCRCPgPtYfRL+ TkJUCACIvjuWjtW0zv6qwyWNZ4eR11ChZWhjx4507jdswfBcqPRWzrztk9x5ZcJAFrtD89Hy1O3 dIQROoiGwIt6/ZT0XrIIuG6ch21Ra870AZs5MZLjQlFKaIK8Ax0Vlhfjs3HuLGrkGESBlhEcUJ7 bb0eoRYQIqpt1vO10ZxC/wn0B3HhG+8aRkBuumyMvo2JoZ2uUuIdxEM38BlZbb61zBzcB/V2Pnp 55oCYIi6Fq8nNZpLZM9cPX7FOwbZDzmX7kNiAY9S+Ewa2h/SCetXD2vMA0WFQcRZ5DGh3zqawwa 3wR1GjDeaQaO5rHw1kluRx9mB4APLagFmV3CpMXKfxK28zan
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the objective of this series is still to prepare making struct
platform_device_id::driver_data an anonymous union. See
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the details about that.

If you consider the last patch mostly churn, just drop it.

v1 of this series can be found at
https://lore.kernel.org/linux-sound/cover.1779958164.git.u.kleine-koenig@baylibre.com.

Changes since then:

 - Rebase to current next
 - Some grammar improvements in the commit log for patch #1
 - Split the changes to sound/soc/amd/acp in separate changes.
 - The 2nd patch used to be "ASoC: renesas: fsi: Simplify driver_data
   handling" which removed fsi_id_table[0].driver_data, but with commit
   38d3273075d6 ("ASoC: renesas: fsi: remove platform data style
   support") that needed to change.
 - The last patch now touches a few more files. (I didn't check if these
   are new offenders or if I failed to catch them in v1.) I didn't add
   Cezary Rojewski's ack because of that.

If splitting off the amd/acp changes was requested because they go in
via a separate tree: That's possible, in fact each file is touched only
once, so the patches can be reordered freely and applied via different
trees if needed.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (6):
  ASoC: codecs: mt6357: Drop unused assignment of platform_device_id
    driver data
  ASoC: renesas: fsi: Drop platform probing metadata
  ASoC: amd: acp: Use named initializers for platform_device_id arrays
  ASoC: amd: acp: Unify code style for platform_device_id array
  ASoC: Use named initializers for platform_device_id arrays
  ASOC: Unify code style for platform_device_id arrays

 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  4 ++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  4 ++--
 sound/soc/amd/acp/acp-sof-mach.c        | 14 +++++++-------
 sound/soc/au1x/db1200.c                 |  2 +-
 sound/soc/codecs/adau7118-hw.c          |  2 +-
 sound/soc/codecs/bt-sco.c               | 10 +++-------
 sound/soc/codecs/cs40l50-codec.c        |  4 ++--
 sound/soc/codecs/cs42l43.c              |  4 ++--
 sound/soc/codecs/mt6357.c               |  4 ++--
 sound/soc/codecs/wcd934x.c              |  6 ++----
 sound/soc/fsl/imx-pcm-rpmsg.c           |  6 +++---
 sound/soc/intel/avs/boards/da7219.c     |  6 ++----
 sound/soc/intel/avs/boards/dmic.c       |  6 ++----
 sound/soc/intel/avs/boards/es8336.c     |  6 ++----
 sound/soc/intel/avs/boards/hdaudio.c    |  6 ++----
 sound/soc/intel/avs/boards/i2s_test.c   |  6 ++----
 sound/soc/intel/avs/boards/max98357a.c  |  6 ++----
 sound/soc/intel/avs/boards/max98373.c   |  6 ++----
 sound/soc/intel/avs/boards/max98927.c   |  6 ++----
 sound/soc/intel/avs/boards/nau8825.c    |  6 ++----
 sound/soc/intel/avs/boards/pcm3168a.c   |  6 ++----
 sound/soc/intel/avs/boards/probe.c      |  2 +-
 sound/soc/intel/avs/boards/rt274.c      |  2 +-
 sound/soc/intel/avs/boards/rt286.c      |  2 +-
 sound/soc/intel/avs/boards/rt298.c      |  2 +-
 sound/soc/intel/avs/boards/rt5514.c     |  2 +-
 sound/soc/intel/avs/boards/rt5640.c     |  2 +-
 sound/soc/intel/avs/boards/rt5663.c     |  2 +-
 sound/soc/intel/avs/boards/rt5682.c     |  2 +-
 sound/soc/intel/avs/boards/ssm4567.c    |  2 +-
 sound/soc/intel/boards/sof_sdw.c        |  4 ++--
 sound/soc/renesas/fsi.c                 |  4 ++--
 sound/soc/samsung/i2s.c                 |  2 +-
 33 files changed, 61 insertions(+), 87 deletions(-)


base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.55.0.11.g153666a7d9bb

