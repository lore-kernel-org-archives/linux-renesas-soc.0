Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825466;
	b=AdNp7kc8XilEC/n/OTZYhdByu+KlV3FJCHaEH7wgcNitC71mLIg5ofbm0iM0t9kHBTkd
	 RG+/ISwa0hXjZ0zPqLfIDopVy4TjB018Nq4n2S05IKa3h1+vhVGTOBVne0AkApbR6hhJv
	 kEScJlikQCn1C5AZmOOTP539hYeOZUcAdhWYsmPHfF35kWQ0P+1WzXtAGhGcajFCp1wM0
	 bR6gaJ8eXpP0T0rxwhexEW+Tm+/Ef26Zdl2Lp9NP4X7OhL/Iaq0ImDJwnher/m0Giqwxe
	 FKhMSOVQPimm3g+J/ULp4FsXJc6wfPHwtVCPSOi4zAxbVqgHTedXDLcHaPFXvSGJZPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
	b=lgJG+As0KKFklezW9Pv3ZhFZ+AzMg+Pf8k6senVwLWTfLl9wMSZ6ygxEYpovOLn+6vbH
	 bguJED2WnzbMwot1cOYPZx0+GjSMGRg8l2rgN1uD+sAkcXk0wZh2r3O5igfhwO7p9eK87
	 40OZZOjXcZL7THLan9/F5LDbQzQ1Vr+m0p/rkw2VTBnLE5kHxLUoAuRZxAjF3MhILi9P3
	 3rd45u/XkedytqdnDxYKjdsBcGPDSWI7S7gGPjh324OaU1/GKgfb7vRQocEm4n78IUBBG
	 CPPim2CFz2hYU3xO85hAmxwWLjfUmcs8jxfjaaNaIyEF+aD/guj4eLinZXx96VfwVKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQF7oTeJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF20D606A339
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 10:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF20D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQF7oTeJ
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5365d725440so37063911cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 02:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825465; cv=none;
        d=google.com; s=arc-20260327;
        b=CekR7MnCfGmW4vRYB64Fzsq0JbH5cx8dYiZNriF9SqOKid8OHv+LVdFnLAy75hucoL
         8QBKgHS87Pe/OVQV0iUXoGtwXdCQBjnUCO27ESEf+l2+YHiqdWxcgg0XY1i1Ivf3/XOr
         o/ELgwMxOt3G2mbRN3ADvLYfmWvoJxlfY8hnzd07euUUwLoXg67jX9KMb5TxAs5k5j7u
         L5weSWxKqjRc86bmAixNf6m1dDbeNX0J304VAOEQb093bC1OJXHNtUPngRCrEBhatRwD
         w0lqdapPWUo/oH7hfbusHHEIEFOmNTb8ZpvC2pouEfl482D2VXCQz0xsBVPWDj7bLioe
         Ny2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
        fh=Z3aAcf68TFCVCrm3TOa41I7VvCErAR2CmSht3wIvvqA=;
        b=BN8RPnW8q3g5BynHDo6ETZ7TJoiRNP5anJ1RZXwggl/9dj9CjLw89YI/cHtP/f5BTC
         X1z7oJw62aTCfKXpb+5F0gbeJ+XEyBW+8LNNo4Qae1iuKbML/lPAP+z38mdo1P98oHne
         kBwNY2aVg/QP5KKOQp2jCVx+LrCzMatjzthpea015xrR+4fG97m6E+zR+L4cISjZE1PZ
         dWk66eC+sVY/B4nufBsIFQahMUcq1oNbh6fR0N1zSifCtAYn+bskKZII6N1vNCAckjyT
         KmViOzKvC2c0wCxYbKATM0lnHALEaNIdQsK571E633T4O8pHZl2NxzUK4fwctTA3eDjM
         m7kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825465; x=1795430265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
        b=LQF7oTeJXUmYYX7GD6HzYAHvjyOCEFEhBBLy/AdElE+gFHaztHun5Mhn6gjnN/as5M
         zNV6sEipktBEj1vCPGfGLk+cOwuIDnCTj6GK1mBNI3J2MkxAyr3JeNr4t56czsg7yjma
         1mEgysUQWNYP+bVidEgL2UkRb2Y+H1wXoHhPOtTEEMDNkVO01SLH126WEr5oSZmFAg15
         l+rUuhJvBPs6pCURm4Hx2pbwFJHX18dd4HHG4Ph1MU++j1GmnIveTXIN2UWYs4Qc7CZw
         1CL/wZVT+TUN9RPbuEuUswJMkz5/HPfT5vrxlmkfstOOD/m6zoUwa8vQsXyfMA6X9pOR
         gXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825465; x=1795430265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
        b=2T/jLrIO4oV8jzbTsa8e1YnoE1z8qNNfc8YaxRWX4o7eGs8CM6ZODMFQY3DRk+lE0c
         RD5Jp0KFKrrx1dU1zYnM903Il91+dN+vd2xuG1uVZb+hs53qj9CMhoE2jljl2I12Wf6+
         R8//LKSVYQl6fBUqQpiiGhFzY0aGJ2rWauZUWJpUnyPDXkLqcQ6z+A5kyn8JCTPqx0cn
         SaCbWpSqRZ/zsKPk1QIYNoUseUKvZJEyRAkXfgMeV5xXsAI5Mk2bUhnQ1dDf8rtquhf7
         YeKQkyDn4CXVrUflzyp+Hvv9F3aNkl+mE+6ArpCaB69tQnL0OC4PHwArFUKJ8QZbRe60
         q1ng==
