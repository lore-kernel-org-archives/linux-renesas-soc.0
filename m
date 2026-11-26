Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707471;
	b=f5TMFb4QTV5OReQXEFFT0J43jtrynJZzh9RDslmKwRgUhJnN/1jWx+Xw+c/znB9fzkhz
	 wncxlgrv15oSf5pHiLdgCxjVBzP08s9MoIiN9F14XS0NfiNU2vfr3kuqB79RWsJyrn3hW
	 gi6sMw4K5zAuTseIoZb7568vCgHyjeu3eq1KN9CNB3Ari8BhMSlFNLY+Lp4YcmJRaeS4q
	 tpD95EEjCsK3zVPeYjpLshRIIMgNQIc7v10qo1+C/BHfE/AJAGbQfl7pENq8MFxZQU2jY
	 +cenZ5onuR2Aqqa8WybFNVC80gPEVyGs03khswOq077XKgsuH9bRLh5pcOrylOwQrog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707471;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VTt6jbaht2zGBYKNI2lpBkMP4t0i6MoEcGFYwP5l2hs=;
	b=gUyXUkGgFjYPco0PrMW6vamSRuh3a7ph7aZCHy5C2rQC3DYT5VBiJ+kN7imjWlCe/PKJ
	 4dr/FXnKL9D2Um76dDMZFA/yw2QwsAYb/BMSXRB9FLBUq7Zt8CVZhdj+DidSyuUfEK+KD
	 AoNcdKO713fQJKYb7fASGInv1koqigL9/P41OaTEVVihrPR9xJ/1bdrgmtvIZ+mvy6qQZ
	 5m8scH8fD567GQD2fi+uOXKvdlJ0cy+D/YUsYzOM64tgi82OlFAjJa8ezlhhlRVQJIN0R
	 yoJlOaoK4BfycvpVxI/OcSZfvlgpjLcnrUB4QOhslnfO/tf8dL0YcrsBpAbCxmBaKDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BCC606A31E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 15:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BCC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5495d549924so75585071cf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 07:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707470; x=1796312270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTt6jbaht2zGBYKNI2lpBkMP4t0i6MoEcGFYwP5l2hs=;
        b=BYzS8CCv7gXCQVYJeRHBDIOmo5zZtEyYkyOIlHDG1bIUkFbJX5FPNNNjq4Lhtswr3C
         3voLY+PueVgVO+Vc5pCQfgwyPCF4aBjqUTErlctA/QV5wdM+lpXGjXXlejvEWw2bV3y3
         pdd/Xy02MTIhr+dkX+m20pzhfHEeSkdDyrkdP9mDSnurwPyHN+0XSewxE/SwmB98y+2C
         w2QIrxVGB/YxVOhsEBMfJfm69Uvh+FIuOjwlRru3y2WXHzp+G5Lz3AizMSayledKlnZf
         uHP+bbZXjOGq/BnTFyE47HiLOUOmM6uZOlJ7hWdPc/D57EvAXWtFOgmLEEUImkbZ7TIc
         VoTQ==
X-Forwarded-Encrypted: i=1; AL+hErGLCqRlPAvtlLLXTymEvjoT15TJlia4pmXD2hhvAzWalneLJ/dGR470y6S0hbGa6wRw3zUiKwT+8ZzH88hB+zjW0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9M8AFdSs9zPoISAa8AvE9jJa7MmZNqf1xNfOA7VpiQaFtATO1a
	XOKAalTnUq8ZYPgWu2dJxJg5J84kM5u+OJeifo9CgPfgXpayOSIyOaL4eMTVVIDL
