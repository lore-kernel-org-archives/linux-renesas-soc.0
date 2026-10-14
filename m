Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40254CF4D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991350; cv=none; b=miIRD1lOMsafdzu8XWiKkb+exFPyWIF/1/vsO8mVytPbbuE6QNu0B57oUqiS6UKbeA3uG6G01TO//26d/s2L6fPfARXg0UfIa/8aigpqu/Rr4q/s+K2VRjlHyMQFUgOZ9eKelx0k/FONNgzNuTsum9tloIfIN/5hHm8Wr2Ggh5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991350; c=relaxed/simple;
	bh=OJYOG4YSV0pLaaOPEwxxy35lIjjZKUEA7jwt74Dr43o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p63UC9igGbGQmw0Pm6y3hRs6CZs2As3Scpoy4uWnKpSoUSUc6H+69/JAXoIVSw76EBQrH+HdVHRhRpoKQAg4qMBlKx1UFNcF2b0+u9NH2qJf6EmAJ8lwTO48SiLk1x8AHkHGNtOEJheTa19QGojFbl9eFX7aUnkI9VNSn6d9Tpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TwrXJ8qN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TwrXJ8qN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16c399641so41992135e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791991347; x=1792596147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Js2yXAKJLVFgb+YsCYrtsAgVcbxI+5CvJwak5knEqR8=;
        b=TwrXJ8qNCIBIfvZ5vaqH0HNVYo5jxBCxdNP4WT1BAOI4HGpqusYbSt51p4DOmcFQW+
         SfTLiLcWRk5ksnQB0u7htHubUA9hXpmtcva4ZIs4zG4iHLnRPcHJRaI4H4k6rQOf2zxV
         dAnisya7Ej4yH+2vgh/mDvbvCJa3LRtPIBCJYMqqRRanw0+VfLIUC7hVSg3yPoQU+8Yf
         BdoT06WioNkHNweW56PaotpWkWOkfmPlPPUEVy9ojZWmHGBOq5x5Dc3OJ3MWVkV8eYQX
         kVBLATFT1j2rrcrT98a/zwbSyY5HlgWIWIFaSD0Ct/M0CaCU/U3LPEBjpSZXtabPDsRa
         E8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991347; x=1792596147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Js2yXAKJLVFgb+YsCYrtsAgVcbxI+5CvJwak5knEqR8=;
        b=Yp5KReKxjdfCZ9sTxn+WpgKLo55frz0N8WjoLrQrZJH7VvPZBPVoekBIuJU/iviGY9
         VMRjyWrsEEsW8c9Feceu2Wwap16slSp4vawKj9TJou/i0DtVHDwU4bN4dTxUNU75JO+z
         agU2rooBOye6sfsLQivKjtwfARtLvD98pOFUkHwChSvxm+kyxYsQq7+uHQqExaOAnMzZ
         BITr/kCC2OR4VA5BIVTVAmWWmMA7lxR/qmbzXF0vVNNYkm55rA1+xRUcQ5xugwA6Bzbt
         F19B61HQ+QuEl3HXQPCi8XylGqWMcRzIRHS+b2SscFWoVOQ9R59EdD6XRuG7BxtxUzqP
         mZqg==
X-Forwarded-Encrypted: i=1; AKwUvBxQtuM/U+EA7bOZ1h7NHKj2L0nEIxlW/BA9w3tCxD/a+9iGv5mL8C06Ihl8JxGJ7vPJZGwIuBZCbPrueLiaEJillg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9KdvJtuLYGEW7727Oaxy6jAfojVJxvKmu7zqJXt1VbhRVX/dL
	0Qt8D5E+bB3PqJFyQCPvk81GBuvp2BbyLSm6UCPm1VYPZf69gltiQcsaSBTyP3D/IEk=
X-Gm-Gg: AYBFou35GAYJjk4ATUr5wBUJvcFZW47aTyfekVLcvrvdvY9LmQDsn8gmtsDm9nFi1Yq
	oZK4G2bEiLRxoA58YNTMZo5X0dc7aJdrWWAbQ58PKtxY1MCaQpAYtDd+nU6FpxjZzj8DiRq1dBS
	JzqH/IJ6XoV7ffi3lEShUENGcCcG8FJeM/WGrgiww2+yCaicxFrV+GuvQQbt7xbES+5LMQUMqVh
	XbDdpnCXLQtHeBHR1qlR2ZWiOU+FdRGMzZOMZ5Fewh1rHWCQg4ai0Sl27O/QGiJkYzg0My+q28i
	yDddNNfBuJtlwqnfT2GTN2j6C7G453JtKEaTnl9u5wRviBA+6VCshMy1QItb6tLRyFfLSvZ2fdP
	rHFmV1+PxqFR59ZRi9Lq+7O+KGsHxxoqVpSRaNEgonP8n6xwK663fQ5eCbTGRIY88rAgSFtA7uJ
	EU5staguWyl+1/MeMHGdpEqK2J0UvWYVrTGat9V3gU1J8PfZYo/7gQzPTwrX1RAXXEW67fqj9AF
	u4HRM8=
X-Received: by 2002:a05:600c:3507:b0:4a1:afcd:3919 with SMTP id 5b1f17b1804b1-4a1afcd393emr93408495e9.7.1791991346614;
        Wed, 14 Oct 2026 08:22:26 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67502asm974715e9.3.2026.10.14.08.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:22:25 -0700 (PDT)
Message-ID: <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
Date: Wed, 14 Oct 2026 18:22:21 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bui Duc Phuc <phucduc.bui@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
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
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>,
 linux-sound@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com>
 <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
 <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
 <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Morimoto-san, Bui,

On 10/14/26 02:38, Kuninori Morimoto wrote:
> 
> Hi Bui, Claudiu
> 
>> For rz-ssi: in DMA mode, the driver registers the generic dmaengine
>> PCM component, whose .open callback already applies the integer
>> PERIODS constraint via snd_dmaengine_pcm_open().
>>
>> Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
>> value fix only for rz_ssi_pcm_open_pio()?
> 
> It seems fine, but I don't know detail of rz-ssi.
> Claudiu, what do you think ?

That should work. I'll test v2 once it's out.

Thank you,
Claudiu
