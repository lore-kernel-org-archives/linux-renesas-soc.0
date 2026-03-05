Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C425DD1E;
	Thu,  5 Mar 2026 02:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772678276; cv=none; b=tOvxaIURG8F3GxhKr8v8gRZgCbXUT6RnFxdVV4lONOEifh2L94z0ENxxUN1JJlBpvslpxdzZr2jKsUYFvdBBP1MoFaaJJ7evuxDzfMCowWPZ03p0XmySN5Dm38ogWavPzGtzY9lAAOZ27eLxcvMIlGdK2+GuGViL5XIKr99iUVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772678276; c=relaxed/simple;
	bh=ctlM72JYmbL1Usy4MX4oCLAGdH+Lb8yTuQeMy++90Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etwEQuycyisoECOAq/tLUY70Ciqb11CcYNjz+tZYg82FSVUEXctvz67SmJuiJvAKwO5AovtALrE9+3teoLcyN0dwCQoVJA9stdIkif6Gt2/VXtKflSHuBCV0QgzabAaV+Kricsefc/6s9n9ehodlSpuRu9fmJQyfbMdywRwtNCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6bfPG+1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6bfPG+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FEBC4CEF7;
	Thu,  5 Mar 2026 02:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772678275;
	bh=ctlM72JYmbL1Usy4MX4oCLAGdH+Lb8yTuQeMy++90Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6bfPG+1oRsZwPxz6HFWXI/zd/eeZZuZdFyAZTAL98KMQc1eRvBq4q4o+CpoW1fzB
	 SkBCZWE5owuUxcoU2QI4/NxVnM4mZWYsJzGsLVUqptObNxy0jxfjz/Sqbhq/H0ugca
	 AoxufxVukcxH0mVxSQzK9tWjXEXPJtD/laNeoy8K6bCtTP681tSjh0gilzsI6eSQDr
	 LGVaxRQdjAp2Lg4SlVfM0fRrgVpGBC0ggAguDutfgNi/d65WqGD8jTlHCuXEQTPpf6
	 xs7c+2uhNio7j/KxYUyd7op6/HFDna/BJzZbE6sXs9Tzp1ea9HE/IztK5dXYPUpiAx
	 fbhFHM0gAf60A==
Date: Wed, 4 Mar 2026 20:37:54 -0600
From: Rob Herring <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Peter Rosin <peda@axentia.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: mux: Remove nodename pattern
 constraints
Message-ID: <20260305023754.GA3129331-robh@kernel.org>
References: <cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
 <dbe73c0777eca61cf14442f4082caae62b61805a.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbe73c0777eca61cf14442f4082caae62b61805a.1769703480.git.tommaso.merciai.xr@bp.renesas.com>

On Thu, Jan 29, 2026 at 05:48:48PM +0100, Tommaso Merciai wrote:
> The nodename pattern in  created an unnecessary restriction that forced
> all mux nodes to be named with the 'mux-controller' prefix.
> This prevented valid use cases where mux functionality is part of other
> hardware blocks that should use more specific naming conventions.
> 
> Remove the $nodename pattern constraints from both the 'select' keyword
> and the properties section of the mux-controller schema.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v6->v7:
>  - No changes.
> 
> v5->v6:
>  - No changes.
> 
> v4->v5:
>  - Added Reviewed-by tag from Conor Dooley.
> 
> v3->v4:
>  - New patch.
> 
>  Documentation/devicetree/bindings/mux/mux-controller.yaml | 6 ------
>  1 file changed, 6 deletions(-)

Applied, because someone else needs the same thing now and it is 
independent from the rest of the series.

Rob

