Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438873;
	b=FSJbxmATUaPxfvwp6R1H3G7PYfFDF6hAEl1KQqrvV/sLHMB9xEsZD0he1XqFtxdfnbGU
	 ev2b2VjzrJ2CuYf9MzzdLnjpGQUPvIPoiSooTUDT8AZR516hSnzbbk+6r11sJ8HIwYRaz
	 mwOOOEWUn9B33UFi6BgNmpsrFL7NNLj4DQ5msJr1ZQwHROz6U/s30lmB5zQLu+gLtb29I
	 S+PzSUSVek5O3qYAg104Z8wBbfXFSO1QnJklqp6LbEm8kcPFeoT1SBJ42JWX2VCmGCAs5
	 zQ+tDFRpF30K/DKyU+4BELovdoErkIdeFllMZZrugr6E7uvBA97d/3al11sYVT/zDWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438873;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SsVRMPSyNzie31mooAWwpfLKTDZGyyCN3cZBedOe8C4=;
	b=D5vF72pLJGMly0fHA+jyjjgpV3uZL4OWe35fBMVl28gsFYipqAeOFyrU52J1gB7m6sEl
	 2ufbsAa7248C5r04q56xmMK78Px7HK744TArdvnSxwkUbvZEAV5Zl6zPfXdP2sV2SkqoY
	 vndbvs2x1tl36G//kb4KthoZW8J288XMuVMdpuucWO/qWHhwjt8VLB9N0YEE1xeOzYjM4
	 LlJWBiphu3bgAHjxbHivSYA9GFUHdYSFt9CFUQqh5evv1ZfTlDbmDqZLEGEQOHO/K72lx
	 0gkm1v//RTK/J/kS3fT4VMR3+iNztsUXx8q4uYGyXi90ZeT8ff+vO6j1N/d0XT9ou2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=I4RCL8+l;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4081606A32E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4081606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=I4RCL8+l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SsVR
	MPSyNzie31mooAWwpfLKTDZGyyCN3cZBedOe8C4=; b=I4RCL8+lfqpMIAWTNiyl
	Po3sM2dYYNnR0RVAbIEz75KzF2sOpEi0h7sIuXnka9qQIOHY6CY/PJ/feNrWrHrB
	6bE64kbw20m/c+8Uj3Shwms/DmvhERv6+T2Di+nxPDn1iG72DHVAo07B7mttZGEk
	+P26Y9LeYdoNC1jh+XZCwfj4cW0iB6iJdxdONZjGSIJTsLfP2lsc2WmoL/UGfZzq
	I8cjXXUtgimzxmC5e05i1VIhO0oxnQJlMWpgW1ch+DOcHjqAMQkKBMeAE+CYz9pH
	ZmQnveSzX5XVpsrjra98/SLTYFHxR77GV+xjhqMFLQOK9Ubg9ok1u8g3BlBr97zm
	BQ==
Received: (qmail 2731665 invoked from network); 23 Nov 2026 14:01:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 14:01:06 +0100
X-UD-Smtp-Session: l3s3148p1@vhjXL/FgUIgujnsu
Date: Mon, 23 Nov 2026 14:01:06 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: Remove unused clk.dev
Message-ID: <awQ5Ems-ZyYsWVRy@ninjato>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
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
In-Reply-To: <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>

On Thu, Nov 19, 2026 at 02:40:34PM +0100, Geert Uytterhoeven wrote:
> This basically reverts commit efa850487a6b6742 ("clk: Inform the core
> about consumer devices").
> 
> This commit added a struct device pointer member to struct clk and a
> parameter to clk_hw_create_clk(), but the new member was never used
> beyond setting.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Cool cleanup!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

