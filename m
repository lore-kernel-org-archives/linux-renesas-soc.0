Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3546F4D8CE;
	Tue,  9 Jun 2026 06:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988069; cv=none; b=Ia2R2LwWv1MO/06yFAR4TikLEw0UeQsuV03vRLEBPQLkZUbpghXVf2uOFS422pMZ1JIK5cWT+vCG/RqKWY7HBMtpl7Zl8rEElgyL+0k+VrnDmQdD5iBtJp724VdRLcBU398kqpP/8Ich7/TmXExI9fjZSoBYFLYtI1CkpFtVpd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988069; c=relaxed/simple;
	bh=gwl0mgD3YbSGd3bezJJHMAGJlyPDVqLlW3At5TV/kgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEqwLf4Yj0UZW64e1WUh9P7Bfds/dRSbg5Clc3Qg2ZnIv8pYtYduMF2FjYQ03f/gFS6/Eqg3cjg8pO6ePg+mw7pz1og9JJvcdX9TLeRIyc0NeeoKSJMHNFYGKuBBJGOYhJiPTN/2Bvod+kSyQsERZdp6WLWrs9RNqzEtG6yojYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQ6LwpPN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQ6LwpPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83581F00893;
	Tue,  9 Jun 2026 06:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780988067;
	bh=lVR+GGb9kcP9oVHsAkYfRgRyVIDL3Rps0ij5HnWQ+Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XQ6LwpPN22zuO3eh9qTleCrY4IDdf9NkmmiNScJbRDWPhPin5c28GrqObiT/cheJk
	 CxCJxXi1iTsy6AJjlpJ+rOnkJ37mjcOW1EDjlBm0enI3L+QS7EfYOlT2Nb71YTYPOr
	 ByXFhCcCoVY8nT1Ri1ZNY6LtHKwpsQZfwdZBJaKlj1JaR8TywIvaLWXY1sksB1nn3T
	 c10NwSI21yrTSRCZMB6M/1fZhPJMsN1SilOg17FnXquKPQQ7fplOhqZnKJltnkweA6
	 MHUEn+KeC4xTpPrDjOAMPXC0MUxAkhJU6zo/YHqLWvRK2uYih7jv4MC9u9gj002KzX
	 mR9+A4niw+t1A==
Date: Tue, 9 Jun 2026 08:54:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
Message-ID: <20260609-nimble-guillemot-of-karma-bef5f1@quoll>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
 <20260609013107.5995-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609013107.5995-2-phucduc.bui@gmail.com>

On Tue, Jun 09, 2026 at 08:30:57AM +0700, phucduc.bui@gmail.com wrote:
> +  clock-names:
> +    minItems: 1
> +    maxItems: 8
> +    items:
> +      enum:
> +        - fck  # Main FSI module clock
> +        - spu  # optional SPU bus/bridge clock
> +        - icka # optional CPG DIV6 functional clocks for FSI port A
> +        - ickb # optional CPG DIV6 functional clocks for FSI port B
> +        - diva # optional FSI dividers for port A used for audio clock generation
> +        - divb # optional FSI dividers for port B used for audio clock generation
> +        - xcka # optional External clock inputs for FSI port A provided by the board
> +        - xckb # optional External clock inputs for FSI port B provided by the board
>  
>    power-domains:
>      maxItems: 1
> @@ -69,6 +91,31 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,fsi2-r8a7740
> +    then:
> +      required:
> +        - clock-names
> +
> +      properties:
> +        clock-names:
> +          minItems: 2
> +          uniqueItems: true

You don't need this, it's by default.

> +          items:
> +            - const: fck
> +            - const: spu
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]

Are all optional in the board design? I cannot find answers to that in
commit msg, but it is important - you need to explain WHY you are doing
this and WHY such different way.


Best regards,
Krzysztof

