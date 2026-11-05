Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870871;
	b=FI/jjLAPFipSfQVq0TWhtHawSrV8/RHGJTWqfCBGBNQEJz72EBYt64Dcpquttj0Yynuh
	 W876Eh/fu8GMivjyCJbrEoLvwcCfJ1bKneBdiHpv8PG9ewS3cUJ51SBPNqQr3ZtrA0gOa
	 Er/f2dAXBwNN2x33qae5vB/0oDPMsoxT5tlQ/SwynM7Pjtu4ckHI2hTsrRBWPslyynWLy
	 O3c/2w2H6mOdIBlauoKGoxvHVYI5UAI0cEO8+SdmxXmcaKRdOnm7hxXFq1zoDMXv+d28E
	 U2/qc5O+38ETWprkJX0+3J3E3EA8d0GWvzXLsvh0Rbjs0PY62v/Sgua9qKfgRRe5D/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870871;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
	b=SaHx4x1tKC/G7EHq/eTeo4sgOrGw9nBHvfBHtLlAMM+6plG1wtrGM855oZz+8XMi+eXs
	 sz7grj6OL77nlNPWae+a+sb8FKVv7W5WHwQxkkZzZTs2vs0Fcpi71FtB9TVzov+3KTevy
	 l/cAzUt9exSkCdCXPaXuShYjYjyrCc5EHgChrDa5iGCqcJ2EGVlzKdFsa7jugvDF6R27R
	 3+xIt6PZyNwoFqTv4uzM467x5Nbdlb/dY6kvjMBGKoar8vreyrznkoOo//2gNLZyeLLqF
	 MFLYgmrFI3UAZENw6rqfQAWVJgIWI+bx9cGB0M9QNAPBB0D5M7oS9PgFrobinFdwS0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED48606A326
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 09:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED48606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53512cd2f85so18321081cf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2026 01:27:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870870; x=1794475670;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
        b=n6aPAlqPcXI1sG/9jp5kW0KbbIAKOF3wwnRv2sE6kGlxHq+YB8k1IXZdtXCv1q7liP
         ZRKGfQsJnxj6kTW4EBZP/4U1vqi+HsknXPKGgQgBFl1wlWkckGxPPeM8F40HOK9Hw6et
         igHDIPhGyQjFegdeGqjJNze2hgaJR3DIQ1TvwXVOJCJtTVjkBiJ1blGFnuhLIBI7LGe1
         PYrKeb7+SEKJLVupveu/Tb6LQHWv6KPh7C5RW1AnW2qLb4lfzESFMCPzpRigBOS2ncoU
         HPiuyhRxe1qBttcwqoWWQJgCCyBsE7QY0msjIUzWzQDT3uXf9fJ2cwuJCH/6NyegvDL6
         Mvlg==
X-Forwarded-Encrypted: i=1; AKwUvBzD+OHj1YhPLHpt0YoLLGl8vNs3ybsxntBX7BNRnr5jJCDMj9dRdk+NkrX3Mx4FoJzOL15rOZWEa9YD2t12YI/uJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kSqLLZ94AvjjR/FHsPHfDFMKTp2348PV7GZIfPh2oyQVbF7X8
	JNXlNWlF9KS8ljH365u0wxWyuLAK2jk9c0c8n7I2Rv5iROZ/zMTRnYHkwiazGe1VMAg=
X-Gm-Gg: AYBFou1NAef132izInCk9JCAfRrfZ3ApCO863cXx1Ubb//RhvxZ9Pc0NSuO9+wExeXp
	y32foA9dqZBQgOBbMeskM72vMWDubJ8Cgp3VbZbFaVAnK7rAYpsMx8b3g7S9UslJGpBcNK1TfFK
	kWfIOgpo93o8m/joQzJTYeiXIj3UoYyzhDlwiaPwXcZQMBEmmxKn4u97yzIMRCxDR30vCRjHvRA
	YkVS3g9pGAUqdM+rwl1JnF3HYSkfe2hGb51NYnI7U6auIzdoMyHCsmkALFrPjNGpnzpypadBh06
	mhC9d1xvzcZByXu/rI7g+Q2QPaUvZX8MXfa7xZ2VAebnL4QrDsKifVYu1yZJ3CmDtsuVz0cj6wd
	xba7gxSiU6nYoXGKfKPboEtEQCxwHLK7vV7JcPFQ0WsZ//Gd8cDSTM1mgISQaiythPkwL/oPAiz
	zuaV93a96rqmFU/89MRvZUz1XRQHyUjErTyjSiETST2fG079DrLEGwSwGoDdBG5ZupPYrFYxJ6b
	/EzHasecHEeYxBJ+riryrhnpXQex61pq/pIHSlc8ZfBAU6k279I8ccApG+O0ecBQrIbx9JcemJ/
	Hu1McPn8iHRyD/NUShtHGB+ARkOMmI41Bn2fvHh+5IPzMWHC4l7r1UC1NATaS48kdWfshr6Xr7U
	PDccnfO7WWSRkSp8=
X-Received: by 2002:a05:622a:181c:b0:536:725f:24d5 with SMTP id d75a77b69052e-542b781bbb1mr308274751cf.52.1793870869913;
        Thu, 05 Nov 2026 01:27:49 -0800 (PST)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfbe832sm42860066d6.14.2026.11.05.01.27.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:27:49 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53665358476so17326601cf.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2026 01:27:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzx3eKCXvV3Gqpl5zCj6+Y5atLbVr5gviOkIxqTCk0i40S8d2FGjhngYNadedsgJFj7wgafPO0WDvACsrZbKtJiHA==@vger.kernel.org
X-Received: by 2002:a05:6102:e0b:b0:7cc:1045:610 with SMTP id
 ada2fe7eead31-7d072cc4a42mr6604019137.27.1793870415083; Thu, 05 Nov 2026
 01:20:15 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:20:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
X-Gm-Features: AclHuK-9tAw2bAtaZucYUxK8rDds9GR808jJtyoj1R1Fxu-dNuDK-M2tP9yoLrk
Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Wed, 4 Nov 2026 at 16:30, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed set_callback in rspi_dma_transfer() (sashiko
> - collect review by tags
> - drop void *

You have lost the "# Renesas related drivers" part from Wolfram's
review?
https://lore.kernel.org/all/auoQiuIm9FxdOrYl@shikoro/



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
