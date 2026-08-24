Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9E36B067
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575661; cv=none; b=oBhiMyWkCyiDQ2MgFQLcdYPysCaTsGwfaVS1ZKjUaEaTafkk0VBXvuJRy3e/7k+J4MTAq/OEtx2cPJVPry5JRQvG7YT9CauU/8DovU7ccQlPsYtF2Fs0XcGF1vy/vA5YRhJsoB+/oJDcv+Zkkaj/fLd7almeQo44O+GQ/HHJg6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575661; c=relaxed/simple;
	bh=lI76YK88ZltuQHg9+zsDOjRNQgdjPki/p5J+GduZo2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IgiKhh0gCOcokHq3TSbkji8AHw4MhkaspGOEOCWV1z8Lhg+9d7bwPfifEwdwSiVBr/3IAMYFz06KuXf4N+QocXYwSN716ZNY4UeM9Tw/V5WBK797M3y8jHMsAlzJ5rFwaRwGKAwAapiQeDrAKnDRNRSE1x5329k5nyYL3WmFzfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-836c5b01e82so45588257b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575659; x=1788180459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=Tcb63sG6JA6gLEWevWJJCsLor9AJp8CfRgAMUTXb/jvnVg+o3V4yIY/0N6brcE+u+l
         Qg+5Dhl7nibRUlm8h6d6XcqpII/omk2MAbVw9DkYP8dDeY+HkVksjHaOo80fz3Nnz5FH
         Tt0sgB4hC+kVhGyhj0R6z0v/CtT6vNK7XI4CBRdhlgNRNnhyz9mMOYg/6pFFB5bA1iyb
         3scDBk2jH+r6zK9vXmaC4HruS9ggQ8szVmcoawKZtMZzcxp4lDtFBj5X8q+4yE6xEW2u
         30ZSreVUYCyOzBydVpt6/DVPh8hIuMMRnEKDBDtmu50IkM4vRnzuaJnh7Tmvx76FYeiB
         gHxg==
X-Forwarded-Encrypted: i=1; AHgh+RpmypU4Kon/LjbsfB9XQKcDkEpmNL2ewPmah2yA0MElf/5gmwLD9Hne0CHh2NNtxAWXS/8Orq90Nj7E0Xvpe/MrKw==@vger.kernel.org
X-Gm-Message-State: AFuF++n18vCLMwPy7hDhYqfssNurPbfcwC2t5WOvS9pDYVuCC6vigiRy
	uAe2vmscLr5w1bj/njRj5fG9QYNWi0SxBa5bfB22KxUQSAufSzQB7ap1UlR+3VCv
X-Gm-Gg: AR+sD13j9b7Q6R6EJZUtt4K2Lt04B+5IrLENUAUoCfOEbjbgGN0aUo0YkneLFm6+Yqc
	Pug2P6Qn2SS6YanMIVNzHqDWJWsHSTZ8U7NJsVopc3mbJ/UlcETm/Nghn9Kir14aIndVvHtVPAS
	5LiJ/913bjZjV3kCdqjok7hSrwmxoQto8m+zTws/FMVmq1i+yZnrqGn6tAIsA5nSHmceCaWU0G3
	gvbx1chmvrcCswPfelSMfYB/dnmfOpXEJHmBOUPVkuHEuPUKdBBjgCTjA3CEiP+nFcTVSCxqDAo
	ETyJt8dX4pb3lzgpyLWUhig3g9tAv0CZTf6TQOlqyUDr/WhYQo0exBz5SPpkS3hcxU/SC4tmRoD
	qmUdfA8B2Rp4WDoqH5CW79IxO7Q97DehxAtQqspV6kKtJq8IHmhX053Gv94cZ/+ouL7w8GWA02D
	i3kQZNp3r2eg3p7RDpHd8YOIb+MHZ5B37EJ9urlEN1Ig6UMFYVt2sTLqwx+yl1Gjm3CoW1UNZob
	vUHT5RcsV4dtwfjlSe5GpdFsQF8fCN4CYOP
X-Received: by 2002:a05:690c:438e:b0:845:ddf4:a393 with SMTP id 00721157ae682-849f6a9f31cmr85993427b3.29.1787575658647;
        Mon, 24 Aug 2026 05:47:38 -0700 (PDT)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com. [74.125.224.46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84ca5188f1dsm32566297b3.6.2026.08.24.05.47.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:47:38 -0700 (PDT)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66c8e41f703so3976799d50.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:47:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpBY+Oha4uk6bo6wTCcmkNp5V96nExeZjp5CWkSQqds0bXeM6kpDppmbk+82HZmIaItKs4BnmY+TUQrZ2S4tzLwPA==@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
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

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
