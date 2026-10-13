Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036AA374E5A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Oct 2026 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865122; cv=pass; b=IU+ZlzWGejw6AJ7NxF1FuT6FQlH7Z4EQh+pvYikjdduKI255JWFZ9qzgfu6Kj+nTcmxMKgYvUefit1ETtv1OlC3sBdr8JnfQX9+khMtd7kFjk3DnaSCT0YsbDGYL43FdAtF6HEaEZyjzmcbkeSSnoI/7H5xo7nvXnHcSUYV/l6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865122; c=relaxed/simple;
	bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftBahvTLq5QCZ11RrMwlvP8JSkMeSvwu8b0pDc91Y6ACeL+49igD/mBS9yRg6niCmuMfj4BuhGZ6pVq2902sFBKENpafVas+uRjjp6FLZOb0lNT6QkBIM8pPK6FnC1pCjdoqdYgTC4sjAVrayOL4FpnhHAr0huuvGJmfAGTTW2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAnGxwWW; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAnGxwWW"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-88b8f0a1bcdso1945214b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 21:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791865120; cv=none;
        d=google.com; s=arc-20260327;
        b=SEvaV3gUGjK9RT0OduH5R4BGxINcYuEw9voMBqNlZCG5ZyE1It2O4Lx/pebHsiQSjC
         xHaCn3Tr4aM4ArSLHflErDoxrU/jjHzG0cu73a+Lfp64uqB9C61VtX5SVZI9PjGyh0JJ
         0TYppkld5YHmkm6BadFXeNP7i9jLT150HtgKMv1OQxCzg32tG3AQlvYnIyhhPt9iEiHm
         YOAXZ3PKRQ2wv8eM6xWIVXsz1oX08xWkmuXUuq5Jws/9sYNiGsdr7+xl9JDSCo4w4K8T
         hCgG2izUAfcwzpds0Tgk0WDhin0kEr3UFW03SN+4Tr6RaEFTchCrv2D2xG0PQUSwfSJH
         CNcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        fh=RBFtEh6KgsETvwUpAcfaOW4+dBzZiytkyCVRnLqJquo=;
        b=B4pDQsar2jMyZLpL/SB21J+fEPSoij7sGGS+F1iRc5qMlwAILk7CI+KznN0AYp9wrC
         I5ZWBVKLp52YwkG0RH06irqO+m8wdoEo59/FNDMhNYvpcmkSTTraon3jB89UQGkFkmX2
         I4AbMLi2WZcA0WoxRga2SSIZo0ZpwQe1N2KVzYZwRL4HqKXJMzqBiRQ8oFV616D732Sa
         cQg/t71vyK0qiwN+ca9YqEOeeG5PiiniM+GN/EE61Yeo+7MZcZax9lOHmVDT9xzxyX5p
         SRpUOM/USVJgJFyFvJmctIx7YDo57KTGuR8sQS1skZXan4JtmK5ng4SMiCvD5L9hFSJT
         Qk1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791865120; x=1792469920; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        b=gAnGxwWW1NaLFGFjjBnWuN9tTcCkvKmMsKgTYp6veCaJKVQsFq8Bo4JlG/FVhatgGp
         2e2cIiPAGB6Qb/MIIA3ZWwBoAGg/ZeVaucb08SaLqLszvh52QBG5vD087h18Dvxm6SJ8
         +R+HNrAiUOKoQwJSAZtrGhhXqcvbBNJiia+Fzy47GLEXCwTJ11PkKAv850DxYnirs6tv
         qsbdxYjd83MqOKRm5qRCwUMGQRmoJkaDp8HRpK/PSW7Y061ASPNTrzWLdH/0PLAfDyab
         PY+ujhonpKwMOnSGLXKjMfMxvpLtjbXyoi3BoRIKNtCojJtFG1FJI5uNdCebMM/aYgH9
         WR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865120; x=1792469920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        b=2LVQV4jaYb9M2xQVTyHA6VlvBNJEgob3Ga2FB4apvxoMeN2ryPpH7Ti02qJjV7L/sh
         /rfKBs82DTJZdnZ4Dtzdtd5Czqn8TH0pMyg1OYSCF9oYJbl8Brfb5lqEvPpDKqMBDujd
         drebM1DmA2r2Xm9t5IY1Cb+tDnHmKcY9ip6nMLlFkOlm6Yup22YUJDH+3vIgsbGGqQ6f
         w8ot5MsRx9Kgv4L6pUdtoJHSSCIzW6dH3br8NrIYQjq5daJCgyYaByCb9GShTrlHXNtB
         DUuLOHVU+W5gUkeLb9RzKToDb/7B/sPqrpa+USNmuryqQ8N4SlPYovr8+4uiY18jauXH
         IuSA==
