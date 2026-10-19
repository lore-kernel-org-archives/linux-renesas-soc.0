Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4D94F85C0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417030; cv=none; b=uEC4Xae9cjLOTiESFYWMy6IFJ2eQ4Cj2TYPFm5nptQxnUlpx3C9vmPb9B3DmH01MHQCpj440bWiassDk9aNqbZNDpO1WeUnQTkexS/vaY0YdH7GVWHTQ1pREa5fK84JMhp8u7ejsVxLaFmbWAtwj5Ia4k2AP14WPokZZnXzLcXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417030; c=relaxed/simple;
	bh=fwAYS3zcXGkdd+Ibq1n5HFY65n1XJA1GPMTC7CY2epw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJfyyi86Wnhp37j/tKdT1sAqKBPVZH3yGOXKOQmmUZfSmD81aM4se9fpz/MKWruXRzCx5/SkKvKRXeFgN1hrVexOq4o89tya8WhFeNrGPumRLTv/iQ10kTKp+ym1ejDqvWEJdiV78eiSkZRFSA08+gFM9KvKTZnbX0V54VyOcjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Jewcw8c8; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Jewcw8c8"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3043784a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792417025; x=1793021825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kc0HBa20pNgTgn9A/dNG9MRjR4EzrI7cz68avvggZvk=;
        b=Jewcw8c8ACrek60ikgqusPxWnpbvxhf3bLGWoDJ6DdvKTiZQw8i2MJ+9pX/0LINqyw
         BDiqd7B7+hhgxdnDMG0zUXFP0ZIZowDvAJbzrSzGjweucAHxESNEpiUt0vOcm+F0/8wv
         /7VaQE9eZbiAbnDw1DQ3mkgm4FRyarMZ502LzgWjGqvuk6QToJ22t8yVYZ0sFtjGQH54
         rKVkWfRO8ds6z3Hgc2El8YD313HTjVLL6o1qE4j7V+//9FhPTa6bfOii9X6uRQsatSfO
         8g1jsEbylGzUPu9HyizE2JdZ7g33iznw7N18t18N+picnHrdLFS/HbQ6gz9Y39moQj82
         jLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417025; x=1793021825;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kc0HBa20pNgTgn9A/dNG9MRjR4EzrI7cz68avvggZvk=;
        b=FuyD3XlTxTjd+f7s8IqBiD6W2gnz7Hnvl/N15VBKXIwE1c2R/xkOLi/Cnavn671vFv
         ivtr+EdUeC3DCoQ0fTH1NdU6tfEPv810YTSLJJI6dlLE+p2oX91VF7wmyjOUFIa1ECxW
         j1Mxe9mwuvpMxKthJGXIy0GW3B+g9ExiDOyrcvl+6iIdw5DuEx0lN3FZtBaPk4jttwow
         33ggNR6vHgPFFnn4x2gENLlVmRzkieNL4fZqE7DSlkB4YQPekpOTbIbZpfTh32Cd/IS9
         EGCbLyMrV1aDxTOQFe5e27rx/jvL16h/XpVpPOh+VluBf9ddAbrH4oojTouhYSDOA+/j
         tlUw==
X-Forwarded-Encrypted: i=1; AKwUvBx2j4nHsJE4bmS1/qtVaq0o2oFJoFAaVE3ImTBYMdJrQyLXi4h4ATwYu+ZGjBrWFmaBvktFuceZBt22PQWZHr+0Ag==@vger.kernel.org
X-Gm-Message-State: AFq9FYJhvkSl9Bf1tQqdwAAmuu4MLDaVE6XEgZl+3JBHfeZUEnriqWwp
	M98f+ahzq6fsXHfco4OFG8BT7IfEunHtRe1aI1Z0Z0vfNxzDBWK0vQyNybqGH1nlGpw=
X-Gm-Gg: AYBFou3MDEDYug7NjH8lsDl2u+5Ci2tw5tvYoP1WeeRva/nJo3zG5lGKEwev6WLZHVZ
	k+YCKM7Q8DTCoKlJNyXHyQfG5zNisWczdvr1sfsVKd6h1s4N6AA5VUn6qiZazpEUvwIE0ytBIJW
	cFfxFD5k+3hjlpHYUjljUdoyuR2rLyjNM6XHLbDu0NVXRw1vwX9kmEjswiykB984+YPV5ZPwvyQ
	ZGuIQ59mjvL2Gn0HaePWV8RdVq5c4Ox+VgZqvniOifkh280LOqXxxCSZPEE4jPZAnbuCNM7vzpI
	cg85AvoBnXsFu7+7ZQeMNROdRTSQwoXK17XmHiaYlPp6viyjMXYDZbbIT96hHRL+jWsU5aIUFo/
	tf123A9nGO1plxg7Olt7sEGI/rH+9YEeLDdSDI+iVc3/8UekBbnU6iGMK9zsklwUF1Y3icXmuUX
	PdfPBkIEgou7fY3WbxSvARN32mpYw4hf+SE0wQhmXfJr8xG5RIoMwLMkGujOrqj5YDSLGza28nq
	AFE/qs=
X-Received: by 2002:a05:6402:5489:b0:6af:8a4b:7aad with SMTP id 4fb4d7f45d1cf-6b3a81a6d00mr4333695a12.28.1792417023411;
        Mon, 19 Oct 2026 06:37:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm22897379f8f.30.2026.10.19.06.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:37:01 -0700 (PDT)
Message-ID: <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
Date: Mon, 19 Oct 2026 16:36:57 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component
 open callback
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>,
 wangdicheng <wangdicheng@kylinos.cn>,
 Chris Bainbridge <chris.bainbridge@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Neo Chang <YLCHANG2@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Hemanth Selam <hemanth.selam@gmail.com>,
 Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Zain Aboobacker <zainaboobacker33@gmail.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Bo Shen <voice.shen@atmel.com>,
 Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-11-phucduc.bui@gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261016040946.521195-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 07:09, phucduc.bui@gmail.com wrote:
> From: bui duc phuc<phucduc.bui@gmail.com>
> 
> In DMA mode, the generic dmaengine PCM component already applies
> the integer PERIODS constraint in snd_dmaengine_pcm_open().
> 
> Since rz_ssi_pcm_open_dma() only applies this constraint, remove
> the redundant component .open callback.
> 
> Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>

FTR:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

