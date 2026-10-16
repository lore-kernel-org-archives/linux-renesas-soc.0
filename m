Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A2B3451AA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 01:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792115583; cv=pass; b=ejwRCsf1NW0umyIzxTmYvo3bFJ4lujw78jEZAARtYtyaHDMY3HmZVeVcGKnpneOceG191qw9y6LfE1eo08ovvsZ3e6Se/3TDSK/xuE+alUSENhpE2mkHE9e693R6vKZlIHYK4GUcqSNZpquTlmspUwUZRaB/c4eseeD66ua0njA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792115583; c=relaxed/simple;
	bh=Ia+9qnQFXuT7Qa703XqyFy/Lx1I20mduDC3TrKVaE04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkQ2kvSQNd30IGgcnW1r95gxOqZ75xRLcePxqOSdKatwA24Cnnnqcah9UzTDLyanXV7aJjCLPTEpxbxYyDGiuDfP3Y0gFvsLMuIdEtcRmhArsT/etPpcs9XSf7ZPGXJJSBWIjMaJzbvuwIr0hdS9BKWNLllIE2zP5YleyYHy2OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Op0eyiit; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Op0eyiit"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e831e86ebfso15827855ad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 18:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792115582; cv=none;
        d=google.com; s=arc-20260327;
        b=Cg8qXOyZge/9EQJw44Unu70T2bhJB8CeHu+38yCWLG13jjMb/hQgGBeQQzL+FH31oM
         OsOVmstJlF5uCywA4OzMiePAPmSJ5yHIaNQ3wG2ay/oyCiqI6aL+7KnKWwNYccwRLtHm
         P4NnT60BYy2lidECeti3cGmjZY2scYX8UGRLTou+TMm2Roh3wpHrBwijkD8radHvNXrD
         i7GPA2lPdzVVw0/l1YdAm/NuLO7PaQDYBg2848G3L0AgqURqVLyEkKoTexqcyEMi5MNS
         qrIhkZePfDAbF1RHhK8EuEBEvLsg3UV1qf7kDMSsixXSy/eBfOl+mGWMC2fUDdmGiBMv
         km6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        fh=tzfF/ooPdQhdkwutnItMD+TnL0P0c0QWuQ9Ns7/5C48=;
        b=XdojyLplhElMxBQb3Yk5AQFIGd4YZoblhNqFor5WSv5ibk2ensA67rsNe0xzZx5eFq
         CAA1JVVkrvT3lZpaZ0oOuiwtz6aSgjYmNchg4wkA4Mc0HaFl7WhyZh+8ekoCYi5qUAmh
         KBkI5JrzwvWkxyeDg9a5ZPnZlX/6Ko2vQ4QQSM+Rzge/gpqV0VlJf57cRd8P+2Qvy1F6
         /d/umnTiJ5AszpC6A1MTBYXQcLaqMhA0dzWFzPQNSPwlNY7MV7LlvEAp9AWtFNhM+1Ll
         hxO1dQQ3ZeKGmuDpNXGo2gpLiog4seJ0BiKA7bH7hk4wSuRn6C364+Ea9e8fjSohQ+ij
         PA3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792115582; x=1792720382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        b=Op0eyiitNEQ9ES47jArbONvej3eRBF5KjtydwZxPxVl1mc+bOWWPhdC05xKTeFLMmz
         q99SeUeotiGXJ8mNibarU/ufZeGdSwlcRc46/KvgrJUTPnns6FJhMcnUi/mI8AUDS1c4
         7HHqvb97Td8c1ys25ubxhuq8k0LNuGKCrYp6lyV2KkdlRu1k961YEQHQ3rGiowy9n3J3
         yxfMN8tAlTxVfrjuU7vIpsM8AxMPL0+iJfGuhxGrNgYBjZR2K9IqKYbCa8d4Oh+Duz0d
         IuU+lz6A5Gasr8oJ1NZInlII5/H8q4exLKfSXBg1A8r3Z23hqJtffW2lWJSVt1tU30XU
         vjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792115582; x=1792720382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        b=UBuO8IqAkxrDgkpWgrKIS9O2rYXSpIv6Db9E4NGjavkQoA3cpngTn4tutmjhTkdsW5
         P2gvafB+QOtD6cCG44Rfx2wPz/VKsI3rfFCW1myPVb7pNcU/BMYfIrdThimuX9iYVN7U
         BrEeIxSLJx1XbDvpzHx9rYh6uQRgtunGJUeS0n9JbT+liqKMiSeNyf1s00dBoUUIeDDT
         LMnT8ceUjlLJDg0JfLGp9ZxUNE40Ps6rhPHC1VpfQXbJY6cTzjga93MtiucMjIJTvfKa
         E3BNgzv9Y4VghLqucgnN41tQsXOZE4KCpeEbalJPZbc/TLv+cYb/WLVJdwfrUD8fkcEA
         0+FA==
