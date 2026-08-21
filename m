Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822DD415B6B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298738; cv=pass; b=kkEwNtfu0A5eH/fGynGkRS/IRckbAwvZVICWceWAJfBuGRxwR5ekrE3ixCRZPRMv8Hd02DVFUR4wqOzkRc96WNpEjcNcCMsxKNBxB/mcbtbR1fuuAGPcl78rq1X+XDo18FArJ0eadk3wwNXI9jmBaQ48j1+0x7PBstmA00Q6swE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298738; c=relaxed/simple;
	bh=iCkxqhNZxgEtFomtEu7YxBIX5x1KY9BNtJroquO1XxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ic4CD7E/RAkcJ3Xh3V41rSPD6PGa/VcwA5UBaxPXDbE0EFCcjxCgo5or6jIFj7ZlhIp9laSUSdGksTFCmbtMQlvkz0lEABauFoOmVXs/dCcrtINNLJvo1Pm6lArjET3+g4gniTWeSzfrDJfm2fqQQnTHnbw66FXzZl0AVVlh/aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmaYIegP; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmaYIegP"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so510094f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 00:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787298735; cv=none;
        d=google.com; s=arc-20260327;
        b=oIBwG6mHjff41wDSwzPUY92j94a5DtLmMGpIN8xDVPsBEjvvyxYTwMcE1emmxU+roD
         skDCMnMjnLc3pz96VaQh8TxZiA9ANImRyZLd1CAoQ1dgXQXyBW/9Oc30mbbE1LvW326J
         Jc9NmNqy8c0AB2sNHsaa9ZflslDrUAd/qYV2rOl0AQAfwAr2YRWMwU7N2axYQsfhgOhs
         AyXeDXWRFBt5N7jNwI9H+IhDhQhDmXOZG+MiNrAWqfrnV5VquDdXPkM+E7oPlMisVU1P
         4UGoVi7Y8IdFFpYz/1LHzhouygah0iyk0ydY1i33UTH2PU7eGAyCvMFIqRLZ6xcnuq7S
         qUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WXVNR4kHchxo+dOC1K7o47R8p3Nbe2lAn3hnL/xdjqw=;
        fh=Z/YY6uyC8VrLqh6VqmL9hcLa5PB1d4xkeMKx4hUyYz4=;
        b=OWdvxNRodNs6HEgHvvMf/ALoafMCIcoBjXdFyy0MRXzhftjhFDOFXi5cO4BhIlTwCL
         hbq/GsU5rfU1EM1kBd+dgjZIeG8hQ7wot2WlyVXr+zolMg4qdoZIWZp6r6RtCrHRVFoP
         Gzfm+a0FVgjH+F5iq/quOXB6xhFWlj6ZSH6PKn6lEjub0o39nBLAbD+SxUB6p0oYTVwI
         4BKazWRRJV1FIHNqFkPCQEbuUARH8Exp316yGsaWmpzsK5tSEjgKZri1l21m4IC5cI9q
         GCRjpRPtmi0KpBaezphtQv2tVxOTqYoIA1bE8eVio6BaKrxOX+i9EktK9YGL8sQANLwX
         g6QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787298735; x=1787903535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXVNR4kHchxo+dOC1K7o47R8p3Nbe2lAn3hnL/xdjqw=;
        b=SmaYIegPGvowGAWTdIAVIQyyixhEpKqghPDCzlHFKWV+OLmkyg2JBGoIMOW0FDPH+S
         8hMX6EDqZJZqJsW8daZUL1d7yFVP6Qf4rLRmyBYj2y+5LK6Ie5HOi6Bg0X/J1kzIB3vJ
         8p3a79EozxMPxbFrfpSktMYnPtFbO48MKqT/XsUopwsVuHnJyJbbZgHXxQf6+rG3n8VR
         x5GykVVoRatG+Id5LeKS2g3jC8Cj5dHePa0uCk28ckFydh2UIbAuYLtZoLkSD/D6EopN
         gDvu+SRgfuXTAhxzOasZq3AzvNhieww0bEKpaSXwOIP1taFwEoAUMoCEjFUY6vdpRl/X
         ZkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787298735; x=1787903535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXVNR4kHchxo+dOC1K7o47R8p3Nbe2lAn3hnL/xdjqw=;
        b=ITW5Ot4gf0st1LwUb738dcBQMEWJqN/mAHwulA7HEJB+dwbuCQBge+kfA1dV6CSgKi
         n/zgAOb7V7JL+awAJLiHOPuudJQvbAK2u8zL5csI1+waYxQcIDqbLQxg4XtmM2K5xWWr
         wPOJumFRsX5V6Yy2AM58FNdR3D3l1sQfSzXVj41lk1Lg78KiRaikInGeP8TbM3rtdH2w
         pMeVYSZegYxUoOgO641mH0fU5cpM6Kf2r9Dd45PMGdql9ec/M5KIBeNt82HwSQshTRhE
         t/eqhMrsfpIQEVl2M+BxoOvEs66vEw7gxPcn9iHYLamkaINNzxTPt56N8ZrEbMZFP7bC
         mL+g==
