Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199546;
	b=X+OGC+zpGvY7lQEK0FlKvrKD1qMhI30bcMDj7dpCfcM82c5gQAfDA4dNbUzc4SOkGb05
	 kzsQOi/mknRlgmRp56ke8U17thIKi31WeY2OKRQV8lxpQsIO7ujZZpteXw0wxksxEwH0a
	 PFzNpl8SKIpx41GtFMau1moVw3tTqg7DA5f28T7xg44hIswDiEovAoml2S3ajkHeMSlxN
	 wDtfD6yuCS9r9AZZHxp1hcQGRSOnz8WPT/5mZs0B5pVeE2V/E7SyvlbYI0EYestWgELNT
	 FoS2RGSbv2OJ9AnKKftmL0c/x1UMZ0Hk08+z9GbKyRTS6UG7DoanyYMhCRfmiPuyN3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qdpiEp0f2c3LjxTdYPvRzKuFSHht9K4INL82GKB/8H8=;
	b=cCGnOg0uAQWiA0fYpHdk+mRuLDafpJTwcxRAT4hZax+pcUwIosrUnnQrzo62ECmGtsnZ
	 EgJy2U2Vt4GnVDfYGrxr6PIsby0aYGkRvkBJFuZZfil8W/U59H5Pyd1zqmL2+cdhQT2BV
	 InU2jeTsIVn4XcgWbgIPmgz/ghHJcCK4BG4g5RF9t/jAg7hUVg1T2YX+9bqbTuUU/xv98
	 4Kv6byc6ltDTkTWT0RaT7plN0znlf0tXCQhtzXiYrP7s55wjCaDeuhxUTCIEmpoQh2UMQ
	 Rl1jRPfUzXGRLPUHVFAlSwE9dJuis+GNp14FAHtnG3n2dbO/yQDIouYPjdB+2FKAThg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndOHic+M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDA7606A333
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 18:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDA7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndOHic+M
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so11379325e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 10:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199544; cv=none;
        d=google.com; s=arc-20260327;
        b=rW6ZMoV5ADqWfGcaanUxDCEUgPQhzcb6PqbpuSk75AKS9Ti7vPAFYazdE/E2fn7j7J
         5kU+oxGJHJxi3DxGU6t/5Ee8lM8GFKxjgnkzSfwN/RMGqL8H+QMLgkBLFeTxUsB/p3iw
         8lGYFJ75wTfQRD3x7Q/R1kVtpB7l0ThL+8Ket7CPzLitUjghmncgpDF72xTOMTOqWiYC
         O1Xo/sllQhZm955i4tkSVFaYQ1IWR2kulyzh44E1JQyI+u/IdNFQhJteqKLyLG+XAXlk
         7LWp8Rf/F8uxioVgE6GsPcdGWhbc8mFaLcxaoZFAvBy7PV9qEe1issIrUEGEFjeYNHjc
         KQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qdpiEp0f2c3LjxTdYPvRzKuFSHht9K4INL82GKB/8H8=;
        fh=ZIJJmoPb1ahicJB7rtO+tLMZq7PSGIT1shDBVzNKoCY=;
        b=kmjQseQEmaLb9w2bFXfG5wybGwHn8Y/ww6PJ5O18gD9Z/oM9z+G856SjGrMRHh2YHu
         lmsr/bELJ88+Rj978UcnSgg7cYM50cGd1Hq53sXMhxg1KFTlZey9EQYQtkQH4Q6yVUum
         XNPSR5KqwxxZK+x87GQa1JqHvszKAoAUQ25HcuxnIMAi93OC3KTvKNcDWP4Fd2/NrD+5
         TczpiDbLJ1OnoZCSZOVGoq+YxUCnPJQcQzbhwtIGlElisGAuAsclLkAQNAvx3L8Rm04n
         lKss3YOGcpds1QFvlgCqa1qoIyFPPibQLt6hZamOVwvIV1XS/UX6bIV8WVK0uka6hnCk
         y7CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199544; x=1795804344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qdpiEp0f2c3LjxTdYPvRzKuFSHht9K4INL82GKB/8H8=;
        b=ndOHic+MgMREurcnuv6YefFBdrW1f2TPWdybI5XVPKnjFI8WjmT6RA/QWtOnB5XBVS
         GMWl5n09lfCOi2/7Uq1tQywzWoYrxo2vIWwsl3aNJMf4OmyMFpCKPz0OmGoZ6rh6OpLD
         zfoiz8Ticj3GpEvz3uVg9eP9cD4zOXI6/PK1gZI3rzDCIkxraeWmjnw5HkqwSYBggann
         heYBS6nzbsM6oQJO+wgY+Habe3yEkIi50cqviD64INGQYBDyDJLQk2HgEICwAmIhTyfz
         bWEyhQ1TENjuqotyWLA2oqUeRhxHl/3vUxUNhZQiTKglUyacSS/H4KzQgXUI8vshKpE/
         SR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199544; x=1795804344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdpiEp0f2c3LjxTdYPvRzKuFSHht9K4INL82GKB/8H8=;
        b=K6OonUjWyLnGL5JR7FYyMnC3Os3T0zw8oU8hj3gZEQkcTROxKMCZPUH7t8gpvPd/Pn
         2MEYTx1JorOOfPigTqMVisoDWTHgFTNZ2ZhJ53HHTeQUmTjL+Z3lw+r6U4LJitE53xu+
         yTvqJ0hVraaB1TG77P9igldhq9FGBq0HlyFR2OXlP+bP8j6qpyvcMZi5hXXTYK07XN5b
         mbHftRQ4yd+AUXDe50FllFgCcbZUa3FoQr87Lh+GQe4n6xfCv4gxZ2oPHZoics+dQf2L
         OogXL5pVA2K2rrNGU0E707hgcA/M4nlFpV+0fCddn5rPg9qAIsU2ckOV2X0Sfy6n0ECl
         7/Vw==
