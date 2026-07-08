Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A99D3B994A;
	Wed,  8 Jul 2026 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499436; cv=none; b=BEEEyDOhIeYl5rZV/I0P5Uq/SqSEDbzcSDCeVF6cYboaqp5YSFIPXD6JfEt8rspMvYYl5QZI6ItgvQBxvvvi8+QCQpAqeFa/CQMvzEZdxZHjM9UcZrmGH/oc6+VpyFOZ94J1kKYUjeb/Vty+Ov7QSOt9wH6GXrznkkryXPSRLLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499436; c=relaxed/simple;
	bh=oCcqZnyK2YYlGofCxvRcruqo8OgkYBxVE5clbe4oX74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnhobyqQQ4bCvUXgZlegcvGK2Y1zZ5rN9wzXWIkp3rhn04097U+HoY+0Kfgr3IGLQyJRFX0/JmdOrvvl0pDT5zMB5a6r3NglVTTve6vHW6nny7BZtqSZiuoyUWRRFUKVsQuQLEus+wmTASL/J8SqhK5fQdUDeHC1BgZwUBmdfLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fm0grg32; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fm0grg32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353A81F000E9;
	Wed,  8 Jul 2026 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783499435;
	bh=bjtxR6NUe5F9tzlvYSS82b87oLOzar11BDinoTrndlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fm0grg32GQ29cQ6XWZw8mrwbqmtTGNsuX/EuGF+uW/cSLlZo5vOkZQVFRB4ia9EvZ
	 1I0Qnj143U8Jan09r+DQGW2iUdkdVU2WtJ94f49BvlqRWgsrUqtBMohI205zeetcU4
	 il+4iNMxqqa/SP7SVYh773xmo7zzl4FkjvtTn8Le3oqOLOoBnBfnYcHcu7f8osM2Q0
	 5JniP2rJNYPgVolBC9SkH/LDB02of6ttEnqrYcdvEwKXCwE/BCYrSqAjXlgsTSandQ
	 7WwovceXdRAJX4lHs1Ya/gTcrED7QEfTTHP+o7TO6Q+SgsifHerCKYoGxmye5P52cR
	 MahYs0gM/PFug==
Date: Wed, 8 Jul 2026 10:30:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 07/16] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3L SoC
Message-ID: <20260708-satisfied-mammoth-from-betelgeuse-d4fe94@quoll>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
 <20260704093433.273672-8-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260704093433.273672-8-biju.das.jz@bp.renesas.com>

On Sat, Jul 04, 2026 at 10:34:17AM +0100, Biju wrote:
>        model-dependent. Each port shall have a single endpoint.
>  
>      patternProperties:
> -      "^port@[0-1]$":
> +      "^port@[0-2]$":
>          $ref: /schemas/graph.yaml#/properties/port
>          unevaluatedProperties: false
>  
> @@ -88,7 +89,6 @@ required:
>    - clocks
>    - clock-names
>    - power-domains
> -  - ports

Why doing this change?

>    - renesas,vsps
>  
>  additionalProperties: false
> @@ -108,6 +108,7 @@ allOf:
>              port@0:
>                description: DPI
>              port@1: false
> +            port@2: false

Best regards,
Krzysztof

