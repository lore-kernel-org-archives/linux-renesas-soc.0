Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58669466B5E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358892; cv=none; b=TO7AxQrM0dBhivSAQkiM+LciWCMXlIm17H6KnRrTZyRVHHQgP6EtDIljUYXR/4B2It9TDN0qxSF2Zdtl/6VZYBgd3DW6sKuJNigLLCkqVYo5NzIYqjvWEMoxpCizuuRHGyfZvLGk87yj3LZ0Cju3EB0jH2sobLgGeajrwkBaZ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358892; c=relaxed/simple;
	bh=3iYJBxh76ksrHroBjxLWDni+wZz5yO+8mFWg+dS++j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pGQJJ0/Z+Ybw4FkV6yJxVxn3ySwXZhEm2uqlnj6gPvTXXz29XSCPTemBoiVkJTJI8dAR6/6CFpuen++YXdC2Bk0J5w3H8wOFRSS/BAoNCHdh89wNtncI9IE7TxOr0GQmzRpAY3mxeSSTY9Mt5FrsmPchP1DlZ1wKWhddrhud8io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c652293bcdso1194713e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 07:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358889; x=1788963689;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=evP2uDnq5KuHvliZWqlHGeP115Ejr4LNw5LNG8+8bBg=;
        b=So9vRxi4fsmYCucJ28jKmj2+1OsQDcughPAPw2oSMJoIMbgEC1f7oPzT5CMLitGRXY
         CZZ58MJFg7AizpRXS7JoZtmD6/j/Lk+k0ME83N7GBvchnivxGYAqMty/HEiqzEQZPyJ3
         D6+QUDTW3SVNW4DqB8QpUAbWlnEsB1KhhzKMQXSQyVIv3Wxx6VxeNFZJtcEL99wSxzUa
         H9N+zyuuw0urgsF34ZNEUiaR49xOCIORKYU/yI11ipX2evSDv0LOCweymEgnLxOmQTDg
         vT3wNVEWeYsJWzCO2nmlGBqnu/ox5XKPgBOyJrJHm6XcHeF+ZDmJ6fQ7PEl8+aBhIMDh
         MZQg==
X-Forwarded-Encrypted: i=1; AKwUvBwX+REVJrAFrvJOCFs2Bds7a8EEQBPzLVzbeJd65d/sReAm/jkuTtjaWmkYQ2714KAIYUVGWVRHNAMYGb6ip0pdEA==@vger.kernel.org
X-Gm-Message-State: AFuF++kLFD+L8jAy+JWkZFxvbHb0o6gWTIB1udPhfTgnqMMKoISuDY/l
	p+4OSKKfolxZ9VzxtckvudZ23YuAbSK8GooVvlr4yipMLuxXbwvz/lQLHCsfQ0ri
X-Gm-Gg: AYBFou3VfkHheQbPqPfFma9hetxbo0O91LJqgiM3vyNPNQGIfX7QkAQ7TC151S5qi2T
	XN151H4dsf2SCNDG9xMLuhYAZPl2uB/BkHAASZfdBn+KW+mpABpt2r9SZTxYVFhA2SE0SDKt63R
	W0IlZsGe4usYs8pfHeh8NCgZIprGg7//AXkRJOr2oy6ybmbAdSChLL+qK4CneYDYBg7e3Tauw/p
	uwDRqeNOAsiPY0Oh+73XAfaeMKFeC/hMXok03zVZR0cvZD9gN19CpzFbE1OkcdOkWFcVXMN4Wl7
	izKR9YNpBdXC3LZJ4KKThpFuOUQ/Y3mUpBIPwNuVSP79SiH8mKohhepH1aSOwl9/Y2z1rWzzb+L
	BN11WC499ginMVB7uOJfGwWPGjcU7yQCKnvM/Ske2D3MkjWRkMi1ItuXSq4ZJpOEqUsng45uaiu
	lCMrUp4AKZ8/kreeUgapu+YsegikieXgqANVMteE2OIeUSTEKxVpKbizHVbIA/CMiJglltmhyUE
	6cXo2GQp4uH+i01v5R0yLdYJpQ1Bg==
