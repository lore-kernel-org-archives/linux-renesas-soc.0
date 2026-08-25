Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78A443ABA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670718; cv=none; b=j0s9R4yvJSLcAo2HWvhAP9u5DGfBpls97KWjgylshfhQ0iXLR2WT8fiNQmmSiZarGeDJN0v+6s6Btqokxuoq73gZAcaUczDXs9Nrlj3OqayGv0Qy2Ao27+ukPAly/D7xm3LhrKPl6ohecTRlrlinvxAdd1a6MNKl2PlOXcYjE+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670718; c=relaxed/simple;
	bh=VSfhDbGuaO6bj6wZHF4WXo8dJZaWBr1sYjz3PhauiKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooj7pLQgMKE5ATB0ZXgecrx+sCZyYiGpUjbxGa6Gmo4JZ1L3O/O1StMZfLuK29ZqYL83E78vT+t+fjpMXU6BenELnNmIsRQVUSuGq2fhl8931KwZaNhp6Vfo5fvjraW4F9nAzy3t9sGCTye0F/62lShRTKHcdFn+4j1ds1psots=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FlbTmueS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bbGS78/9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FlbTmueS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bbGS78/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787670714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
	b=FlbTmueS7yE5ScB9fPbUh80T84Vhw1OLHiljEbaXRzQE5L46iJb4WZidzd8lwOVxIoU1rx
	IGLoXuZKcaLsJksp3EPtjQJ9HIySrN6Vhc5TOxzxPzI1G1zDdvoFZravbHngSb5SJdoRXA
	FPWe+5uf1m5dLr0CAB4YL1Y4Q3tfF5s=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-RPKie-1kMVCUg5jG7CYtqQ-1; Tue, 25 Aug 2026 11:11:53 -0400
X-MC-Unique: RPKie-1kMVCUg5jG7CYtqQ-1
X-Mimecast-MFC-AGG-ID: RPKie-1kMVCUg5jG7CYtqQ_1787670713
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso70369631cf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787670712; x=1788275512; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
        b=bbGS78/9p1yjB9MFkt3X59TwOSQ4HBwGLUhu9/HyeKRwmdhY7srFe7ByrGEHvLaF3N
         WjzN8xCAxe7gzwckMrJS3Mnh1VOnkMSmoVgzMdtHmm0CV4wZctg/5vfacvyg/datpLi7
         1EOXnhxSXRldED2FdG6LcOoJz0FgIU7MnPRQVn3k1+aeebnSqImx88ye7tyIROheW66a
         zY/QoUa1Z+H5dOJcpp7UKdCOkpWAkzFiyT6sRPI/2ydKASRWbOaDM5vNWNjkz8gkAYbx
         l/13wsQXIytWBXb+EWmxh0SZaewGWmN6e7XWSRjJjff9GXCUactH/ugQEiNqFgun9rEP
         L+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670712; x=1788275512;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
        b=DV5/KbrTPK7t/ADF7QISlVp40Mi1KBLrQnCSFG+FXDoEZp6K5We9EdirEnfavcyFHL
         wiN2vCRzVYZ9hnSYbeZYoSv26jfDy1LnDQr9Q/ScqvlEWE08PXEuf8cSqgoiocy6R7Bf
         hNomZq0cQEnU7+/+spkm4k0ZaJCJeE5PkOwBj9vLy8acCZ6FHQlFJOT17TCUSyWh0MV4
         jZiD9SiDxHf3VwdPC2IHfZinuXVVQD46Jqkcm13yi+T070YFTKzdmdh3x/KGdkJUvnY6
         2IkfDo8uOejfmerb8LqT8/Y6RWC3ZzN8t2brX8tv5R+aA5PLbDmjIiMlmHkGEAY49b9P
         nWWA==
X-Forwarded-Encrypted: i=1; AHgh+RqevDeIr5XgpfjlNqtCTNF+9+xY+zQAcZnX6psboVQowklxx4XJ/SJEkSLeTftAKwLTOWYQQyC7khvOmwTDpSQcRw==@vger.kernel.org
X-Gm-Message-State: AFuF++nb5TEEXoByGt/H8U2wA467dXjyy0SoLO8zkjQzy9DjJjqD2jCv
	783wKtaR15cZqLyzHc2l3XjBOoaFn+zkpW7iEUcIa9WMoxyHdivnhJA9I8lrWlFjdQhAn6QHock
	s33Qd7pwo0zIBP3mH1rUzmOpaZwq9wTXPHuLtuz9cIfn9lXw+U9EIr2i9PKQCqnOXwbHLZ+jk
X-Gm-Gg: AR+sD11oAR1BwjfA1uJEC/+5060iPcYBHlnXkBJf/+XmQRoZ+K8tRwjs3VIGx/DdDMY
	jB8vEMF7OTz84tEY6llFZAi9ZkO3OXzYbJ69tfrw20aKRzt0zACVUGAEXiKSaGvGTGcf5RyC8xb
	/LpGSomcUPeECftrU7ybrPrDAr5c+pahn+yX+ceJXNmRX5QaUpKEcJSCgqYrEkx+rGWk0T/ugkd
	36Hun5tKmHqtU3PjTaQ7yxaijkHCKv+avwg5bBa5DelPBCEK0TDItLYvEHTOs18ounotuT68Ugi
	FjXOAIqnH45v1JIFjknFwKMYNzylz7kd5rp5ntgdWkdcMWkAk6jjnP3tgrmzht2DdBy7Zveffvk
	yHqMKvZ48ZlKqLXBGuMSA5827auxKDy6paq0=
X-Received: by 2002:ac8:7d13:0:b0:52d:3d46:bfd0 with SMTP id d75a77b69052e-52df5a4a41emr343135801cf.32.1787670712350;
        Tue, 25 Aug 2026 08:11:52 -0700 (PDT)
X-Received: by 2002:ac8:7d13:0:b0:52d:3d46:bfd0 with SMTP id d75a77b69052e-52df5a4a41emr343134781cf.32.1787670711664;
        Tue, 25 Aug 2026 08:11:51 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aad030sm71209161cf.15.2026.08.25.08.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:11:50 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:11:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
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
	Vladimir Zapolskiy <vz@mleia.com>,
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
Message-ID: <ao2ws3ZA-o8ZVjTh@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <3074509.irdbgypaU6@diego>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3074509.irdbgypaU6@diego>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Heiko,

On Mon, Aug 24, 2026 at 11:11:32PM +0200, Heiko Stübner wrote:
> Am Freitag, 21. August 2026, 10:53:10 Mitteleuropäische Sommerzeit schrieb Geert Uytterhoeven:
> > 	Hi all,
> > 
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
> > 
> > Thanks for your comments!
> 
> I guess more a handling question, how do you expect this series to be
> applied?
> 
> I.e. each clk-arch-maintainer, or in one big thing by the core clock
> maintainers? Just wondering if I should pick the Rockchip patch
> or just let the whole series get applied by the clock maintainers.

Before you pick up anything, let's see if Stephen picks up this series
the next few days before he sends his pull to Linus.

Next development cycle, Jerome Brunet and I will be clk co-maintainers
[1] and will start collecting patches then. If Stephen doesn't pick up
this whole series this week, then pick up the patch(es) relevant for
your tree and send Jerome and I pull as usual. That's just in case
there's other patches that come in during the next development cycle to
these files and to avoid merge conflicts. I don't have a strong opinion
about this though, and could be convinced to take the whole series for
simplicity.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=8bc7ceadce1f362a8b0e88075ef3d926b286c01c

Brian

