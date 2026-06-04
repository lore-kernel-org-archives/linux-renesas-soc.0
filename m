Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62EC259C80;
	Thu,  4 Jun 2026 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582299; cv=none; b=ddvnutLRemxuNOOW3HVtb1Z5D7DOW+qzQxNdWZ0OWToFShcqm4n04qXrKa8V9s3He6xDcIMUd0uqgNSU6ai+jwT0M4+23B6r/4eFk0I1WSFtJ7oduTe0cg9kjiUHOGbno+US4UcxgjjNWMTakhewl0UftYn79psgn1BOhWfw+Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582299; c=relaxed/simple;
	bh=c8MRTraEcn0OO+rGytzTy1mD4h0gR3K/7RG7LVvZFt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFQp+jW/NSGRSTGIQQH9z+yERm4wnSaPzIoZOVrmc6jHR7iXgp5BWeBDYtCE3mEYBgBuCedAVI+fYWT2JY7qJTlffMsjBQ8CdwYT0+9QU1O2jLBxSmBrTx6mhKM+rJG5TwjxjdQRpT60r8MmDXOZNUQpKaSuS2hxO7oV0en0Aro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOgx2IWr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOgx2IWr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9E91F00893;
	Thu,  4 Jun 2026 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780582297;
	bh=0Sh8NbjgSm3sX3rE5H27Sw9yGDX3iYRRahDZnYRzigY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XOgx2IWry6BQMO6hf28wILss3wx9fWI9pLICcpBiEVvTiBYLRWH76sW0VccP0wsD6
	 x6Rp4lgpXHKOwgxN7oGX5zC0Ei4svwjET5+bnxB07wPuFNMNIQjU93gMZ8agZUJkm+
	 j0jhV99LPtm1d9A2nOAmT964FlZr8ApxETSo9q2G5esDbwSCW4mTxcsEIV573cdI/9
	 RL+/pdbC+5hBwMJ6PSxYhkuue/2TI2vZgDeNel2pyMmGlonrJQtlTNJk5vuH8Mi1iW
	 PmLjfaIbytO+sCNgAFxGSN4VTEeChsII1Vx6HOPJMbaR7X1oreY3CGSQjHKg2EiJ2d
	 XKvrYEL43jJFw==
Date: Thu, 4 Jun 2026 09:11:36 -0500
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, john.madieu@gmail.com
Subject: Re: [PATCH] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names list and ports schema
Message-ID: <20260604141136.GA328529-robh@kernel.org>
References: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>

On Wed, Jun 03, 2026 at 08:28:05PM +0000, John Madieu wrote:
> Express the dvc/src/ssiu dma-names as an items list rather than an
> allOf-wrapped single schema, and drop the now-redundant maxItems. Fix
> the ports container to reference graph.yaml's ports definition instead
> of port-base (a ports container is not itself a port), keeping
> port-base on the port@N children, and constrain each playback/capture
> phandle-array entry to a single phandle.
> 
> While at it, drop the unused top-level #address-cells/#size-cells since
> no child node uses a unit address and the ports node provides its own,
> require interrupts/dmas/dma-names on the src sub-nodes to match the
> ssi/ssiu sub-nodes and the driver, pin clocks and resets to their fixed
> counts (47 and 14) to match the clock-names/reset-names lists, and put
> compatible and reg first in the example.
> 
> Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  .../sound/renesas,r9a09g047-sound.yaml        | 71 +++++++++++--------
>  1 file changed, 43 insertions(+), 28 deletions(-)


> @@ -143,11 +139,12 @@ properties:
>                through the list to find a free channel.
>  
>            dma-names:
> -            maxItems: 5
> -            allOf:
> -              - items:
> -                  enum:
> -                    - tx
> +            items:
> +              - const: tx
> +              - const: tx
> +              - const: tx
> +              - const: tx
> +              - const: tx

All you need is:

maxItems: 5
items:
  const: tx

(The schema form (vs. list form) of 'items' applies to all items.)

>  
>          required:
>            - dmas
> @@ -203,12 +200,22 @@ properties:
>                falls through the list to find a free channel.
>  
>            dma-names:
> -            maxItems: 10
> -            allOf:
> -              - items:
> -                  enum:
> -                    - tx
> -                    - rx
> +            items:
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]

maxItems: 10
items:
  enum: [ tx, rx ]

> +
> +        required:
> +          - interrupts
> +          - dmas
> +          - dma-names
>  
>    ssiu:
>      type: object
> @@ -229,12 +236,17 @@ properties:
>                falls through the list to find a free channel.
>  
>            dma-names:
> -            maxItems: 10
> -            allOf:
> -              - items:
> -                  enum:
> -                    - tx
> -                    - rx
> +            items:
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]

And same here.

Rob
