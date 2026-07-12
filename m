Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3BD31B833;
	Sun, 12 Jul 2026 15:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783869874; cv=none; b=jPPKQHB35QZLMvXroihg/gh8IjSQKN4ehfxyXs/ODtmRybfae9Cekzh7Z/7k5HrhpZbUWqYolTwr78+d6DRCWpJOGp1/l3pERheo4ICKCf4po2MC1f4bCqK3HZHhjuQuIY5feHjF9gg4KYjCcO++c0NpKO+JIuwBgYk6/nCWPX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783869874; c=relaxed/simple;
	bh=HKWwFZGg7PTFUjVraGUbn1nC34PPqeJUJ8Wl+BoZfxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uluND5l1rZ+EPbsg5hXAiDHS4+2CrgEhcuK+4rWx4WWilJoxa5lkbcTKYbCw80Q96ogMUwEnaz/lIK5mSVWWGO2M3I7iirzV1qzhYd+a41wnkmFmbY8A5VcXUQIUWQDzvW09cYW3oZWhVwWvu0c9pQFydhHM4LnG3gDj5yjv9yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXX1BiDI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXX1BiDI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783CE1F000E9;
	Sun, 12 Jul 2026 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783869873;
	bh=HQIHMdxN0FPpuhQMFBvDbnB9+5Gm6o4Vk0oxtEYadb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IXX1BiDIrRCafafq1RK1qogsHcqU1MZbu+4n+7pVF7mwXtFkSmQVvxK6L0pEzl9hn
	 XZNp+9pnme2K+FN5lkyHHw2cAq2rIZnJnSFqYNcNuvHRjIpXPkjnNmFebkjK+wYxHp
	 +aLKNbJYT/XWGqgsYLbnGBLIEedxQdJt+J/GUuRODn19VZULZ4a3thPuaAme8dmYq3
	 GLNsXHSIs5yYSlGjsfS7qZErTSIEW20N8Ct0vkHDyf7fYxeB4liJnfH8v2ZqYanMBN
	 tL82ylSdO80OxGwf+6kHon+LCaetDcxJ7Pe53mlHUe6kcqr0hUETsEkgOoVqWYbqOe
	 bSa320TOJoqjQ==
Date: Sun, 12 Jul 2026 17:24:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"magnus.damm" <magnus.damm@gmail.com>, "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 01/16] dt-bindings: display: bridge: renesas,dsi:
 Document RZ/G3L
Message-ID: <20260712-jumping-whimsical-alligator-8fa8ec@quoll>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
 <20260704093433.273672-2-biju.das.jz@bp.renesas.com>
 <20260708-hopping-exotic-baboon-6c5a46@quoll>
 <TY3PR01MB11346CB08784610C00EBC870A86FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346CB08784610C00EBC870A86FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Wed, Jul 08, 2026 at 09:39:01AM +0000, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: 08 July 2026 09:30
> > Subject: Re: [PATCH 01/16] dt-bindings: display: bridge: renesas,dsi: Document RZ/G3L
> > 
> > On Sat, Jul 04, 2026 at 10:34:11AM +0100, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > The RZ/G3L DSI IP is similar to the RZ/G2L but has different global
> > > PHY timings and also the PLLCLK is ungateble clock. Add the compatible
> > > string "renesas,r9a08g046-mipi-dsi" to handle these difference for the
> > > Renesas RZ/G3L SoC. The power to DSI region is controlled by SYSC block.
> > > Document renesas,sysc-pwrrdy property to handle the power control.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  .../bindings/display/bridge/renesas,dsi.yaml      | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > index c20625b8425e..b114ac3b111a 100644
> > > ---
> > > a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yam
> > > +++ l
> > > @@ -28,6 +28,7 @@ properties:
> > >            - const: renesas,r9a09g057-mipi-dsi
> > >
> > >        - enum:
> > > +          - renesas,r9a08g046-mipi-dsi # RZ/G3L
> > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > >
> > >    reg:
> > > @@ -108,6 +109,20 @@ properties:
> > >    power-domains:
> > >      maxItems: 1
> > >
> > > +  renesas,sysc-pwrrdy:
> > > +    description:
> > > +      The system controller PWRRDY indicates to the DSI region, if the power
> > > +      supply is ready. PWRRDY needs to be set during power-on before applying
> > > +      any other settings. It also needs to be set before powering off the DSI.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > 
> > This feels a lot like a power domain. Please elaborate what is PWRRDY and why power-on/off and power
> > status within SoC (important!) is not encoded as power domain.
> 
> We already tried modelling signal as power domain in RZ/G3S and finally Ulf
> agreed that it cannot be power-domain[1]
> 
> " SYSC signal seems best to be modelled as a reset.
> Although, it looks like the USB PM domain provider should rather be
> the consumer of that reset, instead of having the reset being consumed
> by the consumers of the USB PM domain."
> 
> Then Phillip proposed power sequencing driver[2] and finally he and Rob ok for the 
> solution [3] 

The problem is that you did not implement or reference here power
sequencing. You created phandle without corresponding any hardware
signal and used "driver" as an argument.

power sequencing does not mean you can stuff random phandles here and
there.

Best regards,
Krzysztof

