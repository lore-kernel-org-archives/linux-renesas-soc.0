Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094117;
	b=wRvPvTiavgMiTtk9wQD4dRjUfxelnu7K4cWm/q8CxpYZMAhEWhbqCQzGGWn2VkeY4oir
	 GnE910XthzSg8jwZIWmnz3fpi4dRvLQ/mVjvsNGioZOGcl2PqeqILDKNe22MFaZJiS5Kq
	 cEq5XgRdv9HXVLqMhllXOTEbd5caF23f4PUYlRry7uhmg92pA8vmWTSOM6hJeOQf1olTs
	 NRhVjpiUqt4RYI5jWEz4JXS+IDp/1c/E0B5fiHgPdb5zY9JFruEO66D1/CQKdLreqs87a
	 RA6Lxl+A0WTdsXenSVmxPPf9+Y3xpfhey9Uknvrkg7Xty7GOKhsrO/suzjVfdnnPtKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
	b=2gWWUhaOljBjfgM0TDn5z6UYSy0j9n3hSa+vfLtua2FEH8RujIGtMRt9zfGJkvcvgUGZ
	 wN+JEkcLq3Rgayw7xR52JHd6OYYoOjBe9gLdWsVXJgh1OuOFUp7qs1NgVRkYdLFokwjTm
	 DxXpT7CVSqegtTsVpRJkCw2BeYlkvWl6wca7QpPGMZJEr9Q2GeRp/oczpQOLL3rxe6W0Z
	 rx5KRU9eyVX8m292CoZ2tfs0DG/skEsSK9pL734oGgbhw+c3lRO9mz0+rv6nRSlYma7bJ
	 Hzl4o0zuc28dvI0h9lrY2Qyy/fW0bLJTZOp2R5c3E0H9TF6qK/7jKgAsaXkoRM6Y6Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Lrgqg8Sw;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72D606A31D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 09:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E72D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Lrgqg8Sw
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso15410595e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793094115; x=1793698915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
        b=Lrgqg8Sw8B0MTFHOgBFBsZea8yJ5PGupCUU44KFrLSJFOaY7P+6n7vJiqmkm/ccK36
         mnRTBEXSzJjw7xIZDs+5PWEyIB3Wnj60O8VDRG9CRFrmAAqy0R3jrwSfYzp2RC+iR/da
         CX+EOdAr1Jmfgg5HdNz0YL53TuoXKnFmWUVNvqvRiGwB3nJhgXmXudPcUEBUs2LGCCW0
         LQyNCaOKCXuojR58IHPS9Xzm4UhEno4FBNeMmanacYHfeaoNrvJdsY835na+t3EpbJf7
         NUxkcOBM73+LfGKKxWz0wEGr7pjwv7WTp6KLUY4Dk+hm7tkmDbCofa1WaCwsvjoa4tVW
         RVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094115; x=1793698915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
        b=F4VTku9XzLhx6et8wkgTQBwuIOj0U7roLfCphgb5unsSvJClntHLAa6j4YcJ0c2YLy
         EKqX4cvOd6+tassHbNYjuk55AHBboSFHDciHV5XVlcngBp2Jl1YiJVh7XhXG/aCzT3+m
         FK3YaoObhRV5Q5GS53IDslnlvyuSFBTeeZOIvRAJlb+74IYYERlyBKmP+UtTzDoOi5b5
         ihZ/aJBp3S0OsW4ava+yA+cH+9XFTckB0kZRw98SWtMGLienrpAWFrR3ihsUZENZEv59
         +IwhTS7rzfKlKX1RnflU/HcnfBqpuOegt9ngpFLu9t4BTmCSDcfnTg6Vg30qiwYCHDoT
         Jgwg==
X-Forwarded-Encrypted: i=1; AKwUvBxuIiycHbvs4gRw4w9mtYsLV73rqxJ1fwVwuTZgKJszQxrn96Ccx4aa+v/wYShpp14wFaNP6RCVmCdg+Mnz+QZkgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJYgKspKfDz3N+WuODdktNIlvo1UsfGdvvk6g7M/QxfRuCVaANi
	X7bb1mqabj1qp8hRb3Hcu9EXfNeSyMKJob6CFDT1BwqpwWVenNr0F1ocNTBjIkbBb6I=
