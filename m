Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752513515E6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989863; cv=pass; b=EefX7BBs2FEPOV1wosnxoOM2d7087acANkn7E2GOMXCa0y6LkfQdlknT3uhZhPGYIlE/zrX7LtNx4t1qMcMD31dDj1/pkJwrM3UN0oL0QKO2ISQcDDJdax5+d4iJLEnfkJyFlgRP2E3v9GoUzlG+G4wYwdYg4LBH5ECXp5NyFYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989863; c=relaxed/simple;
	bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4EDOkh27ULh2+WKRRO1ZKO6kBCpiNWaDWQ8ZfCuyGjl/3cjB+TjCWFA3lMJFPiulBAglu4T2Iaj9CijU+32n1gJf009OMK1uegO6GzowkplwqtbgbDMK6WVyieqNst9HXodewey+rNCGo7W53ids8IYOVsXyAcge+gZiyBGXkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThX742iP; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThX742iP"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso2356140f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 04:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789989856; cv=none;
        d=google.com; s=arc-20260327;
        b=bKnFPVqTySW50/vMP4W4MNPMmhG2whzAZxUPqgDbVbpMYbN436lXpjHYaQcSd9SWaE
         fASOS+YnexP3l6+RJc88C6cc2jylgn41KQfjJv3eUjSxbBFP2n2ApQvBMOg9rxEbLKup
         zwYWinMVH/BFxPNIvaLGR0byYQcA38JnHfq00Jr1H/TNYqMKNNkj/t0a4y3JoNHGy3bC
         RCbmobcawoH1DgvE4lCIfkOXp/2MasQ2njTMb+rwcWoRd2TKEC6enFCH7aJbaCfQr3YV
         inFIEM3xd9Ep16Gh5yaKUjYAt3nJgVBf9KgZlyV6Ooh36ahgYzD7q2VCdfXH3iwuUcBE
         QLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        fh=Gf9Yurr5JBrkbPmm7OCTwcOdn4TQdcreHlVG5ZXYo/o=;
        b=Hq0CmZVRxwJDCb7nypWtns6lLRuZ8kHMBw8kQE84zLD9yIpW28ulzqKsL7FDeCZ6ZE
         QJtAIa8WrWbwAecR0APRP8pVLcqCfnwlC4LYZ7IHi/zJaHGsor0ec538exYOu47gFwHX
         5wqd4rKDlgRE35DkBLyWRTPgJEw2wxlI7+RtzkQiwHAHt6fazcPyvPz0mz20M5w9Q3Wb
         aSsS8UV1qTewRXoU9hw+Kn51oGkwpP4pdaNq3e/e3kZIbaLUXZcfIPnpT+w14jj79eYG
         OVLaQVd5o43u7558Rz3DTBSkGAObpontEXLAG9RhIG9YAdE2OyMnWLIc52fhzNqSdYS5
         vP4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989856; x=1790594656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        b=ThX742iPETQukFX3BBlsPPA+JqXvvRIUi3buvYb6DHUJ8uhywR7FkPybPC3WtdM2td
         cw+JZn2MXPLxNJkU1hv/HjhYQbCExqead52s5CZSES4onYM6ZeFng/l1dI4W2aCJ070z
         sGUIx8WWnCBUSgqZw2OQGQDhU4eYseFbxWM7XOZhjmsVd9hw+zaQJd17FyC+lmjZlng7
         YrB893St+30OJ3wABghrgJytAqkSKr044EIXFeyfBUmZZurPVJoA7+OODterBi/HYktB
         K+y+DZZjHv2NV80Cj+p5ANMayWnacg6V/RlXynE4nq+plf2w/FGel/B+E5JwiNU9VlO6
         LP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989856; x=1790594656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        b=0YmOtQj1g6Ju23yUTFkDx6Gd0YgrghzhEhdAQczegS2yX2zISaC4rs2piaJLHfH/L8
         G8CcIlmY7UyQcCUxt7+Hz+S4IdzAsp+/qyktrLoHuWbO47opgJPASzYCYXHxYapDMKpK
         tf5GLNvTmC75xms2u0rsotoo3bkxnv/wl1bOk/u4k51xlADeCGvxsLXCkwA3G1rGehTo
         b6n1SsGlTbZeYBSGuEMCaLrhBvqTE6+wqM+HahUPTc7MHjxVGkGxaZ1N4QPzRM5NSC/5
         wezw+Nk0CHuzqojW3BXbKLIxfqkOMwFGlgpEXmIkV23haj4XHu3h8FPFzTW2MgYy9H8u
         3ePw==
