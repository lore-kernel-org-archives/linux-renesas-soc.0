Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D1447986C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149971; cv=pass; b=CQE6nOaxmNHjicGb7pl3ZI1d0SeqytaYaqo+ApBZ4vhLZNN996OxkoNlUx+krfb9C8osujz6aBljqe/7+MGQu1hKwU18scMocEONHs6jgiXelttCeQjx0h2/VMGsH0tiWx/v4qUatXJYuQGOhw2+yAxNxFXSHuQQkzDmyfolBPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149971; c=relaxed/simple;
	bh=R7fc9o/O4yqhA3W/kJmDsBhaIBU4bJflgTG28U+KE44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEkN45gGdlseiVrYi2UEoCDgVjw4JBWk7kJ3dREJ4kV5Uu7Y4w/QbP1274eQsGrPUnVT35Q1/7z6umW4naaeSl95B4cLqG3m81rQBY/N/NFHpTIGCvmdkc7eLR7UL1oj+H4JaHUc6eiuzlzbifcmboMBiC/iPCFh1WPyplEHMxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDUOhPxJ; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDUOhPxJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db80fcdf8bso37339595ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 04:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792149968; cv=none;
        d=google.com; s=arc-20260327;
        b=Evgm2JW2qyvKbGVFzZwNme39cLldrU/8+siRWo2L3jXApW3kqE/BwVT+26bT4/wDRy
         e+NOHu9WoYybAJ5UAAV7XQwL4ToyW85uxrL8U/UBnDDltuWY3B74sQPkqG5STB8dlhhZ
         VrINCJZBRpJDMian3QnBvI88Ir6aLzGdPhOWqR2MohvJ3tHN3ToV9JEAqGSn6NaurFnZ
         73VG8k9ZSJYRLhJ62feetN9tQ4oXr9HOYEF6izPQT07A8uD8KfVDHINu5J/oTepx277K
         4FAf3xs1NArrZVHJH9XwQVAFK10DbHhaAXJhH6FqRJW/AKS5v+WBXZYgUmXQea+7p/RK
         E3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        fh=en/b2OxX2qo5MWhDThlEAxF3GPH6gGg4EtQqVVwZjns=;
        b=hCdkhOgwIJXb+knLbH90XmKkQinNScnHffKrTcb87nTERRUyC3UmAi/pCBWHKQrITp
         o5nG4L/6a3HvfyslVK92qOFvvwtycDr2AhUNd5j+RLU8eYLKOMUuYH2dLcLV+NBzr8yE
         /PwcVoSaGw/mk5l3QtoHMLaN/CU9SfjK6PdLC8LF8/twt2NAIPcock0U+U6NOPa+AZa0
         SztIWOh8h/iP5DAaOP+SPa+U2s4+OJrFoInHvBPhpN/zjBEJAR6CJsTpLh04GS86VZm2
         OlcBXjbLbXx9elOoqCV9EMgb11PKydcyakh6nsw9JnrpNyhK/VU/mM666A22AEzkSbDQ
         tsaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149968; x=1792754768; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        b=JDUOhPxJFfNqGzF6qKagGJ9RdRyuEtlDsg+3/BmwOi8JRKOFv69C/T58mLShzd9MLR
         P4lD88hLeJxqC/81P7wQ53ZoLv+i68KSQCpKcKcJfrTplRaSwkyHF9JOQS+TRyVtR2GJ
         ynQGWzn8Zc8IG6In2A46KxGeym75SzVyTOUSEG3ZzyQLMuuDdyep816xIYjogWDEEwp3
         3LywSes+jn2igaxBP5OqlRJ5hZLuboyXNJghCSwRjbQkzKZ9TkR7T/Hw9iZa6V/FBa7G
         JsLPrG8QIVh1537rgYtGIKaIpXnlHN3ECjvINIepxb/jmZxy3P1u65/S6l99rhkiF2mE
         3sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149968; x=1792754768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        b=C1rlXXa+K4m3YP5QfbABC9y4ey7EjnJGngFmbrJiKh1uTHHrAVK1EI4RjpUuYlaBqZ
         G9u1/h9FajozjTo6HqLPdj6nmAL+IXAtYNegV/kU7YykZhK3Y2k00KSWx3cF00gqAkCt
         R0QENUXhONuHnOVhx+rkpGaaiSl4ajl3rW40vuQ5kaTRieBw0+0qxoqepCRu8jYkmjYC
         ECPxlZO8NrzbtUs0ShfHzeejTk/xfEzgx4vnxSjHQvZ72eatjwB4kEF6Zt0qqoMgIvmK
         zuSier70fkmNTz691QjbLzuQzceCbppQ/zd4U13fvK90gbcERnOhD3lRpPdDLduVviDQ
         d/BA==