X-Forwarded-Encrypted: i=1; AHgh+RoUYHhDFkkb6b+wWbHtdPcXA9aUHiHOmH5zdQnyFZSqsOG3rTMWA/JCeGg3GqDQZbZkrAjerjbDsIycDAS3mJGUJw==@vger.kernel.org
X-Gm-Message-State: AFuF++kLt4WmtTNvn00K9rinbro61o1a+PIiJgQaWLp54BOFSw61zJr7
	7MtxO7Y2PrKhioloL0EYVTwQfEiB2MSUNARUR5EH09U3lKzoOnT+/K9QlLiAPEtOeJ/4MSuQt9W
	vuPEF5Q/NmkMCeC5gVS/zgV/3qj0Nm+0=
X-Gm-Gg: AR+sD10W6gQ35ZIhrjr5WztL6CrziNK0OvLB0wvqFaGVYSnchCoCgtcXfEP3tZO/TNQ
	fwja0mTE2R6gR/jkP/4GIkh63OYAYaz1ORVypRMqrBf7FJDSUmiQdPWfo5aeKAkMoI6JwDHg6ST
	jHMdTgzD6QLDazdB1ThKGX7VJGg4dVG3+vhsfYcJrlVj1xY/gKrlsUgVYJU5wbQsOF5gP8VEGfc
	fg2shfLunJluFCFGLTvgRfzg1Fr60vMUueCySl8x+7RofZjewIhgLF/fHeF4530hcaOgBTeN5sV
	jEQYizY0KzrN1EnFAH5wPpE6GmgU78879DSDYWCBp1JqKttpgAeCtskfLZ91UeF6o+LemwhHkXO
	xCsGK2Yf55yLZM2tXp8IFVcSFvk+Atzs8HHw=
X-Received: by 2002:a5d:5886:0:b0:481:568e:11b5 with SMTP id
 ffacd0b85a97d-482c0b4207emr6296886f8f.5.1787298734749; Fri, 21 Aug 2026
 00:52:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <aoWr0gfN6sQmgUie@shikoro>
In-Reply-To: <aoWr0gfN6sQmgUie@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 08:51:48 +0100
X-Gm-Features: AcwNN1XlRNqpAUbeTUrYnSgdpHgWqQlabT6nhqi5ctC444iuectwmXZSSzZ0vF0
Message-ID: <CA+V-a8vwNHm+KZs74ktpuvxKjOcqLtcxGRFi8i-_g9jcPs_3yQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] rtc: rzn1: Add OF match data to gate SUBU
 register access
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Wed, Aug 19, 2026 at 2:12=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > +     if (!scmp_val && !data->has_subu)
> > +             return -EOPNOTSUPP;
>
> I'd think here a helpful comment for the user is justified. Maybe "No
> valid XTAL provided and SUBU mode not supported"?
>
Ok I will add a dev_err_probe().

> > +static const struct rzn1_rtc_data rzn1_data =3D {
> > +     .has_subu =3D true,
> > +};
>
> 'rzn1_data' is maybe too generic? rzn1_rtc_rzn1_data? Yeah, looks a bit
> weird but I personally still like it better.
>
Ok I will rename this to rzn1_rtc_rzn1_data.

Cheers,
Prabhakar
