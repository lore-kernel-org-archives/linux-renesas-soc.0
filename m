Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792462258;
	b=wqW+piZmjbs6m5IOziBrFbicBDKhxDzeJx9vhVtJNLa6Jef4jYX5tHe7vxSQZtF95DEq
	 gU/OKOHGXoXdtvQngSkwL3C0zbQYpxQM1nIiwua8JRGSBiqSNfy1hcsq1YqQgacUthfxn
	 DzZEGdTFUX8BnMbxY5h61nAJ1vWCT06CxU23U3JobXMbfktoXUT2/5qOclkyoHy9QcNKH
	 ulMDCJW/qCY9xuk3l4glKH66Se+hbt/Lvm2IKo28B62DNj0s9OWGXQ6nh3iY7EEWXH0Zz
	 f0nbRxk0XkB0jcm/UaVGIom+/n/YEn8lzvT6N3un4jpUToTDkJCReFJ7z1ok6QiDoRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
	b=D+swkD2hUk8YLmdvY8YKHJWA03juja109Gy8wWzrvcC5r/VelZO/SKi35nnb6xDyCRUH
	 Vnu0dkQUQqdfwFc2lU4WwqAOUPLpVwRGdqze6xjq9hOdWHbZVcMQy9IX0hzX2NgRaP9UC
	 kC7ikpTnay/3xkOHuTaLb/Er6fNNjNvt42arPxuC/7SvDuBlHd7evFCLdgBky2sPg/hMD
	 iYNj8OilfT+DmH3CyPmxb5+9FqsdarsOrwpLm3E6LR635W72Za3iBvDoXO33pcYsMlSlP
	 LfP2LF+eADWnbkdVHGB2VEGJ3+ki6Lq8FsozB2G1cd+r0S9zx6FNuP22KwNHByOMr1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hb/UPhHW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4CE606A31C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 02:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hb/UPhHW
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso14228645ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 19:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792462257; cv=none;
        d=google.com; s=arc-20260327;
        b=jIRTXKV4q4v3wdM+ssrbsHB81SnRQmwcquCujzlVAQgtr/9AknTB5wt1pF8DLWm+SY
         em4lhx97u4OlmMwhNuJlyNqWnSzWOSMUzN0ox2OAAJdMhgP+FBT4RzW9YU9gi43m9GYr
         ixSA640zFs++AbKHFKRg20jz5821xtuq63kbXhWSWCwmV8z43M9E5HlL1kmyEPkp6BEJ
         XlZBp0ga2AClLdru8MYtbvbsYV1cQ8oK41wBRFKG+O7ICFzDybDjrl7Vm0oxlvatifKW
         79QS/BVrff+YuqhFWjFeTPvHI3OrJ9/wRekiHeHvzSVh2jhuJHNUOED3ZgN4Cn5YBaXm
         SALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        fh=GX+3Sz+7jESV7KVJlD7SLjVWpROFibpfJl1ercXI5rI=;
        b=qtRMj9Vz8qeVvE8OYcpBFpIY3qx6uqFWT1eembpIqxFRtKdW18GjDZw4JdCeoRc6nP
         GeK3EacfPmJ+2UhrKAdvvyLnz8+YT1CLEVlymyrmJoiMf+wcmVz/ZfsHfL1TgSkUBKh7
         +NR4orvnYACtau5HT3z1VWXsJcETxGyY9KTvOWQRW6QMQfCMFo5cuzHUyvYsXgLiOtnM
         a+JKhtiozwLhHvsAFDoSdYvGpYVnRNxFGl8B3TEZBovvv95BZan1E99f/RzzA6TYvxLO
         R+wxFqJsIS8oNpDsr/2FNsj1QfFH/uJcthy6NED78RSN1eNbJk5DTxNV60GPfhIUbUFU
         K/oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462257; x=1793067057; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        b=hb/UPhHWEbBTw2Sv0j1Br3zlb1tF0v5WNhFa7htWdgnfMrEBEzsiE5hXvp3vrKt+TP
         A1iM4KW0YJYwxzG35H7vcpjnRx2CJW00YJ1JPRskO4JBnOwdM8+j0JMiVuFyDKqXxQqy
         IF8QO+DA9VVJVKNwvZA4wSa1LLQcm+FQ/mH3rTdFwZ2L0UY5SDtbjxoZ7bHzWztur0R+
         tgiWKShd9eA8WOCLKzI5UqagnrkJpCgp6xz+od/Wjdw1NYd1wkGPa32hCxCPRPI9iuRq
         vcv4YOonUtpCVRDWpIA6S8UcXFNuTSGHu3Bn+qGsMIkZDz0VzJrSfO3VjllcABlIUTXL
         UR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462257; x=1793067057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        b=L7zfJA+azA8WPkgZqi+oze2R1A81gdxP86L2h2Rzsq9u+GTb4yaRS5x0pdDvGOGwjW
         rhHrlbqzT8YEi0Ja8MP9amEiVo78g5GawMfw+geJifeUvrjDd0n2wu0KVbjOMFJLZvs2
         bnAF0gNhtvRwG5/7sWRKGqfkc+zZPvzzyMXL6XsCqCZdB5wHxQhtBCkNeNIyp4AgVnzK
         pvmJQZGdsfWqrxlcM0L2Vw1nqaQeMMdEJj4ifX4zo4iK0XBAeyPbk+Q03/OIjstwQfUt
         aBZUTFHBHc2nTs/eelWO6HHnf3wpzIgrbvj1HCdYWhOFC2NXJ99P9N12PMWl1v2FgCMA
         a6Ww==
