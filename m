Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609216;
	b=nJN//HyouufYeFkY26TKPu6bM4H4EeMUwOEYAmGFKlmdzCHpcqvG2Kk+wEmt82PWTxwk
	 I2B1/MZ16f8iW3HTCX/eLWphsfemyujAmbfvwGG2PEsTTizfJYno3WnyPrNrlifr//VIv
	 YJaH17+XsE+8QuVddp0K8WEu2KeOO66R3xKkgMXnimHPe+xpyupDaFgaYdb+Y76R6qS5j
	 sSZFZWj7rUjthokEI2buNEjP0RfjjLQL5iYtUOXJcsB9h1Gl5lBWAIKXIni6T9x58LB0I
	 kNZ2cBwYnd8dwJYVkC3D9GmjxLsJykkSIhYouquWwEd9/rdHGOLjghf3ie+7r6AGkJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609216;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=g0cGllNjSZ1Dlm0jVYy1c6i4slueJeHAQyhOKe/jYNU=;
	b=0o14rK9kAKFuSV/BkROMz1qrpBkunSM1Tj/G9HCtmZc8Y7L7lKHN06cyrFbvaOZl3/U0
	 dNMiAxuq/FNcnaYzq4xTAB5FqI6ZRbfNLlgaZVzUFmdJfrBD2aJO0pUrVbSlA+upUSR2M
	 VxL3qVUwxIOe89xjLwoiejyzS+DrQQ/WFlqL+vArK8TgZWi7JKEX+qWsr0Rzvt1/h2T4d
	 9tv+tYD6DSsLXi+5WDvt2ZobWwHMIP0OQGIOxHRWEC0yN9P4NLSrwqjMzI83qV/SmpbvV
	 VcZo0EMaYgcbBBaUM6TG7sJejd0apdauCkDEmgs0GnR3qOhrmw4e5K1bgmDj8NTHKbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7ZAtjiu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A789F606A31E;
	Wed, 25 Nov 2026 12:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7ZAtjiu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8EB1F000C4;
	Wed, 25 Nov 2026 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609216;
	bh=g0cGllNjSZ1Dlm0jVYy1c6i4slueJeHAQyhOKe/jYNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d7ZAtjiuRyHXkqPBq4xg2DgJbYRJHmkbUzYixCVpFSEAoCHirys2mk6dQ+JIr+J40
	 Knp+k4We+LIxg3mN+xOf5pn5oFGpoRbB7zmzZxMp59fNS4SCtJ2M2GtceeukrKHpUR
	 CS6JtMtrfxBZyLRsDGp7OcyFzczFogVAuryMbi2wUvYwcROvU27p/VH1dlGFp/j0Ad
	 sFVyOPs2tdKw7uiAy7L+7ejV6na1073gaznu18X/foVmIU/fE+KlS73dpFF6YM9oXZ
	 vrK+Iq94NSBDFzduyLUvx6GzHc6gifbkg4mmFeRxn3aIefOLWH+dKs7DKqMk8KeIil
	 CJ/8noLwUVlcg==
Date: Wed, 25 Nov 2026 13:20:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 2/2] Renesas DTS updates for v7.5
Message-ID: <20261125-qualified-shiny-cat-ade8f1@quoll>
References: <cover.1795540796.git.geert+renesas@glider.be>
 <cover.1795540800.git.geert+renesas@glider.be>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1795540800.git.geert+renesas@glider.be>

On Tue, Nov 24, 2026 at 06:28:36PM +0100, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.5-tag1
> 
> for you to fetch changes up to df85c8ee22391046200bb057c85717eb906e464a:
> 
>   arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD (2026-11-23 11:05:32 +0100)
> 
> ----------------------------------------------------------------
> Renesas DTS updates for v7.5
> 
>   - Add more timer support for the RZ/N1 SoC,
>   - Add PCIe endpoint suppport for the Renesas Spider development board,
>   - Add CAN-FD support for the RZ/G3L and RZ/G3S SoCs and their SMARC
>     boards.
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof

