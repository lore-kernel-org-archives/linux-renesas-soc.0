Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41A03515CE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457248; cv=pass; b=s+5vOKZ3/kMQMKWM6yfZa36btEsYQb2Siq55uH+6j14oaUBpiqK4b0taLulC+T4N3r5OQFSHB7OUWV6DT7aY0mL/DkpUknJ8PWDJ1OknCVQIzqjGSvMXtFP6iowmk1qCxWo421a5jJbGlfwL92ddgIkSJgMTFaO+B0l8DJRCAkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457248; c=relaxed/simple;
	bh=PwHZM9ypG7ivy6DiyvJAIMcoKpqU4Q9ea2Q0SCuiZzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLyoKxU7LrR3pFP52DMwZwHURYyjIvxcXEOK8rouGR0eZqXZEpeQZXKZOtNbt6hG88l6gTRcskLuFRYvYeNgvbyXHCOAPNSE/GmpNq3ISoFSK4MmKgX6zrKmp8qrPz1YhJjvUfVjVnzB8tEQqWOKEqNFpkpQd2AXu5ISAVKBDbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMPboJC6; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMPboJC6"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so561937a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 04:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791457246; cv=none;
        d=google.com; s=arc-20260327;
        b=KKhXH50gX4n4lZGaxfQK9lX/dtuDRs90jTurGRJr4EqazCaw5Dxhl0V2iqJScRAo7Z
         wsiF4k5BQ57C/uxtoBUMX4RZZ/AD+V3gNViGnOv95aH1ISGcqUcM1b5Iji3yOW/yZMfr
         Ki0NzXsBKrrkVWfVU7hFaKuQyvsIywKTp+yRPYAM7Y5pMGEwoGBAMGOSuPGA3y19UjdG
         WwoHo5syv2TiSJFVFQzT0uEkyeNIedBB/SBLwxTIYz1CIzUdLXz2q4/B1aSSft5ycmYu
         xd1g4jI/E9KKG3+t2aTEN10zguSq9dQUupE1jWmfRpjbkFG4sfzpto/wXQh9nTnIZ2m1
         nZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        fh=IyD42zkLjUt9htYXvbGVPvZJqnmguYLC5pClx9TWcg0=;
        b=pcBKOp2H0sXdIsXp8WlMoGU0Npi/7q/znckL1VKTsbaraF/BN2jZAXFYuuqBv7LI5g
         nvbAe2GRAbM5FDkT5mqpFrAqRqnCmXibSqEG4MbGuAuB8JlikvpPJhHDeCLs53sd5Sf7
         4K3gVrBKRt6EOfDpUEcTJ+WEUj2hiLTIcTN03ibEnK5E9GgIUauyawb0HUtqUQBVPQYe
         TOlQEwsYmFRtmjE9QnUFuKdQKCk3bL8D8a4PO3KqASW1/2NqtU+Z0sLEhxMmiNpeLkcF
         qPsiVG2kCsZFfwWNw8BKVkmZYU0uduGr1Is0LbDj+CbNb7dXZ8Tszbk9+uXiNrb2UMn8
         z01Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791457246; x=1792062046; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        b=nMPboJC6mbtr5yVf1HywZ8TL0EQZ28IKn8EBIfVQdbnb8rwU3r3S/e/QF0cMQdM6Ry
         Mg+W54JbmFDBWb/+3iZfzWiU5MlX74RN0bLLU3a4SqaPz/RJ56QBYKz/+bdU2AJAPBUi
         xA8lYP/UE3eovNzjXMFB8PU9PHox0VrHqsgXWXhccAIT2nQVGbxQllWiAVsuskcK4yW6
         aD78/Ku8hcIfY9s3LFHZqxWgH8VP8D2R1Fz7MGKnX/rEh9DWJ6UYc9upZQotzO4Pdhof
         1KasENyt+KLrLieGG23BMRvARkCLzg++OK8qcxhelAa9lU8pJQcm3o6KeuBNm3ZTJGJF
         R8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457246; x=1792062046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        b=1JZDR2J3EjNW38NtAP8zEIJbkAz1UooK2iUga+cDuwRiut+OSgedL0CfbpF27+Jurv
         MIf8tYbXygt1EuAlhxkRSOzN9bxFOcHT97Ii4O8BvbwSsg+9R157V3Xxc7W3wQnoKshs
         F6cGuUN9/JPGeiJr3iiPRC/Se8s+hoH4JzAEOF6usks1BTQfih5NUVXqO0JCG/56cZbF
         pHNpIbudG4gi6CSKssVGfF3vNqIq9bBPITuAun8KBqtgIAlNfZ0ipjtjiv8n+aYprciA
         Iea6awHGPKBSS1b88h4E+T8aAW8rsiZ2fcFpxox1VuGBP/y5FFYCEFVyyaQFBRFwnLIr
         JX4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMcXZKrIEz3HMeyytBP8JY5lLIdTosDRIrE9iBhvEG6WeJG1tH3zuMmJrJtHjKUQ6sTIZUV9WAttX6cLspANlCyA==@vger.kernel.org
