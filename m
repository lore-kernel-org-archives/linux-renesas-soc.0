Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B737333C194
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028385; cv=pass; b=uTkPixqrlnH55zq3Q8ANKaXN0DO+cjZRmV2h09vRafrBNmqm2rF/UwkPqZ/c5eYFick1UHtW7D5IfVhe40++UVJLz2a5H3I9pCFdCgkh21h7jnimJZyU7qcqsj311uYyADySdLEy1RbOFID677MEe6GbywP3SqROenoaznqItLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028385; c=relaxed/simple;
	bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQaptMtqmpCjlXWkGcpE0a9bPrFcbMKkFvXmVXFNLpjlrDUObdQLo78KZSwsgYM3FsyIecXjlIaoPlWwQzLaf4Mxglj7ew92uC9TN07F54AGAzLsxzKZKSN/IY8Hs45Op7p6LwCeEBDWaOC5nkKjDzDdQHWG56Cp2sHTZB0p4Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1n/68Qs; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1n/68Qs"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1918047a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792028383; cv=none;
        d=google.com; s=arc-20260327;
        b=NgjSS9mVizsRMdtVjVFkUOY91DmkGC+ryZAVUeKfvq+zfpUhhCBmf3MsWozHHP8bO5
         kNyDxn2NBSX6f8Z/wzmCJS/YwqJHeSL+n3pe6qstsuahaLA106Vmg5FHJIKwcEmGt6sE
         mCWrREMyK68Fdk8+rhcQBpHXMF9MDoSUE179RhrOuVJT9TTb0Nf/H93tSI2JqXKmZDYe
         dd19MjC2iQe7+bmXMymdnGfkUbPcMoK6gOiwBteAx3AyGConnHN8qzpwGc+spT9fTZ9s
         toQl7aIJ4m+qXuYr6Z3GWuGo3qjq+p5CQgbQVMwQ9A8gxcb1kFZ/bRAVfzHS6A9kMABV
         /r+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        fh=WTcP3b/3wIAtyj5d552xNPvDZ5QJP2qOHOR3ysVREtE=;
        b=Slm9UQYL5RD25/2ML3ouCLsa2azT2mg9gSlQv3QgjukEn4jk0bq4cE7UoZDXkjSBR3
         d82B5diZtyepOwNEyDwHSowVhDXRRKkSQRaHfuEXSwExboq+9ONd09P+q4YKelk9Md11
         tMPVwabxf5km6ITdETaea3ATtIyqiEAcK3jUu08qt4cG370SK1z4n3RoY2wFHLT55MgU
         D+sg2O9eRLzBoTDfbX2gLJtFeBSmJIQyLgn3BHpLu1/MXSGAyCYise+jss29sLo0ZZ4i
         Tg9XRGV2LlPYBO3wsEiOOWJUksc12xvPXVrHXQ+1m6dexsOxJaY938jEx8VGilatt51i
         noqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028383; x=1792633183; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        b=i1n/68QsX5mSayOSTyq612muWvig38beYybjN53xxBowSpgKghyZ6wLe5SrKRhhFLN
         z7VEKfLPkGfG2/zX+ux25IZEL7f9Xi3dx+zNQtEhna+Fld8jir/Y0appgbtwM9AhTyTn
         cFtf5G0MM3ZtF2rOfVXOL9T4tCmaBtLml2ExD+NrV2AsIUd0uiADbe6TMwAseyl0fs0l
         ME3EELltZr+tcP01gHbOPNZmdvrjYY17UkYzSdaZZcxx08jvN5RXef9ZV5nyBLR7zKsL
         a0OiB70a0Z73i6ukXnGBCyjqZIjM66xUfkL5i1e5QHQSTD2ujy256iZQHFetz10tWtyS
         hxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028383; x=1792633183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        b=B7GfqIO6BSZVr/5GZlzCWv+Q8whJD5TPv9FLmBmR86YHGMg7VlVTmn1At8og35518k
         AXayyk2HN7WfIlKE07yFs7owkrzXkKTUWRZfISgRfFjshbsxtcTlZhde0BQ5ViO+mamh
         m38aKVY7G2XUPuMW+mgCqlyOZqOn9q2tPPoIjtsaV0i3d+yvQRzQg8dlPsdgrOG8ygpG
         XLZ+99d3Gqg5QXbdivR15CkOP/xYzrH+aNzDyFDU0BODCSHuV1rCwHGaU3omQBDj8830
         KX5BVQqJ4uH6PXXp3qShIj0NmFa4Ef9wIdW+MstZ6lhDpZ7io/aZSkAzBi8ve3dvLdUb
         RfiQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5QZjsolSLqAcc3M9N9YK9k4XElre3yAJcCJERPJo0mu5dYaGzHVCJY2oF0QIoTqhRdXM6o/leQRNz6/iiTWOVEA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKkdV5u54i5yheLaCtVJXlA+LNOUpsPbcBiD+VBgy4XiFLQoTMn
	RktFSUjL+lBlCjEfAGpLtV6KvDB1xPNSPahe5gGClIRy5f1m3bO9z1yez0+IbgMAqU6NPO1LWyF
	lvFjjSLSfpkQoYqeE6SbvTY2BVlMjZ4M=
X-Gm-Gg: AYBFou1yIcBEhiiW6fAAXiwo1NBbCYjPGBJVN2YEPexXWozTu0Ud7rAkyMd8pORUmRn
	5VRfc1+DVqHTQ9dYRDSzEDqCugCpJ9UZHOT/BZQlbb8Mdon4jinpxG+NoUVUMpSwQB8cnqPyEPR
	EHqPyq6P+3fI+HBF+6N85R6M6mmgWWfFI0HJo87Og7Aq3fz5/nknNYVRLW+C9OtKYvN4rp/PzIJ
	nw+Qs9hOGiguQ+12vOWSBf/OtCWf1J7C+rnLYEDDXdP7zOEkGOcRiGA5AIgM+RhPhCzLWwkMZcC
	x1JBNmOyIJgyvwwU5CCLu0wX286O3T6A2x2dGdBwnEXEUqwYxkXk0tG1fgcuBvtsCn6wMJKf4pj
	CXLii1eP12fuFQ8WwyqwJi9yHJ6/nGfbf15PTuOeaj8sH+kCvR9RGacmkbEr4E8Q8hMI=
X-Received: by 2002:a17:90b:4acc:b0:3a0:e1f7:9b04 with SMTP id
 98e67ed59e1d1-3ab3a60ac9amr16312045a91.12.1792028382966; Wed, 14 Oct 2026
 18:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
 <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
 <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com> <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
In-Reply-To: <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 15 Oct 2026 08:39:29 +0700
X-Gm-Features: AclHuK8C1u90VDPCucQhY3afyuLfcxP0SCIJrlA3M2hLxVwcjMsqinLCGr2nhSI
Message-ID: <CAABR9nFA5p=5hnMoxFHLtmGEj4kvfrN6M6UFPnm9hRQv_CAP6Q@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
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

Hi Claudiu, Morimoto-san,

> >
> >> For rz-ssi: in DMA mode, the driver registers the generic dmaengine
> >> PCM component, whose .open callback already applies the integer
> >> PERIODS constraint via snd_dmaengine_pcm_open().
> >>
> >> Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
> >> value fix only for rz_ssi_pcm_open_pio()?
> >
> > It seems fine, but I don't know detail of rz-ssi.
> > Claudiu, what do you think ?
>
> That should work. I'll test v2 once it's out.
>

Thanks for your help and feedback. I'll send v2 now.

Best regards,
Phuc
