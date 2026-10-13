Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901003A16AE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Oct 2026 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886373; cv=pass; b=YDW08BnzeIujl5UjA3IqR6+xUKo3L0GzXGZ7/I8aTvlZ3UzemA0KlId+OwLeIKLCllRPhovZC9tXogfMl9B7qn7WuvgBQLdeaTIl1vOu1Dp3u8R9n0HDTsTN8Vv4mgXr+Zew0Bocc0n84N9bvr3fzQF02no85ZpOmcXHY+G3PTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886373; c=relaxed/simple;
	bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tenxQSjPzYr0VagwkF+fdUVgbdClEe6LHSy7QVqvFhVXzfxs1FjsYPMLZ3oVBbX42hHNHepEt5iwHIzWG8ASFQsDRVIlbvLAq6QDYd53WrCxzGDo7RCdGDfhO2grw9QoNVk6aXuhldT2OTwRPsNXBa5nLCBgEp6VA1Cai5tdKlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mud9Rva/; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mud9Rva/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-887a58523e6so686603b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Oct 2026 03:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791886372; cv=none;
        d=google.com; s=arc-20260327;
        b=OAm7eSRIt2IYW+sHT/abXhI1X5Dd/oGg0FrhZEKb5ub7GnGkpuOyrfMH4ECZJJoeHA
         za2kMutX9U76OQFPXbGvApEdP3Z5K/BXdp7su6ZYpC2Qujx5/IV5M4m2o8NSnAsEotk/
         ico4EEJO9HeAbwgWXq+mvxLWLjX6K6g1Y/jhEix2dBnsVYfnPY4tbNh/DPgOZEvjYeoB
         FWQkiit7HfR2h3N4/MQ65vqWqCU6Q6qUKR/TcY9TNsZ0DlgA05a9GU1cVEDlq+jI3doV
         WnQcbhVUs9pc6yp1mS5IW8dVn6PaeorLBDIrJyBorHG8SRXqxlAAKkholPTqdBHb7nHw
         ldaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
        fh=BY50Swuxzb/F0qJ8x7A+D+3X/vFPUnCwfVFUFl+bV7c=;
        b=jK0AwFTv2N4ZeuaFxqEujWv3ozzU/CgoZYe/SGnXuryW+DpBPnFgF9oUuoGke9kqih
         nMm+R5jR4ts3NhmqEyK8zuFGLl6lE0GXeziEB98f0e2sVUHjz5RkVCmlrbTB/0W0XZHI
         qwvoTyv6UC5JwJG3BVOilgN6aTx83lBjxKSdATri9BqQwJGip0sH4drvmvAXso1WSV4c
         XS8YROY02vL0nQNlzbkksrrbN4q//eJ9y+HZfaFEdSQ6YWlyOyHlZGAXssPwNAFcwj/b
         R4X5pW00mTHwUHaSv5aPimy7anFZJJCJuYMR02Ti+WCAmqxijwazxyhdwJ0HByp1bNR7
         lP8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886372; x=1792491172; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
        b=Mud9Rva/LeFOnCDUIiPjQjYUmvHzEcsos0QGhI9WPySVqDhj55WYp3CBIAwIMT3wu8
         BxAgAi2Npnb6ADK75WkHPfYilGiZdZxXO+G73cim6wmjKUFEdskTCbMYSD34GXpm5SAN
         mQG0vwhMmUXSXcEPSgdLeO2iPPbdL70aUwzWj/fwSw6DbzB1v4ADzDkfkCdTDZYJQydR
         BrRHp48uDD3uCH45AcsVXKfCVbr2QBrxzpBfiKy6z+mVzcD/irRXIYh+IR+4jv5qnlYp
         laOfSmBrQPU2WDs2vLkw10SE9eH4rWbv8dd3VZu0OSzditr6UqsMCBepCaX0ZNYeiRDU
         CAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886372; x=1792491172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
        b=261/zQwvTyb+xfB+iVdcwB9yU2z4Rx8SrUp6LHqUhK+id7gnmtK0jTuN7oixo6NWhN
         M60/bnTdpg5N8zsoVl91vufLs1Bs7lm7Cu6Q1HH04cP4o8BG7osS7tf2f1tMo51cDhEy
         V4ChFkrqjL/9zH0hNLw0Q1ZPRsBOLsgdOJngQ/mitNF/BSu1Ih75W3mB8cmyUhhgO1pa
         gHehoJan4ejdKlYneF1wp5mw+/j8eo/SsTEJ4Y165fh5/gRoAvl2pwP6ruO9XjibXlfs
         urcbnJfAzGoS1WhONgkoRLIdakLkRS87r8HjhOQJHGH5yrDPGvSgTP7FUsRwEFWJn2po
         WubQ==
X-Forwarded-Encrypted: i=1; AKwUvBwt0ILjndiJqTbDTZLGNhxrn6+SSaukK2RjfP8nd+sxMJMUcqZ3IfLSbEBm/2jrEsPIKoyAb5D+EWOjbtBC5lf5mQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhENr5mUYnucxgC0TJLpl72Xhl/b8Kj5w1oetVb8niYxWAkd2R
	qSQb2FQl6pSDJABK9iYvasUjfI64uQ/SWlDfb8p0Ku6qxr9GqBepz0l1k7evox80Qcz8CzXbh4G
	Zyk5htTygOxjcSeDqBstrwl6NTjgKrJ8=
X-Gm-Gg: AYBFou2E8z7OgqGLQrCJZFhqU2L5sHkEO4PCu69EP7RJ+HPgEJNCOF6lOp7TviOBLLL
	Wn8HABPrd79XKvGCBtAERKHk5xhtL0pkZsTPoESvt2BNj6CKf29C3bw/ReM8+0zl+T+JJ5VNsCi
	x9pdtdcvI6+rL3hBAKLSLpKlboBOOpGJL0GB1Ehu78nUgLD6VtXP75zGZuE+E2BbANTrj4z7ENB
	kFL1Q3jPpe4cgR4VreoOoc5L0Hr+zb+frNOZ3EEsk4wuYnq7m6Pi+1zWMwvE7xTKqR7CNk1uagT
	7yg+erj9xi26BUEiFYWxrKJLTHDHBkzOm5vofqrVvx584t1sAwtkrSN418MzUWyVbL7vtMCbOos
	qV6cuZvCJ2Y0XxGsyUo1OMP9lLvJ7cPy5Ha4pe+QhRGceZfmquebWqq4E3ssOchsJoFI=
X-Received: by 2002:a05:6300:6bc8:10b0:3e1:9071:acb1 with SMTP id
 adf61e73a8af0-3e19071d79emr3692539637.89.1791886371799; Tue, 13 Oct 2026
 03:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com> <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 13 Oct 2026 17:12:40 +0700
X-Gm-Features: AclHuK9ysK1Jav05byu2z6c82z-Prt9juV9RV67s1OGQmeMH_qLrceJ2TQNxX6U
Message-ID: <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
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

Hi Morimoto-san,

Thank you for your confirmation.

> > For MSIOF, I noticed that snd_dmaengine_pcm_open() already calls
> > snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS,
> > so the call in msiof_open() seems redundant.
> >
> > Since the first call succeeds, the second call should return 0.
> > Would removing the redundant call be acceptable?
>
> Nice cache, yes please.
>

For rz-ssi: in DMA mode, the driver registers the generic dmaengine
PCM component, whose .open callback already applies the integer
PERIODS constraint via snd_dmaengine_pcm_open().

Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
value fix only for rz_ssi_pcm_open_pio()?

Best regards,
Phuc