X-Forwarded-Encrypted: i=1; AKwUvBw0y0HWMTitksY/ti+uhumPWwfwba6IfBPQg9yDuwHkw+/OpVdHae0jUu53eBd7WTHswd3DQsZ7WK9kU9k0Jvt10w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLG+1IBJVopO3KeYfGp9h7gFmbhebXKfhTc4Oq7WIJKPqayrIkl
	EjFQrfwWZeAczMlOev2Ut7Yx2y1c8U8v+pBSQkT9C/H+HHZiJZ4RYCsoTiGwuUqdb4ws3h2qsRh
	d0qZdhSBGsA+yRI7m8wYT6xb+ufy66jc=
X-Gm-Gg: AYBFou3b/ZKNmrt5PwaDMmLxw8Ml6YclsVph458qiMRvnCiwBequ7jU+dSEDiHnMMPl
	WY7JJm8aEnsBtvPOJTRRwYmH6UEhzmZY5DtWu7TcoJjTSXTIFK+rw36wf9YNoswZi10ytSn6yiy
	YP5nxsPapI/kvr+kgL/Q7EJ2OYCE3OeLvXwUlTeXBa2G/jDFmVd9KqzGraDa/nbwbyTR+Enfme2
	xrYCaTEtmiKeDQoQ87ZYeBQNasPukJxpi0jF7qlwJxmuQ99E+n86xnz+k7LRrbwr+qbi7Zfi5gv
	03hdDKzNkqnxGo/W2egIv+ZLhpKKiRHR2u7p4rb+te3G/vuMfPdPlbj6AgV9poRUlQrGcdzVHUx
	PffOKZo581uUQQpe1vhBL16Qo6H0+az79/SL9YXLkoAtUtX9YWFKGhLo4mjReIx4YwFk=
X-Received: by 2002:a05:6a21:4eab:b0:3e0:de06:126b with SMTP id
 adf61e73a8af0-3e16beff287mr10686193637.66.1791865120247; Mon, 12 Oct 2026
 21:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 13 Oct 2026 11:18:28 +0700
X-Gm-Features: AclHuK8E-95w9dmy_Nn8Ii2RGxOq8D0J-l4YT38o4WK2kAtoUqqhMqA48tZbgYk
Message-ID: <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Bo Shen <voice.shen@atmel.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Thank you for your review.

>
> If so,

Although I don't have MSIOF hardware, I tested this on FSI hardware.

I added a .close() callback to fsi_soc_component and forced fsi_dai_startup()
to fail to trigger rollback in __soc_pcm_open().

When fsi_pcm_open() returned 1 from snd_pcm_hw_constraint_integer(),
 the .close() callback was skipped during rollback.
When it returned 0, the callback was called as expected.

>we would like to have such comment to indicate such background,
> because it is not intuitive for people.
> Otherwise, someone (maybe me :) will return to the original code.
>

I'll add a comment to explain why the return value must be normalized to 0
in the affected drivers.

For MSIOF, I noticed that snd_dmaengine_pcm_open() already calls
snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS,
so the call in msiof_open() seems redundant.

Since the first call succeeds, the second call should return 0.
Would removing the redundant call be acceptable?

Best regards,
Phuc
