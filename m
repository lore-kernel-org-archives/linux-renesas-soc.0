Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C717E52CCFF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984997; cv=pass; b=o74df+a2K65/1uDnCGA0mKtYeBi6dQEqSJS2MFsMPzufA5EIumU0O6P5oZamUAhAotEw/ULiEiyZm3ASZZiu1V4GwDKDkfxMxaGEhn/vjsBkvRbVAyTFs/JDhPrAV5aVLU+UE/ZvlpQ+B6f35uUC1Bc+zQ+oKdnLUEqA3yytF80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984997; c=relaxed/simple;
	bh=IT0qggrd1mARJ6zH4Bx5bdn3EzKctPth4DH9TaUm78M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6874NJRoWhSAu1+B6zNj6wGFrtPuhjyv4lmkEjRJj5eqwl/+1AebMjSjEGZvP2aBMDRXMUP9e7Gb3B0hBlwvUuMaNoZ7z8YGs/FileY5Gu0HuSp8qcgR1UsMo7jCNhz5WJAnRdBzFvhWX+0e6HMLOr8uJzWBkrJRGYHIG2cEP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stl97STh; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stl97STh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa29e06bso1509537a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 06:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791984990; cv=none;
        d=google.com; s=arc-20260327;
        b=i0lRXn3iudyQZCGfv35W97VD121BPnh/PthXpokjPFmI10AuTtCO6HFhgvgUqfQ6Xy
         eK08tB2rMBSU3TzCyDvFVoWBxy2JePl8pQMcHMgGvj3uF8lz+E7TROPn0QGEotzPxIPX
         yZHjFnXbLecFFaoVewwQtTerHmw+Ahww0vugPncwb08sV4TDshE6/FhZ9Kg4N5lXpg/e
         o4U3bVPpjDkPBTkiPtnZ4tWiK0ErUS9poZN5Jjp4kE0EUrZkkh+VOIGcymMAQWqgpEXy
         7JWX+6Lr4xDI4PJq9/cdS1C5Jam02ku/WHtTqCv7+Bbns90HSR0/tjKAgV3P7gM5Z6ix
         jeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WzfJaWITDWTXbAq39l/2Sp3XytY3nCJV7TfZMBMIxVs=;
        fh=+zC+MeXzlEwKGRD016Jv/w/Pc+WIecUFDLSz21SUqK0=;
        b=ACLeziUkgP7Q5uNl47F0g8CubZNNyQG5lnFqNb6Z8aPn7Z3xP9i3r3Ca1SDUQmTGH3
         4MaaoaoedVIcfyJ59QAentTAH5xuoeNAd9ovpF5xSp9fTuqkHY7Z0b4k4MkAs/rV4uxK
         975+p7uwHuhRbbYa6zW0x6qKXTKV/WIaikEKRH1Z4ltC+3xx88XrSmt4qVCR7sdJZAlK
         USCbjx4RbsvhGNg7suGRgBVzdnc3eHbMjF02ugMCAHexPfIDrNivm2WP1BIIlH/Ny9cE
         CpnGIqqLSD251IvXqtd8t2LsE/hOPfHQElajqbKMSOFwr3QgJlh4sRsDrQsL9fgS6sbD
         PgGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984990; x=1792589790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WzfJaWITDWTXbAq39l/2Sp3XytY3nCJV7TfZMBMIxVs=;
        b=stl97SThMAAaKpod2Yo9NGY11Ms0uA2KmHC3Qq68BTZNwq3Nozbh/f2/qLMrAmqXOn
         5c3jcejjbE8lC60StZ16+ykubS3dxO4UA8mbaJAzXuJxyXtSlJsaq76+TwUBiP4e4r1e
         dU/C/3Hty3fh34T3Zs/9Fi2kMW1m25XJOHTiIQBU0lrnhQKzQG7rB5xV8L+ArmPMHkpU
         fiV8bpzGHqByTbO9WbfPvQ7BYcEA6kipWSS1PF7J6v/4Jq/o2Ubdc3KyRKFKqPBwQYIg
         5DWLtQ+eA6KjMnd+kEduCPoJ4pBsoSm8bJquOHX7RDzdfh02iwV4FkL1eENDmnG2DET+
         WBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984990; x=1792589790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzfJaWITDWTXbAq39l/2Sp3XytY3nCJV7TfZMBMIxVs=;
        b=24efwXdomLHz10S6aibjutS09sYhtHvIxOCJeqsRDEo+6AUZsjtp8nJSg0K3mxbb5F
         pVmCbB1nEMX7JqKgUIJg4/UF9z6hc0QE+Wp55l3H0b+kKCuq5KMKvQcHQVXmo0KP+jjj
         pmiqkznp+z3P1yFtRt2hciI8w1EGGlcxe33jh4PTcxYFO91akt/p0V13HahpnCvZEoK7
         ZrAxPz/jY7T6yID1OxHUA5qt3XrRK5evH/WsGKu61GhweFdBU9HmTUARyIOR1eL4zAE9
         L4Ew4ydbQayoXXva5AqzXG7Rzh/5BMsaYmTSdBTwBW4TyUrMCZp0M5Z7cDDCGysRugRc
         9lzQ==
