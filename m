Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770BE3DB320
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 07:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939838; cv=none; b=laDw/UV9EMJxwFH674pIDaOnoZRtFgERyFsuSKOEQghNT/vZpOyR9thVrSP1q09tKyQ0H1n53pIOcdff9fLDJRfMjGt/B7CZQbRh17dwcF8esUhKI/uoVcPt/5wQbJ6UoR1tIXg4YbHmjPcEGUl31POcpjLYNgymdIvUHMG1Eyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939838; c=relaxed/simple;
	bh=9yc14kv9vv0ac8fv1uYJcHFWFcqHf9NP7Ogx1611OGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEWjpVqb/y9x+NKkAVJt62iU1JK1pyi+hMhJIesZx6fCmZsu0w/MP0sGQx8jhcs7ZtzTb5x5C/gAE0/0xVr4/fDh1C6WJdjY5fG7wOVx6OxFypjOw0TBCUxc8PcClFR0M5nKqK5RuUY9GUP707NVRHVli6itRbxi9I55gIf0FWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c197e7e4e94so914382366b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 00:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939835; x=1789544635;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2rInCUUC/UXiPpHJ1CPYpbMNMz1oCA9yxKCwNhHDaNM=;
        b=KTkR0a+pCkAmEYgiG3vC1IMLembgZ3ARJirvPexbxDYB3GbqpkKf63/eoMYRKlabfI
         o7Ycm8wz3dfdMsF9b4ia6svvLNrs3PEW6qqwitTzTJ2epvduJa/ZKnua3Q8ZZD7CUx6g
         hjawcrLIGrIKHkT0DeU+WSJI5wu3W6v/F3+jyChuJaMUhYefpSSHIC0J1jTCk7SveKBp
         z9kN81MLaiIEA+ofm1goHJv+SE5yt55Ym+zk3V6xTp5kWVlGdpgCBh6X9eZXHeYwybf1
         jYYdxQ0ynC+0DbdR9OkOlUY4chyo8fzo5SIodrUOJR0ECDTj6liMlwdihZCiyJuELFRI
         VK5g==
X-Forwarded-Encrypted: i=1; AKwUvBw1b/TVXmFDFBN9T0NCbGNmBSpP82BQNnBd19OVqcOn77TI9tsBCX4PHsAXizmO+Z5+ksHGacqYYL5+Lxpn1agfiw==@vger.kernel.org
X-Gm-Message-State: AFuF++ljCYNw9Yx2F+clDC8IRR8a+tuceuwY58GiqtK5u23lBTPrNBuS
	AL3UcozEh4jFmqD7QLB7m4MtLfPak+O6CFZYJTKB4WD8iLLN7dNGDGSMPGsVKLw65Ws=
X-Gm-Gg: AYBFou29GERmoLnANxHcsdh8RLZpMwR+VvU4A+9JdKEmzx++TJWMBMqamoh4JzXJykV
	jgkTWJpjeFzMXO0aUyX0NioIIfI1cUrPxDP9AK3oPcWeouxu1XQlrmkEXaNWYL1XzeCpIwGgK5N
	NZPOrGJJK8/5cKztVhpwfJ/GQZx/ukHraP8BvZcGAfMZPfkAvIn1jX44AA2XKVA/WQMEfKyZZbE
	nYrfiNe1jdQnWwVsraCcrcAWWXFnllPt3mY78z1oW/zZlc5OHKxLmwWuxEBpQ4cGoPRoR61HTOQ
	u8p2x3m75ZdAP5lEz1Qrv8Lci3YSjRKaEwtD9MWk6k/zcVPdZP5r3JZ0Q1YrpMyLlszPWijYC0R
	ZKqH8244dndobeveNdXfK5dpTb5BzqRxGAKnapR7rcLPANMm/BUy2wQp9S65/ARLpbnTlQZb+H+
	g3w3c7E1sprJi0imKm+5QGbpqtCy7U26nSEDEDvWMBXg7aXHNUpYqhKHk1k7KD2l6FSzYVkFW3t
	ZjXgEmgyiSSQAcjQVmIP0T7ikVkY2KUwgg4Iw==
