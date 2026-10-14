Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316F454281B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990774; cv=pass; b=gdJA5qtXa648wZzMelRNvDVOKjd95FcdFm227Ybfzpi+A9d4vWaWnU1e4p49p5Wz2ad+m73qNJ9EnLxPPVSpYaofRobzFLDo6CFaPQKu8qSJjv8JbOGTI479WvT+Z7gYtIh3VkK68j+mGj9LS1eFQmcHnfWbREbuwuKTO0Qwmjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990774; c=relaxed/simple;
	bh=S5zs7o+IvJ94PTcJ859wDkqWMdgUCMYMIGrDaQPMmSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqhhuVjFEe3w+7fMRKYUqNaR9XyKndzO8WTV5o3UsowcXkkAE5ilrJTBaDhJBJ3DmcHVElSWBO3gI6jPcMwVgHyR4/WPAe5+FnOP1XXeif9gAKGecWVHd3N1w15qKXSmqeIFdXfJ5f2WctQNldg/oT3rvQGJuSeeV7BpZl7ZsDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXfwA3nj; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXfwA3nj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b060ec084so2805100f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 08:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791990771; cv=none;
        d=google.com; s=arc-20260327;
        b=MQEcevSBhxLcRjcTfmKPco0K7g9MygwxEYxvBVEycr88tjK0dw0NcC/gVeAbNeH/Aw
         oir1cr/j2/TIRis8DdPVtDUYZLwJRuIwwcSj6IWAZxGTuN4XU87R6tUslOF4dNu8PRqb
         gNxoAxmOhfGqWKx+Pk2yF7aNIR2rw0ireuVVs9d7RrOhIdNZPWWhcb/XETJv5ol8dCeB
         XgpHx64ALTBYIhiclHDyMm2ezPCfkMaGvkNSQtQLT8o8CjSqKeYZZaWb2NmwcsfdbWoO
         I3LFu6V6VAyaHVeRMf3FSSwoTh+D6SyczTlhIXMdJTrn2GQz4TEbxneIyCcpiRXTmyMF
         pGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WUSTZfpPOOhjEr0q1WimSib8kVLmZYK9NAgp2MPe0uQ=;
        fh=xU6qlMGHxniw8Vt0XHojqfHHXPM39gpn72c/QPcbqaU=;
        b=Y9EtOUi9rU5DR82CeOwGqWxS15917OvfWIy9mMNrM7xFdscsCCAuh2j8x4qAwesEaF
         snchh9cIjOUX900xyjKLdROweLq6H3VZpl10LGIty84d1nOfQvvABQaQylT5yMaHfp5E
         XCuOvsd0n1FWTeZJz0QRYjTSe8yht0iAd9LPcszL7icgFTJrwVKwYGmr8/86OixdqqtI
         2ftHKsEnTXTG1XjLY+8aVXpHpkC/q1O0T2EJWjblVR7lpv4U2RQ8OiRb21/OZNkCNIj0
         aWUprKKnLHLBBk6j3Pd5glWqXb5kXAg5eY1U9O0QA4ZLFFWt6tW/T+R/552YLodQT1OC
         gsqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791990771; x=1792595571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WUSTZfpPOOhjEr0q1WimSib8kVLmZYK9NAgp2MPe0uQ=;
        b=DXfwA3njbnanK1S+51Hx1cy4UO9CZ0e2Oa4rvzBS+JGEYkWcmjEkvDq+GR1ZTJxFG6
         Oj0EJKJ8bqP+3ok2+Wv85blS/YJh7EES4pYWOqBVUqzyYNVE9ILJovS2AINGN+jgv5pN
         kInj8WcsUElThf793hZrtbeANVHIhdQBFlm437b7Kj9PUPhIt+sNJktS6FYBm+YEIc+V
         jjV9seGNTnk4gP/SHPSzhClmtYryZgyjGb83Jmyfwr/trylUPQhQxcnVZ2f1cwApss1P
         gDGyDuuLZTuus0hnJyC5zHKL48wkJDff9u+ansoalKQRes4I/vvI82ixp54YABQmQISU
         HTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990771; x=1792595571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUSTZfpPOOhjEr0q1WimSib8kVLmZYK9NAgp2MPe0uQ=;
        b=irs084RV2mcQn07Cf6D2oiL31CxKPAG/R54TtalOYn5wSA8+yvCVP30hEN/7CkIEcP
         tUPO7Fic2WQpYScLFsJ+jv6fAq4Tl9YRG9GgyMbrScpa+Pz6HBxw/5X3sSPn5O8O4wYS
         klxSaWxXRtOJEvMshIzhQ0UCSO69e+S6ou+BirE8rmsyRj/u/99HjLf68bwqf3GvRnxx
         XZDBnDIGSDcKqAHn5QVileNrRy83sYd9H78fBLZ9qq1bZPML03vJYZPdv4LI+D+TjBev
         nPP505vGXR+6shDpYhjYKG7Ld6fGXp+FVXEJ5icGuf1EAzUy9s4on+ifcTmONFP/R4/M
         tS1g==