X-Forwarded-Encrypted: i=1; AKwUvByXT8Kr8FqJPuNGDsBPFwObNax7bpKX35MF/GxwOknYnlgQoGgMZHZgs5/fcavwKC1wCU/MJw5ORWgW/8kw0i+Oxg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBdgDNujAwvCqa8QM0CmstD/6CTSFCNPaWtDthfMVUe2X3ptvl
	5S5IhUijTRtoAxLsbIRYWqkeKklylt4eHyezhQkFz08Rk7EbDFRBWLTVT0A1FlVLoDtKyQBtXQ7
	fKnWMEq1Xdw+HfBdy7GDQfGoQ+CQQ0pU=
X-Gm-Gg: AYBFou1DDyVqVXCrbBOmV3BEZ2QEC5rw+yERL4KVFPqx4vgErGlfg2rqz6iMNO0NG/R
	cFUDDyikGBMLkaiB4GxdDQU0I6l+1lnNyhys2VkYDPIhr3A4QaW5Nj5KYDxKvEs1k0mCdJpCBZx
	qO3AE6FXALRiu+eLlKiJydW104jHadVDJ6Wo6iEKUyED5swMv4Ro8vVIJ2OKURnUW0juGvDNiWL
	NTnRytkfa1cFzqcEI9Bn3VsZYXAhSXZVusJ0yunlUmKaCVihdGCjkQ9e+UAXDApRqrTMiaX8fms
	BbOvkrMlenqKG8JC9wKrN9Tn+fg7CIII0Sjhzrd+swA5d4uke6gs/VRhK1YcyhgfdMVnxOvd7f0
	KzgCnU1TFkuk26z/igDAADbYHRXn6RplaqZJpLvs79sTJAyIpW+8sC1emvuDCiWqO+Sp+TYKFqg
	==
X-Received: by 2002:a05:6402:461a:b0:6b1:e37c:135f with SMTP id
 4fb4d7f45d1cf-6b1e37c1669mr5342555a12.3.1791984989802; Wed, 14 Oct 2026
 06:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009184122.1378797-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <as5GXPcMKe-CBLXK@ashevche-desk.local>
In-Reply-To: <as5GXPcMKe-CBLXK@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 14:36:03 +0100
X-Gm-Features: AclHuK-KZvXq9usDlegpOUwMj00FdeLieTauYj8tlmG7JTbxbS1FG7D7z0W2904
Message-ID: <CA+V-a8sec-ZzMKGZJeNA-iXw-Tkt9mcXv7OoziMtjeh23BjOsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] iio: adc: rzt2h: Wait for the analog part to stop
 after a forced stop
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Tue, Oct 13, 2026 at 3:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Oct 09, 2026 at 07:41:16PM +0100, Prabhakar wrote:
>
> > When ADCSR.ADST is cleared to forcibly stop a conversion, the analog pa=
rt
> > of the A/D converter can take up to 2 ADCLK cycles to stop operating.
> >
> > Wait for the write to ADCSR to complete and allow the analog part to st=
op
> > before reconfiguring or restarting the converter.
>
> ...
>
> > +     /*
> > +      * When a conversion is forcibly stopped, the analog part of the =
A/D
> > +      * converter takes up to 2 ADCLK cycles to stop operating. Read b=
ack
> > +      * ADCSR to make sure the write has reached the hardware before
> > +      * starting the delay.
> > +      */
> > +     readw(adc->base + RZT2H_ADCSR_REG);
> > +     ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC,
> > +                         adc->adclk_rate));
>
> A single line (84 characters) is okay in this case.
>
>         ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC, adc->ad=
clk_rate));
>
Ok, I will update it as above in the next version.

Cheers,
Prabhakar

> --
> With Best Regards,
> Andy Shevchenko
>
>
