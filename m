Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825083;
	b=qLYVIlR1zeLNtjexJwpzvFBYMzpiPa98YJj1pxMhpFvdiO4ETrW19uCvcta1XKobCSZ/
	 f43rdsuTi/JfsQaaZQAyidlyw7X8tVLftfmHPtj4rOBA7V6zdOZWQHMZzg1hhmyMEqpOV
	 OKpnga4EqAtX/P7i2PO+4Nq0Swm4ASqPMsahBnFMBdKnOkN1jW/BqgyPhKjMeJliRnzsK
	 rmaC4i34qcIEepMuWYq+rbymqRUejaSkKtDHSKVL8MiU2wG1SvQEsefkloJu/b9KKoiiH
	 Ijh93mcVn+XI9zONTX5vE2exz3Okl2pSezuKI3jNi/L5vyvG3vpYcCH4WnK2VwJclUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
	b=wEZlQOrtjmmY2djiLw60dr4m/xIsTzDDCFn8qLXEoi27SaQULHZygtbKyGWbkmn7LYmv
	 H88U5d0xjXibubgTAFuqm5q+Ai9HJM8ktWtv9tfyTocxatlQkbjpo3nYFFY47V4aysGvy
	 F1b1eLU4DUIFpMPizr+AxM+f5euyYgPB3TRSbHNe4OARapZzaHRYrmlqaEejePKFKgzi8
	 4udSo1nUpk5Dq0Q85tXZnDJU9UNI+rg/IWmbDxMgkjKq+SE3dMCH+RoaXoacsovyZ5MR4
	 mz0DtbX/wAVDxCLq5/VadeXgMbEpTOk82bKA+lnJj8brlHIh2q/D0TRZZS2m2Y90RrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DS84mFHy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF0606A883
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 10:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CF0606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DS84mFHy
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53644b28706so24364831cf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 02:31:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825082; cv=none;
        d=google.com; s=arc-20260327;
        b=TMPBdRmCkGqxXm+8IrjFCOgoIDW5u6PBqamuzT0amQS1ysgRTMqG8XlDyu0eoYJoO1
         OB6EL49zmnmhFGptuZgNCuBcPUig7ldQfecR+cQMTq+5QdEVCfy6Nsyih8rPtyBQjCe/
         72JUOv/AntJapOqyMmS3Xs4rqXMTJbQzC6zldD/v7o6srL+eD3SJYP864/GsfDRsgzoJ
         L5/N+0aIfkq6ZSlexfw7pv8GtS4RmI9NMjlJEG9bjrEsWW9yZlakoDZKaqKCi7M5Zoxy
         zEyYo3YuaKwmlJB1ml1G1RAjcIKntJBT5XRYmgQFNg8raLpig9KofaMt4X6PVQ0xzreX
         ab9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
        fh=+t2RZLjAMrlnwukHcPlJh3APjT0GXrJ8EwmuPQOs/TI=;
        b=YehlvhduD3TMsHnw+eiAONhBAiZQu8VjKTBYN+E/bERN1NUGQDbLPi0dFiWvLqZ6Qt
         CRpuV4ZfSkd+sQtebia+LBkBd0Ym1QEhz8y2iB0Y+CiYhEydR0OJyFbr54aE5je6cqOM
         Ig3/fWDdTGLIdoRgHWjGQ+eURpsrjasDtZ8CQTeBD0y3aSNgQImKKGEzDOF5ifp3zFIP
         oaE7BOty3RmWXGr4TPtOatDoTVupKGm7Jn0CmZ4bN4hFWCPDLIgxUefJvtu8xec2pGW1
         em4MsduJRHt4726Bg7QHBQXoxSPjyv42Gw4Z9KlgwyPodn/8r7vXHW6ggMpdqTKdnQ4K
         eZ2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825082; x=1795429882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
        b=DS84mFHyPaquzhMIFrPucSvrXaOGC6IvbD5KhwZAme4nzHxaKTAzGvTp622VH2+K2s
         AYADXW1kV+J6MtdUo0GcdDgAIbssjM2sPsJM8fn6NUVQrt32iy1kJz7XWduaGYz4yrob
         EEyykkTZbHTmncrPJd2hfclByO1RSE/NmaZyEG8dxKNJCgFaD2dmPitPbv9rqJaCsPWs
         H+UUIc3fyhTK4og2BNlpUvOD4hOhq0x1PuGHRYXzewnjoLgb3QU0RBUozfYV6jJm2XOv
         p4UAi/y/qFvYWoqlDGBs1VPsAme94LQkcl0Falj1U/tpYadVGPIwNQMgAFoCDS+jxPLn
         cybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825082; x=1795429882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
        b=kMLGJB2bxpnAUP4/LJZQ9xpgSjT/BRxrDqcnsaV+yXMZPxYUgWfJGX39+eSDjzt9BZ
         8+s1d82gcxeONYdI5gVUy3WYOgUw8o0V5tCCT+WfFRtKDZKVkMazn3o8cRGO672aGKx6
         nDXUX+fFYtNXYcSUnuPpBppYqYcFqLyBm06HWsYwa1pAGY1/mnzlLQ3tpN1sWmxAUxvu
         RoDVZbB4fW2Z6es9RThTACkjSLc20tJcxcpQWNQCu3fEYMoHVZbG3YVJXEh+Kb41vnTd
         BYDvu+b7NZvwl0WsfN0Zu6o+3qKvQ68rV+UGTUcvEGbTpbInw218JjetNQXECrtCZLry
         r+Fw==
