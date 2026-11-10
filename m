Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310729;
	b=ia61vBoB2GzTE3MqhNnXaCyiLJnA3c++CbgAqM8yjsGrItQnOamd03i6FTXsv++fp5qb
	 i72OXtGUokfLA1eOT3Y7AbkHgPTxn5Z/xsMpm3z0sLaAmElAFVgq5yLd6fQPj/HEdlNF3
	 DP2zmwaweqTDpbRTCqOoJ8r6CJn++SxxtF+vq+lH9uF7sHzGY40fvc+aZ0wlw1DAHcKeK
	 E1Ja7okzKJVjNM8do/behvc8ISjEynNpZ+yubUvmfDClc7vVS9qu5of8rYi5ADZmEEj9C
	 WbmimPpgJsgyyqOw91swBZBGyNOdQdY5/8vXkiVl4QN1CW/cGxnRo9ZkwFkioxJn9ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310729;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=6I+JHeyZuaCKZLVFRW5Ed83CP01+3aMwrBoHmGNmzl8=;
	b=VicmJZjezJTbmLJzZhbNmQvf+Fw9/blo5iWY+6Epf1xuFGYdKazPnOgRYRwTwpj4Qn/M
	 13cjE7Xco4TmqxxV6TZH/xpLdg3koOuWXZZHqz0bHmWGSmSPlcG4ffICePqhqmVAcwR5R
	 gdjB1kLJ2Xq20D1n8YZU7oOSO//d+U+NfDrKbQOPYd7nSieKxlCO1bULXD1mXZ6t9GY78
	 wpT3l9t9MxgCaPqFPzrKzbJf+ascF1sXz9EzisFiiuwQogOz9LeUfyybMi169rcw8UeU8
	 R+MYuVCsOdJIQbhIuKaGkiclOM8Qpu7gJt0+xHhUuJY54RmOZwwmLKSvk74EXUjTTig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC5560A2600
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 11:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC5560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so1106047e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 03:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310728; x=1794915528;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6I+JHeyZuaCKZLVFRW5Ed83CP01+3aMwrBoHmGNmzl8=;
        b=l8po2BeVF1ZglCgfP5GKTXssNMyKrjJ1k7iM+EtktYhRqx6wCWR9iaPicuhkZDjYxX
         cVkdGT2MWEbe1MxLRjC+DMze5E6ol1pJ+2kWQDV4Plf0WvxEkj7vv+sOIht2kGCKUt+J
         CTcOYfig/LOsBa4wnIgU7VshDR12GZLAFJBIrhfEXxVd6AfISLGELeqGgrh5Tn+6Yhd3
         0cDLU3dD1mlwL4Y9/yBCL8yXIqVjEnCZNwUJwNIrppBlgnnp1gfueFXAgXHFlwaIOdsr
         9sHC/GlYTi1NUyUWHF7BnnhYxsFK4m+ssp7AfH+3L+maL4k0mjVfgDYdCPDGCZMoJumG
         iUFA==
X-Forwarded-Encrypted: i=1; AL+hErHuJvPK02MXwtHvjGWasmukxyJjNHrfliKe1hQBuE8pE2aveETuT9TK6aUGYEL0ys1m+HD2NQF2h8RxAGcPKUch8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kesVXoLI/na6yx+3EfJzTHM+Y1lzNxfXF8WxfTKI/2bSoj64s
	fanE1mtFxcAjo+xkNaqDGFxPwN64zL8htlTwiLilT5UkDDy7A+b0baEV2b8UkzZ5ak4=
X-Gm-Gg: AYBFou3Vx53L18y/imdYMyD0nlYCRPJmdlagYvDitO/9Wjxl55hfcr4mPi/wb81Y3Ya
	Xqg0FhLD5C7uPphdguj6e0mF57acdG0oMXE3Dn3atSucpsSVSuXCPhp76UskVgaA1hwMCnfqgjC
	QtbM29cQochzvfJDvPD7KaxUkKy/elGmEkDtZQLQ/csdsXzdLjp/jnobFcyeO5KJChkEt9seCwi
	vLhlkhZldy72UV3X04PXdQWNnDJlV0y5ZJcCzjEBdnWjURbyVahpYKGTs7n2ir99RzeZcxZyTiw
	Snx/6SoI2EdZCVq8wSYVyDW3yS0jM5hYC+jf87gjVcGlvZJtNbzJIaDI7c7+5vEFeZB40LjaAWu
	YGidr5rF+lIYEtTDdAtMflIzmJMMYDi5Kv13tSaAkyNJEtRz86k0UmwaAPKdcIAT0hTx74CxTy1
	YBOLZDZO4eyBwvsmbMeRKkVhof71//xyX0db6Id2gA+uR6Qd5B08fN97KAHSweDtnpQuKBt/Ja9
	9GXPhqFV9DRjWvBvMC+ZUpB2fnWRxG1uw+BWA4NkjpmpvQ1c6KNjytSu1DSh0U5vH5bMBMMHDND
	TKM0TuPCogkv1XX3najryYQdKlLnUx5qe/TVuZXqCa6DSuFxpYPEwQDNn2I8igd96N0=
X-Received: by 2002:a05:6122:35cd:b0:5ec:16d2:4537 with SMTP id 71dfb90a1353d-5ee0d0c6e86mr707800e0c.7.1794310728069;
        Tue, 10 Nov 2026 03:38:48 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5eedbbsm1476104e0c.13.2026.11.10.03.38.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:38:45 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so1031682241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 03:38:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHw2D2f6lGR5GG4xReYj2q3yFYB/6N4JlUlZnahJAsn92s1Ut/13cxwvq1B0YEdqcGGk2YZMcK25i/zGpdK4CPpuA==@vger.kernel.org
X-Received: by 2002:a05:6102:688e:b0:7a8:1837:9eb9 with SMTP id
 ada2fe7eead31-7d301c1a90dmr782422137.27.1794310725440; Tue, 10 Nov 2026
 03:38:45 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev>
 <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
 <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com> <20261110-urban-bald-mastiff-d3cc34-mkl@pengutronix.de>
In-Reply-To: <20261110-urban-bald-mastiff-d3cc34-mkl@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 12:38:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
X-Gm-Features: AclHuK_lxOefaCYe09vBlve1NogRGIcO0y48-fj-2S6VLM4EBEDUoZvwulW0sXI
Message-ID: <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Tue, 10 Nov 2026 at 12:28, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> On 10.11.2026 12:08:49, Geert Uytterhoeven wrote:
> > On Tue, 29 Sept 2026 at 16:19, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> > > On 02.09.2026 17:15:37, Claudiu Beznea wrote:
> > > > Series adds CAN support for the Renesas RZ/G3S SoC. Along with it a typo
> > > > fix patch was added on the CAN driver.
> > > >
> > > > Merge strategy:
> > > > - patches 1-5/7 should go though the CAN tree
> > >
> > > Applied 1...5 to the linux-can-next tree.
> >
> > Thanks, but six weeks later they are still not visible?
> > Same for " [PATCH] dt-bindings: can: renesas,rcar-canfd: Restrict
> > resets in top-level"
> > https://lore.kernel.org/20261009-holistic-warping-puffin-3b92fe-mkl@pengutronix.de
> >
> > Am I looking at the wrong tree?
>
> I tried to get stuff into the last merge window. For various reasons it
> didn't happen. Anyways - I've pushed all queued Renesas related patches
> to the can-next/testing branch. I hope I've collected all the latest
> series. Can you have a look?

Thanks, LGTM at first sight (I guess Biju or Claudiu will scream if
something is still missing).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