X-Forwarded-Encrypted: i=1; AL+hErF+Hc/ME2uJEEMRr8LaC04OkNtW5Rr1m1yVV3Lr9zObpNfo8C/4HQol3BSLiGwgm8dfJ9aNbc2zkLdwpKfTacM2CQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/IbWK81tecYji06LB3H2JQxOmV189Tr2WKdq8f1KkX2zSUpodH
	CBqWiGjoU22sqmsTWHAnKNf9BdaonQrdz9YCW5Py/zf58nzunlKqi1EjYhvb5G2dWEA0pbh7hYt
	FvTwEzNUKmvOyFZLc/ZO33EtCR4I/EMr7UwKd
X-Gm-Gg: AYBFou24BXJfbJsKetgXIDv6QmwQXQOHCko1k46T0AIVn62fRt9o1GNjouuMddXX+v5
	b+9u1/mITrsFsQm/Ywr8Ri0CCvu4Na8wMRKNxn7ZNNk47/oy5a3zHkXsjvIEABrcmHfd1Xl/Ey8
	f40uPAntrRToOlwIGfbjqet1m/cnOwuQ6X0rJ5vSkz3P3Q/UB1q5E5zxdWmfoi3owY+cQUvrYw6
	1JnhZHuE8+syn+zXYLfT5UR9PAnH0YLan/c6qUnkjkuvGdkt52cnGpu3SLyioQrmXClzgJkBEcV
	u8QNyvZZh1Gnl+L13prnvII6MwbuTp6CAlAci99gJEM9lj8fWQE6K/88eAVf2EZQecV8jSoYiRq
	k2ARdB0R/vl91C4jHkD56tfPSvRdfTQE7jTFe7Ckm4FTmqc7HByiFyg01EpluwFif4BUXhw==
X-Received: by 2002:a05:622a:e40f:10b0:55c:6d3d:b688 with SMTP id
 d75a77b69052e-55c6d3db7eemr69199391cf.0.1794825464925; Mon, 16 Nov 2026
 02:37:44 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com> <sashiko-outbox-211741@kernel.org>
