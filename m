Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565251;
	b=SEiJi24kr3U7xkJXe9X43UGHioJVXaV1bySXtsD/sEJlcbsa6fIURA/shZ1VYDz3rw6l
	 ecoLT0CaHqJoGyPZxLBh9h9TSY9Ro5afpLXZxjygVmB+WPv7gg46bDprY9JsQufzZ/dxz
	 DqRdDoQGG8oIF9esGomrNj4H3E162OANps5F/wUsGpX638y9tHwEu85LhejmwvXLU+5uR
	 xoqi2nCtvCUMioYp9ID9UKkwIUEOkrf0uuVIcJLKevAGPiFlxo7JxzlIoTCXheM48/LYs
	 KxCOLJL6GJysI7zKjRgzgD/xq4kk43ZdWX6+2E5D0FS0PeuTTJ593V+gZydqWPel3fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565251;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=WEcinyzXvpzdrQbdmzGRVBkMmzuM3NlP9qlzk0r7u+M=;
	b=jM6lWRz0d9yG3zfxQe3wX/4FzJzK1J9pDL8JJiMiKwULL+4JV2qsXvO0CoxHV++wWR9o
	 JncHz2j6kmOUbdqBD7nCRg+kupJVEd9t3SFkc1G3fygXWNHkUubRZerd7hr+vhEEXWILG
	 igTWuy5v4UboN2QjlJoF+y4llXwzobksWA7lgMvvQwQqRU8e+crjQ1CamjO6KVq5hka8H
	 6v3Ssi1xWvGqOnvXDwk4Y4WAB2HxUyYqS/KhEd6D6nUCShiArauvLqq69CxurykJ1tM77
	 a0d159c1PM66DXy2QOOLeg01VMXmCK0yYDvrOgaSL9DP4TBonm0z+kTkupxFkaJ/qWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BtuJ+9TG;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041C8606A329
	for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Nov 2026 20:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041C8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BtuJ+9TG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WEci
	nyzXvpzdrQbdmzGRVBkMmzuM3NlP9qlzk0r7u+M=; b=BtuJ+9TGthEvfHggV1K7
	8HCM7lmDmDVKnstgAkSutQeepbxM9f+LBjaFk5F7H0FOumehplkJKLqoJ4+ceSBh
	YK2ss/QChr71ijKyvjcVkjJLIy4l+mwVhX+S0+XWv8HGGxsgbS3TL9RxhUbSVG/E
	axv8+Pk12kFE5H2dIY84wmQcx62TwwtQW8iTi8kMfH2anW9M1GuJzYn0um/iNzoS
	MqQKrx44llXCiyQQ7aiR0H9+sB8qB7UaGm2wtCRRck41rxjhBhdU4H/PyL28+gfh
	1iQa6igkkswZenPR28OwGiM6B5IRigeuzt7kfw2me4EMvNskJM0zliJLQI9IogCF
	wA==
Received: (qmail 853660 invoked from network); 1 Nov 2026 21:34:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Nov 2026 21:34:07 +0100
X-UD-Smtp-Session: l3s3148p1@YnRo8zxfVKTB0HFD
Date: Sun, 1 Nov 2026 22:34:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: r9a08g046: Add I3C support
Message-ID: <aueiPnMvmHQhFtM4@shikoro>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-7-2e76b87209bb@renesas.com>
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
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-7-2e76b87209bb@renesas.com>

On Mon, Oct 26, 2026 at 11:35:50AM +0000, Diogo Ivo wrote:
> Add the I3C Bus Interface node to the RZ/G3L (R9A08G046) SoC DTSI and
> enable it on the RZ/G3L SMARC EVK, together with the required pin
> control.
> 
> The driver only consumes resources that are common to the RZ/G3L and
> the RZ/G3S (R9A08G045), so the node uses the SoC-specific
> renesas,r9a08g046-i3c compatible with a fallback to the
> renesas,r9a08g045-i3c compatible of the RZ/G3S, following the bindings.
> 
> The I3C pins are shared with RIIC3, so the controller is only enabled
> when the SW_I3C_EN switch is on.
> 
> The I3C I/O voltage can be set to 1.2V or 1.8V on the board through
> the SYS.3 (I3C_IOVS) switch, so configure the pin controller for the
> selected voltage through the power-source property.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Didn't double check the pinmux values, but rest looks good to me:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

