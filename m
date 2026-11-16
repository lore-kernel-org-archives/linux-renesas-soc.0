Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817380;
	b=c+hLhOd/t0LnB4BO9UXgQobBh+U4TWhIZtzMuopLRHW3ug3neJXKt3CABh89YxbCDfO3
	 MmOhZR8r+U0wQlfzCuDQtPHAxxTWiGPCTY9v/pDPPn015LNbrUanwNfwAD29tMWyGo2ge
	 CRkwkdglrY3nb0bgfOPY0lXBZGHN1jx8lEZoJaTmb5WWdIbdGpxMTinOPZ5V5mVW1Mw9r
	 I/IBvFhl9RBVluLMjPzUy+6rTuZaCMnvEYQ7Xb1POjyBOHo8iHBqxQvSgmtpxIiLIa4a1
	 YNt0JHsmRjJM/VmbWndvzRKGQ9VVmKuZDI7dB2LPeOMfW7gSBz1Xgy4p/oBo3Or6agA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817380;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=euH0BJNlYcSHq5yr15pcFlaT205pABUUGFubW7NpuMk=;
	b=ULuQpsLuK/Gf5OknSSZ9rLiujtQEbic+bp8j2MMsweyFrbyfv5Wztc/fsb+GSs+LeW8m
	 /AcoM9o3HnkiIB1FzsoNGdvoAszPoRtwzbhoCXxW00/boaEuVKP2WiE5cyV8oDHnoLc9K
	 hcqI9YBtzL5XKKpNaf+aFl53J8V0lG0nsWg1aTWzec9xwx1lrIKZG9eca3G4Y/60/LOCS
	 i4PaQFHinj/z5dvYyxA05xPCAhfzpJYRda41+vSRRfe6wtB/KVkOcYhNRRQWaeCl3KP01
	 FUOBlavR/HruKdU2rmEX2IgGoa3HwisuPDgAxKcI4VLVZZ2VfMK9o2RRCPX9ZXcYZYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Q95X8rex;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C604606A336
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 08:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C604606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Q95X8rex
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=euH0
	BJNlYcSHq5yr15pcFlaT205pABUUGFubW7NpuMk=; b=Q95X8rexII/3mzewfYJW
	zxeUCE/7KqQCyMLyUMmoeiOuyWjlTDU3Yc5WuzAQun5UV9NomJD+Ib327u1CS29D
	shtsvpCX0eqF0eEivl5cIuWdGSKGRcdUNH2AUiHRUHIvA3n/tvaSrHAzyc4CYfoa
	uipewViPV66CHwwtpqiRO3D6fefOqCDADfJNOpl2zduSD8JVzHk02Nu0VIHQZ9YS
	TjLAmPZw9mgkrkzy2e14AgsJ6ndq0fnQYF8CsGybikyICE2iFjgDs7qW6VY8MGj1
	laiTd9GEpgasBafTlf2S8/PayX47qKq/sVSbGcq+BQ1DSzqGvQ/lupXTlDUfliK6
	NQ==
Received: (qmail 1195362 invoked from network); 16 Nov 2026 09:22:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:56 +0100
X-UD-Smtp-Session: l3s3148p1@uvIkfGBgKooujnv5
Date: Mon, 16 Nov 2026 09:22:56 +0100
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
Subject: Re: [PATCH v4 8/8] arm64: dts: renesas: ironhide: Enable SCMI devpd,
 sys, clock, and reset
Message-ID: <avq9YAeAsAgc-btt@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <a66c5ceda67314eb9e86224eb555adf5ce00ecbb.1792163045.git.geert+renesas@glider.be>
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
In-Reply-To: <a66c5ceda67314eb9e86224eb555adf5ce00ecbb.1792163045.git.geert+renesas@glider.be>

On Fri, Oct 16, 2026 at 05:55:47PM +0200, Geert Uytterhoeven wrote:
> SCP FW SDKv4.28.0 and later for Renesas R-Car X5H Ironhide not only
> implement the SCMI base protocol, but also the SCMI power domain, system
> power, clock, and reset domain management protocols.
> 
> Enable support for the latter by adding the corresponding SCMI protocol
> subnodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

