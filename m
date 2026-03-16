Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388E3B95ED;
	Mon, 16 Mar 2026 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676775; cv=none; b=jkMBC/Mudh1B3FhENjT8+BxNLFuRrxrj31xoggEat8dI1H8xSgNbBd/Q9xGyzNwwwbM/jBYqI1FiSvgXohkXEEEKnL6V2YnerxZzSCFhc5YvvXitLFvmeqM6H1C+SKgAA4uDShRzWSI6SaeeXg8ew+rZ5FUVoBR01gs1R59rUWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676775; c=relaxed/simple;
	bh=W3/aqEHr4f+dl3R/F2nCBCei9LbuG+ABw2wNyR7NSU4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=badoiTHxteJ05CgMUyxLfhgH0HkB5j19gNzc8YEypYITiufiC3KT2+XhqYiNDmO+NJmACpN4DtwXi0bIAhkawGUmEXle40XCR8cjEyYpn1bMu1GkpSJr1Ul9GUYy3/UxsMVrsKnBJnb/ZSgOlSuJD5mNBl50JT3SO9zSGW1Mdrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PnTea7iO; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PnTea7iO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B808FC55044;
	Mon, 16 Mar 2026 15:59:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15DF85FC9A;
	Mon, 16 Mar 2026 15:59:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 820EE103721D8;
	Mon, 16 Mar 2026 16:59:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773676768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FZY21WVCh7c8tZeHp10QX3BK4g8IIBPl4iC5dqseA4U=;
	b=PnTea7iOGokpmAn1gpLIkkS6Nd0yGlc32SP/zNZvtylTZgU/Z1Ybnij3ZXYHCeC0U4d09o
	BRZE1yUVjD6Qmz+8IbH5O78mpzRxZFVRAOgUrCMag55DutlsW94ck10nmmgpEW8m17kUFB
	VkFeXkZ/kIUAIGK0CYRdfaJUttWVEJCY0yeTVJBm3ckYagrbCPSqUej+/DdEwMHpQyOzOo
	8MiEFF5MN/OJ/MlEHmatCqK6k/97aTMH2f9dIHKPkhmoT252RKvR8n9bPQsmgBgalSXrhs
	sfgPzez5nSsPBiDxgAwqxCX0rAYf6cWo5wKbaXugCpuXG2yIuwNhrzWMpUZZKQ==
Date: Mon, 16 Mar 2026 16:59:08 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Martin =?UTF-8?B?UG92acOFwqFlcg==?=" <povik+lin@cutebit.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrei Simion
 <andrei.simion@microchip.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Benson Leung <bleung@chromium.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cyril Chao <Cyril.Chao@mediatek.com>, Dan
 Carpenter <dan.carpenter@linaro.org>, Daniel Baluta
 <daniel.baluta@nxp.com>, Daniel Mack <daniel@zonque.org>, Fabio Estevam
 <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Guenter Roeck <groeck@chromium.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Orson Zhai <orsonzhai@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Sheetal <sheetal@nvidia.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srini@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi
 Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Tim Bird
 <tim.bird@sony.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Venkata Prasad
 Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 10/29] ASoC: fsl: name back to pcm_new()/pcm_free()
Message-ID: <20260316165908.6a272e81@bootlin.com>
In-Reply-To: <87wlzcjyrn.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
	<87wlzcjyrn.wl-kuninori.morimoto.gx@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Kuninori,

On Mon, 16 Mar 2026 02:25:56 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> We have been used pcm_new()/pcm_free(), but switched to
> pcm_construct()/pcm_destruct() to use extra parameters [1].
> 
> pcm_new()/free() had been removed [2], but each drivers are still
> using such function naming. Let's name back to pcm_new()/pcm_free()
> again.
> 
> [1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
> [2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/fsl/fsl_asrc_dma.c  | 2 +-
>  sound/soc/fsl/fsl_dma.c       | 2 +-
>  sound/soc/fsl/fsl_qmc_audio.c | 6 +++---
>  sound/soc/fsl/imx-pcm-fiq.c   | 4 ++--
>  sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
>  sound/soc/fsl/mpc5200_dma.c   | 2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
