Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC2F490C01
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161984; cv=pass; b=Lk4xNnO/03MBUeqZDgnRvDDxWBVP0Qoz3tFVKF2o0fgCwvikPaJYz6aAmwN3bAGh+tZe+EhQ4zArwmf7AXIvQKYT959OUMthJACn/cPSos1Uoo5VOj4AXicpEeG6ghnzhRDzDyd5YVYJK4n3vCWogKLYbFL5pJz81elUpOd3wYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161984; c=relaxed/simple;
	bh=8zQc2kihKmltrWCPlwdMB1xKk2HSQAEcmpgNNDtGHUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Srxm0pCYupb+PxEx5kDbLQi5vz2rpkBlOdnfGWn0FlRfN3g8sSXIWX9o/fNFuCaRY9ZGAbMKnOco/85Mf+Noq25M5rv6h6AaFvuvNft/T6V565pesppHvyRUuOor6CUcZcr7X29oeQchJPPKmapnL7D8g74qaFhMP0HwK/cdUiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXXcfVH3; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXXcfVH3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so12580765e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787161978; cv=none;
        d=google.com; s=arc-20260327;
        b=SdKqRs//TpCa6CtUzJZPpWh9qG8bEHSlC1XnIxqrGT1S1y745IqgDh2DqX1JpSbNd6
         bMUlXYYzwM1IJyt1Vl4JD4H6UuO+Ux3rVyiMBNlCdlvNTR2scE6vokqA9/VodBhNJ6HW
         CM3ObaBVGA8H9bLo0VL5AYjkeVDw970gajjR7ow2XvGNFBHzo7DMsgWP4last7DOh5Dd
         MuIka2AI9azhKV/Z9Nb9FeGmv2oh7kH5uOWU3QhGUGhYlRMYiCvbuW1ajs8LI0AHHtTf
         ZO9BZpkB6p/X2ABPLybeE4p4UlLpRNNFFBchIggtCaocVu/W0n2TkG399oddiV7NCsTb
         zCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+jgLmRTKFljohDQGU+TCWbzcFi+q3XbPME2RwOajqPI=;
        fh=bdPNNq4oEL+S7KabbotDvCsWQLMZ6lHLEJwh7UbaQGQ=;
        b=YMfNNv1WIKXOkcVU6rgb3jknf/fc0OQE2oJi9L0UA1cEqQCdh4OkA5ILyl//XM/LkX
         WOTLQnsRwiGbnK4VSvx6reMY/jzHDiQO1mjUyfxSvvBaZZd6tuczs69X/QrH4NJayV3B
         IU5pKs23Y70xPzuEZ198gQ+PPj1RCL60ExlOVxjcUtz1IBS9FoyrirhmspoNEL5stCU6
         CY5qvd5C5ZOr67pKK4R5qlxq1jtGIgph6/KiW8e+4EuiLnZmg9iI8xVVvvD2mXZE6gag
         LvEaiBa2BexIW6/+p/0MQY2yL0P63y0UTX6bJKsHaOayj1qSZLs+Z65rHRg/qrWJD0HO
         bl2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787161978; x=1787766778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+jgLmRTKFljohDQGU+TCWbzcFi+q3XbPME2RwOajqPI=;
        b=YXXcfVH38vRQHLpMud0sKymlJJxYQpuCZpcwz8M53XaHtgoenBIyqf6stR6Vc/Xdeq
         uHCAnVmgW0czfJsnX5SLrPqTBpMfX4H9eYSxMWUaznI6ilM1cZNwV0P5ECAdUiNEwfAo
         7C9FAMgBH8VqvURatVNZ8AcbrRdKWfAot32hQbAal1idqXUMFNfsujkmoShfWuxaUUy3
         KJnxLCtrwnnkWFyVjlwcA5LXpVTvYgjObBuBKKDQZwtIJyMV3KgSDK299oU7OkF14CFz
         oogjPIwGfzCqZh5VILY3G6Val4jWXfcB3VkllaV5xxUTGNA3g/4/jt6sNvFrsmBqA9uj
         UY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161978; x=1787766778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jgLmRTKFljohDQGU+TCWbzcFi+q3XbPME2RwOajqPI=;
        b=ZrD07Hj5DQsDTHJeGzQqKzEM0z5ETjGu6DZE6BWIPZNu7iwUUdrXvexiigvtX7VV/5
         XsIiRvpoTwGDFTmxO3FlJQp4RTxvzNKjaZLNuKCnUDPkFkofNIbB4Gp/HBDyRL4XFUzy
         /0FKXt/IrLJKiRyNZ5gFZyzPPjtCy4x1tXaRH0UAZzuj9/KJankRbfkauRvgcN1MjkQz
         RdZh5USUPQUCdZ+kY7+FhdtsoKLjD37usM3exrFjUqlqFjQwuVDeh50dd4WZbDzfdCtK
         YNnvnaV5itGvGNjzLP6zlbOuAs5FLGLtZtwXhCt9fZaz6sFdjORcFpyQaucBS9gTxrHq
         ITEg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4ti5c1xuXgBHEbhUtWKMtK09CONHJHqOcX3PgJ0GZNaTBCFDDvcj6N2wrohNzLn5ehD3ST0J+5J9fV0hnqol+8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBG/pY1/zIlPkfLn5GIxfebrjQjo86Tp0iazsLyO3+muoPoxrG
	y9NSpvUnDLJC1z554OdPccXLdIBowpOyOJ95XhV0yiBQcYssVSStWXMyeAp6uuzXnIniPdfS6+8
	Ol+Vc53TQvRz7B38faLyEWSDW1+7JM8Q=
