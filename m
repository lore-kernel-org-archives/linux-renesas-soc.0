Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E42C029F;
	Fri, 13 Mar 2026 23:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773445584; cv=none; b=M7o5SFqs1xaPHMd3LSW/n3JpL4FIG0ATC8mYhxyTa8CT3Yj9dr/H7mNCMmPVwHMTb/lQBE9Q4VHG7MuQGTwxhESUXHKUjAj2iYicvBTcqfeiYXTjHMIe9OMLA81ID/qrlWwweqxDayw/NHZ2rE8oZnYqF5udnH01ypl4oL6oo0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773445584; c=relaxed/simple;
	bh=l0J6UxG2Xo0qMbb5afxleJPxtISpCy1pVKLdkDdqZ1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHJydtVGw5+R8ZPxsr7LBgSkmzqAOPOuo0dbqgEAk2w+c6EVjvwLzMoeXrA/TBPUlRQj84tZuIhahN13z2bswXAnCYJ5zUaf/dJP2jPoV7twz9Kg3R42rBFdtYF+yLobUXK9L1oBYkJahNFrTtnU+SPfCI9xMCFPtYD6eBvbfqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nytqiSax; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nytqiSax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB95C19421;
	Fri, 13 Mar 2026 23:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773445583;
	bh=l0J6UxG2Xo0qMbb5afxleJPxtISpCy1pVKLdkDdqZ1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nytqiSaxKQmJfhc175aQkILi0HvMCC42qFmYmmjrIU62A49gZcD3Ws5kRjLBJJhP9
	 QBO14ad4AVIUYldwQXZ7IbnSaY4ns5ZsEBUAcRwyUzRHxOlz6wj3L8YbkGUuLcQqeh
	 PsK+Id12aCFDftjU8LC+fGc/heeDDnwv0VyIbE2lg4Xi9O05GF1JcWZrwicsqd2WZL
	 IcL1SNJwiqEBSMsMpNzSp7jaJptAlXV5OlgJtriSxD6TQa5Goy+I0fK0QlAWwho3lx
	 cW9sDy6E0u6RyTd36Mgt1eMqVm267iqwgPXx+lUJ9z8jFfV94LRooiO6XXYRJTBaUo
	 hnHcUQ5vwqF9g==
Date: Fri, 13 Mar 2026 18:46:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H
 and RZ/N2H support
Message-ID: <177344558150.3660030.11298746843207669134.robh@kernel.org>
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260310212927.3372410-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310212927.3372410-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Tue, 10 Mar 2026 21:29:25 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add device tree binding support for the xSPI Interface on Renesas
> RZ/T2H and RZ/N2H SoCs. The xSPI IP on these SoCs is closely related
> to that found on the RZ/G3E SoC with some register bit differences
> in the configuration registers.
> 
> The RZ/T2H variant has a reduced clock configuration, requiring only
> the AHB and SPI clocks (without the AXI and spix2 clocks). It also
> requires only the hardware reset (hresetn), without the AXI reset
> (aresetn).
> 
> The RZ/N2H variant is compatible with RZ/T2H and uses the same clock
> and reset configuration.
> 
> Update the binding schema to accommodate these differences using
> conditional constraints based on the compatible string, while
> maintaining backward compatibility with existing RZ/G3E and RZ/V2H(P)
> implementations.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../renesas,rzg3e-xspi.yaml                   | 60 +++++++++++++++----
>  1 file changed, 49 insertions(+), 11 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