X-Gm-Message-State: AFuF++lfU3yxfcv08/Pest4ADg5HpCH1Iaj37u86QdNf8q+/rjtFIFDT
	e+8duo/EeKmKst6M1DKUNmfIVm+gYpklXC5wADWwiE9vGQVAypYOAJRuVtv+iSW59zFYiMp6l9i
	prcrviawXGM8ettPf8o0CTUerEIdegBo=
X-Gm-Gg: AYBFou3bdzEXi9wnMEuFO/wNar5h7c+dIVnoO6m6eQKPBJlXsX07MtCnL2I7adoPPov
	SXMT8bpd8JmSTwDp2tzuaKMNf7A7iW5275z+PLJKsOTDgGXP5ZaGoftRyr/PsOsPeX4kMuf2MXu
	IFWPd7Ov7fnb5Saj7CjHkRRcWHWSzgt73OTtd78cBSVWBSBWsoxnOy9FpiuFcudRms9LrcL5nBg
	Rz/vKoN0I8bbBK98JZAZagcZRQ42uU5Wk2cfbXrYBMi+VmRrrGeAdk4ELpB3MsqoN5TwBybC7IG
	f4jprQF6howoAw57lSZmTaADsduwX7P/m+ZBht7qIt396r6kGcv8EQEyb610hX5WMNd/93437OK
	CCxyj6AVZfH1SDJEXKZ+upkbOSVHHFPIhrUGh4ZOg97K68eWWnpwevHO7jT6xo+6C11U=
X-Received: by 2002:a17:907:3f9b:b0:c26:1648:a062 with SMTP id
 a640c23a62f3a-c317be58e90mr502991266b.29.1791457245712; Thu, 08 Oct 2026
 04:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-11-phucduc.bui@gmail.com> <fc7d2b73-e0a4-4a36-b6d4-8080ebb883f7@opensource.cirrus.com>
In-Reply-To: <fc7d2b73-e0a4-4a36-b6d4-8080ebb883f7@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 8 Oct 2026 18:00:32 +0700
X-Gm-Features: AclHuK_K3qxrvyLSGGdbMZG2p4PEMizBkDvUHEpZw0j03bz-I49nzoxH95pIpWQ
Message-ID: <CAABR9nHx1Uwket5-co+e-LR3j=0Cww0ZqZgZsUbiDmHTEXp-PA@mail.gmail.com>
Subject: Re: [PATCH 10/24] ASoC: codecs: cs42l42: Ensure the DAI is marked as
 started on success
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
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

Hi Richard,

Thank you for your review.

> Is there any reason why we can't change ASoC to mark the DAI as started
> if return is not an error?
>
>
> int snd_soc_dai_startup(struct snd_soc_dai *dai,
>                         struct snd_pcm_substream *substream)
> {
> <SNIP>
>
>         if (ret < 0)
>                 soc_dai_ret(dai, ret);
>
>         soc_dai_mark_push(dai, substream, startup);
>
>         return soc_dai_ret(dai, 0);
> }

I confirmed this with the maintainer here:
https://lore.kernel.org/all/CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com/

It seems that the other ASoC callbacks consistently use 0 to indicate
success. The other call sites also handle the return values correctly.
The issue is limited to callbacks that directly return the result of
snd_pcm_hw_constraint_minmax() or snd_pcm_hw_constraint_integer(),
where the positive return value was overlooked.

Best regards,
Phuc
