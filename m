Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792668522;
	b=pnzbBLbL7xJ5BZDIve9RCP16xUwnTZslmHqPDxWbX1meeDzHQcTjKH/eQ8jYnlXMFtoy
	 GmpxYVz+4ogEztwgF6Ro2uj87dtUUnxQKrnxf52/8RS9OtBW0A2xVDYVGKYTg3M6jmGXe
	 hkQHfhm8aEXxszEdnsKenYiHDzDbQXVcGplynK/wtnBUKg90lBM2vs2gJtSHn4dK51Tyn
	 tFZjWNpsUxGOKzf/jdHZ/lmHnknbOHfwZqQqZhSzj/26JGg7isYb0eAIjxktJ8V4OaOP4
	 6iKtccy5GK5X18vKgAJN7EQBMDIs9vwJ3Ihrwe9uCPzpaTmLKysUtOJkmBtzKog0zeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c3AFBFGhYU38KeWEvthADpOmG5PB5zwanCEFzPAZY48=;
	b=OWUxMsX2Xtu7QSewFYq2JkKVQv7m2F3I6/okySkDBG6Oaye5TGx5hsn2Xl1pbUNPHFud
	 kft7sTfW89nX7GUGIKA9qDJ+UuONHkg/876HGTbhAcqtJfFJUxM+Szlxg7vQzpbB2Kdj4
	 1J8gnz57lLBRaK6fUqHozmSnY9JdFqMWW/VY691n/pOw/8J/efHOY8sHfhafwIJmAn8HG
	 NA51Zl50YCdNabtSwtPeeQ+znpYsUklYjPPKdaFArZ8lYHCEAiQ99TWGx4N0G66FXBCbm
	 wsWbxnlw+2pXpQsM3E8Ma6Qv0WxxPRakHLbfAB23qAVKVBAZ09humT8lCzPKRkuSgaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mIEisywb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0430A606A31B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 11:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0430A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mIEisywb
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df54150dfso1106281f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 04:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792668520; cv=none;
        d=google.com; s=arc-20260327;
        b=oc0vCaQ/L5fzGlyM9U1CUV6w02C5J9GOc9/xRflFLFzIXm7XXIlWskgfFhAbwIbtYG
         35j/nhkNqCKlXk69fUei7sN0d+QC4oSPxdrLKTIL8XEHEi4iPkqcHZrznxNXxBXsp3Op
         az1KJqleyRLxUGdRK5HDMV1+JCPXo9a64NWlsn5gAwl7oWGg+2j7+VjmTNl8MkEZUfJ5
         DNvvbPM/ERVbU6Mf+fbna2YIY03+qMTeRxwyXdH/BrcqVdrCOUqg+xkLUY0Kmwdux1Yw
         wWfdOVo5ty4nQc8J+73XL6O8fXUSzMHw9qucRSKP0UKRUCKljK5POqZ2zkWAIVmigYfY
         YIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c3AFBFGhYU38KeWEvthADpOmG5PB5zwanCEFzPAZY48=;
        fh=EN23eNA/X2c4eMy1MgTgaQSp001LiBZZknHujDgu5Ac=;
        b=HfG3sc8Adklwt8C4FRkN2u2sE4t1fGyXe80F3cXFk/giBn8RPp/TmvhuCvFxwU2mDV
         MNdapGYc5/ux0QQApot4x+3hD4eZ1JtIgnvKU5kTEG/WhOmid8dhbUvdv7DDGGlQeoMl
         9Ju703ASFmf5A8UsOd4GRau8PgL/iHqVCgFoVXiC9F+qw7bRUDaDTNaD46dS4EUSnyef
         Fs/+iUirtXbZVpJWTRhJHS6MLVb2XzbFH4TcTwnVJGBligrQ6g80wzddY48ewNHylnIc
         LqSCgBnxI8tdkc8XVPRXvhTj/2wfcvJgfs+o5MBrdY8hJjoRuOx27Mkj/nwBOHt2yAN5
         WMOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668520; x=1793273320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c3AFBFGhYU38KeWEvthADpOmG5PB5zwanCEFzPAZY48=;
        b=mIEisywbw7pP3bKrwyU6M6MibXLo/vR2s/sJ6n/HBkW7OofdwjjtgHarz6xhmmD74g
         Jnd3YMFGTK1nBDW9WQH7OAF1ELqiKSp1msH8/QcuQ/6lI8zKEzHBxlPx9PuW3sS7zrIG
         4BMKead2gxIFKH72AC4ttBmZyyhGju8Be6MK4/LEApino2w1m0MoIvGT/biZPh60M329
         DZpl8IHwO1mrLeoeReksPoJztG7aycSZpuRjB9A6Zffpb2lpdvK+hkuUg0bxBc5yxRna
         Ew3yWoi5dKXrWVOf1OMQKvcfqEru3oOZbbNIPgKAQymRBLSXyXP4prXhGSB9n8Y0jXp1
         +VOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668520; x=1793273320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3AFBFGhYU38KeWEvthADpOmG5PB5zwanCEFzPAZY48=;
        b=TUJmQTjvAqxTXinfHYkoKXPUmz/9XvIUb5El5yrPNHEphMh+gq8xjnZC0EyZBSLbfz
         q4m6sdoaRkFLBLeCUzxzOZgA9dIIGkRYqum2yu19B6EtYUuSDw5pZfRjpVYdxspiPIMe
         A/6pAqY2KezFwDbRfJNs7mVMbQIwmM2IGR5FP+F9EHrrWXSS4anqLjaVzQkCCI5oJTXR
         zJXVxDDdnNG6Gs1N9OKVZFM1CvNVhU0K7WlXQM5vp065J7joIGX/9hZmvuxESpSOlLbx
         leQQEYYiH3C6zrZnz5QhNE8UKlb0TXefzbXrapiTU8e1hu1nzcHP+qV4mTk5N/sx3x3y
         pujA==