X-Received: by 2002:a17:906:c14e:b0:c16:2dc0:e1ef with SMTP id a640c23a62f3a-c260c988de0mr1307287866b.14.1788939834494;
        Wed, 09 Sep 2026 00:43:54 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d57fd88sm698646166b.44.2026.09.09.00.43.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:43:49 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a63667b78aso8838267a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 00:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzIMn4tVHbtKtxV7BOfGNXVMicjkISD/NmG9xcZUfzVQuOSqN17KqnykLvRG2zbqwir1l83V6ZwYRIhBMEzXewxYg==@vger.kernel.org
X-Received: by 2002:a05:6402:f05:b0:6a8:e223:fee3 with SMTP id
 4fb4d7f45d1cf-6a8e223ff92mr2011006a12.43.1788939828389; Wed, 09 Sep 2026
 00:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-14-biju.das.jz@bp.renesas.com> <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
 <TY3PR01MB113466B5A606D636420D7BD5586B02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113466B5A606D636420D7BD5586B02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:43:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQAAugUtYNgkKrY=TFZbiAa61=jBg_fj__L+hRUBCR_A@mail.gmail.com>
X-Gm-Features: AcwNN1UM-4yUAnjvwz3HU9UugHpIoEhFheoRD6Ksts2TAyZGkKbX5f7QzfQ8BYQ
Message-ID: <CAMuHMdWQAAugUtYNgkKrY=TFZbiAa61=jBg_fj__L+hRUBCR_A@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for RZ/G3L
 SMARC EVK with ITE6263
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 9 Sept 2026 at 04:57, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> > > Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for
> > > the RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output
> > > via the ITE 6263 HDMI transmitter.
> > >
> > > The overlay enables the LVDS controller and the display unit
> > > (DU/LCDC), and configures the ITE6263 on I2C2.
> > >
> > > Update the Makefile to build the overlay as both a standalone .dtbo
> > > and a composite .dtb (base DTB + overlay).
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso

> > > +&{/} {
> > > +       lvds-to-hdmi-out {
> > > +               compatible = "hdmi-connector";
> > > +               type = "d";
> > > +
> > > +               port {
> > > +                       lvds_to_hdmi_con_out: endpoint {
> > > +                               remote-endpoint = <&it6263_out>;
> > > +                       };
> > > +               };
> >
> > No DDC?
>
> The driver uses parent i2c bus as ddc-i2c-bus. That is the reason not added.

Neat trick. Do you know where that is handled? I couldn't find it.

> > > +       it6263: it6263@4c {
> >
> > hdmi@4c
> Ok.
>
> >
> > > +               compatible = "ite,it6263";
> > > +               reg = <0x4c>;
> > > +               data-mapping = "vesa-24";
> > > +               ivdd-supply = <&reg_1v8>;
> > > +               ovdd-supply = <&reg_3v3>;
> > > +               txavcc18-supply = <&reg_1v8>;
> > > +               txavcc33-supply = <&reg_3v3>;
> > > +               pvcc1-supply = <&reg_1v8>;
> > > +               pvcc2-supply = <&reg_1v8>;
> > > +               avcc-supply = <&reg_3v3>;
> > > +               anvdd-supply = <&reg_1v8>;
> > > +               apvdd-supply = <&reg_1v8>;
> > > +
> > > +               ports {
> > > +                       #address-cells = <1>;
> > > +                       #size-cells = <0>;
> > > +
> > > +                       port@0 {
> > > +                               reg = <0>;
> > > +                               bridge_in: endpoint {
> > > +                                       remote-endpoint = <&lvds_out>;
> > > +                               };
> > > +                       };
> > > +
> > > +                       port@2 {
> > > +                               reg = <2>;
> > > +                               it6263_out: endpoint {
> > > +                                       remote-endpoint = <&lvds_to_hdmi_con_out>;
> > > +                               };
> > > +                       };
> > > +               };
> >
> > No audio?
>
> Binding describes audio port, but ITE6263 driver supports only video mode compared to
> both Audio/Video support on ADV7535 driver.
>
> I will add audio entries once we have driver support.
> Hope it is ok for you?

That's fine, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