X-Gm-Gg: AR+sD10jIPkgrNGcJMjrPVcIuyYuW6D9wI5FAGaWLxPH12yHxphAB357pWlJPKayuY0
	T3aHDByYOSn//hYnjfPmzpmu54FF5TO6xXD0nGBIKZeedQEYS/EOeNtrLZ9/HT/TDZyfKatYrLP
	3V12oV9iqbcmPiRTQRIhofa5rDEFCgXPU3RNWkwi/uQ1wqtCNevtwjKX5QK25ScqHNN+NHebZhm
	urv9+FnxwFqEqwwQnLPdQMaRl9tVtFWXbdbcTNzL+AU8B+kAR7oEUIG97ZP1pFTpgIsJuYG5aL0
	JhilK6oy29ks/I4NOcNb6twEdYoH5Spv6KRnbNpyTPWAzwuPUMLv3z1OqcsFkUJ16bfuTlDBjEs
	KffHD8IXxgM8SB8yalAY27bag+mfONm4=
X-Received: by 2002:a05:600c:3e0c:b0:499:4e47:eaf2 with SMTP id
 5b1f17b1804b1-499aa1a3e87mr135314645e9.6.1787161977655; Wed, 19 Aug 2026
 10:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUrD22vs+HyuxSRfgrGqugoNp4wfvet-1tRo2qF_CsFzQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUrD22vs+HyuxSRfgrGqugoNp4wfvet-1tRo2qF_CsFzQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 19 Aug 2026 18:52:31 +0100
X-Gm-Features: AcwNN1UUFcHAmSBCIsJsPZqcyHnPNsRSgvoydk2Px4kAQ_U7SkTKsV40VGJXBbs
Message-ID: <CA+V-a8upqydkSDs+aVbYVZS_x-+wr3ZZsSJgOYT-VGkZR6c6Fg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H
 and RZ/N2H EVKs with ADV7513
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review. Sorry for the delayed response.

