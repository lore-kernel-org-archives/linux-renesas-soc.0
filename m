Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817329;
	b=0rbLADOFSXWP2/fE3qeD0fmwvlX21Cm0y0fVeegpFsqYIXZ7YSL2RVKnlK52Wkxh6Ku7
	 LVRB9YBCb0f1NJCSiS1JFGeo+G5xNfJlutXY/hrQlPUawJWYtcdsnkpd3vodBzqxRbM3V
	 8zOuE5gHShSGF12ciZnbJPpnFK+2bypZTGQOYe8h8/jpYf+EMqPwdjP3XqZyvueRadHTY
	 4L3dOkrCnDjTwDysJ/DLO/leBTOhB+1rHkpNa4pxd8JhDN7AgI3tyVo+2bJXopFpICylj
	 O32L9EmshKBFNJ34z6pmdfHIPplVhbZa8UQIjE2P1KLXdcnXUqI3KFWilBP6DoQPKBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817329;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kntaO+oUTbJCXBEo8v7uvyycdeEcUVRAgtKFDNoUDNk=;
	b=bN6tWfx9CRjBI5ElNWE68f+5uHG/lqAcvY01mJ52Xp6R5xYnh0iaEM0xrGAlSo3QeqJp
	 WpyB5vVPxwlPIMsHYL1B7chQQjJBwNULVQT+pNqs0Jrw6FsztvzYoFPUbx/d8ec+BVXjN
	 NNujy7VQ8UBPQHcHg6LqiXQ/hKQCtpAN4unY8mqTHyWZY/ahnuYZEfAdzqnj0CFicrx9a
	 2CFRt4L+XeelIQQZyVH+Ypxbp/RIi7LlhAseydpgdQIEqtA0DEeR1DqAygl7YmZmWRvTA
	 Dv/uKtCthzvDe7ZuNlbv6bMVPHvO0NnubrjWWgqXXD5lW+cDcoYfLRHSxKAxVzytrew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=TDueOfo5;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB142606A33B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 08:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB142606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=TDueOfo5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=knta
	O+oUTbJCXBEo8v7uvyycdeEcUVRAgtKFDNoUDNk=; b=TDueOfo5XDcMHyVszCQE
	h86anmmtL5Z3LjGcR8v/IdK2pKSPs02woMZvQQqXEnKTFQQxi3h+p4vbzOjlBh3R
	/oJZqbCkaSOqUWgkk1NfuNsHg/JQyGNQX/f/rMY19mkY3W1itw1I3IrdnYY3vH5b
	qq6Iy9Kqe1KlQjAivQan3SfgW5BTrEAbDRJLpn3LqFC6rmQy08N3Bm+mJp0umWLb
	DI1sqTXE+BovYvsfJf3eIwfMMC7tBOimUI3+FV4uruJQft4D7FYocNRVWgalQYC1
	QgaWPvtRZwiaKy7WMRQ2oKmE+OF1mCJIFMZ0MXbw6wnc/d6SNs/vNaiBSA8FZgSa
	fw==
Received: (qmail 1194441 invoked from network); 16 Nov 2026 09:22:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:05 +0100
X-UD-Smtp-Session: l3s3148p1@+LkceWBgDoMujnv5
Date: Mon, 16 Nov 2026 09:22:05 +0100
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
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
Message-ID: <avq9LcNeaugpmkgh@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
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
In-Reply-To: <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>

On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> pointer to the clk_map structure, and populating it up-front.
> 
> Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> needed afterwards, and drop NUM_FIXED_CLKS.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