X-Received: by 2002:a05:6122:3701:b0:5c6:731e:3c8a with SMTP id 71dfb90a1353d-5c7d2489256mr2444550e0c.1.1788358881438;
        Wed, 02 Sep 2026 07:21:21 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980672bb0edsm2252423241.5.2026.09.02.07.21.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:21:17 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so961183e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 07:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxrygIb0VvVg7dTlTi7lCTBEBcb3TFR6Ie+w00YDSnJ1d7qb7UswGPTUeDG7T43JENbu8lwhMZBO2vVXr8zeU4DqQ==@vger.kernel.org
X-Received: by 2002:a05:6122:3701:b0:5c6:731e:3c8a with SMTP id
 71dfb90a1353d-5c7d2489256mr2442213e0c.1.1788358863528; Wed, 02 Sep 2026
 07:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122113.1426778-1-tommaso.merciai.xr@bp.renesas.com>
 <20260828122113.1426778-2-tommaso.merciai.xr@bp.renesas.com>
 <20260902-heavenly-ambrosial-trogon-b7ab03@quoll> <apgsOubuGuvw_0rf@tom-desktop>
In-Reply-To: <apgsOubuGuvw_0rf@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 16:20:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0y5Dg9tW7fAM3QQHKpAw_+vmjj7v-XeZmrushQgQFAA@mail.gmail.com>
X-Gm-Features: AcwNN1X9A4V0FkbVpKVtvPWiA_DTIG3JNljzBRxP5oY3Ch7smDLgUzau8FWVpIQ
Message-ID: <CAMuHMdU0y5Dg9tW7fAM3QQHKpAw_+vmjj7v-XeZmrushQgQFAA@mail.gmail.com>
Subject: Re: [PATCH v8 1/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Wed, 2 Sept 2026 at 16:03, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Sep 02, 2026 at 08:37:06AM +0200, Krzysztof Kozlowski wrote:
> > On Fri, Aug 28, 2026 at 02:21:04PM +0200, Tommaso Merciai wrote:
> > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > > Processor (VSPD), and Display Unit (DU).
> > >
> > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > >
> > > Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> > > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > @@ -21,6 +21,7 @@ properties:
> > >            - renesas,r9a07g043u-du # RZ/G2UL
> > >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > >            - renesas,r9a08g046-du # RZ/G3L
> > > +          - renesas,r9a09g047-du # RZ/G3E
> > >            - renesas,r9a09g057-du # RZ/V2H(P)
> > >            - renesas,r9a09g077-du # RZ/T2H
> > >        - items:
> > > @@ -35,25 +36,51 @@ properties:
> > >            - const: renesas,r9a09g077-du # RZ/T2H fallback
> > >
> > >    reg:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: du.0
> > > +      - const: du.1
> >
> > du is the name of the device, thus calling items "0" and "1" is pretty
> > pointless - indices already define that. Please drop the reg-names.
>
> Will drop this in v8.
>
> > >    interrupts:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: du.0
> > > +      - const: du.1
> >
> > Same here
>
> Same, thanks.
>
> >
> > >
> > >    clocks:
> > > +    minItems: 3
> > >      items:
> > >        - description: Main clock
> > >        - description: Register access clock
> > >        - description: Video clock
> > > +      - description: Main clock for DU1
> > > +      - description: Register access clock for DU1
> > > +      - description: Video clock for DU1
> > >
> > >    clock-names:
> > > +    minItems: 3
> > >      items:
> > >        - const: aclk
> > >        - const: pclk
> > >        - const: vclk
> > > +      - const: aclk1
> > > +      - const: pclk1
> > > +      - const: vclk1
> > >
> > >    resets:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: resetn
> > > +      - const: resetn1
> >
> > Drop reset-names
>
> For reset-names, I got the the following comment from Philipp in v7 [1].
>
> Dropping reset-names would force the driver back to an index-based
> lookup, which is what that comment explicitly asked me to avoid.
>
> [1] https://lore.kernel.org/all/8382e2b9fd07fb1132c26e228b3899336fc1fdd4.camel@pengutronix.de/
>
> Philipp, Krzysztof, could you agree on which way you'd prefer?
> I'll follow whatever you decide.

Until we get a variant with a third interrupt (or reset or reg),
which is not related to the number of channels...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