X-Forwarded-Encrypted: i=1; AKwUvBxL/MReT8ZHe+BTeRhPt90dShJ4SaHboaZT2JwDytewyKVPPVkx/BLJIWjE7yMuO+KWxI4ZmFW5r1AwlulXhJAWTQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kkBdEx9WbWQVbMkXfopAZutv5zcFbMPUiChBd0CSzXJnEGPxo/
	EbMYmTFBD/pnKOUnjwh8YXWd59jypF+9sguF9IbAPqE/p+H1zQq+0nXz5Rn2p58Wgf3jza6270n
	jsPgesAu6yvpJbdg5n4R1kFFVn6ppYUw=
X-Gm-Gg: AYBFou3Tp1H36v2ilwKeh7ocaMBKxAMZR7Aimc3CC2HN8cUIhe+hTPmI+0UEInSdzxs
	mfk09ZeVSTZCut4DB2JmsYGxiV/3HzAH8BXELB7WJ5bz61Ng8wWOmaZPiH1jjRrsDDiT9JxdwNn
	M6+tULAZJ0w/c8ZXnQ8TNyPoi1Vg2zVv6apQ+mgUKL3CNmrwmcjM9U+JVbOpKU+HmhlVUTfFY7h
	mq1XdU1n366XcxzWH9WIC1atrfo+u2YJ93w5i+cmikjZHqLLa3hqEFPieQZK7SHhxM8NTUDtXIu
	lyflo6b2/hUs0G9bpomU9MSSmtuNNDWqW6cu92HTggwkaw8Cz1DlTnRiQ3unKHXCjTLkquzsRF2
	39yASFFTqnlOhAjVhY52mP7WfpEV8cpNpvQVRirS3I9bBeomYYci+DX5vUK0G57yf540FFUFz
X-Received: by 2002:a5d:5d03:0:b0:487:8ef:5303 with SMTP id
 ffacd0b85a97d-4871e394d18mr16926933f8f.34.1789989855856; Mon, 21 Sep 2026
 04:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87577cdb-7f1d-4a9f-8a61-ff1f272234d9@roeck-us.net> <CA+V-a8vVtjALarck6PE3it1si2hNbveZWoGjTaTUW68Q6yYjcQ@mail.gmail.com>
 <a73c5d5d-dd64-4061-83cd-0a1cdcc2db4d@roeck-us.net>
In-Reply-To: <a73c5d5d-dd64-4061-83cd-0a1cdcc2db4d@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Sep 2026 12:23:49 +0100
X-Gm-Features: AcwNN1VFoJ0rwe68Hi1fMS8HP9OtdClqcRaDuoUukIno7KtW8dqa4XMt5T_ytyQ
Message-ID: <CA+V-a8tugekX_ykWWMzVkHbEo4huviGYdJuECEfuYVZo6dY5wQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] watchdog: rzv2h: Add syscon support for WDTDCR
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Fri, Sep 18, 2026 at 6:39=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi,
>
> On 9/18/26 08:18, Lad, Prabhakar wrote:
> > Hi Guenter,
> >
> > On Thu, Sep 17, 2026 at 2:12=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, Aug 17, 2026 at 08:25:38PM +0100, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) re=
sides
> >>> in the second register region of the CPG/MSSR block. Since this
> >>> multi-function block is shared with other peripherals, it is exposed =
via a
> >>> syscon regmap interface.
> >>>
> >>> Look up the SYSC regmap using the optional "renesas,sysc" property an=
d
> >>> derive the WDTDCR offset from the watchdog instance index.
> >>>
> >>> Retain the existing MMIO-based access method when the "renesas,sysc"
> >>> property is absent to preserve compatibility with existing DT's.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >> Can I apply this patch without the other patches of the series ?
> >>
> > I posted the v5 series here addressing Sashiko's comments.
> >
>
> Sorry, I was getting confused. I somehow thought they are different serie=
s.
>
> Do you plan to send v6 to address the issues reported in v5 ?
>
Yes I do plan to post a v6.

> Note that Sashiko no longer reports pre-existing issues in public,
> so those will be out of scope.
>
Thanks for the note.

Cheers,
Prabhakar
