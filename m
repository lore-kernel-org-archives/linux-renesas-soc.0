Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CC02FDC38;
	Wed,  6 May 2026 19:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097007; cv=none; b=gqVF4TNA8LWQWp0w1VFaPih0EXskEiqAforst2xWcNol6fGBsldiadLo0Jhk/UPcguy5wCjiZTsENfEjQM7LpUe6iNPEx/tjgMIs+l+1AlySStr8Y69qbGUHPN4Blerq1rePwMFXvJ7z7DhnJ1nZXGAR57QEPBg1WjppKjrI1S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097007; c=relaxed/simple;
	bh=CWjjeBSxLJ/PhJIT9LxxVUi9vAPPXt+Nm+NkyfHpUVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdlV3hLN0pSvovRzJ6+q8OjuO2vZrmBqhMHbYGptajmV8BmVqYfJuPoGJzURiZjdVRNl37+A4DhCVe6iSH/0LqF4CTqpwN7eoAnSCsrBHCsByMsX6fTa5rsOsNoCOWckXNs47xAZh+oyWsj3BPtS5nnqoj9Ao4fjtTs+M3+Lxr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VajIfYK+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VajIfYK+"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DF0CDA;
	Wed,  6 May 2026 21:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778097000;
	bh=CWjjeBSxLJ/PhJIT9LxxVUi9vAPPXt+Nm+NkyfHpUVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VajIfYK+IXrqe845Dd8lP3zE7zmGBCNQq1uGwbfCaBGWbgRenuLU/+BWhZFaLf+l9
	 FgLmcwTIH60Ec2hnRo3aa9E8cEmkXeYu8Qgrt8jOIkOaeWQG/gopM+jCLM8M9mq0RN
	 StZnxTlQ6XZKWsPB8BX0xdF0pklwJQdGR9mXarKM=
Date: Wed, 6 May 2026 22:50:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
Message-ID: <20260506195002.GA1778786@killaraus.ideasonboard.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Wed, Apr 29, 2026 at 06:00:09PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.
> 
> The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU and
> supports the DPI interface, but includes SoC-specific register differences.
> Add a dedicated compatible string to represent this variant.
> 
> As the DU implementation on RZ/N2H matches RZ/T2H, describe it using an
> RZ/N2H specific compatible string with the RZ/T2H compatible as fallback.
> 
> Unlike other DU variants which use a multi-port model, the RZ/T2H and
> RZ/N2H DU has a single output and is modelled using a single port node
> with one endpoint. Add a port property to support this and update the
> allOf constraints accordingly.

Wouldn't it be simpler to always have a "ports" node, even for variants
with a single port ?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 2cc66dcef870..45678d536a75 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -21,6 +21,7 @@ properties:
>            - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
>            - renesas,r9a09g057-du # RZ/V2H(P)
> +          - renesas,r9a09g077-du # RZ/T2H
>        - items:
>            - enum:
>                - renesas,r9a07g054-du    # RZ/V2L
> @@ -28,6 +29,9 @@ properties:
>        - items:
>            - const: renesas,r9a09g056-du # RZ/V2N
>            - const: renesas,r9a09g057-du # RZ/V2H(P) fallback
> +      - items:
> +          - const: renesas,r9a09g087-du # RZ/N2H
> +          - const: renesas,r9a09g077-du # RZ/T2H fallback
>  
>    reg:
>      maxItems: 1
> @@ -53,6 +57,10 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Single output port for single-output DU variants.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      description: |
> @@ -83,9 +91,7 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - resets
>    - power-domains
> -  - ports
>    - renesas,vsps
>  
>  additionalProperties: false
> @@ -137,6 +143,20 @@ allOf:
>  
>            required:
>              - port@0
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-du
> +    then:
> +      properties:
> +        resets: false
> +      required:
> +        - port
> +    else:
> +      required:
> +        - resets
> +        - ports
>  
>  examples:
>    # RZ/G2L DU

-- 
Regards,

Laurent Pinchart
