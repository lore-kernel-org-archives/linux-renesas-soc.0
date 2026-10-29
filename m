Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264923;
	b=FGXw3PSQik2ewtA/aDQC9GC0TOIag/7RGndneJjlgGo1qBrejwws1IC7YmQPBi9Aa3zE
	 K9toNm68rNXSG8Vy7TJwHht6fZS5tT8KlagzssMvA7edHZ5X1zZDAvYrk8QFlRnZw6gTI
	 rO8E6scNLJlUgSxoy+AdEQp3Aac/Thau49Wv14CgUOLWBRwmqv8VgOuaWWAgHKUSvAh3t
	 5mSG+cs5Ga4V7YkDqWiGLmRr+pOLTllP1Lde+EjrHmSADFwYZbyDZzVkMOBgUyvqKPTXL
	 yqDIOdciA6rb/dEWYuj54sxNJ0xs0KiRYnSy9UFrszWLjTZAvOD2xG3dEodoYnfAecA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264923;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZlsJgsuUxLshKsbZ0JGTcZhiSxa4IqXzGzYrO+oYcmo=;
	b=cIWz/KWG2FsTIrqGvo9oSebPSb7KF5L8+3Z6ryfJ6c1DxaWgMS34t1Rj8Ob9lqn8THkw
	 BkzYyl0jxZugJj0XaUIBwVWkQB8a1AhbyzvBoUPb5fZLaaE5ld6Bm+3eg8bXWiUctFBqy
	 MuFPWKrGsjWQy1W/YaDshiYmjhORcZ6hz71z+2P6dy3sFd4hZWNWWEzWk94XW3811m1ab
	 evm96ZlCywiyA768glwJJH0KpYDN4Lu+ZeWKC0dJGye1DAm+FSel/DoFzeAHtWBT4JiXa
	 8NA7oOc9lRh8G4MQjoQjWwzbmdgsM8SSZ/JjNwB4YsLJ1Ufk1Q7US1P+d2sGAI001PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE4F606A320
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 09:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE4F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eac3b6b2ceso447314e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 02:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264922; x=1793869722;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZlsJgsuUxLshKsbZ0JGTcZhiSxa4IqXzGzYrO+oYcmo=;
        b=YQ6UTNTXGrU82pA++ZJ4FE4oiRdiTxIGvXHy2b8ofL1Fc591vYmstd3GR24dj+2Rr3
         R3DwLbxTWYvsR/Ax5Tgfp5MLKOQGetnBqUwxDoOvRfJOA0Js+r1xWGvtXVoAeNILNVSK
         bqzFcMs4u7TZZ1tBE7jjEEWy/fqpQvWGkd/kCZemD6eeRdPsY261+VdnkiQtQfLiKqLh
         K5j55sTN7WotCTXOAP+lKFW4CZ0NaxXFtrR1InH6xE8c4AmV0GRCbUPg63lPpYHkuNf7
         lk2NDoncEstiXTUpiGA4sju50fxkw+P14O7p5calQ9cK7HPFmzV+YrRwy2YNR5B4HwHt
         YkkA==
X-Forwarded-Encrypted: i=1; AKwUvBwE+8ZhKd0pD+LBWmpPtRdazFaSYJsAEnVAk1TRcSnJrHDw0M4vWrC1tDqtREq532k4qtJ6KvjCXeQF79Ugaqct8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJOmyVjO7DfkNYv+Gc/cyRzuKM9WjA+NLN1Ei8oHNsJoSxbzO8K
	SrbFFLCIKg6JDX5vH5yhqvRgNpKjnDyqgzlm8h8dP0oPu9uNlCmHFSs1FL4DYPb7
X-Gm-Gg: AYBFou1dbUIONq4yFufE1XsT8HqBkosX+ceiXwEAb2CArfWSomSy8xlycJBnb0/fAw1
	IWqT/+1UD6j5UFX8Yi05hw1LDkqTsLYhTqHfyqzfn2nUMxQfs+BsW04kBJbN4BtpXZMZ/3HdvUH
	NKxfj15tKNASUKAw6l/7NOBSugf+Qj0WPEFhOlTdzawac7hTkVZDEdxlvUuMoUNJver258MY9fW
	ldA+I3cNP2sDMZdbPUmfjaVSvpsH9/Tfq8wiaNeXLy+WHIOPaLoYjhOBC4d4pj8mWr/11Yv4tgB
	4N7psrXfxq2eHdCvvtaaVPIJldX3d+SPsy4Ed6K5ZieOwtQ8HZ3x6453SH+nV3JUTyDrxc87AVh
	s9KIMjn2y/n8jkjyzU5Kk40Br6NXvj/DS7xDSpxWFbSoi+MYC/6RewPosZA0Q/kS/VsZZTNWX+T
	W2kkApvDSpluVNR4+mS+hgAPeEV6y+D2Q/0pLTZDJxgNqEvkCewhET/4eCNj70WTfMZNVkv1HgS
	F+xj6bIewwSFZQ7zRg7jD0igcu0aQ9pAqoDfkS++O9emY1f4yxGS6/4lyzbllIMHJtUo0lH9RKW
	uOeLqipMSL1EURLEJeDPFzVUyqUXHvq6Q9VEXOiAh7ZqTjCDhgkoVsWDCs1L9SmxD4PK
