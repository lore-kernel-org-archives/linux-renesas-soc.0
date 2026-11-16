Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817359;
	b=QWPbVv02lBaRV32KODoLOZRbWiokeYMoVdRZv7IcN+jURHMRtmAHQs3sFUQqmuK5BjBO
	 oP8rtQ2MwAXdhPovjs4Xd4XEeRYSpmdN9E4JPYL+3ZFQCFuiUEWkdSx0I2wCIVO5vrc1M
	 Htu6EGsjzoex2QHrZX+lHp7hnLT154EtqmTS0xGsnQPSDb23pw49PjJnoGUSfNaKtOJ10
	 edOOk6zURuFNgs3Q+5QpJkcILgIMrj/326byhA4ybUEmf0KD7u/Tmq9lPX/up25ZN+zzX
	 dgoM5IHnq9zCqSvEKBd6grSw1luld1C5ugKeIyTdOmStz9nnrOf+mUP5qVgAuCR1zOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817359;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FhHfyYwYQ9ZGP17NUjMsOu+VrPrB95iXQbOeEOYKFOs=;
	b=00V8dOPLznKUrjkmGLpa5RKz7XtXfSPF+ZIRFWPUjHb/OrRXhlX2J0/4P1Zl20QuTKym
	 vgYrg9Kl4GYo2Y/VsIIu85cU7qZA/uyJvJxcZ2z+nOqrMfOIV2EqmJ7/lIulXnrSnE9ma
	 cDFvIzoPXMyPJ8atBn8NwBPhbb7HacfpprVwICGWyZU9OyAsg4WJwLRTexUYvapPHUyPn
	 enedqWuzBSbV1eWk/V7HcIhhlaGM7mLgkbc+2gj7fR8Qo7GWk1wPqBhNk+0Wv7q6q8R6M
	 iOBKdiTBp2jmrOPWrLBxscMnJEuYCzCPacoAMK2uwmmbhu74g3v0KVxGm+5nG/nqDYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="jx/ZBIZU";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CE9606A330
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 08:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0CE9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=jx/ZBIZU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FhHf
	yYwYQ9ZGP17NUjMsOu+VrPrB95iXQbOeEOYKFOs=; b=jx/ZBIZUH+eiIfgl591n
	kki9k049+ZNEFJ6O8zEQf43eL2mUryLnYS6WONV35hADltlR8913ZsixH40hIN7M
	VJdX7R7NtHbnnEPcK1Cx4qLIwgAAAkEUIxLghF2sGxEwGhBpfpcraSVFS6OxBnWb
	6knyJdn2tt5NVk4EcrvGRFASslihaJ6ZF+tfI7gAzsFc7aD1zwt/+xbbXmBtFWoB
	GDjvx0KFOdXUqMvBTGcsvH2veU13F0d7G/YP2XBruubZ0O1r2rjAH1rynewjJarR
	s6SMAGdGvyLWzOH4nB8m5Esih77sNNP7aIVQQEjfU1NA4nbdlGVAspdZE4N3OISG
	bw==
Received: (qmail 1194944 invoked from network); 16 Nov 2026 09:22:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:35 +0100
X-UD-Smtp-Session: l3s3148p1@Iy/hemBg+Igujnv5
Date: Mon, 16 Nov 2026 09:22:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return
 -EPROBE_DEFER
Message-ID: <avq9SkUx-3q_28wO@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>

On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2].
> 
> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
> 
> [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
>     return -EPROBE_DEFER").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