On Thu, Aug 13, 2026 at 12:56=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DT overlay support enabling the DU/LCDC pipeline on the RZ/T2H
> > (r9a09g077) and RZ/N2H (r9a09g087) evaluation kits when fitted with a
> > CN15/CN20 ADV7513 HDMI transmitter.
> >
> > Move the LED8 and LED9 preprocessor conditionals inside the node
> > definitions so that the nodes remain present in the base DTS. This
> > allows the LCDC overlay to reference and disable them when their pins
> > are reassigned to display functions.
> >
> > According to the hardware manual, the LCDC pins should use slew-rate
> > setting 1 (fast). However, testing on the RZ/T2H and RZ/N2H EVKs with
> > the ADV7513 HDMI transmitter showed unstable display output with visibl=
e
> > screen flicker when configured for fast slew-rate operation. Configure
> > the LCDC pins with slew-rate setting 0 (slow) instead, which provides
> > stable display output on the evaluation platforms.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
>
> > +/*
> > + * RZ/T2H LCDC configuration:
> > + * ----------------------------------------------------------
> > + * Function        Pin     SW Setting
> > + * ----------------------------------------------------------
> > + * LCDC_DATG0     P11_0, SW6[3]: OFF, SW6[4]: ON, SW6[5]: OFF
> > + * LCDC_DATB1     P18_0, SW8[3]: OFF, SW8[4]: ON
> > + * LCDC_DATB2     P18_1, SW8[1]: OFF, SW8[2]: ON
> > + * HEADER_IRQ8    P22_6, SW2[1]: ON, SW2[2]: OFF
>
> What is IRQ8 connected to on the display board?
> It is not described in the .dts[io].
>
Actually this is connected to pin 28 (INT) of the ADV7513 chip.

> BTW, r9a09g077m44-rzt2h-evk.dts uses a mix of "SWx[y]" and "SWx-y" (and
> tables), which makes it harder than needed to see which functionality
> is affected by a given switch.
>
I'll add a patch to use consistent notation.

> > + */
> > +#include "rzt2h-n2h-evk-du-adv7513.dtsi"
>
> In case of dynamic overlays, any conflicting pins must be disabled
> first, so please move this #include to the end of this file.
>
> > +
> > +&{/leds/led-4} {
> > +       /* P18_0 is used for DU function LCDC_DATB1. */
> > +       status =3D "disabled";
> > +};
> > +
> > +&{/leds/led-5} {
> > +       /* P18_1 is used for DU function LCDC_DATB2. */
> > +       status =3D "disabled";
> > +};
> > +
> > +/*
> > + * Disable SDHI0 as SW2 settings for eMMC/SD card conflict with DU pin
> > + * settings.
> > + */
> > +&sdhi0 {
> > +       status =3D "disabled";
> > +};
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
>
> > +/*
> > + * RZ/N2H LCDC configuration:
> > + * ----------------------------------------------------------
> > + * Function        Pin     SW Setting
> > + * ----------------------------------------------------------
> > + * LCDC_DATG0     P11_0, DSW12[3]: ON, DSW12[4]: OFF
> > + * LCDC_DATG3     P14_3, DSW18[5]: OFF, DSW18[6]: ON
>
> and DSW19[3]: OFF, DSW19[4]: ON?
>
Ack.

> > + * LCDC_DATG6     P14_6, DSW15[8]: ON, DSW15[9]: OFF, DSW15[10]: OFF
> > + * LCDC_DATB2     P18_1, DSW18[9]: OFF, DSW18[10]: ON
> > + * I2C_SDA1       P03_3, DSW7[1]: ON, DSW7[2]: OFF
> > + * I2C_SCL1       P03_4, DSW7[3]: ON, DSW7[4]: OFF
>
> I2C_SDA1 and I2C_SCL1 are exchanged?
>
Ack.

> BTW, r9a09g087m44-rzn2h-evk.dts uses a mix of "SWx[y]" and "SWx-y" (and
> tables), which makes it harder than needed to see which functionality
> is affected by a given switch.
>
I'll update it to be consistent.

> > + * ------------------------------------------------
> > + */
> > +
> > +#include "rzt2h-n2h-evk-du-adv7513.dtsi"
>
> In case of dynamic overlays, any conflicting pins must be disabled
> first, so please move this #include to the end of this file.
>
Ok.

> > +
> > +&{/keys/key-1} {
> > +       /* P18_2 is used for DU function LCDC_DATB3. */
> > +       status =3D "disabled";
> > +};
> > +
> > +&{/leds/led-4} {
> > +       /* P18_1 is used for DU function LCDC_DATB2. */
> > +       status =3D "disabled";
> > +};
> > +
> > +&{/leds/led-7} {
> > +       /* P14_3 is used for DU function LCDC_DATG3. */
> > +       status =3D "disabled";
> > +};
> > +
> > +&{/leds/led-8} {
> > +       /* P14_6 is used for DU function LCDC_DATG6. */
> > +       status =3D "disabled";
> > +};
> > +
> > +&i2c0 {
> > +       status =3D "disabled";
>
> Needs the same comment as led-8 above?
>
Ok, I will add a comment for it.

Cheers,
Prabhakar