X-Received: by 2002:a05:6122:ca3:b0:5ec:3e18:a88f with SMTP id 71dfb90a1353d-5ec4ccf75d3mr2813508e0c.23.1793264921705;
        Thu, 29 Oct 2026 02:08:41 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f93a492sm4728097e0c.11.2026.10.29.02.08.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:08:41 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9908e3cd939so561883241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 02:08:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwfPTEiG4uLrY3Wih2jMH7KERzT0ktZvBtB43ZII7z3I0FS++D7569IZ2wE5oHwQ0YBwV6wNoVNKxgeRpxb17Cgqg==@vger.kernel.org
X-Received: by 2002:a05:6102:8357:10b0:7cd:3218:362e with SMTP id
 ada2fe7eead31-7d03a5d6043mr1694600137.29.1793264920555; Thu, 29 Oct 2026
 02:08:40 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793026273.git.geert+renesas@glider.be> <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
 <20261028132937.GL15441@killaraus.ideasonboard.com> <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
 <20261028163940.GA2673734@killaraus.ideasonboard.com>
In-Reply-To: <20261028163940.GA2673734@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Oct 2026 10:08:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOT+DTZum525kmYfP+jzzPrxMnEeRAkapxOMGz4XMHBA@mail.gmail.com>
X-Gm-Features: AclHuK9-UV4UizkhZLPxSnm2gBMXfy5lUX6jKfLRdtUVdpASkFCmlMNEyTp9nPg
Message-ID: <CAMuHMdVOT+DTZum525kmYfP+jzzPrxMnEeRAkapxOMGz4XMHBA@mail.gmail.com>
Subject: Re: [PATCH 07/11] dt-bindings: clock: renesas,r8a78000-cpg: Add PWM clocks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Wed, 28 Oct 2026 at 17:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Oct 28, 2026 at 03:43:42PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart wrote:
> > > On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > > > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> > > >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> > > >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > > > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > @@ -28,5 +28,8 @@
> > > >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> > > >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> > > >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > > > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > > > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
> > >
> > > Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> > > R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> > > dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> > > R8A78000_CPG_SGD16_PERW_BUS, as well as
> > > R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.
> >
> > I could add them, but do you have any need to refer to them from DT?
> > So far I only added clocks that are listed as clock supplies of on-SoC
> > modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
> > Timer Unit (TMU)).
>
> So we have two conflicting goals here. One of them is to only add clocks
> that we have validated to exist (and ideally work as documented). The
> other is to keep renesas,r8a78000-cpg.h readable. We won't be able to
> satisfy them both fully.
>
> I think we previously discussed adding whole groups of dividers in one
> go, as some sort of middle-ground approach. Those are clocks that are

That is what did in this and the previous patch: we need
  - R8A78000_CPG_SGASYNCDn_PERW_MAIN for n=16, and added the one for
    n=8, too.
  - R8A78000_CPG_SCPBUSDn_SCP_MAIN for n=16, and added the ones for
    n=1,2,4,6,8,32, too.
  - R8A78000_CPG_S0Dn_PERE_MAIN for n=24, and added the ones for
    n=1,2,3,4,8, too.
  - R8A78000_CPG_SGDn_PERW_BUS for n=32, and added the ones for n=8,
    too.

I did not includes clocks with values for n that exist according to
the documentation, but are not used as suppliers for modules.
Of course the documentation may be incorrect or incomplete, and we may
need to add them later. As IDs are ABI and the list is append-only,
they must be added at the end, which could indeed lead to not all
clocks of the same group being located together.  From an ABI point
of view that is OK, but from a human-readability point of view it is
indeed suboptimal.

Before, we tended to add all clocks from the clock tables listed the
documentation upfront, ignoring clocks that are clearly internal-only.
Some of them turned out not to exist later.
Some new clocks had to be added when the documentation was updated.
Nothing new here, except that the list of clocks on R-Car X5H is an
order of magnitude longer.

Note that we don't use a linear array of clocks indexed by clock ID
in the R-Car X5H CPG driver (yet), so large holes of unused clocks do
not hurt (they do hurt in the SCMI driver ;-)

> not directly controllable. There's a risk of adding clocks that don't

FTR, the xDn clocks are not directly controllable; clocks like
R8A78000_CPG_MSO_SCP_MAIN are.  We know the latter exist, as they
are used.

> exist, or clocks that we won't need to reference from DT (because
> they're only used as parents of the MDLC-controlled module clock). Do

The direct parent of an MDLC-controlled module clock should be in DT.
Higher-up parents should not be needed iff the SCMI firmware exposed
and/or implements the proper clock hierarchy (which it does not at
the moment).  Still, they can be internal enum, starting after the last
DT clock, like we did in other R-Car clock drivers.

> you think that's an issue, could it cause ABI problems in the future ?

An ABI problem appears only when you refer in DT to a clock that does
not exist in hardware.  This should be caught by testing before the
DT user is added.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