X-Forwarded-Encrypted: i=1; AL+hErGz4sv5acjxFX0AH0b6e4u1IH80e/wgdCgT/7/+lKWtePJjbkynRec38akNUz6zzXctBEiDUv5EQSHbtuViaeFRHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GnWyo1MwttVvPf2mPE/vb8q+m56Nm9on7Yavlg7N6xNrGZPun
	a/vI7eCfzCIy+yQL1cwRGFKOEBSdUQaZMcv2AVleQcJlIamByoRA/LrxvClwlZCAGamw0bO4VHY
	+0f+TDt7IZw2ZAgTEXhdhjYZeQnuiz2J4lZs3
X-Gm-Gg: AYBFou2BObYJCtkowk0WIKYpOZdO21Ltxy4amssqLDy2pDPYEfKz/tSY4ZelCyPJ4Kc
	CZ5gt45L8YqYIagqtDw8zLSEwi4dZv2sIYnFxhcIutmcYWnCwb1OompO/QQH1+YUKpuzdufkRNZ
	pV+Lnqq9WA/cBEOdlnfTg6QPBEteQdnOmjXu2N4z3hkUZYm/7JouTT7rtwntbYwR8ix/OkxaloZ
	feDdZMWRWQh+wKUKfmkFhxIvwLdtOIrZnaJ3wv6LnZvzgHuz4CvNeXodtuu2TUevCaST4HKF2eC
	FRiEWFkpBwCtD4B5psVr4bLD38gNt2hySOHEfCqAGOZ7Jpf4KiHLmCKkLJDeM+MJUQLAFPFW4BO
	FgeK8BdRM+x4zRryfdpDxJkOxPDjFvGmcOBRIUOmZZypDlmbgY5kLcaXsiy6c54pS0DpwJEs=
X-Received: by 2002:a05:622a:4d99:b0:536:990e:b4c6 with SMTP id
 d75a77b69052e-55ac7b550e6mr150515241cf.35.1794825082365; Mon, 16 Nov 2026
 02:31:22 -0800 (PST)
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
 <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com> <sashiko-outbox-211747@kernel.org>
In-Reply-To: <sashiko-outbox-211747@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 10:31:11 +0000
X-Gm-Features: AclHuK-69tq2_5BrwcWip5r2r2C2Neh0RQqG5aAWyws3AaOyvcwgj8fZIJcAvcI
Message-ID: <CADT+UeCM2SEvcm8ELcFVDK_rHJuw=H4fC0=ArbJZcwBaeCQjvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: renesas: rzg3l-smarc-som: no-op UHS pinctrl
>   switch on sdhi2
> --
>
> commit fa36790e3b28d4844cd7f51756a420dcdb4538ff
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
>
> This commit adds pin control and device tree nodes to enable SDHI2 on the
> RZ/G3L SMARC EVK platform when the SW_SD2_EN macro is set.
>
> > diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/ar=
m64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > index f6f4eed9a2ea6..e8fc9cddf288f 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
>
> [ ... ]
>
> > @@ -330,6 +331,74 @@ sd0-data {
> >                       power-source =3D <1800>;
> >               };
> >       };
> > +
> > +     sdhi2_pins: sd2 {
> > +             sd2-cd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_C=
D */
> > +             };
> > +
> > +             sd2-clk {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_C=
LK */
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd2-cmd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_C=
MD */
> > +                     input-enable;
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd2-data {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_D=
AT0 */
> > +                              <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT=
1 */
> > +                              <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT=
2 */
> > +                              <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT=
3 */
> > +                     input-enable;
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd2-iovs {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_I=
OVS */
> > +             };
> > +
> > +             sd2-pwen {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_P=
WEN */
> > +             };
> > +     };
> > +
> > +     sdhi2_pins_uhs: sd2-uhs {
> > +             sd2-cd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_C=
D */
> > +             };
> > +
> > +             sd2-clk {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_C=
LK */
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd2-cmd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_C=
MD */
> > +                     input-enable;
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd2-data {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_D=
AT0 */
> > +                              <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT=
1 */
> > +                              <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT=
2 */
> > +                              <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT=
3 */
> > +                     input-enable;
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd2-iovs {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_I=
OVS */
> > +             };
> > +
> > +             sd2-pwen {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_P=
WEN */
> > +             };
> > +     };
> >  };
>
> [Severity: Medium]
> Does switching sdhi2 between sdhi2_pins and sdhi2_pins_uhs write any hard=
ware
> pinctrl registers for the sd2 pins?

yes, it configures POC registers and uses reset values for drive strength.
>
> sdhi2_pins and sdhi2_pins_uhs differ only by power-source (<3300> vs <180=
0>),
> and neither specifies drive-strength-microamp. In r9a08g046_variable_pin_=
cfg,
> those pins use software power-source tracking instead of a hardware
> power-output-control register:
>
> drivers/pinctrl/renesas/pinctrl-rzg2l.c:r9a08g046_variable_pin_cfg[] =3D =
{
>     ...
>         RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG3L_MPXED_PIN_FUNCS(B)=
),
>         RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG3L_MPXED_PIN_FUNCS(B)=
 | PIN_CFG_IEN),
>     ...
> };

 RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3,
RZG2L_MPXED_COMMON_PIN_FUNCS(B) | PIN_CFG_IEN |
   PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),

RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),

AI reviews can be wrong. see the mismatch.

Cheers,
Biju
