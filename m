Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE79E3C5530
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443345; cv=pass; b=j+EO15mwWgPbrRd1xH2P+YZhC6+4GDgaIMhiwist/MWj6TUvJUZUuNEpBXzUbokedy2fT3vEGKCpQ9tztiyDTxhf9lzIKZb4UAV3uAjY0T4z5IKe1e6nBQvSOKb/+0pD6VcaR5LcXrvBr2vud8G+zU6eBv7XMwCKSRi8rmhBBQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443345; c=relaxed/simple;
	bh=BV3nfYDh8WB934qXYoTUNUtO0cx+cauV4kfuBRprQk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIJActgxxo7H6qdiUENkVezsBqUilIFf4+AmROiAL9zMBmkl+I/MBfqKDeqwcFFS1aI0Ae4yjiU02uCKcY5N+kdM0aHrymIGWO/dPzvEHhaV7SICPFWtV4XbajujW0I/EgUiz4jgU9zNNrQBteLsRseB/q+w3qPxqgzfUYSrJzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+sP/6dR; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+sP/6dR"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b7481f9d3so2161508f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 05:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774443342; cv=none;
        d=google.com; s=arc-20240605;
        b=abeYs2e+rOUOTzluvvJ3Tj0CKMoGJAdQNOxu0vKE68xCnLXtzPDpL0aBjRWcFZL5j7
         RKQVHGK4LlapEZ9QnYrluSUs4A9xfnCUF2eIr0eJQW1GX0vXSh3jhRy8wofAnUh1fY8/
         FKmCUOT9iJ0aEH/SRsBrIpOqhOxwBIJPJL+7el2PHjl7y3XFBtg+uCHuSbgpfKFrQFBh
         LMx99yKoVsUl1vqthbTTcTOi7iOphswCPlYYim45WRJxSuMVRIsmWj9I5iv3TKAA4oI2
         vdk3/h3P/B9s+P/e8vEy5ynqeeui74J79nveEGI8AQ0B1qku4pT6GSsZ29I+kAkfzB9t
         2K0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ibd9SV4JUyqdlWcLocgMKTGACJe/SwVChUcXVjG7qHs=;
        fh=bcmGyx/5xgI3s8ZYYiEuvR5HiwBy//U3mEJJnbYMpW4=;
        b=Ut/6WXTKhiYHE2yZo9zruehRtNAQ5CUprDnHN8zTczB0Y6mFluoLNZBTXAco/XKI8u
         MwMd8MzG4QNfqeQMIcSl9YHH/MqFGf12LZi23vv2uLU1Uh9uT7FNaNmruJJ+JUwvsvuc
         lSDMuSEZa+787kfa1j5y8j5WO3Q89kZGg5daZWH2MBZj/icsD8ad5VLckNXuB0vzRaqG
         IYiop01h8ak9Ie5VrHwZXNv4mfiSAFL1lTYJe/Rt3KWtOf5u9MMq2Cq/SV8BopspGRW5
         qiOmYATWFklruYxeVuwuadk9m7pIER9Q/IdNpl8pPjhDiW14VjOQvbJD4BsuGhpHf2Kk
         n+uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774443342; x=1775048142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibd9SV4JUyqdlWcLocgMKTGACJe/SwVChUcXVjG7qHs=;
        b=O+sP/6dRCaL0nLXWqubpcIGPAPmK6hAvedPEKsrG1nXIjvsfkA0575y7LPfGBriuHV
         9gb9oArVQRwDzqbZ3qf1pd2HwnnIc4CRQ3MCmXbRdyBcVwYFzCOuD12+o7r1CWNoQEgK
         tZNTg+WyHSXjh1YSD+Gf2OBwrpgmCLzG5l5a/A26WvlU0JkU7UKSAPyWAwYjMBUqCUro
         WEMEK7dkOeS2jl/40GD9dJNvLmC93j835cSFut7R7EaQfW/3NTkICWf5qo9GXVlPYSn9
         HMs7SvtU5NKJpPSlp4H03JnvfzWVDMrdNSMyALf1vxdaqhgUbGcrN2CGOC6Vhd4ll8p1
         BLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443342; x=1775048142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ibd9SV4JUyqdlWcLocgMKTGACJe/SwVChUcXVjG7qHs=;
        b=TjQzz6IzAdzIRpSUBi9a3owL7x5qWR1BpoU8NFr4wMEsqciZmBqW+KwZbZooyxAz64
         rytRDKTftpzrGQy9wsCpw2zU4NoXSIU1SrKvAGZfm8pSHt4W/A/hqPR5eHdGtME5pdGU
         Uw3+1L817MkYwRuPa3L4kM9mUjxs1xYpQAIBPGyaYtahA++crM6KIbYpChzbOB+GNATI
         OBmcQfjUIHnRQiCMWk/9zGXUidxofz26JTSeEeWqQh+q2XLAexZG2GqRz+yKWKHgb3Q/
         SN7rBTtu7N4ygXjVhqmQ90v6AlxGwk2j8QUFkB7tY8Uxm7ABz98DR3IMmm8+lIkhwBLk
         xaQw==
