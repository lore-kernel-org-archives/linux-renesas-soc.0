Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110454;
	b=JnVzHziefhe5wVmkNC9E9X0oBNNEz5sSirdReZciyodX1mxS+Yq+ykSpzW8jCHlTW9ZG
	 gJ2hUkcbpEWpLQCvkHnKdGaT72xnZNjuFmQgpBng/x0VS7n83xILK2c9XUlaCYmWzm/UD
	 HS6Bfhd4VEfrafDV7bNeiTWHtw5B+kc8GUpuArRyeQ+W+7k8gXwKINpX09TyQNRe/4Hng
	 F1weoA2F/fplyJvp0B8qiv8XcNtbI/9K48lh8FVTzAz+YnglGyv8RUj/LDcGpxAR7J4uC
	 Ip8fFmikXmLFDYgXPYpbR+C6KOxRMkSXWfU+QS9oZKGCRiSDWCjm2gT07LkItMOdzdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110454;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ULtd9LbkaeiBjJrJ74ty1dyVfksSuVPpssfCtnxbGQs=;
	b=ko+NsYcvqAjQsZyuoOU1LU/+N+FK5yJyzBjeyBjgbeDz/8cwx+vhirQOlDdYCEZAJjRW
	 XP5d29syDH4Z6sGyMvxMd5Fk+YJp6IfFQCR9Bb7PjPSUaGZi9MdwZ455QCmFmqu6vMfwr
	 cju1JDdYywzDjhhS4b56Q0feruXj5zPttkEwVMIrkjSL6JVn5qKx8j1tvMWEyWcNiYOkB
	 oi+nT3K6vFrxSplKHCNIS6wNuzFUL03HJ4LU0Mm579wSr91XnvhGW6tGk8p8uf/0DBrUw
	 9U2UH78jSdC9g62jDfzy7hLbdTE/QPGw2q+p4WQgHezWLKeaOmjsuIh0S43UloTr16g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOHXFD9i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C61606A31D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOHXFD9i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F231F01829
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110454;
	bh=ULtd9LbkaeiBjJrJ74ty1dyVfksSuVPpssfCtnxbGQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nOHXFD9io0Ru2PaYz+V6smtGs0WntNANVygH/FG21ay5l6eXVd/Fv0/Tv/05f5lHN
	 ro4iu7gr3151Nom7znD+w9DtyJZyWfUd1ugqFnU4sroYLuBrr059kaYzOqg3LHyBNE
	 Nq5slenfftrhf+jQMKg2z4tHzFnbsIy48BStIJ4xgz9ShxnCKOCF83cSRLUB1U0tDm
	 g3peUTLWKcVDShNXN+mUP1xR1HMK/LuErofPe2xUAZAdWO0fFLSPuWwNBeF/MoBv5J
	 AbW/DgyYr644yxz8kE3Ve5Rjs1Wa91W5XlLBIEfFPMWntO1C6QOqcmg7216oQhQAET
	 L21vjkzNFgP8A==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-48e94879f02so1305207fac.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 07:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVzQD+6fIc6yVM0a47M1xee1ZhvpDA7ymc32P4nEnH5UZtmpOSiQqVj6sVPs63op9B9WDwQKWIrC0M/x+IVyd9XA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL5z8ylg1ST7WZfTQLD5gnZICgFltVRVU34vL2wddFlD8pk90I6
	UpizwnLuwqRtkzwipVW8WqXgyA4tmaHwjtBn2gj7ZiTgISQY+o0TPWmDgizIKzDO3IaYKZFSa0L
	85RzmhKayCyerDlwvwrEN04LHWm0DZOA=
X-Received: by 2002:a05:6870:c69e:b0:49d:c8ab:967b with SMTP id
 586e51a60fabf-4a83f542697mr5910295fac.47.1793110453054; Tue, 27 Oct 2026
 07:14:13 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com> <20261026-drm-panel-funcs-v1-9-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-9-5e3070a3478f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:13:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=2zsU8xOQWURD7HFOiCYwCNwW9ece1=PoVci2qNM8Ykw@mail.gmail.com>
X-Gm-Features: AclHuK8ruqZCGkf4O-7fY-Pys0rgaueWTZBuD-NGSUOyqWUpd7La4hdhioD434w
Message-ID: <CAD++jL=2zsU8xOQWURD7HFOiCYwCNwW9ece1=PoVci2qNM8Ykw@mail.gmail.com>
Subject: Re: [PATCH 09/35] drm/mcde: use drm_panel_bridge_add()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Igor Reznichenko <igor@reznichenko.net>, 
	Michael Walle <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
	Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Cristian Cozzolino <cristian_ci@protonmail.com>, Junjie Cao <junjie.cao@linux.dev>, 
	Ryan Brue <ryanbrue.dev@gmail.com>, Nickolay Goppen <setotau@mainlining.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Robert Chiras <robert.chiras@nxp.com>, Alexander Koskovich <akoskovich@pm.me>, 
	Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>, 
	David Heidelberg <david@ixit.cz>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 12:10=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> The connector type passed to drm_panel_bridge_add_typed() has been
> ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
> every drm_panel"), the bridge always has the type of the panel.
>
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks for driving this patch series Dmitry!

Yours,
Linus Walleij