X-Forwarded-Encrypted: i=1; AKwUvBz86xs1A5Xv/zQ/VRynO9bLXkdNPLjaGgX0IHR03ad8/PbWOH2+vEffeVHenB46LH0FCg7EVnbrCHYzwB0MFoL6wQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIcYFiHi6+Z4hOX7A0u31cC8bDXT+qWxeu1wdKXNizGsvXYf8i8
	rgpYOw3epZfttR4oejrdiOjFict7v8PE6jcOljXhEfjE3beiz9o/tSkG0PoxCLYEYMunjpviRvr
	Y/A5k6myz5LlbLdO/sCkFDPNxc3tj8Ik=
X-Gm-Gg: AYBFou3UCuHb+Q+TzCoVjpK87J1PtEjPziEQ1n45AtIFiQGqVG7VvcmcsAddmN7uJTh
	WJNWNkmEyvwbqO/dnyZb8l00tt0wEZoGNWE/bVuWAv4rrqhorVimEZA/2rwrZKXG5+sKRakYgt2
	LMWTH1KUDiBIxQSSDgzlFuvYqRawHQb8mYjT1DWHN39emicul4zuWLGAH6sF/7Q9q1XdHXd2s45
	bjAXgFaT5OdzI9QPrlOpNaOUdizRvlP6UHywd6flJ053czQQitJcgct1oTRvH/NQNCBpjD+kzbn
	uZpgdWTsw8ME7C3dn2k5Was+RQgBtAYfcdSYJAO4qAuJWYl0rpizK9HMSewCK+E2/NN14QhfDeQ
	N3yt1ZWbMSrONRoWgnGLGY0uMqxppu2iJInsmgJTaMcHsZLPf+wt4TBdTAVFe7odl1yA=
X-Received: by 2002:a17:902:e547:b0:2e8:93b5:c555 with SMTP id
 d9443c01a7336-2e9a6e5296emr76192995ad.61.1792462257434; Mon, 19 Oct 2026
 19:10:57 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-11-phucduc.bui@gmail.com> <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
In-Reply-To: <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 20 Oct 2026 09:10:45 +0700
X-Gm-Features: AclHuK-OxoOqEZe9QHO9PQT5BaN1GB4IUM0kwzQZDjYp5iThqBCJWYOaobvziFs
Message-ID: <CAABR9nGOmx6zvost-Y9Zd2nzQa+ZMYxt2PtZ8xYPLZqZVGHegg@mail.gmail.com>
Subject: Re: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component
 open callback
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>, 
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

Hi Claudiu,


> > In DMA mode, the generic dmaengine PCM component already applies
> > the integer PERIODS constraint in snd_dmaengine_pcm_open().
> >
> > Since rz_ssi_pcm_open_dma() only applies this constraint, remove
> > the redundant component .open callback.
> >
> > Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>
>
> FTR:
>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>

Thanks for reviewing and testing!

Best regards,
Phuc
