Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486924;
	b=L7V/yDIzzLbTY6+oj+C78Whxxd2IAlJXRtKqPM7rP6O7V79h+EgPcIxQ7sQ3a795reSZ
	 v+8bU+lagCfValpTzmxQNE3DANOALdM1CCzD+856rNENsAbLUYEAgAWnsE+EGXu0ODFpH
	 QuhvJCFLxZGoaBw4tYwK+Jcvnqae1X7ejD52lGh+4VKD/hlZCCJSr6PfjxrzQ3GsphB6d
	 ikLH/RCtuAIFVTzbJ7wIwDaTvdkjnuDKUlSGqMwB7vo+1SQcjZAdrA+BYbuXz5U6UkzIM
	 acC+HO0P/O0PiE2A2U4i0Q7kzm23mz3/e5FCinNwZCqS+c+bI72rQfTfBpV5r7g+GDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
	b=W9XK29oa7clXO9U/l2VekDhsBbu5hZ+WACzHDY/cnqheo4YvfwfH08qp0w+Jlc08QFIP
	 jnFBfxjiZL0ay4PTWUnLp8/GdvynxXnbmtHWA4fKRstC0EtvC8MjCTlvIYxazEQ4LJU5i
	 XAuHdCnmxeXqEfZzEPAMUTIeucmMWhoGaASG59f9OnZa0kwOhQrJSX4+l2Y5qOWJwH/Q9
	 H/1JpP0FVY4xnCOo+CbVFQeS9iVo9DFoUlUONNBmyeJNWOSvg8G9474qcMwrS3lyeA909
	 D95AZ1CtovIkFOF47EywHDgZiRRR17ZhelrugbE31Py/HcZY30e8h+7s+6HoBc+Pv6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ums0J9tX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0BD606A321
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 12:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ums0J9tX
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso29547285e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 04:35:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794486922; cv=none;
        d=google.com; s=arc-20260327;
        b=GSblSs+7EjbmlIzarTZp+Z0XSKFGVkvZJ/OkJHW8ltVVJne1KhOI/NUAf1oSLUJ5Hu
         WDCSGtzkChs5hrfAcg4w/rOWj7tAlW/W1eH7V7t5TxMxGGDX4hqoXg+rckLtVONN/qMt
         wX0/kX8ibZrb2he7Dm1AcFhyhwnk9ij4KiMde4kzMqxxCFE7PTI9HeE4+JhWEjLk96DQ
         j13K/M9Dj4g5R9vINfHWQcQJBgLELV71eP15EdAI01QcOZn6ja2hSTgXJD7O8WafRXRl
         aV1rynuK/NzMvAB/GtvQUcBd4lwjfvUXHVz6FaCrrawgR6pp59JN38p7HXD6cggvTuW/
         i0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
        fh=uVAifSmvNl68UARLSu/kDCdZ10yYnXc/3HIT6tSbRyY=;
        b=MhDsPJKV1p3rthmG9N/gVxzdnFG4N95NziD4U64XqDtQpu5Y7OThUcQTGdrZPv1q1c
         8xaX6uY5LhJMyM2Ob/iomQo30nyF+5oPO7K6aS7dztYkxOCYJ2cBTn0ikVX5nJCbPTWW
         wDE75YtjWYvXOQixsrvmMMf3lbX11XOv844LTLhPoL2ChgTvphAqxz2um5c/iIaZvfzY
         Pp64MIMND1EXwHlXYkpYay3iO+ctnrH6Ddp9hVrCujih5mQ3BD0xC+sRtZSJTPzIUQwe
         O7ZRUjytzZV0qSJt93Nhy+13QODpA6cyiG0NVhHkMa27OCMrHaTYOyQVJXbUauCR7t01
         UwEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486922; x=1795091722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
        b=Ums0J9tXeHFKhdP+fol+vzmGnv1+Fue5K3B2lj8LLRXkHXY3JaZgN1a68UZDyVwlr3
         b+0TXQx6uz2DxdQO9FJRj6XA4Pwp5YiLBfzHunkAP5nZXfa20p8ohSXA/npzC9fTPsof
         YCI6CV0szHYmKPkXtlYqz3aToZBEJPSZnO3qJny8ZRSWwckefgqbggkEwAI5aEzUA0Vt
         ks8xjf2GELPaPEaJ0BQpF8FQOm3C6U7vbbVBf6l3M2MbyEnOxikMPL1dXYKfefIFcB7Q
         NDEggS0PaVnv+7mUAzLQBIW9SgIF2fBI7ZuxfzOOKngGjXrCabf714t5TK6zi46fwp+G
         FNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486922; x=1795091722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
        b=RAI5npAhnLvPa9iP40s8eZTi1Evfj+M0Mva+jNsJreA7BQyt6bq0auG2C16P8hnl88
         ya+N3KijiaCwIbsR/IHiYpOowLfvTXmWxA3j6NpGQ6jB9b7yXB4NdYpPm5/a6a2fgrid
         oY8uOyJFrXERlm4osLuslU1oLVWPelF6uSPTzBihFLfnHT5QA44D7fKztvTcIVUO6ZVT
         GWnDMJas2AVvJpm+3JlNVxQ+DHrZRNeYNSk0GmdTijLcBiuKZZ+SHKS+uaMHnNy2GOVU
         fqSGMovIhlz3uvB2lzgVkzViLJVgSj19DAEZsfPT0o6Pgoc2A1oWoAqCOJhxSZ+nB//y
         /ePg==
