Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55730BF4F;
	Mon,  3 Aug 2026 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785746052; cv=none; b=iojugXYS5ly+6m4zKu8pOLjaSSJos5U8a39Gy46FXydXUaX1LJ4DkQ0dYcpBMqH5qD5/1+70hoOrhgFVVV7DbH3iMen7oIf11laC3HlU/yoSmxM44J3gWCE2B+UWFZ2YeUIYR/HyUlWo66U/7hiHIljqxsWq0wiEVcWFYp4Cn9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785746052; c=relaxed/simple;
	bh=dEdhcuzkUfXQyga9yrK4zLlXKMXxx5XzURwgMzpODcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbbBqVBhG699Kdyi7rc9jvmODATtvHPLkHaVThKFb2nHMMz7RTpRGS2/GSTpIXhAkw+5xdwZWg9YvhdONEqcU0RW7GRxu2G+1cRu15LzBM/PysHLcgCqGa4tj2UltmBhYdJfEzeUmvMdJR2VmRcQus81DYknSmtKzBRkxqcobgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPXLqTlI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPXLqTlI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9151F000E9;
	Mon,  3 Aug 2026 08:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785746051;
	bh=ocpvpi2NArcOC90TKmTQCVuO5qbsZgPqGuWVp8yEIuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NPXLqTlIUfHO078x2ULmPwHFX1vR8hBeUdnGadGMw4sVH6YS043Vf/FDqGeMlVt7f
	 +wsEx8DqIGWTUKy6p9xZ5QEYNV5JQ/kullic4Do43hNeCfaza65gKYylchNLo754r7
	 Cm3vsqWnl3y6bZdXuH7PkTafqWvfPzZQllH96NWhHoMUWx3tJ8Smhyby84cfkO9EqX
	 HJ3w/q1y/tIWjVVII164anOsoZY0xijCTOJPEIfN8t/fzMw6WDR6F7nJYVtSmsYyzF
	 vkkZ3/Q7AGpKPX3RmgV1BmwuNwOwJvbWyE5s4wbsgZ9mX7wfKp9U3G4PhOL89QQDXA
	 NCS12Mf9uTGuw==
Date: Mon, 3 Aug 2026 10:34:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 01/16] dt-bindings: display: bridge: renesas,dsi:
 Document RZ/G3L
Message-ID: <20260803-prodigious-brave-myna-08deb7@quoll>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
 <20260729125516.230757-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729125516.230757-2-biju.das.jz@bp.renesas.com>

On Wed, Jul 29, 2026 at 01:54:53PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The RZ/G3L DSI IP is similar to the RZ/G2L but has different global PHY
> timings and also the PLLCLK is ungateble clock. Add the compatible
> string "renesas,r9a08g046-mipi-dsi" to handle these difference for the
> Renesas RZ/G3L SoC. The power to DSI region is controlled by SYSC block.
> Document renesas,sysc-pwrrdy property to handle the power control.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped renesas,sysc-pwrrdy property as it is modelled as power
>    sequence.
> ---
>  .../devicetree/bindings/display/bridge/renesas,dsi.yaml          | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