X-Forwarded-Encrypted: i=1; AKwUvBzToWMdo9AQKGed3Hp3EP5Giyd8sU1jBuX+AZhpz5YOtzTTsqcLqWPCmBrFOh22PIXzNH5cBJXqKXO5mo1Lqm/p8Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJgVXBzWs4Ti+LQ7E3scOSxNpZYJGuSXvIPpN1FFmwYQlEpqMT6
	G+T2OG1DLfF51UtZeFb/ecZHh6UipUaGuRu6P3272CsRAok61M4S+KhFo1sJJy0WvRym6lg7UQq
	tkSCaBCmusAX/kqQ6PttbI7GwmD5jOUI=
X-Gm-Gg: AYBFou0tHor3wSU6clI8y7/98y/In7lztJy4Vahb1VMSadLjoYFON4jXWIVVCE8yCIc
	loXblvmvumuUTYPowpewCZWs+dUPTF6HOkTPNFvLWua2oiFdyH0Tl4PWqPYGRLtrDovOWhNkEdH
	lVu+g4Db3YBqJI1RNpperQxoHYmUQtY3SgDNtbr9CWPidLatL3yvy5l5d7eC15LpjemRZ9K9J/V
	6C5UMtcJ5W879CPtQko3yuie1GYnhHC4O7XgQG6Rltkl5+x/kMWMRV/VznhFejQR4NRGzkSs3qg
	ryNLOWbIswkKGh1TduN+x3XwZ97XDyIqDM7WW4ey9Q6ZLiRZ5SN2yS6pLtc49jxLiYhiy3CBErU
	arGz3pvDCpZns6fKOghC2ZDjL+azY7R3tz6pCFgXrlGtwwhY6GrrzbwQk2b7Eh3WRZH4=
X-Received: by 2002:a17:902:f641:b0:2e9:5714:608e with SMTP id
 d9443c01a7336-2e957148bb7mr48721225ad.49.1792115581670; Thu, 15 Oct 2026
 18:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <ad722297-5ca5-42c5-a07e-59fa958387c1@sirena.org.uk>
In-Reply-To: <ad722297-5ca5-42c5-a07e-59fa958387c1@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 08:52:48 +0700
X-Gm-Features: AclHuK85_RuY5Eq4148HpcAJND7CX_R3cPSTmudMqJuFIrc_MXHUz5ZN3dyw0W4
Message-ID: <CAABR9nGU0qW6iMadffrXw86a=ty=FVhw_Ypoa4rQtwOCbepVWg@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] ASoC: Fix constraint return value handling
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

> > Changes in v2:
> >  - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu.
> >  - Remove redundant integer constraints already applied by
> >    snd_dmaengine_pcm_open().
>
> v1 was applied, please send incremental changes for the differences.

Thank you for applying v1.
I'll prepare and send the incremental changes soon.

Best regards,
Phuc
