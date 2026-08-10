Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6553E275F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366640; cv=none; b=LIDO7JYu08kNJAARQ8VebDyXX5lylHnnThlGye2dksoOkDIAzHH//ooSDrIfqMQSfDg/HvAMviC8JNDWQ7HTD0Zu6CVJz8ZDGJQd6PXab4lVaDnwFsISba7C/4QFhZWHdZlk7cRo9V7U6gHNjlgAtNzlbCQrxyaVcpCw1ge72jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366640; c=relaxed/simple;
	bh=ChS/Bn6zepkpnRtJFlAWRaPzmlVSNNX2nqtInB7kA8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUDdzQUYxdBQSiUhpIzA1TgL2hZtb8pukqUc7sfCl84Ke+dDVnm9Kqsp/RUmneEBFRJfDfRQ863HoVS9RkonCb6p8V7IhTlHlzEftS9I2iyi3Zh15V2WYJ8YXBhDSqOGe0RDwfFb38iF44HGgJE2T86gsW7G2CZVL2Ywrru/BXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-979fd43810dso237687241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 05:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786366638; x=1786971438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ucqtpg0grkHChPvWz58kRJ+3MP3h2PLHcjZkUQRzebw=;
        b=mUe+xj1cTELK6QqwYln5BxVXRr/2YLpEYJwS3vtIAJGL4ue9y7o4y8NjLtbgaPbHR0
         3Ax9jUSAnpKDuHlsd+ge/EtFA1HUajSlGLXrwhRfGv3s97Bna+ZbcppwJiSfhyM6UNnu
         zPIwPVCS1D+DpxancsPQgvgoaomZeUKSG7IJ4mHtbXXnbjz7yu6deqyTKt4XKgOnuPpx
         ZO7eZTvGIkJ+JYe9CbWP2nBEmzSt1vWqlc41tCE6UAwHwicvRzLtOh7bcUnVovYsiqlh
         dStprgZp43hxcPSeytPatefP/fSneu1mcPc3djW4K0mT7UG64JXTlYFNFr5Gz3fraTWU
         ROUg==
X-Forwarded-Encrypted: i=1; AHgh+Rpwzi+qYn+5mnk2lO6NXlb978uiQU/zWP+AkHQHNpkopJ3hFEyBYORualrAXHDep2GmM52JJp755qQSMvodUbbXgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3XvFVG8liE8rwf6CNoLBSlQvk8QM7s3pIb+rtpqI6auCfy28
	5Tlrd9ubNTDPCmxFzG35zndSm4C4bLSUs/jX1h6t/i+Mpg6ZpDdMQOGXIvBqamPp
X-Gm-Gg: AR+sD10hxvdvbKDhA+pJGGJ3Xqr8m7deP3d0ODshevOy1kxuRxBzmvZcDnCrF1V7kEV
	hQpZg1asLVixLkuC58jybumaqLZfn8MXVdfk/mjB95yAV/j85uanyz3PsENUG4jm+vwafbgTvX5
	iuT3coPTs6cjnrVwDb/cHDpeArTas7pdwCu+Er7MZIIDK8+PFfuXtqrCAw+HW6ItUaydEAGb0tE
	75zNKc5PPKEc9ajMJUs8W+9Vt/MvYkfYARQUDX0ftl0xy/v6KC0NRaRmaYePCeY3XjO0fWIOVvE
	e/KMl6kje1kZBeTP/krXHO6vY4TFwAAL12IdaEkmqieKKeFHLMi99LYkhKi++UfwFZkvTySx5BO
	WKdgeMXT3iA6Ooa9q6LsHJQBvompdhywqj1gP5B6yW3O+JJPjhXIQXFpu65Ay4dB0Pv00y0FOX+
	Z45qE16SwM47hOgfjo5rXvNWN22O/zIa/NAEgtwda9tlwwbPQ92dr7AVbtNfmSs2C30ieStxIYd
	PeFrM6Jlme69EnZdKCYUZjBEe66yg==
X-Received: by 2002:a05:6102:b0a:b0:631:23fa:38d7 with SMTP id ada2fe7eead31-764301f5609mr4513457137.14.1786366637941;
        Mon, 10 Aug 2026 05:57:17 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2eac14fsm3452552241.7.2026.08.10.05.57.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 05:57:17 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf95ade656so650253e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 05:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roqd6PiNCxF8BiB9tPjw7MLCuvaRLKaaNlX7VB4kNDDJa1lkaGFKyVF53tYJKv73FGKAAG4Ou3YUHYNh6603C9UJA==@vger.kernel.org
X-Received: by 2002:a05:6102:3ec4:b0:737:783d:1916 with SMTP id
 ada2fe7eead31-7642f8bd6d4mr4730624137.11.1786366636139; Mon, 10 Aug 2026
 05:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
 <20260619164030.380098-5-biju.das.jz@bp.renesas.com> <CAMuHMdX2+Y3Wpd5WwZBRSjhPdABGfKEzUifcGg5gTbkya6Pjuw@mail.gmail.com>
 <TY3PR01MB11346C90ECE3632E3006BFDA986CB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C90ECE3632E3006BFDA986CB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 14:57:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFyOwuOge4PYTaDEmL=T1PTn3iNRiR==5C4ZKRKKew0w@mail.gmail.com>
X-Gm-Features: AUfX_mzvJXPduQ5dapuJXvaFriBFz3yz-qOGbJYm-qfllV6oQ4scPBZHL6wJT9c
Message-ID: <CAMuHMdXFyOwuOge4PYTaDEmL=T1PTn3iNRiR==5C4ZKRKKew0w@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 28 Jul 2026 at 14:35, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add support for RZ/G3L DSI mux that supports 2 duty cycles.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > @@ -120,6 +120,11 @@
> > >  #define RZG3L_PLL7_FSTD_DIV_MR_MIN     (8 * MEGA)
> > >  #define RZG3L_PLL7_FSTD_DIV_MR_MAX     (16 * MEGA)
> > >
> > > +#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM          4
> > > +#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN          7
> > > +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM       1
> > > +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN       2
> >
> > I am wondering if these macros are worthwhile, as IMO they make it harder to understand the code.
>
> OK, you mean find a way to determine the parent based on some variable.

No, I mean to use the actual duty numbers in the code:

    - duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
    - duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
    + duty->num = 4;
    + duty->den = 7;

But probably this can go away anyway...

> > > +
> > >  /**
> > >   * struct clk_hw_data - clock hardware data
> > >   * @hw: clock hw
> >
> > > +static int rzg3l_cpg_dsi_smux_get_duty_cycle(struct clk_hw *hw,
> > > +                                            struct clk_duty *duty) {
> > > +       u8 parent = clk_mux_ops.get_parent(hw);
> > > +
> > > +       /*
> > > +        * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
> > > +        * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
> > > +        */
> > > +       if (parent == 0) {
> > > +               duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
> > > +               duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
> >
> > The 4/7 duty cycle is due to the division by 7 between M2 and M2_DIV7.
> > Perhaps it should be set by that divider clock instead?
>
> You mean define a custom clock for M2_DIV7 and call setduty for grand parent
> from LVDS bridge driver to distinguish LVDS from others ??

I mean to define a custom clock for M2_DIV7 which sets a duty cycle
of 4/7 (i.e. an odd divider clock which sets .num = (div + 1) / 2 and
.den = div).

Then you can just drop rzg3l_cpg_dsi_smux_get_duty_cycle(), as the
clock core will happily call into the parent.

In hindsight, I should have given the same comment when
rzv2h_cpg_plldsi_smux_get_duty_cycle() was introduced.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