X-Gm-Gg: AYBFou1ym5Ql2PRZl/2ITysPRJWQJ324nsRMIC2swBZUJ28Sawpq8yaGOeqHdVSZEtO
	rVc5Ud1uJcuLSi/UqqnesIfFnuvOHA+Uyc8DSSvU2eiSalg4ANR3IhA9GMJANMndi2ldn26KRkz
	eWao+Kr1pXRo55Yws2GBqOfohbFlB2rbmhgBAFUyM+nF1uyOPUJ5MKXwNPAlC0it3SJiwcniFfZ
	Ak+GCdAGobQxYx79gs/dsZDe1tFzXNOOumM2h49NJz6BFhut/rmF+rqMHH8ub4oDrqICnl8coxC
	YsBwGrsdyvx4gPm83AF2NHnEqPJ0q5zm9UCpjJkvH3As6dMKIVW6XsfOS7DCys3OAupLgq2J42K
	8MWGVy7uU1zzrfirwx+Cf4BRFBqy1bmQuOKisiNqT8EE7E3L/L7m7HDJxxMAzf/gXc0o/E3Eb8J
	/s2dQwRdxN5dRbC9C3dA4dBFPOT1Bvky+qFuWZCifGU1MpGbre51KBlrZs+Shpc/7MH6wKAnU2+
	gnHvT9f3LwcdpVFWMF8h8j5qxrrBz7SuUv3YpGJSds6Q3AVdribBqcuzi9gFIPE/5MzoThYGcYh
	gDU30+swrVWtY4IgomZnwKqNGmPF/dNHBc+aDB2hl1w=
X-Received: by 2002:a05:600c:8a08:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4a47a8dc93bmr110335135e9.9.1793094114509;
        Tue, 27 Oct 2026 02:41:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a59d998sm263939065e9.15.2026.10.27.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:41:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:41:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, 
	Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux.dev, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-aspeed@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Michael Buesch <m@bues.ch>, William Breathitt Gray <wbg@kernel.org>, 
	Robert Richter <rric@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 00/22] gpio: Improvements around device-id arrays
Message-ID: <auBxfVzkveb7KlEk@monoceros>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <at-CGVq5jVsMQief@SMW015318>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlk6jmpzfns64bdk"
Content-Disposition: inline
In-Reply-To: <at-CGVq5jVsMQief@SMW015318>


--qlk6jmpzfns64bdk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/22] gpio: Improvements around device-id arrays
MIME-Version: 1.0

Hello,

On Mon, Oct 26, 2026 at 11:38:49AM -0500, Frank Li wrote:
> On Mon, Oct 26, 2026 at 05:28:11PM +0100, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > [...]
> >  drivers/gpio/gpio-imx-scu.c         |  1 +
> > [...]
> >  drivers/gpio/gpio-mxc.c             |  2 +-
> >  drivers/gpio/gpio-mxs.c             |  4 ++--
>=20
> For all imx part:
>=20
> Acked-by: Frank Li <Frank.Li@nxp.com>

I'll apply this to all patches touching the three files left in my
quote.

Best regards
Uwe

--qlk6jmpzfns64bdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrgcd0ACgkQj4D7WH0S
/k4RSwf+IK0Zg4d+0uYc5szRXc18DV2GOQKuWytvc6Mb7rb8wBUlhLcCzHXfHJw5
GKyFFUIrW1GHu/p4aSlsaOLm8RjGYbgR1RTnxQySdf79td9IxG/EXqQcp6FcxSH5
30Ema9IFNIy1Z1fLQlqcQWR4FaujBuohFx12psbgjzkhMn3OY0x3w6FsZddRxBu6
hjb1B8M89jP2R7VcM2CC+KYKqlxNoQYiS/XOiE7oyKj9CqBRDIrGPNwKtLxUelaD
kKhTCJUSL4uTa26RZDC42xIr79ip8u0RW/+hzEwjtlicpsH0uFemsO1TO74xS/ol
PbKbBRoQJlRhoDMBJ7sTb6K4gJHPEA==
=KSfn
-----END PGP SIGNATURE-----

--qlk6jmpzfns64bdk--
