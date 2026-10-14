Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915247F2EE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977977; cv=pass; b=Whdjr+BC75q2BniChzoLGYUQxuYTcinYD6YXm8WtxywpHthgZzknPCppoVv06VEAPrME7Oszb2mooRhHTxxZUE5jYkZKhjni3DOCRUdaOJARemMOuWqXx92NAj7ap54sqYNh3M/rIx9v2PvMFm0iEYWLWlqdMpVzwY1RIO1hf90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977977; c=relaxed/simple;
	bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtiCcr0vSqS+hb7hyJMAN2QjyMcEE2S9KiwlJ270/kfvuhmIAQX7PyjEEG3L+77c8oaaa573UrvgY2k1t2Z7GeNWr4XnTkxnVQy5z2mJEeumpMkOd2Z/KmQbd46fX2vApnFAE/xttKAdcZbthhP4nUWbDl0bAGiXIyfciJh/kqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+sQR5c8; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+sQR5c8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e5378b281aso21591365ad.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 04:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977975; cv=none;
        d=google.com; s=arc-20260327;
        b=he5lgaaPoukGYHG2dhiIqjyi3fUzdf1g8ultMuODspnvCRNSDT+bheVopnww98S9DX
         0LPYDZYfAVnJoH8Goo8RKp2RQSWAK/TSVHI/U6t3y/OXTpHUn0CVy5Uzu8+ivBU/eQhB
         8rTkXrCJFZT7dBjVXM+tIK1fA0c9lWkWunn2eAe1GW9xNMCOnABW/7ep2XTEvH6+Wm9j
         K2tyTkIidNniWg9eT8r5eKyBJyEPpg0nGOPP9wEqKyDSB+nipJbKdgjoIzXMKBHcRDgh
         DUdBK5GXj8FmS+nsSMTK85WGQGbeIBcmVQcu3LTzynSDAgjq3eyCU4k3pPfxX87XarTo
         I9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        fh=DY3d5sceldczakwYWpe7q80IRO3ZWEZKVpk/l/jeYHc=;
        b=mssZoHymOjEIet9CXFEmkSONnoQiy+QP/ZkmNiODo/36ot3fR4B+71zw1GC8+RTAoi
         9WdG2qdxqg1QhxkW9jOCBbd27oigRuVrKbb/eafw2o/jKwmMDXlnIHz5zpOjHBpcBMEz
         7y3ikhg2AaIWgBgh/p6jeMCKQFez5i6zUBGJHj0HeKO3m33SBgImfrvMA6917d+Opmg0
         APG4ah+PKBrV7Qa79sjxMcZIRbRW8ARtD3iX06LAK4u7cZsGkoDbsXHZR5a+4X/mxmgR
         iqGpkZttNdbquQPws7cManWzadkH1krTt4jZRZ5fRN6VCAPYPGUGU83qDTgX9+GWsAlA
         BESQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977975; x=1792582775; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        b=A+sQR5c8D4G5VxHcInTcqcfMRvjDjawE0dD5GndIvxUePkoZ9zfSmrNnRh0ZI7vgxD
         aYegV040fT7ti495IHM4LWCoJ2gPyoY9Srgzo05GnVqf0Z89TuoxoXTaLJgtHT7OkKwi
         FOLF7m29ruhHQZFjNUAQ8SI1O7svvgEOUWp3IMMhhfB/jwKzqP1QxcgXiMCuQPJgifaB
         3q60br17NTrdyynUVqu/BfAXc3/0dRgI/B3XlpgjLew5XpDnm23u59ohtCEOzd2yDUTP
         Xmb78cbtMN4NOngzKlZfZKj8UNxgajndmLDj9mOAXvRWBHDk5cpCe0mXRdDblQVDL1iu
         H4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977975; x=1792582775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        b=cM1zVDEpBOchbihjhZgMFpHskPcV6MemzljJXTMjxSkFe8ULmvATlmEUmekvF7e8p7
         ZNYy5BzNBVw5FrxDthFMjhyYGSqm3d93vLl8P9TgGfNe/3lIqZVKuezyZnklJWYUoMZ/
         mEjNagHIFExP3HYUFKKUn+mNZLgK6KU0ccuYy9tko+xMVnvPRaLmZRBAZrUFAjIgPCrh
         QlgqOL5IX6Bwo8AmNCqHKMtDLeHq3oIgFdoiuwyuj58IB6vEXlG0CmpCm8wu/hMbKrgW
         nR74JLBWwWxSPxf65+d5xy7JiaXvusy0VljEnLWVYaUkfgGmhvShZXExQyZNGO4fCVLA
         VpBw==
X-Forwarded-Encrypted: i=1; AKwUvBxy3gxN1TQF3DE4C+oRRHryR5nOmr4DUn/wK5Y4pZvEv3LhsjelcZmUSdaKOl5okUI3IwT+JGy3nhgGa2JAdIww6g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKelCjIrD5AiRyeB4eyUmxghQeETIwtScI99wGD1vO30uwn7PkL
	blx+fvld4mzt/c6sm9MguecHuv9aX7pfqVhydPkxeNNwlUFy5kEUFj1mJQJX0TIkrtT3PLH1/Ch
	Qybccz5pc/ohS2ygQk0wWe6lyUUjDiW8=
X-Gm-Gg: AYBFou16IqbBiyH0Sh0SiLxK/p5FuS57ojIwM90pdCwfLgtqHiW/4NdUDj5oafwoFDz
	Afm6d26XnzJAWv3lqzDohPqb4NGeIqzx2K656UaIoQACh2o2oIa94hKis4N4f7LfgpLEpZ1G5XC
	L4XqsIhFGuH5D5N9+qqUo8LANvpFWf/GQ45yprbXKLZXq7WPX3ZFbe3im/Pw+YSxjBNa65/gmqJ
	j+3nlUrjQ2C6LAnLlLcErAnYPv5WYrG+c3ExFdjmbg4n2QHvniTm8ZQGZc7PxPlRnclpFbH4pgT
	xnlAlLN1b0XFGLB9GKNeXvD1E6HfhGOHJLXnkKnLbxygspgaV0a9euVJ2p1j3rtQk0YUQG8OK5t
	ikdl7DTQ/MDhfB+Fy2KXceY0Hc2Z+mHLaq/SNPJLDJn3WFXTNwJMolfYmFEF2Yi76/4E=
X-Received: by 2002:a17:902:c946:b0:2e7:e73e:7091 with SMTP id
 d9443c01a7336-2e842bc6d99mr145871485ad.31.1791977975265; Wed, 14 Oct 2026
 04:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com> <fc30ea4e-3c2f-4ba4-9ae2-054db9b49fd5@amd.com>
In-Reply-To: <fc30ea4e-3c2f-4ba4-9ae2-054db9b49fd5@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:39:23 +0700
X-Gm-Features: AclHuK9jgQVtz3xDN60LQFsNWM2GDbLorSH_eG4NihFn39vhGI4sDgE_b4KgxkY
Message-ID: <CAABR9nGbO1tBOL=fN90ZrYPkv767qh_sJG_UHP-FW5C7sBPpmw@mail.gmail.com>
Subject: Re: [PATCH 00/24] ASoC: Fix constraint return value handling
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
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

Hi Mukunda,

Thanks for the review.

> > Found by manual code inspection.
> For AMD patches:
>
> Reviewed-By: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

 I'll send v2 shortly with your Reviewed-by tag.

Best regards,
Phuc