X-Forwarded-Encrypted: i=1; AKwUvBwa/zol5vflfQtYL3EoK1W6/j/tSDfhMtSV/g9HSyAwxWSMFX+fwZY1X0VIpjb3j0aEb9MurLfMbkyKmwSIjQghiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzYCqx2uWWn29fIfVHqbBWJyZAgF4O86a9aUKgTJigeKFRvlOb
	r/CFIgnnBaonVfui2jXjh/Tth/twb30tVnqVs8/vcHJeYGapwzYT7RrBL4U05cfR+QEoBcLIufk
	5stuQsirRCAI+ASxBMuEgoP0Miml4eDU=
X-Gm-Gg: AYBFou1XRX3iEIjdDNZniu4tjX58fa9l4/hJsJS0asHt4dEfwFi0NAOIYhukr6Z0pvm
	PG7MfQ2jSn6ZKueGQ7CwrFMwt3tZDb5ymyRZYVdXX8pvc+l/jrM/3xkmAGEg4vysMdlBQCIIvFG
	HmH7st/9AuLlUlOHQ4JWzPoW5P/zG3HaM4tznAkE03xeXcaERhya7J961Ij8TQU5F9RMFWjT0hL
	SNKt86yddvFERNv4Zi3FTkDYI1XKzKHRCk1hAlD13gbnC2vL4Bw8BUelT9t+7pdfy2if//Ty1yc
	lk+c1G1AnClqotQdBsKp+4QcK9NzqKB1VijvggBLfnucUvGEOD6wHnBzeS7eq8hr3BSG4usM74u
	Anr9bXXfhBNtIFZzD6jrQLGAJXuE+NdbnC0Jo0Sdk2hjbuPUeZ6s+SOKg1viHcQTci5NUTRufq0
	JSYT3g7AwY
X-Received: by 2002:a05:6000:2085:b0:488:7496:15b5 with SMTP id
 ffacd0b85a97d-48dbacf126amr30278767f8f.47.1791990771057; Wed, 14 Oct 2026
 08:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009184122.1378797-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <as5LQ6zFzkft2zNJ@ashevche-desk.local>
In-Reply-To: <as5LQ6zFzkft2zNJ@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 16:12:24 +0100
X-Gm-Features: AclHuK_fe1o3s5DtDV5FGIwilMVE-kQkfjxo_HHCOHYJ4usL-K9N52nyOxeW19E
Message-ID: <CA+V-a8vV80UfHtfrxMFDk_UFH04F=evyAqTvHEMSOiRNTJd+Kw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
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


On Tue, Oct 13, 2026 at 4:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Oct 09, 2026 at 07:41:22PM +0100, Prabhakar wrote:
>
> > Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which share=
s
> > the RZ/T2H ADC IP but differs in channel count, sampling, calibration a=
nd
> > resolution support.
> >
> > The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
> > 20 ADCLK cycles, does not support calibration, and supports selectable
> > 12-bit and 8-bit conversion resolution.
>
> ...
>
> > +static int rzt2h_adc_write_scale(struct iio_dev *indio_dev,
> > +                              struct iio_chan_spec const *chan,
> > +                              int val, int val2)
> > +{
> > +     struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> > +     unsigned int i;
> > +     u64 scale;
> > +     u32 rem;
> > +
> > +     if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_RES_SELECT))
> > +             return -EINVAL;
> > +
> > +     for (i =3D 0; i < chan->num_ext_scan_type; i++) {
> > +             scale =3D (u64)RZT2H_ADC_VREF_mV * NANO >>
> > +                     chan->ext_scan_type[i].realbits;
> > +             if (div_u64_rem(scale, NANO, &rem) =3D=3D val && rem =3D=
=3D val2)
> > +                     break;
>
> Hmm... AFAICT we can use multiplication as the result of the division is =
just
> used to compare.
>
Agreed, I will drop it.

> > +     }
> > +     if (i =3D=3D chan->num_ext_scan_type)
> > +             return -EINVAL;
> > +
> > +     /* The scan type changes with the resolution. */
> > +     IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> > +     if (IIO_DEV_ACQUIRE_FAILED(claim))
> > +             return -EBUSY;
> > +
> > +     adc->resolution =3D i;
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +     ret =3D reset_control_assert(adc->rstc);
> > +     if (ret)
> > +             pwrseq_enable(adc->pwrseq);
> >
> > -     return reset_control_assert(adc->rstc);
> > +     return ret;
>
> Hmm... If it was added in the previous patches, add with unfolded check a=
nd
> explain in the comments that the code done this way to avoid churn in the
> future changes.
>
Ok while adding reset support I will check the return value to avoid this c=
hurn.

Cheers,
Prabhakar