X-Gm-Gg: AZFdTZdNrLk9wOGvn1NUKfqXF3k4NBJ6i7xrfmNV2TxhOE7MkwVKE1/HApeYIcxasop
	WoJ8NgpV7i9ojda76RhcEDctI9b4JYHUglWdt8oS+wGc2qvmS06f6YhhiOovF4aemzG/Ho5lTaN
	Bi/rj2YUKAUiJibbnEpNmGsKS8jbPYDPxhqyy1ljoIJDHIv8ad85878B8+5KbTPRJd1OhIHmolO
	KhgoUffHKilpOy9UTakiKSKzrnFJl4uIho0ySuhrXr85SSmpNv+rgRMvWllRFCsOuPEcfi2h+sV
	IrDBMF89xorGVoYR192nrn1HJ70vk7ou1Qt1ntDRoDXzVkJ4chAZVvM/itSjCIvJ+ufbQ13U6bO
	/zOkJWh9J6FfBHeivwRzeBsVzgz9aAgOGdci7XD/sEfGvsrTuoGNEh7qX+pn5q+T1rkoR7uLog5
	Q2qRr0BQuPib52ZFFqMCr0hFG/UViW/fOaE9GDvlIACuOgiaKULDFJyWCfskwAPjcBaCXzmxrw3
	n4rTqlq6DWm2v0yNeVsNrS/8mUNrwUKDUk6toxiOeMmLhHs3J3deo2+Zt4kFW/bHkekuliQEGGm
	VV3/ufnEEaVv1P0tuVqwt4MKCBgDCuaR5E4QW/+LqLRBK0zxt1u+4I7Ttn3mA6X2KQWBm/o=
X-Received: by 2002:a05:622a:ab0a:10b0:55d:bd82:16b3 with SMTP id d75a77b69052e-55dbd821b79mr59225551cf.77.1795707470159;
        Thu, 26 Nov 2026 07:37:50 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f6959sm191572656d6.31.2026.11.26.07.37.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:37:50 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so5002772e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 07:37:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHW50TAbq24yD4NgwVpFxbLL2ODtdAXfdhkPgdA/5UhMx1HAe79+5GzltJJcZUBG5JiF5RteHbwa+FZbZaGRz1l7Q==@vger.kernel.org
X-Received: by 2002:a05:6122:1352:b0:5ea:d247:adb0 with SMTP id
 71dfb90a1353d-5ee8aec0273mr12525476e0c.4.1795707102063; Thu, 26 Nov 2026
 07:31:42 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se>
 <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com> <20261126151633.GO3898744@ragnatech.se>
In-Reply-To: <20261126151633.GO3898744@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 16:31:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS=HmLkWJayNjWiuaWaCEsq=TZe3Z2d955FiqiT3R0LA@mail.gmail.com>
X-Gm-Features: Aa3M54pKeTC5hUFcgZHzefDJuLY0GDmu_UJnMCzuy7g_xoL8fTHhTprfIbzhyhc
Message-ID: <CAMuHMdWS=HmLkWJayNjWiuaWaCEsq=TZe3Z2d955FiqiT3R0LA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Sergey Shtylyov <sergei.shtylyov@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, 26 Nov 2026 at 16:17, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2026-11-26 14:33:17 +0100, Geert Uytterhoeven wrote:
> > On Tue, 10 Nov 2026 at 09:10, Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > The gPTP module is shared between the RAVB and RTSN Ethernet devices =
on
> > > the SoC.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > > @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
> > >                         status =3D "disabled";
> > >                 };
> > >
> > > +               gptp: ptp@e6449000 {
> > > +                       compatible =3D "renesas,r8a779g0-gptp", "rene=
sas,rcar-gen4-gptp";
> > > +                       reg =3D <0 0xe6449000 0 0x500>;
> >
> > Can you please remind me again where I can find this base address in
> > the documentation?
>
> It's very well hidden. The gPTP device itself is only described in the
> attached files to the datasheet, but it does not describe how it is
> wired into the V4H.
>
> For the longest time I assumed each RAVB (and RTSN/RSWITCH) had its own
> gPTP device as it where on Gen3. I got feedback from Renesas this is not
> the case and there is only a single device on Gen4 which is shared
> between all users. That is RTSN and RAVB on V4H and RWSITCH and RAVB on
> S4. To make it even more fun the gPTP device uses the same clock and
> reset as RTSN on V4H and RSWITCH on S4.
>
> I got final confirmation of the address itself from the address map in
> 002_R-CarV4H_Address_Map_D_r1p30.xlsx.

Thanks, found it!

> > The size looks too small to me, though, as there are registers at offse=
ts
> > 0x500 - 0x788.
>
> You are correct, it should be 0x1000. I will send a new version in a few
> days in case you have feedback from the question above.

I can fix that while applying, no need to resend.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
