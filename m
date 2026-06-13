Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059DF24BBEB;
	Sat, 13 Jun 2026 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781347221; cv=none; b=j0uWbscndajX4hHKa43cCXA3beZjiKibLfr4gjVgcNzFkTMRsF/P4gDqIYpfOvG0FWFV7d6naWVhd8589FX3W6cYpMYi8io7bjf+2pQfVaWLMarUievdYRZ9o3KBfRWXVF2reuFwyQVfVby+Xl/SIOF7KpQogcYRfej81rwSbv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781347221; c=relaxed/simple;
	bh=mKy9p4eFuhPMz20brPJiFpP1Z8heJuVJq5aehMn1Lps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ch/spyVf+b9ECArGt25yz3lb/QVddy+w4r3pPVzQn4AJ/4yITS5LdYdnHxTn4HNoRwWyV9+/XLvkW6lW9zrZjQmJ6a/8vlf5Ye8zgJVw+egGDxoujDFBMlk+TEZRjLWjdH5cN9KjN++5lo4rccdfEYToJpcmamLyAzOm7S2ZGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7zjhANK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7zjhANK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6301F000E9;
	Sat, 13 Jun 2026 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781347219;
	bh=WN1KOQKsPjYjhDch4rXEbyYyLtKjQH60TZSpwPrEm6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I7zjhANK7zNYoaZWIrOcKSIGHeCi+H+wozB4cr90UcC21rcbLyYk3K5NT7bG5ft89
	 bopJaMAnagWYHOgLDS/hfGtQUocU7Lp5+NF2ZWsJI/SnKf2MbWsoAz80s2iZe2okSl
	 FaJUZgYKUzigBWdRs0ZfKTDxL3fOSDLCdud4imj+RnLkka6HAeZA+2HCzAC8i2PrdS
	 0JuYhm7ionWP5MJge6+DyIJHXmpZXi3cmKI9ZCSdm8LTzwRaQvLUhabb4D81DvG/1l
	 7CHDh5ZpYQrs3UTJxJ1JtDzX0j9SkJzWp1bpTBIMv2usUlbHATHxnJrgiLG48OJd+e
	 VsnQX4nj+DVgQ==
Date: Sat, 13 Jun 2026 12:40:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 01/11] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Message-ID: <20260613-careful-vehement-loon-7e808b@quoll>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612143048.317907-2-biju.das.jz@bp.renesas.com>

On Fri, Jun 12, 2026 at 03:30:29PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add device tree binding support for the RZ/G3L (r9a08g046) USB PHY
> controller. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
> has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
> port 1.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> index c83469a1b379..788e467b38db 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> @@ -23,6 +23,7 @@ properties:
>                - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
>            - const: renesas,rzg2l-usbphy-ctrl
>        - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
> +      - const: renesas,r9a08g046-usbphy-ctrl # RZ/G3L

These last two should be just enum, by convention.

>  
>    reg:
>      maxItems: 1
> @@ -50,6 +51,12 @@ properties:
>      $ref: /schemas/regulator/regulator.yaml#
>      unevaluatedProperties: false
>  
> +  regulator1-vbus:
> +    type: object
> +    description: Port 2 USB VBUS regulator
> +    $ref: /schemas/regulator/regulator.yaml#
> +    unevaluatedProperties: false

Instead group them under 'regulators' node and use names matching the
datasheet.

> +
>    renesas,sysc-pwrrdy:
>      description:
>        The system controller PWRRDY indicates to the USB PHY if the power supply
> @@ -78,7 +85,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: renesas,r9a08g045-usbphy-ctrl
> +            enum:
> +              - renesas,r9a08g045-usbphy-ctrl
> +              - renesas,r9a08g046-usbphy-ctrl
>      then:
>        required:
>          - renesas,sysc-pwrrdy
> @@ -86,6 +95,15 @@ allOf:
>        properties:
>          renesas,sysc-pwrrdy: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g046-usbphy-ctrl
> +    then:
> +      required:
> +        - regulator1-vbus

else:
  properties:
    regulators: false

    Best regards,
    Krzysztof