In-Reply-To: <sashiko-outbox-211741@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 10:37:34 +0000
X-Gm-Features: AclHuK9Eg4UhaKH1QJpvsKiOfCpTnXZRZ4Twf9MfbxpkNjE3e-ev8l8nHxuYT8M
Message-ID: <CADT+UeApMF1yftK27r9haAr3eU2Vk=H__TMMNzvFVuURuP_XOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC
 on SDHI0
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:07=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: renesas: rzg3l-smarc-som: sdhi0 pinctrl fails with
>   -EINVAL
> - [Low] arm64: dts: renesas: rzg3l-smarc-som uses RZG2L_PORT_PINMUX for
>   SD0_CD
> --
>
> commit e86cb26292885aecdb37f14368a14d0f62f6aee6
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
>
> This commit enables SD card or eMMC support on SDHI0 for the RZ/G3L SMARC
> SoM, selected via the SW_SD0_DEV_SEL macro.
>
> > diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/ar=
m64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > index 091a227233cba..f6f4eed9a2ea6 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
>
> [ ... ]
>
> > @@ -216,7 +234,132 @@ i2c0_pins: i2c0 {
> >               pinmux =3D <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
> >                        <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
> >       };
> > +
> > +     sd0-pwr-en-hog {
> > +             gpio-hog;
> > +             gpios =3D <RZG3L_GPIO(5, 1) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name =3D "sd0_pwr_en";
> > +     };
> > +
> > +     sdhi0_emmc_pins: sd0-emmc {
> > +             sd0-clk {
> > +                     pins =3D "SD0_CLK";
> > +                     power-source =3D <1800>;
> > +                     drive-strength-microamp =3D <9000>;
> > +             };
>
> [Severity: High]
> Does configuring power-source on the SD0_* pins cause sdhi0 probe to fail
> with -EINVAL?
>

No. see below

> In drivers/pinctrl/renesas/pinctrl-rzg2l.c, the SD0_* entries in
> rzg3l_dedicated_pins do not set PIN_CFG_IO_VMC_SD0 or PIN_CFG_SOFT_PS:
>
> drivers/pinctrl/renesas/pinctrl-rzg2l.c:rzg3l_dedicated_pins[] {
>     ...
>         { "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B) },
>         { "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
>           (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
>     ...
> }

{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B |
PIN_CFG_IO_VMC_SD0) },
{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B |
PIN_CFG_IO_VMC_SD0) },
{ "SD0_DS", RZG2L_SINGLE_PIN_PACK(0x9, 5,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT0", RZG2L_SINGLE_PIN_PACK(0x0a, 0,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT1", RZG2L_SINGLE_PIN_PACK(0x0a, 1,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT2", RZG2L_SINGLE_PIN_PACK(0x0a, 2,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT3", RZG2L_SINGLE_PIN_PACK(0x0a, 3,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT4", RZG2L_SINGLE_PIN_PACK(0x0a, 4,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT5", RZG2L_SINGLE_PIN_PACK(0x0a, 5,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT6", RZG2L_SINGLE_PIN_PACK(0x0a, 6,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT7", RZG2L_SINGLE_PIN_PACK(0x0a, 7,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },


>
> When sdhi0 binds its pinctrl states (sdhi0_emmc_pins, sdhi0_usd_pins, or
> sdhi0_usd_uhs_pins), rzg2l_pinctrl_pinconf_set() -> rzg2l_set_power_sourc=
e()
> -> rzg2l_caps_to_pwr_reg() returns -EINVAL, preventing SDHI0 from probing=
 in
> both eMMC and uSD modes.  (Dropping power-source from DT while keeping
> drive-strength-microamp would instead leave the cached power_source at 0,
> causing rzg2l_ps_to_iolh_idx(0) to return RZG2L_IOLH_IDX_MAX and read pas=
t
> the end of hwcfg->iolh_groupb_ua[] in rzg2l_ds_is_supported().)

Drive strength it uses reset values.

>
> [ ... ]
>
> > +     sdhi0_usd_pins: sd0-usd {
> > +             sd0-cd {
> > +                     pinmux =3D <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_C=
D */
> > +             };
>
> [Severity: Low]
> This isn't a bug since RZG3L_P5 expands to 5, but sd0-cd in both
> sdhi0_usd_pins and sdhi0_usd_uhs_pins uses RZG2L_PORT_PINMUX(5, 0, 8)
> instead of RZG3L_PORT_PINMUX(5, 0, 8) like the rest of this file.

Will fix this.

Cheers,
Biju