X-Forwarded-Encrypted: i=1; AKwUvBwQ1HR/IfntMMJEoeXXhrI3bDtkA7EwDXCtL/ACCOA/VDjA6u8X9v+sBaMHEvKmpFD9DTlJbB2DEqfbuH6sQqCDew==@vger.kernel.org
X-Gm-Message-State: AFq9FYJmdGXcG1qP2wtntJyy3Q7v0uUJX7nHmRsH+ISSPUiYKzZZCD0J
	bSSBT5Rfe06ShUYvHqkSHaml/6ENAVm0UHvDxoOVVYO4EKzl5IPrT3TvttGvXzvSENokr6IQ6ae
	3aDRwFcYc3MNH7KYa7w61g1p6RkZRVIA=
X-Gm-Gg: AYBFou3ga6SgEKYeIJcC0+m3HomY5pcSWAAr2G/zh8aM+5lGSJwdOt58RzGGDLom4ZG
	ulbR44t6MnUwAKL2zvD1bzKV6ScwOyxhB16YfJXqFoLUQgtwmJafKDH+e8Hv1mq4zdH3RxwX7Rh
	Nu/ZmX57tp/95ZEIjytc0hlxzebRnoWmHvIba8fGQN43Nt6ykjZumabPSEvuNNtr9xYq3lFCjUF
	mLqZmePL+f20tLlWincg8+l9NnPiiZS1OASr8Pjh1H8Nk52/ox3STkn3LE86XKAiKJJJm7IKdqT
	nEP+t9B32V1FOLPt66beW9CZk1PsuFUBYM1wsHBnEJHDh6Fq/iuBcw+giJ+Qg7RhnjkcSpKLeO7
	b0Ud6mFzAhMv7OYek8Njlp/9m6dxZTLN9bRxKCaUS4+wT5kh8/JVS9oFfs6MmFXSlnFgdFFxBN3
	/uuAFQZrqt5YGeuT2xR8I=
X-Received: by 2002:a5d:4a4f:0:b0:48e:2b3:5269 with SMTP id
 ffacd0b85a97d-48e265031afmr7463130f8f.45.1792668520009; Thu, 22 Oct 2026
 04:28:40 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
In-Reply-To: <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 22 Oct 2026 12:28:12 +0100
X-Gm-Features: AclHuK-ZlW7j5Veia4UpY76b7Lsra_QP7Fr0yExrDdHnznigNvCvFRFzyg9ZkZI
Message-ID: <CA+V-a8sQmtqoH1y5sk2S5e6O-nnAB=xUnmnjgJ8SC3npVEn2Rw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 15, 2026 at 1:43=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Jacopo,
>
> On Mon, Oct 12, 2026 at 5:39=E2=80=AFPM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
>
> > How was this patch tested ?
>
> I was using the TPG only so far, a camera module is in the mail.
>
> I do have the RPi camera module 3 but didn't get it to work, this
> may explain why...
>
> > > +             ivc: isp-input@16040000 {
> > > +                     compatible =3D "renesas,r9a09g057-ivc";
> > > +                     reg =3D <0 0x16040000 0 0x10000>;
> > > +                     clocks =3D <&cpg CPG_MOD 0xe3>, <&cpg CPG_MOD 0=
xe4>,
> > > +                              <&cpg CPG_MOD 0xe5>;
> >
> > Compared to Dan's original patch I was carrying my tree the first and
> > third ids of clock and reset properties in the ivc and isp nodes respec=
tivelty
> > are swapped
>
> OK
>
> > -                       resets =3D <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2=
>;
> > +                       resets =3D <&cpg 0xd2>, <&cpg 0xd1>, <&cpg 0xd3=
>;
> >                         reset-names =3D "vresetn", "aresetn", "hresetn"=
;
> >                         status =3D "disabled";
> >
> > Fixes the issue for me
>
> OK
>
> > Why is this an issue it's not 100% clear to me.
>
> Can you try this?
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -703,6 +703,12 @@
>                 return ret;
>         }
>
> +       /*
> +        * Allow the ISP's 2500-vclk reset recovery time.
> +        * 200 us cover the RZ/V2H's documented minimum of 20 MHz.
> +        */
> +       usleep_range(200, 300);
> +
I tried this too and saw the same issue as Jacopo (Even increasing the
delay didn't help usleep_range(2000, 3000);).

If I add a dummy read of `readl(mali_c55->base +
MALI_C55_REG_PRODUCT);` after the deassert operation all seems OK (cam
application works).

Without any code change what i see when I start cam application is
readl of MALI_C55_REG_MCU_CONFIG doesnt return back and the CPU
stalls. Any idea what is special about MALI_C55_REG_MCU_CONFIG
register?
__mali_c55_power_on()
           mali_c55_update_bits()
                         mali_c55_read()  for MALI_C55_REG_MCU_CONFIG
-> readl never retunrs!


Cheers,
Prabhakar
