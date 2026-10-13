Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401748F016
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Oct 2026 06:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871478; cv=none; b=EbE1QNGrkKw3IEZTJLdD5wAdeXK9tLjU22z+q5woKw2wxe+2dyt/iG5FidRfcLe7gBQOZvlBlJAeQwIvmZ9KVWu3ukHdv6kF4ZafqOyKepwyvK9C60wW03Mg3cQ3VuXwEZLynuW3txqDulUwmNWIClA6HF9cJQGQZmmXizlmqjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871478; c=relaxed/simple;
	bh=Rjpe9v6RRYU+NG7RT5Zptya1DV0KrnwiYyeVJX03vKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5MHFlhYamtoMSOeWqewYUQzguJOixpAAx0nJI8n8sFMCUqw6OTeK+hr0BcpbcU5mvbKbhQz6i7V+vNeK272q2z4LmWqP/8gcaa8Ejj9PbfFjCzlDEXi+x5ieTpbxwankAI+UNNFlBwL6SS6Gt3jNvO4LfL0uX6DzUNcq2cyPD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4hbr3ff; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4hbr3ff"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1658786a91.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 23:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871475; x=1792476275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acEtVgfuadFdXlisXUuNZxKScLo0hQqEFXfuOZQe1a4=;
        b=q4hbr3ff9+S1j+R8AimLPx1f70G9+88Mad16Fi+2kjmlnO8Muo4ejlkIYcpmiO/AqZ
         YQxKNykLymkr6GhC1rtdzxwPb+ajPnj+VSY2anvgna8RaUkG2BYnGXV81+wWSwwMb5KT
         k3vHc2jN09FhdmRZyxuBconP8xia5Mm5SCYkaJUQlOgwwNwrJNNLCVGKyJNVyWnVUlw6
         gjIU/cCMjxmce2di5+I1JstYEs0KfQW8vf1lrfodYYxwE27dfz/hy7fNeoik3p9rLqmL
         ToKrpIwTbXt8NOf09GntKF/swwY0uIXmZg7MF4JHE2wFwcXN/FHZRcgdPvSGgjOWu3kE
         afHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871475; x=1792476275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acEtVgfuadFdXlisXUuNZxKScLo0hQqEFXfuOZQe1a4=;
        b=Ue6fxXEDFRFX7z5yYCPLz22honnBhR2uUDvE0EV96S7Z1I7r8NJc9EZaIXewhEvBuj
         aj9QdBmJXMckMiurSDfcq5At/WJ0okyXVB+uJiYiaYlSLT7+GVeNF9jO5iJvR2cb4m2s
         EJJldTDdwXbt0S6VsibDJ+58NvlziWyHxJYM7x8/JMUifB04RIS8a04iTpmVJYI/OpN5
         zBCXj7jSwe52NbK1zpPhSlltWE292KczHR62z7CrmkJoegR3jIpyqcPDaaPaClfT1CSK
         xX3Jpyrmjr6z3bnse4Vvu5i9Z1uD2Ywd7iicnbgcrd6YzgqPiM1rMTop8DTYlaBb4ENo
         AnnQ==
X-Forwarded-Encrypted: i=1; AKwUvByyfhSI59AjlwcnYR0IG/TXE8072Vqkyaxulfp0UKueXxAYV7gOgqwJmPUUBsUZVW2zsZgbTmLG05UGoT1wX8S90A==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2JEFPOoF3yeUoBQ9j0+ly4BkMVhxAyGiRnQiyvTJfVg57aDYA
	S8Op7hjRP+WSWrTz7F5XxdX4w3MznpSp6L5cEsbP4/hne2/KCys+xfLF
X-Gm-Gg: AYBFou0Fj0v6xUuntsK6L7A498JIdsihV5O7b6ALKCfo1jNy31r1TeP2RKtKFGkIhfa
	/EswE1aR0LBSNtNOuDSnL63Z1tKeZX2Llbu8ywLBqhTiQBJHjfEca3fX2k28rADoLUBv9zfNTSI
	YTdXvUypmdUDPIlNoe2ndvy2plGLEZqa+Zb5lxW8Ix7DJkBlXO5ossrJ8Lmx00+OhEedGO0P7E0
	7IJfcvU4/KzhFhc60KensMx0EVdOU1sRftQj+JAzpQuZGzGNsUrEYy7xcEiYOnnX561XMh8SE1H
	XlEC0Yyk18+ZsxJeg3PFqc+0NATptdMy+kRO9sVJP74VqYbbhTXBPYHevOjtDi/38urue/M1/ML
	o3dod7FlRVzaadcoKAQhxgbsscBTEWSY2xlV6wqVCqk549Ap+8gvG6lopyT1a+KIXrm/WNAkc/v
	WihCqJ+D+27evWujPCRKqr7A0jOKrndywEDUGfIb5gTlXjnSMzG0gMs2uV6ekfJbBw0UNjCyztP
	hGR10TB3TfnzKihRL4=
X-Received: by 2002:a17:90b:4d86:b0:3a8:6571:b43f with SMTP id 98e67ed59e1d1-3ab3a9f7f28mr9589394a91.29.1791871475585;
        Mon, 12 Oct 2026 23:04:35 -0700 (PDT)
Received: from [10.25.160.252] ([165.85.154.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23035084a91.11.2026.10.12.23.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:04:34 -0700 (PDT)
Message-ID: <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
Date: Tue, 13 Oct 2026 14:04:10 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close()
 being skipped on rollback
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrei Simion <andrei.simion@microchip.com>,
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
 <20261008103831.542533-19-phucduc.bui@gmail.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261008103831.542533-19-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/2026 6:38 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_pcm_hw_constraint_integer() may return 1, which is then returned
> from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
> when .open() returns 0, so .close() can be skipped on rollback.
> 
> Return 0 explicitly on success.
> 
> Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu
