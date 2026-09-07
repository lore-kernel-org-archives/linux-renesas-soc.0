Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3A12571B8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806793; cv=pass; b=GkjniI0mXa1jj36P55OeJZ8s5iqeQKW3omXhW9RzgZj7mmQvohF1hfloy9xl01cI25VzXg8QbEEAJ3D3lDIu8w/+t6L9J5TQMmLZCBefySHHYsW2eIa6a6Gm2byisjhwcM0VErjCRand5uJJEef4IfwyX5bn1BcKeBGjep3aYsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806793; c=relaxed/simple;
	bh=Kvu+yYHIqkrVmBOSJUYeoPn390eBvDfu5o/RT4xjxh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVO+Im+sUZEf8gaRGzzH7Y7K7Yv1OnUQrwDlgYvF1s5ZQQYIWc7STtxY+f2ovf0vD+GwZyYDsXNrnVJxtlrl1T4EK1ZTbyzP9VPFtoFSXEz70GB40hl6hVAFDpjTcEO82LmhnC9qjTTDQYSIIe7ENdYS5WTPgjJpsSEgClKnbcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFBshJci; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFBshJci"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso31731455e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 11:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788806775; cv=none;
        d=google.com; s=arc-20260327;
        b=rj/QwBaJMWMX+0S/+yDD/pLZIh+NSbMFckvA8yWulUUn/m72knVl+toI32fUXKiAsm
         TTPP6Ibi8+PwbhieXW1NCGZINJB+tCFYMy3xAhxPoC+tZseg6Qv3ApBJsLFBbi9ZbwPr
         YGt78dY2KscnfT+rU8l+9mJNYnzSmK9DyBhFCh9tRmX2TsXSGbx37Wzx7em+btNjk/JW
         QOETEboBprb11saQ4M09hiF0nYlZakbhLa5+piYoHcapqpbpsdXhI+K907BOeBDoTrKI
         dc26yQgA0HO1T3a9WW+egFMTMAtJBQdUQ7gQZiA3U0CCppOM31gkte91Yuir4gYkU/1k
         Zxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5tgil3vkQ8CD1s0t9IPIfXEewAuekCe0/KDn3NFVfRk=;
        fh=GuierW/es9AEOLJZmoIrkdh+Ss8RLUpxxnhL5e6/E74=;
        b=Jadb7FpH9U14SguCVrC9dvFrzCz+h9xPQ5O8QzHgbCctllXXT5euQ6qMvITUev1vDt
         CBbboDRRwhvgWT1hvQEV/FKx0chAmZkmvq4NlB0nLJL6soISyeEKTML5JVWtMP/KiVFx
         Syrn5P3VQJPzLS+qMybe6EJzFvVaQgAoacoSY5/KKz4JSbV8KKmrACiChp/5HrzkxgXK
         cN9D4Vv+uvaOVWgAeR3WgKGY2up8hoybQowHapA75w7uSUZZjPh2JT6NzVm0PPLzzQdi
         rWEMNimnVrFn71L+pEj4Msc78vKJlsM5/ZUMynSYm0URkP1l4Bk2V5qW/HcbhoN7gnhe
         yAew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788806775; x=1789411575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tgil3vkQ8CD1s0t9IPIfXEewAuekCe0/KDn3NFVfRk=;
        b=OFBshJci78zCHfXQUSmtYSOEmWo3cwkx7pqkY5KFMN2ZJzq4MRE83anQVFtKdo18N7
         /W7KY21H9EfwijN48gcMKoref8S4dEGsjtj3oQ+pSbSXef+GdNst16pHFEC5zk8juePZ
         25159d5+D9PLpC4Eo/m30Lz7dgbEJNwKaeiO3JWGd7Fmr4VBoXQt7nahBiX2oJvzcAkF
         Fno4+4J7fg6+ioWa6RrglFYjb3tUjAZNWvrq0D7wb19O8lqoIsDEnY534Wg1rDZ8e/8J
         HHHAeXnWTPYC2HYvd7sQ+g9Ub31db+Oga6++DQw/3pOUbtzwO8m2T8G/mw+Ov0LahPRj
         Htmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806775; x=1789411575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tgil3vkQ8CD1s0t9IPIfXEewAuekCe0/KDn3NFVfRk=;
        b=sV/CFW3tv7e+pXSxqua8oq0DbdXDMb+jFJ0/TOckv/tgawO3/E837SilmV58+C9crg
         bc46TYr5rXOQm3RJ7ht9hHC2uvcsI6ydvdtcNKSQFT07f87PD3xYL0tpRj3fHtQRzS8o
         gJmsTWMxFV5n9DW/2T2A/IXZjQcfStAIC1yIhKYACurrThTPKAiQQoZB/m5mIAoYCUTb
         emJTNls10+OA5bOtQxFh4O12NvXv7M0DO5/7Vd8SDP5bFEXiM3Tsvorqdyp5YTjhb7PE
         uOkWt9s9//qbigWasf77APJNg2cSTF/swU/sdfXp4kU9pR3MMeY/E39lHEtHZCM5zllM
         0ZmA==