X-Forwarded-Encrypted: i=1; AL+hErFX9HxPJh9mGofFV340vF6Q/nBbXXy9vmglpYLH6v7RyWmUVPPXmCplMEpW2KFJkdDd23Pq6ZHUkSdW5d1lX2SQPg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sb/ZZ3eryKbrkRKjsgfGK1VK8T6jiTxjtyEt+UvNJ6EXaPNJk
	sbtaD/h2xdp1Pq6kDyjQ4YxN18dTHi7kB7KwFVNCY/BBsMtC8XJEkX2BcU0E2n1BKZB/OdIs1Ki
	ET6mcac1/LH/xhaGTj2EvBcLbDuus7es=
X-Gm-Gg: AYBFou1cjQ4nRJLGgl7klDd+JmutAeE4a8px4wLPtL99gErilRRPrz87wxOUFe+VgHu
	1S0QukVtk/G1jBirEt/sxOpNOWgOVt7dtjhIqr1MMnAu8SxbTz6cmEvUU/27R+oFZ/aJmKKHHdp
	o2KhNYoqGbYWyEgbzujfF+XRS9C1c+u+M9iqHHMAGuV43qQKSQfzv6zDuC0yabFYOAX+aksXTGN
	hdWOyA8chMI/zcbnMtnHh3eV2+YpDUqVR5vDyHQqPi6ZkmEcnAQhtYsOWGi3U/LEt9Lm3uV1QI2
	AuMiWd/EUtSiCzm8urnk8QpiVivba83Rmqa3LbNnPgY4GWmEGIm1n+icGd9WCSwEtCp3wmsmzMU
	SbHEeN7sDqjQAn0CA6jFewe5JlGiqEBCLK7ZHownUqbBsmQ/xXfsBE1dQGECgQa6UEc1yCJOaS2
	sls7d43CY1moiROLPYhQ5RWgmsGRO9SP0FRvChZnA9MUIAqru4DOX3u2eKSw==
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id
 5b1f17b1804b1-4bb888097a2mr107166235e9.5.1795199543982; Fri, 20 Nov 2026
 10:32:23 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <0ff0a7ec-b899-4668-a245-196ed1032548@linux.dev>
In-Reply-To: <0ff0a7ec-b899-4668-a245-196ed1032548@linux.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:31:58 +0000
X-Gm-Features: Aa3M54r8rrZ0zrmXAOHeL5MeMKEwVaPZYcTvPMAdXWb5WEiB_5oOfQ2UQLAY5MQ
Message-ID: <CA+V-a8tsZiLZ24KO=RaQogQ-2d=Wuug3U1ZX-fi=HqvpOZb98Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 03/24] net: dsa: Kconfig: Expand config
 description to cover RZ/T2H and RZ/N2H ETHSW
To: Clement Leger <clement.leger@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Clement,

Thank you for the review.

On Fri, Nov 20, 2026 at 9:32=E2=80=AFAM Clement Leger <clement.leger@linux.=
dev> wrote:
>
>
>
> On 11/20/26 01:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
> > the same tagging format is also used by the ETHSW blocks found in Renes=
as
> > RZ/T2H and RZ/N2H SoCs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5:
> > - No change
> >
> > v3->v4:
> > - No change
> >
> > v2->v3:
> > - No change
> >
> > v1->v2:
> > - Updated description for Kconfig entry to cover RZ/T2H and RZ/N2H ETHS=
W
> > ---
> >   net/dsa/Kconfig | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
> > index bdeb60af764b..3c18314aee95 100644
> > --- a/net/dsa/Kconfig
> > +++ b/net/dsa/Kconfig
> > @@ -199,11 +199,12 @@ config NET_DSA_TAG_RTL8_4
> >         switches with 8 byte protocol 4 tags, such as the Realtek RTL83=
65MB-VC.
> >
> >   config NET_DSA_TAG_RZN1_A5PSW
> > -     tristate "Tag driver for Renesas RZ/N1 A5PSW switch"
> > +     tristate "Tag driver for Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H E=
THSW"
> >       help
> > -       Say Y or M if you want to enable support for tagging frames for
> > -       Renesas RZ/N1 embedded switch that uses an 8 byte tag located a=
fter
> > -       destination MAC address.
> > +       Say Y or M if you want to enable frame tagging support for embe=
dded
> > +       switches found on Renesas RZ/N1 (A5PSW) and RZ/T2H, RZ/N2H (ETH=
SW)
> > +       SoCs. These switches use an 8-byte tag located after the destin=
ation
> > +       MAC address.
>
> Hi Prabhakar,
>
> I would fold that in the commit that adds support for the  RZ/T2H, RZ/N2
> itself (ie patch 23: net: dsa: rzn1-a5psw: Add support for RZ/T2H
> Ethernet switch)
>
Sure, I will squash this in the next version.

Cheers,
Prabhakar

> Thanks,
>
> Cl=C3=A9ment
>
> >
> >   config NET_DSA_TAG_LAN9303
> >       tristate "Tag driver for SMSC/Microchip LAN9303 family of switche=
s"
>