X-Forwarded-Encrypted: i=1; AJvYcCV7nQPjaQr8Gs/FBPh21dWBsbuwRfKquSbd+ttMSRjkd0b8ew4Dt+MRDl6rv2HM67ydgSemBb/85GghOQktrm7htQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUNJJKofzn/AdakYZJnMd0hcgl8mekIZCv6D5cljWyXTaBqjob
	VbJvHen+W527ieGUtagievKBKdmRFuyndTPTqXi+ScrR+xe8IpjiXn5F8ora7MOGd2bF0mtTe+s
	63NTjjCtWHPVc3flTBVh3HuqZQI6PvaE=
X-Gm-Gg: ATEYQzxMF/tOY3Kls+fX2Z0FptSikGZG7ahtoVeXtPy3Q2GqICYql5wkDf4dqtXCV24
	kuCPzz8Y87rKmPX1Za5YlMWFURrFhCWqSpzOlzBFhzyr3uG2Naxnkg75mSc4h0kEEQgndRZCb/N
	8OG29uNet0jtNnu5MnmwPOYvvopIFNQAa/nHjJOHc3uEcOm3dKjxTJyG1GCuOuSvILOnLkAKKPH
	PzJmN/0onVCDv9yiOFbC5bh6V9vwuxav0u46Liy7TJbAPDyxGmZkqbVdgr3AiXCJz42qz2Amjww
	CPfKIvFbD98F4xR7Ee6/+keCuM2/zigwQ5SnQkEboNnThZ+548VywckY00UERy5nqgIg
X-Received: by 2002:a05:6000:2c08:b0:439:b564:7a71 with SMTP id
 ffacd0b85a97d-43b889ac037mr4873482f8f.1.1774443341855; Wed, 25 Mar 2026
 05:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260310212927.3372410-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <abgQpsArW3VrCAns@shikoro> <CA+V-a8us8MiyRtAy9ySShY9XKepY6-Cwy3MpVgMCVK47adAV8g@mail.gmail.com>
In-Reply-To: <CA+V-a8us8MiyRtAy9ySShY9XKepY6-Cwy3MpVgMCVK47adAV8g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 12:55:15 +0000
X-Gm-Features: AQROBzCOBzAmxi7Y3wwnl03cmp576d14Z3rDc6ctssra-K9ee0QCXJNFHrcMG0k
Message-ID: <CA+V-a8tj=LyJ4zoFvfp4a+d-MacE8k90V8bMnkHRKyZQG3xLwg@mail.gmail.com>
Subject: Re: [PATCH 3/3] memory: renesas-rpc-if: Add support for RZ/T2H SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Mar 18, 2026 at 2:03=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Wolfram,
>
> Thank you for the review.
>
> On Mon, Mar 16, 2026 at 2:16=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> >
> > > Add a new compatible string "renesas,r9a09g077-xspi" for RZ/T2H while
> > > reusing the existing xspi_info_r9a09g047 OF data. This allows the dri=
ver
> > > to bind correctly on RZ/T2H while the register differences can be han=
dled
> > > in future updates as the affected configuration registers are not cur=
rently
> > > accessed by the driver.
> >
> > This sounds fragile to me. Can you add a comment somewhere in the drive=
r
> > or headers so people wanting to use these registers will find out that
> > the SoCs are not compatible anymore?
> >
> I could but they would stay unused.
>
> For example, consider the COMCFG register.
> On RZ/G3E, bits 0-1 are used to control the `Channel arbitration mode`
> On RZ/T2H, bits 0-1 are marked as reserved and the write value should be =
0.
>
> Currently the COMCFG register is not handled in the driver. Similarly
> it's the same for other differences.
>
> Can you please suggest how to handle this case.
>
Would adding SoC specific data like below be OK?

static const struct rpcif_info xspi_info_r9a09g077 =3D {
       .regmap_config =3D &xspi_regmap_config,
       .impl =3D &xspi_impl,
       .type =3D XSPI_RZ_T2H,
};


{ .compatible =3D "renesas,r9a09g077-xspi", .data =3D &xspi_info_r9a09g077 =
},

Cheers,
Prabhakar