X-Forwarded-Encrypted: i=1; AKwUvBxzEYniRhK6w4Y/dI31DRIfAOkwSV20PRmEmDHMckgqk5SCvLKK4mRxyYKR0j8pZh6Nd/i4p3rRVPGRg0gXsirI+w==@vger.kernel.org
X-Gm-Message-State: AFuF++keBBfRLQ86pVykKkGR7cydIN22p+5ZXDn52LNzHB7YC0Vl8hM2
	BqfdoMIztMyav8cblXENjFrJpvhptAwHd4XSuGXNvxg4gEg6d1LfPQAbDoiC9yke4rQ9z0uTySb
	lD100UkcoigteWAFmsvaV5oke0nAgjs7v5P5oJzT2WQ==
X-Gm-Gg: AYBFou2acw8a3Yn23No+tLI21NpQf+BaTYgHIPvYOQ12mheZnOR/XEoylLLevvriKiv
	3KRayiuhTju9w9W/EdPA4lhXY8LJuSYhsb1Hl79MnRRo6GRisUwER+I/of44Q9H0s3IjDBcwweC
	Ay/Y8WfMGJSe3TrYVClzrw9od+DRwbJGB/YGf8A9IgDSVIzcwEmLa7tisieZwDDtDoupIK2dWf2
	PiLekeauvbtP5HSn9bAKWD0/BPfWJWWyIPJXzMTez6xWpUwT+w6mCngtE762cU7vonn95gbaMZX
	s8SMT3aa4Y7msdmdmfu36BSonz/XpvFs/itGfpYMYMFvXecmnJPMrLm+ObMq8fhv1boRBDER7ml
	LVSt+nSSY1+2DGOHSUshblQRSioI9zQpFkKfZFfSAENI=
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id
 5b1f17b1804b1-49cfc6ea7b4mr221188365e9.24.1788806775355; Mon, 07 Sep 2026
 11:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
In-Reply-To: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Sep 2026 19:45:48 +0100
X-Gm-Features: AcwNN1XE7uW2eXf-zpDN13rtRKPngwcstajdD4PloW5l674McTr-7H6fGfJLoZs
Message-ID: <CA+V-a8uXz6ehq3Mdgri0zT9we7kE+=-XZjahfVg3BBu4NGxh2g@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 3:57=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The dual-channel TCAN1046V-Q1 CAN Transceiver on the RZ/G3E SMARC EVK is
> currently modelled as two TCAN1042 instances.  Improve hardware
> description by describing the actual transceiver.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only due to lack of hardware.
>
> At least the TI AM68 SK DTS should be updated, too.
> There may be others ("git grep -wc ti,tcan1042 | grep -v :1$").
> ---
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 25 +++++++++++--------
>  .../boot/dts/renesas/renesas-smarc2.dtsi      | 13 +++-------
>  2 files changed, 17 insertions(+), 21 deletions(-)
>
Apart from the sysfs file name changes everything works as expected.

Old path                                               New path
/sys/class/phy/phy-can-phy0.0            /sys/class/phy/phy-can-phy.0
/sys/class/phy/phy-can-phy1.1            /sys/class/phy/phy-can-phy.1

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index 469a6282b2a30c91..14f5834082fa500e 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -112,7 +112,7 @@ &canfd {
>         channel1 {
>                 status =3D "okay";
>  #if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
> -               phys =3D <&can_transceiver1>;
> +               phys =3D <&can_transceiver 1>;
>  #endif
>         };
>  #endif
> @@ -121,22 +121,25 @@ channel1 {
>         channel4 {
>                 status =3D "okay";
>  #if (SW_GPIO8_CAN0_STB)
> -               phys =3D <&can_transceiver0>;
> +               phys =3D <&can_transceiver 0>;
>  #endif
>         };
>  #endif
>  };
>
> -#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB)
> -&can_transceiver0 {
> -       standby-gpios =3D <&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>;
> -       status =3D "okay";
> -};
> +#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB || SW_GPIO9_CAN1_STB)
> +&can_transceiver {
> +       standby-gpios =3D
> +#if (SW_GPIO8_CAN0_STB)
> +                       <&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>,
> +#else
> +                       <0>,
> +#endif
> +#if (SW_GPIO9_CAN1_STB)
> +                       <&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
> +#else
> +                       <0>;
>  #endif
> -
> -#if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
> -&can_transceiver1 {
> -       standby-gpios =3D <&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
>         status =3D "okay";
>  };
>  #endif
> diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64=
/boot/dts/renesas/renesas-smarc2.dtsi
> index 696a933af808a8eb..826a11ab93c7a253 100644
> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> @@ -44,16 +44,9 @@ chosen {
>                 stdout-path =3D "serial3:115200n8";
>         };
>
> -       can_transceiver0: can-phy0 {
> -               compatible =3D "ti,tcan1042";
> -               #phy-cells =3D <0>;
> -               max-bitrate =3D <8000000>;
> -               status =3D "disabled";
> -       };
> -
> -       can_transceiver1: can-phy1 {
> -               compatible =3D "ti,tcan1042";
> -               #phy-cells =3D <0>;
> +       can_transceiver: can-phy {
> +               compatible =3D "ti,tcan1046", "nxp,tja1048";
> +               #phy-cells =3D <1>;
>                 max-bitrate =3D <8000000>;
>                 status =3D "disabled";
>         };
> --
> 2.43.0
>
>
