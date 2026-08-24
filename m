Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C642D8378
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 04:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787544384; cv=none; b=EYjoseTna+PS5GzcCBnppIJN4vy3AZlQmP4+7OBl0OsBVFRF7y60SJSmeTBZ5Cj9zfhum6tVbrhnTc8OvjW9hBwsCBK5Dfy0lGfAW9gmleq4mrD7se6y/PpvHYOsYIFBpXmoSDxXt7H9UQJEZQ/hlG9Fvhwiu+diFiSmzGhqEZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787544384; c=relaxed/simple;
	bh=exbFruRfa5/z+uGWp84fkhkOcBsK93Ejj4V0SsqYGRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKiJ6X5noYmrY0wGWUty6FCh2hBt5fcp9qSYR8kGZLsqioavyp1TTnqlYusunk/12+xADj9OxRYlRGgnxtqos4G13VIluIaKYoBOjXe1yBMg/LznqoNXcZ8+uq0Bl53ncSEleCJCW7ZlUm+0Agqpfvw9C3ZHusvEMBjZl0XsNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dV8Df0fd; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dV8Df0fd"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so3081946b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Aug 2026 21:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787544382; x=1788149182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=dV8Df0fdIdQeW5VcMYGdimMWMml9HPoNZ2WkgPQjfMOHFPwkECh55LfCKqtAyyML9S
         MjBFs9EaIbLis9yaLB6NSOcASSzCJ0F9f73BhYUtOReIbiqIbT87e4qwovccdVeXTmeX
         25iAdIcCufkgZ+JHqx+a4CwZoQYpy9Pu4rrYpqK08GqRhMPl+l3/VQdb/OHhQWhRuTaB
         MKlK5hFTrlNndfmARdon+pPOkWvYr3LstNiVTc3az4i9/ipQFDH6z73mWn8XKlQocGdn
         fIQ5ZqgfzMV8QQPadDjJyorfE/LgANitQLRCu3Z2aJJ1x3bW2f8ThjwocOXGLaUqwiAa
         Y5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787544382; x=1788149182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=n+1QXZYAMaeu6M4M0IW91u0QF8rfJC5NcO402C+lblZ4s8kfLOq/1Nsphcnuv1ezF1
         ut9UHL7TLk9ZmFu/aE9YXc9Ji8NsQSvN1VdFxizyOh56vpuZ8dmXe1oopP3gwLbMRjvW
         hF6OpN5/ExTuxpQW6nps63ZJZvsUG2Q24aP51xFFAlHRBTwcnTQe0FGu3mvfScg6xSbW
         bZ1p8q0pSGHWu90fRPgq1VkLSU5pOLmDgxCZHV9RtmVyTtZbBd8rhNxAdUKCbCF9MzI8
         1KqOo0UUb/epJys2lcS/54N6cXnTAbRzPpDGyNwJJAj+DvBvPn9jsuVQ/WLXBycCQmru
         sbcg==
X-Forwarded-Encrypted: i=1; AHgh+RrL1nYuYO3Dod2jznYvPyMqsJjXFzmfPYnocSopDhp24QCdZg+Yz5RG6nelSauljMNkVAuEa7D/icpgkwiAIfmzuA==@vger.kernel.org
X-Gm-Message-State: AFuF++mEa4dqnW7pfKC8iCJD33T2tDU//0ZK4ma/E66j9Pif2IIjBuqQ
	lq6z5GXzf7YmEF8mPLq+pXn+ZaZL3b0rxzFLbx/H/vR5eCUEoRbMNaWdH/0IhldL8Ls=
X-Gm-Gg: AR+sD138OOMUjbnYxHaYqgxHlg9pJRW0mC29p6RUHOqOnMYItIoanAv11n6vHE7UUfd
	UitMIU9tmapfQegDAjQQkskGQzY2NAF459AAksHPpuT8J3Saku46WxSRIxqon3/8lf6l+MI4kPb
	SJw/ZSazQfZyA8l343j3Ag8DqQQyjXWWEIQVQ9cWl8F5MROmLXRMktEKu6BaQPO3lchKgCcrQ3Y
	qebVll4+Rz+y2sBUIKdYO4SHlaCSAFAOQfNXgK4I3XLhA1iTiH2Uyd1dLLVMQbtTtVzjVMCfk7W
	ef26M12ggYuLphDFyOBfgaF8rISsGVBTrvLSzNzJld2aPdemTNYW4yzdYU+w075fDt6Peb9bTC3
	/Sm1wIXaWZsyUmJOcc0OPhWS5picTk8PKlSS4rEuHYX2c0nr/m8sF3JadaKYpRjokh6sNaeO6dL
	oKI53lUZe18FTIQhtHjpfLyFXjsBemOCL/QyIFo2IaavlQRvl5hc9/vFtVRgfLHKY=
X-Received: by 2002:a05:6a20:7288:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3cd3008a6f1mr36995990637.11.1787544381391;
        Sun, 23 Aug 2026 21:06:21 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6ecsm19733419c88.14.2026.08.23.21.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 21:06:20 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:36:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 33/45] clk: spear: Make sure clk_init_data is fully
 initialized
Message-ID: <aovDOSMKhHLI70dW@vireshk-B250M-D3H>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>

On 21-08-26, 10:53, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/clk/spear/clk-aux-synth.c  | 2 +-
>  drivers/clk/spear/clk-frac-synth.c | 2 +-
>  drivers/clk/spear/clk-gpt-synth.c  | 2 +-
>  drivers/clk/spear/clk-vco-pll.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