X-Forwarded-Encrypted: i=1; AL+hErHWpKoNnH7MkKUoQ1Qty6wEhTEYvRcmBYwsA7I4M5y5B+EcMjOGHc75i/c5qHSJrb6HICg9/ZguD459jfgwUSjxhg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/H6eEZUH1CtZrNqdvunyvG34AUX20Woc9CxZDILZ71dvHXHjxY
	1WpFKSvCq2yLwmXWWeRhYjtgQgmtXALBnJ75RLWZ8L4llfKcVBqIgnBd7Ni7sPkadjoKGscicGq
	/LJ4BORcjCY9JtY2k2u36kfh5gCYJzEI=
X-Gm-Gg: AYBFou00S+feRx5x0BDdRNV3f97yp9QjB13zaNACJpCugNvqxPWp2VCNUp9+ruti+9F
	6vQILUvEc8OJylMuLR4FuE8HDUoIBIV3ig2NSQzeScrGTF3FNhIuxTl+G3LMljGpZOxFB1CFq9J
	GJtBWUKfBFsyU0o4MlhSUBmq2O+552kxAOZD5Md8EAiFgNXLk96saN+x/TinJ3FpgSCau3HyGJ8
	qVtd30AfRWDBWkjnIbQm6lGiTy8v/cTPP/d7W8yokn2+8xxDoCklaXPrW36ZKp5eLE0Ry8uDEIP
	MNhEVdJpT2TbGZOq3bmN6anCU27aexJIKUJk0m4hPMrmmRXxn7tAObI5hCYSKJFBVbJ4WqGgXFu
	Wi6y1i4yepU/4BqZ0JH/t5xhwzNotLe0C2IwiLG33f+TmuUIPVgHL4cMYyfwiXvGIbJuyPMTPaE
	ngwgZ3AhLKCukJas6KPROHe+N220LkCLFRr4AFEF5GaimW0Frzxm9QycRGr18OU2QDo9PXu0Y/1
	h9Qp0U6xWb9l/xO4wUV
X-Received: by 2002:a05:600d:84ca:20b0:4ba:493b:3401 with SMTP id
 5b1f17b1804b1-4ba493b3412mr59282305e9.9.1794486922109; Thu, 12 Nov 2026
 04:35:22 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261104182105.1102555-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261106154454.GA3654918-robh@kernel.org>
In-Reply-To: <20261106154454.GA3654918-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 12 Nov 2026 12:34:56 +0000
X-Gm-Features: AclHuK9CRcx1aTAbEKf-B1mAZlFhg1ndxA-uzYSl8n-I7fAtC3zV5PucT1NF8gU
Message-ID: <CA+V-a8uN1D7CQmKtAizY40NUOXHDLO2VG8JiAiLTyNb6uG=9jA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 05/14] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Disallow ports beyond port@4
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review.

On Fri, Nov 6, 2026 at 3:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Nov 04, 2026 at 06:20:53PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Restrict the A5PSW ethernet-ports node to ports 0 through 4, matching t=
he
> > hardware configuration of four external ports and one CPU/management po=
rt.
> >
> > Although the schema pattern limits port nodes to port@0 through port@4,
> > additionalProperties: true allows other port nodes to pass validation.
> > Set additionalProperties to false and explicitly allow #address-cells
> > and #size-cells so that ports beyond port@4 are rejected.
> >
> > Existing in-tree device trees describe only port@0 through port@4 and
> > are unaffected by this change.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> > - Added reg items validation for ethernet ports
> >
> > v2->v3:
> > - New patch
> > ---
> >  .../bindings/net/dsa/renesas,rzn1-a5psw.yaml         | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5p=
sw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > index 9c477ceb170b..250c59e58439 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > @@ -63,12 +63,22 @@ properties:
> >
> >    ethernet-ports:
> >      type: object
> > -    additionalProperties: true
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
>
> Drop all this.
>
> >      patternProperties:
> >        "^(ethernet-)?port@[0-4]$":
>
> And make this "^(ethernet-)?port@". Then any node will get the 'reg'
> schema applied. That doesn't check the unit-address, but the way to
> check that is comparing it to the reg value (not yet implemented except
> for specific buses in dtc).
>
Good point.

>
> >          type: object
> >          additionalProperties: true
> >          properties:
> > +          reg:
> > +            items:
> > +              - maximum: 4
Here I can drop items and just have something like below:

         properties:
+          reg:
+            maximum: 4

Cheers,
Prabhakar

> >            pcs-handle:
> >              maxItems: 1
> >              description:
> > --
> > 2.56.0
> >
