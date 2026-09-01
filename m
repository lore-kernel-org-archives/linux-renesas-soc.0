Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4942C21F4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Sep 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247310; cv=none; b=OCEZYI2aWg4nqrREMJEBsnww8inhS7qIKOnpMwarsDEjOpDZ4ajrqvxGSsB4UkOb+FI1HWRDwo5mKh8QPYn4b9z7PWkn+gOMdtELEin834O7WDu87U6av/sVHujTF8Wa1dC6uJvu6kJmtW0/7qXzjetoAy8HYdnjzk0ED0rNI7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247310; c=relaxed/simple;
	bh=TJW+ZiT5oYVtElCrK2VJYF5Z8RxcnedgcUFRUh6BMIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBfAT88vcY/bRTTrchGAiAsgzPTXesCEuImhIHtFTsAqlxLQSXpybJOOKfzSRPBsutqMoaWS1pFQuv0hvgxhoZiU0ws0mFXyFy/Rrm5XBZlybvE+q2y9LvvSqTc3ruoY4B6lWhQklCN1RNbjLFZ2bnXLUTUVFEnVfxE5ySAdaKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53016020b2fso26192851cf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Sep 2026 00:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247308; x=1788852108;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=s4mUISkDGf93nKwF2Ji2NxqDtMY/J7sX52pD5pqe/S/VKNSt745jf/gaZB3nArjNi2
         imaUwda9ecrp6zNENDkEc7oablwV5lH85mhItF5F7pnLB3tU/DLqs9R29AiTnno+gqrL
         VqJWarVyQpFOeumKXbVplPyTS/EHM1pinB+cn+iseQSLuLRyDNp3XPO4FdPynPlldAOD
         f7wgV6czZcd0ahhaLIh7dU/k4WfIvh26OQhC3X7OqD7ZybtM/XweD6iTcw0AqN4OgbMs
         mKfUle0JlEFoGnQdxhKaFtokqNip1szfAZOze1M+Wax4uyRa9snkdlSNLieNtcFO7TFR
         pgfA==
X-Forwarded-Encrypted: i=1; AHgh+Rox/siuPCpwYbkXN1J2JWOLv5u2L74DTj0IUYJNLpEaMqT7zRIIyfOvt6ID7OlXOwWTYCRyxghtDvV4PSe0mwIv+A==@vger.kernel.org
X-Gm-Message-State: AFuF++npUHoM4kJGDKz4YPeYnbvT3MkE1Doks2ChUJAZz++qXwj5eGjm
	R3NlaH63CsPi8/o0yUYhYpg7BPAFqVbL4ztup9/XA2xvIu+1RdUC7hi8TTMpvpE2
X-Gm-Gg: AR+sD12B7SCk1oX+1o337yidMar2fxMatfi0voXdjvnZ5vzopZfL1I4jiiW/6R2ms+Z
	kWRLxCDorGi+IM/eEdJDXSEfZcCvoIm1qpVH+475IbDLdTJG3cwiWnJYDV/9GD1+G8e/GbmjvHI
	I2vb/7EDgwAwVl+hlMbUyaBISZNUT99ImcOHhIso+WOkFfnBtN2tB5kKXWwW3tgYWepBnZQOrJX
	sxQIv8FIoFIk1UdoJ3+TfKNZT/+H5yDJd383IF21IZCbRzfhl98MgBII7TIR6rSwBM6ax+kQhl5
	pORisimF2V/05B5MaWDibdpRnSaGtABLSdwOZTtr4TQNFl3N9F1KsdRDqNDs5ZdVkHJoVzayTUy
	YSjrMIrjM7/EQm0brTsoxZYHl4IpfPnJMX/wUMC0pHWDUOQeQ0LI0LO4T+GkDsVuj/EcBwiKwBp
	XdcdYg6R+4deLPRDyctai25ug4DTEQSYWbY2AkzpZXsBD0qZVuwyDFSr5tW9SczNqHM6iOSMC8w
	tGzDH3NwTL9DSgdnTsDUdGSJg==
X-Received: by 2002:ac8:5753:0:b0:52d:7b2a:93f with SMTP id d75a77b69052e-52fb938d28dmr355363841cf.3.1788247308168;
        Tue, 01 Sep 2026 00:21:48 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe7fbe06sm89672341cf.17.2026.09.01.00.21.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:21:48 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90ce08834feso60995806d6.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Sep 2026 00:21:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBykzqTMt6RWrUi7qgW8EjESs3C29zoxESPRurWGKSdsFC448wUdx4gtgm8z5H0+Mp5M+edXSAXJ95zwDwnfTYZ7Tg==@vger.kernel.org
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
