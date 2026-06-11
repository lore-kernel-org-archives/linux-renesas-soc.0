Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9333A7F61;
	Thu, 11 Jun 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170099; cv=none; b=EUxeg5udIq0juBcg6In+puQFe2SsX4iz5LR5JgDKA36aoPNQ2roqVB+DJ5268//mDJqI6yddYpuJJZEs9JQM8CBDG/8QZaAARVnGFc6EkEf1Tuj0wsaK4J2CAm5MdwYF46plf6e9s69zWF5WX08Kk6CCF/p6Y6MXwzvCyEviyNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170099; c=relaxed/simple;
	bh=kDZTggBwDzUV5E1z1wZ/BnB1PSB8MZ5xgHn17JTG2Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dt0fb+r1Rue+MdBCm/a2HYBNPDv4PuaExZTXWqFQRJDpaKjDqyvFcPEdNC3RYqmzA3UvSOei2DiQyw2RBsViEvO1wl+7cpUWWQejm1cmdtikcng07OseM+vtlOZNSU7CFpfC49n3A68u7wPfdO4A4J8Vwd1Hyk9ZvrPHLz007I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dh2/H3NA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dh2/H3NA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E49B1F00893;
	Thu, 11 Jun 2026 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781170098;
	bh=kDZTggBwDzUV5E1z1wZ/BnB1PSB8MZ5xgHn17JTG2Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dh2/H3NA5FheZfY19CJeRkCvuJAJJ9/UIsjqBIoN40p23ysuvtm/uudCaZmEz8TDT
	 7MMVXLJ414TvLkbWVTppLFehRer6cKryklv7c8HpJPy+KT6fu7ZEI+L0X738mVufFZ
	 Dm9BBbcDOQKQURPUGQ9yukPgQvoRz50wGvZmxI3jSUX9W+RnsJId/LB7pJiDnGi2ei
	 eBXVtdkZxOefb7kP9aMFVbYClJIEe4IzUm8AMTEo6OL8hTc04XQf7CpPJZCsAONEI0
	 Lf4C6xJwUrAYIk2FDM+IRL7/o5OCCIB1ONgqoYmn2FsWlt6PMcAd7KPe5BzpG8mr97
	 cBE62AyREfI1g==
Date: Thu, 11 Jun 2026 11:28:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cache: l2c2x0: Add missing power-domains
Message-ID: <20260611-serious-divergent-sidewinder-ec7ccb@quoll>
References: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>

On Wed, Jun 10, 2026 at 05:29:20PM +0200, Geert Uytterhoeven wrote:
> On Renesas SH-Mobile and R-Mobile SoCs, the ARM PL310 L2 Cache
> Controller is located in a controllable power area.

Interesting... so to turn on L2 cache, OS would need to boot, setup
power domains handling, turn on power domain and then turn on L2 cache?

I understand that bootloader actually handles it, but I really doubt
that it is "controllable".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

