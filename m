Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8ED27FD75;
	Wed,  8 Jul 2026 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499375; cv=none; b=l2YqYWBFi8tYgk4gZpRXwKbNFkwsffSrflyzsSYiYv+Fc/MQJeXXnUPEY7pqiRmNXRdV2VRrR0jgNA1zmNs6xzWF81alXdGhyYSfQs3AMDRcxTK/h8zmY1xucN/rUZsL9zx5yBI4Nss+qr+T7uuStVyC7olDXrXeGFZ5i5JO+vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499375; c=relaxed/simple;
	bh=xkjPZOWZJ0gBAldxLah5iX3ePWb2A6PPRRluNZ+a8M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYn1hher/DH4/4+cKG8huugxFlM1emsMy0T3KLi2M22QPCzIeuM/dja1j8p+H3HmjoXxDRpuOaUwCJah1Vo60QeLmWxQ+x6XcHETr+57KCJJOd74xQFt6fv2mbY5r4R/VwwVEGNKpYz/35S9L5Bwse5WpLkJgArNxxKC/ZgLxvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXgQaSyx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXgQaSyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF88F1F000E9;
	Wed,  8 Jul 2026 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783499373;
	bh=CWIm+NgsXwAVtIsalyxLXYc9JK4CbYz1QiTAMRXEaUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZXgQaSyxuwRdfO0MsiB5Go3qFhqa+he7eIP+MyDR0EfVjUny+iA1YsbMkVzJLDbcB
	 s6yP1suFqfAk06R4ZJSY5t0We0XvbG2Iuz9Xj9e1YQVPkjDkzlVQp4fz0xkHJtnndj
	 qea9JuS77BoMxunXeqpWRR7e8Lrezm4IIGBzQYLzNNB/GiYQgpWcVMkJN8l95Y2i1+
	 4FYmsAH5fw3wFjY6aDLG32V6fasQ+/Z0sw2ofls1jtq5VssOWRyZuA24+hYiK/pIrM
	 u3UThc0jkNPLsN4ZBayko3AHABMcAiuRhe7+l5RME74+C03uF1MflLqVYZkb3d/o93
	 5kXdcESec7PbQ==
Date: Wed, 8 Jul 2026 10:29:30 +0200
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
Subject: Re: [PATCH 01/16] dt-bindings: display: bridge: renesas,dsi:
 Document RZ/G3L
Message-ID: <20260708-hopping-exotic-baboon-6c5a46@quoll>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
 <20260704093433.273672-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260704093433.273672-2-biju.das.jz@bp.renesas.com>

On Sat, Jul 04, 2026 at 10:34:11AM +0100, Biju wrote:
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
>  .../bindings/display/bridge/renesas,dsi.yaml      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> index c20625b8425e..b114ac3b111a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -28,6 +28,7 @@ properties:
>            - const: renesas,r9a09g057-mipi-dsi
>  
>        - enum:
> +          - renesas,r9a08g046-mipi-dsi # RZ/G3L
>            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
>  
>    reg:
> @@ -108,6 +109,20 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  renesas,sysc-pwrrdy:
> +    description:
> +      The system controller PWRRDY indicates to the DSI region, if the power
> +      supply is ready. PWRRDY needs to be set during power-on before applying
> +      any other settings. It also needs to be set before powering off the DSI.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

This feels a lot like a power domain. Please elaborate what is PWRRDY
and why power-on/off and power status within SoC (important!) is not
encoded as power domain.

Best regards,
Krzysztof