X-Forwarded-Encrypted: i=1; AKwUvByWVcTHwFucgwCu03OtAZIfrYqC4YhQuHKz6ijFHXamlDjzsTpbdwe2frhbfeArZ+m3h9WUYQjnzk1pc9m3nbM/WQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTnEyXye0Eu5DVdnHZ1HXuac2KhDrIq86S9o5AEfMkaA6HhKw3
	hC9sGA7eEQygvjzDPSwWdM+zim0ZFMnz2Ss7hrcRC+3kX+K4yCvypMpR7NxxeVHBAhpnxCtesBa
	NHrit3Nm7oXvoMFhD3Y8YzsZH310eIu0=
X-Gm-Gg: AYBFou07IisHpE2WmsXM8WKpVhBFjhlYoQbXcRk21TP2MMKTE7K5Rt4PaeWIPX/XLL6
	KKeBDo/1EAojv46C84OZklVSMdpA9ZUpwYwHadhoQmF6bLUNas687M2JKUvGan2/XLNapZQLRrk
	S5t4/NVAlo1XhjWriYHrz9i1nvkK95ec+iL+GCNPLbf/YHO4nzjjEEI81hnP5yZfsW5/W3KIW6S
	7YZ2rVo3ICXHUhLrqHhF7NY10xQ7UzHwXR2ltl4QxiSeLrshf5opXkEJlT/EkrjpYuOSkVf1/HJ
	Snd5R8UvCTCxHPkUSiSRSbyM2LWwFvs0UXrh5SOyEs1uNTWRNFHCRYgaue5WarxiBwtozGs+Vwa
	kn/Mkl4qBlxzeR8pefS+ILZzFBq9ulGPKyPFBU7SJTbCIXwKoK65/0jNANCNhzoLvHfg2
X-Received: by 2002:a17:903:11ce:b0:2e9:4e83:1979 with SMTP id
 d9443c01a7336-2e94e836527mr62789995ad.32.1792149967287; Fri, 16 Oct 2026
 04:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <20261016040048.506531-1-phucduc.bui@gmail.com>
 <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
In-Reply-To: <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 18:25:56 +0700
X-Gm-Features: AclHuK9bobvuHZz0ZvKJfKfhAJdiG3c7XQlmqU2uHEyUuNfyFRrkKv-rn3SiKZ0
Message-ID: <CAABR9nG8PeQS4GBGwENfHTRBUnroKYQiEu29iztix+py=Arprg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] ASoC: rockchip: rockchip_max98090: Mark the link
 as started on success
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, povik+lin@cutebit.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
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
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> Can you please resubmit this as a separate patch as a new thread without
> the series numbering?  This is really going to mess with the tooling :(
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
>
> Series numbering only makes sense within a series for ordering, if
> you're sending something separately to a series or a new series then
> preserving the ordering of the series just causes confusion.

Sorry for the inconvenience.

This was patch 25 of v2. I had only managed to send the first 24
patches previously.
Patch 25 failed to send due to an error, so I sent it afterward to
complete the series history.

Link to v2:
https://lore.kernel.org/all/20261015014324.5569-1-phucduc.bui@gmail.com/

Since you had already applied v1, this patch does not necessarily need
to be resubmitted,
so please feel free to ignore it.

Link v1 :
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/

I have also sent the incremental changes in a separate thread, as you requested:

https://lore.kernel.org/all/20261016040946.521195-1-phucduc.bui@gmail.com/

Best regards,
Phuc
