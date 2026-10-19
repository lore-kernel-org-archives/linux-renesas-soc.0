Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CB74EA397
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416972; cv=none; b=rGDS5/RnEohRM/kBvFbjjgJZcVaimcxaKTs0QyEXYjZNz395tVNJemUvbfyt/Yonx2qtpeTxGPPBSBKWF/m7xJb0K+kRjGECXEVXcoalPp8NxBHRObKY77wLRo6w3beEe7AsiLGnaMyhdv/UtWULKCVIxp1INILjkzRn/zTm3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416972; c=relaxed/simple;
	bh=0YRsJG0zikzQGyPZCwNj3fX9FQhaRP08kplHGzoklOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRCDrMrceJZncRD/fvHtMQIPwNIXYfL2ZFBOI6Erh4ZatfNEPGhrsITtdMGUIiU0pZOljYGar30ZlOl/C+PY4BdUA516SEsLHtvJ5m0kJ9FxUDMLBJN9Tsn45BVuDlTAu2phhcPTEL/Nkdx/P54rfm0nEXmJ2wwcxxwb9ChhyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YsGlnA1t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YsGlnA1t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so16024175e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792416968; x=1793021768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7QI1RqFBazH73cHjUm3bJRQ468s8YNQSYzETjY7O2I=;
        b=YsGlnA1tkkMkyfgl+1EjIKdeVt42ERpVq32kDtbsL4AQzF3AKBAGt4plfMadWyUg3w
         QS53/OD/qWkvgb9tJMAY3gJqqygFYV/W3Uidq42AXc/wn6aMEFGkFv7whkNPA3Qc1KFH
         RAngo3ihvgB9c0YLxVa9j3O6KABwzqpCgYVLvoHzSLcu1olVNHyDELClMccU2zO/20Vp
         Eln5hlyaHuDTsyn56R+JHRFnKpYDwPK5ZbIBVFGlu3p1jvF8h8uMTGtWWUO2wy42YAcp
         td49/Dbe4i8u10buM5zcthSmGumEc0B8Sq0mqlNCnLIwxh+Brno5ouw3Ah8aaiV5D6x5
         Po1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416968; x=1793021768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7QI1RqFBazH73cHjUm3bJRQ468s8YNQSYzETjY7O2I=;
        b=LRCFhW6wyAR9jL85TfGJ0P9JyidTxTkmHAPWAGlS5vZ3klorsGuLBprmJ8VTWYu9p+
         p9X1bG3t4v8/LaLTh4+D7yK+4Jokst5xqzE7bnguu8gconVGxGzDrAl1JHIgRTfzshIy
         1nwMFly9Wyuwxpb/L1bGgmsSRHreS9PMjUzcSCZYKIHSMCCxht4la0dkUXkrLzeOaNv7
         YJypg5m0qvWJFLzB9Nos3g9ajcD/2Kpac4Sv8n8oKTXNgCCNTh+lCDMcx8cmN1cDU9f5
         VMqDoFj8rHXwoQAUhZ8gYLYicu/OH25O1dOIB8UgSRwnPS4qtgzkEsypHPy2/h1Z42hO
         0pWQ==
X-Forwarded-Encrypted: i=1; AKwUvByRB5bLLGLjWrcL4/RuZRANEGUdkYJTJytOkHCrAtXjMGqCk+iq62qhjuOUnstZiCTFvZyWqNSmgBxs+lv6H7qAsA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIURJJLYSTxC7FujrTLDeqhhxrNBCBOX017B1D7gpdzV8IIuC5W
	DxLt2EamS5x0N8iVSSo5R7nH4I7txCywCMCP/w0Vck4okAxQ4OaYA5W6TvL3yskYASk=
X-Gm-Gg: AYBFou3PF9th3D8pnVY+9UYG6+OUnnELtLiuzRwDVjv5XcMbCJMUio64XdgdXd5oP9d
	O22wnFQA1VVbBKO5G80Iu2c6ffYpMdMyRIwnVZ5Nn1CPlVo7tXHrywYUZyszX1A2WdJZzyL/Bav
	ANXAVa5XVlapbRWNUUkORenNfhGcEIwr6DgMiaD6wWrropZ8NLbTD9uev4D9ovb7E82z7EtBoB7
	4d+BDd3zWkdfZ2SY0SrQbTSCudlp2l+oH9+gOH9+L3A673Z1SvjSmJxUhSUWoN/hCziiWYEEaM/
	bAxS2NP4ZmoF5NADt45TTG070Teouu+zzlSgSa8EWah0OlqDDnJjeNF2AqmBHKoXY73248pDTQR
	f4QVsjRzyMEvPWwoTpK+sEZdfi1inWGktNal1xGrwYdSs2M/Tog1phg4WfsZYwzH3aMwQ61OEYs
	KEnBFarb7QqFT1T///bYNKNFgQKfTRxGtbUTm3pGbE0EyLlq1F9fmjeFuM4De3c8KQsJ3AfStpe
	dGTollR
X-Received: by 2002:a05:600c:c168:b0:4a1:ed0c:f051 with SMTP id 5b1f17b1804b1-4a1ed0cf21dmr30497355e9.5.1792416967770;
        Mon, 19 Oct 2026 06:36:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm20387473f8f.37.2026.10.19.06.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:36:03 -0700 (PDT)
Message-ID: <0cf7bef8-42fd-475d-b47a-9cb8629644ed@tuxon.dev>
Date: Mon, 19 Oct 2026 16:35:59 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] ASoC: renesas: rz-ssi: Explain component open
 return value handling
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
 <20261016040946.521195-10-phucduc.bui@gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261016040946.521195-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 07:09, phucduc.bui@gmail.com wrote:
> From: bui duc phuc<phucduc.bui@gmail.com>
> 
> Add a comment explaining why .open() must return 0 on success
> to ensure the component is correctly marked as opened and
> prevent future changes from reintroducing the issue.
> 
> Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>

FTR:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
