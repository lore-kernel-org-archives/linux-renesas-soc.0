Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1D227E1A1;
	Fri, 12 Jun 2026 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781273505; cv=none; b=BN3nsYcAyvkLu4dVE1KcLXA+C3TJnQ+jR5DkajMQzdoWr7s/wNf2dHs8DndnLrfGC6uDkYkxPMmlbEwRq1WGsOyG/NM73sNtU2C+Qd2uuyssK1Gi3NvqPPo0MzdXX0tu3zngz4gfNDEMqvfrHt9qU1xAAaKiDvLdokj960ZoqX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781273505; c=relaxed/simple;
	bh=zIiwxq5MYuZ1Xink+1WuZ0ldvNVMFfHqm2hcRDF/moI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTONjQxJ8k+7wRWsrkldpDzkGPuQuapSFrmdEn5H27L49uRVePaCfAi/v5K//KHFuil7wWZ0KNQxpfbBcZyOw+smk8kSy5qJnpQUd13Hov01bn3TWRwKtrY+7hJm/5CW2ZpdIpeXHgLsky+/REu4asvSegf8EvtDTxeWDracHX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbkDfSUv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbkDfSUv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A583E1F000E9;
	Fri, 12 Jun 2026 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781273503;
	bh=YPSIQHesNYp6mKnxTN6vC8q7P0Hn+TPBZyyWY0vEwAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WbkDfSUvhzc0aHrq3YoaM/ZzSLkLSGF8UUC9PllO/HBQx2p2v1hUGPVOYvBLDXq1Z
	 zrRtVNY/gDQIiIX2IQPBYCzFQG5OY9SBxUG6edOWt4PORJ1kwAl9TPiPO6WCWg8htC
	 5Dca2prpu8SsAm8W0TWDZ8yCy6CuKxvsZVMuy3sO/7xQS1dIrlOvRRH+paOFdjSi70
	 gCSqtfg+0hMUhSPA2nOpPLUqINBVuUl8ZR6deZAHHPlYxixr61Bf1XFVQoeCwSvaxX
	 DTpwEGrFDG6/qVDn/kGhPwq5FN/8GWa6t6Kj76wQpYJaN/+BBjD5awiVg2h+Jg9n1m
	 hS3RJj4nvtjzA==
Date: Fri, 12 Jun 2026 09:11:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] dt-bindings: cache: l2c2x0: Add missing power-domains
Message-ID: <178127350175.916476.16317522760209240659.robh@kernel.org>
References: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>


On Wed, 10 Jun 2026 17:29:20 +0200, Geert Uytterhoeven wrote:
> On Renesas SH-Mobile and R-Mobile SoCs, the ARM PL310 L2 Cache
> Controller is located in a controllable power area.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This fixes "make dtbs_check":
> 
>     arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: cache-controller@f0100000 (arm,pl310-cache): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	    from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml
>     arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: cache-controller@f0100000 (arm,pl310-cache): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	    from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml
> ---
>  Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

