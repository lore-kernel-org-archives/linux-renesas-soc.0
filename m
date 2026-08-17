Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FB143CED7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978692; cv=pass; b=k9GwcWe3jHJd0aLKaKy7vJA4kI4HY8WIa0uYtyAus31+HSGm7xjek0NuS/yaLzCTzbTn8eLK5TbZxyMHpyYHb0Qx+JEaig/HxrnRhgVAnzUkvwvX/sxbshS+aRGkSXBRI4UY5qD93Kui9DULAoLTsonHRMLTmkCbX4ZMwkWbakE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978692; c=relaxed/simple;
	bh=gIi+I19Q7XnPhr3NypbxThTLH682pcRQjzGXRDJm87Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gN8dkEgJPD47nglutFSx+l7eyI+KQicrsqhDP8XQKv2E5RcHB2AoMR50Z1A93+F+4EMGg3IvbWfvBX076Stilsu5diS2zBX8sJfAJpN7kMC8czAeNRr2gZgwOGAye1Q2BtPmPvJTZmTat+wNy9xb8dNkDxvn4qaNKYFN1MWs+xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np0TILjm; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np0TILjm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49954b88fffso39987365e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 07:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786978689; cv=none;
        d=google.com; s=arc-20260327;
        b=X0mnzOvTGXk/1/5QjJfwR2XR0qKNxQUQQZwQbd7apjjGTkwHr7O84w/YPYHFoLGVFa
         sopLI1jalVDk2dS6gnabIjG2Q5RRLkUh2+qcep2I+d81Jm6PId+5Kn8Yr1vI/tqIVNH6
         xsRQGGrvqYbNGunFQNWSI3MkfO25+esfv/rCsD/315eIgakhGzcHIlOUqZO1ktJGXxGj
         nLjPAr4dSiAsz4sCMwyDlE9IjfqVUw+gxtD18DeZuIcrUb66CXiO4QbjAaynw2zCTR/5
         re20bhegLX6BautvLSRUHKy0FjM7ZeTSfctFbD0iXhS5yjE044CJH6N+rUYZvVFGuBp9
         2AIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yg844Qi5SZrdGikIefqLd2LapEU10ih29HLHILYEwIM=;
        fh=Mrz4KXJx+26janTiifl0cBITdEdPc3wzTj/pHvHz3rw=;
        b=l5IPvQ8OvpnjZWJYX2mt119iszeXehkLtrNSvdAGC3hhEPvc/Ozhmvuw+D2l2ewTkO
         tOg/xLiBtVnZuYkDpMOt2k9NPHVfqyEmDi3MJDhaizisNHmkLjLPFT/zrOIoREy9n4vI
         k2hbDzdh+C6ah8MYbKon13SIAJonO95ZDpdRJs0bPoavAyV+k0PpgndyI962+tju5MSi
         LvJD+5kuLEfxPe04VZowikJUNxrTpRl0YAGQPuXcr7YJr+oSI6jB5l2dA6jNlegHMb3b
         ASGSlm/m7KXISqnP/2K+7EldWKkdno/cwCLsHQOqZ89kJKAq0FRRrmq9KezTW9XExzXe
         zqAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786978689; x=1787583489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yg844Qi5SZrdGikIefqLd2LapEU10ih29HLHILYEwIM=;
        b=Np0TILjm50tJQ2QuLvbdcOBxS+9qO9LaueKKKurxu+/yPGBSN8ubmmD7NxH32RgpKV
         CLYk1zUatYr2q0fplDYhIO1cLQ2aHzJkSAbYkvwbdGmXvp6Jr8MA5zWa/QoEbdUfR14l
         XMRuounhRFFWZyVb1YBov8G3PrWo62/jkbWwoY7fNp5VDJqSgiECQzdfUqr6h3BKubT1
         ThrZ71iJUHz6zfE1LmuzIiB3Qd4KOzq9HnJAe2EqavwLlzAJ4zOokrs2c+i3Lsso+v8O
         KlFu0P5TGLnV2bx9KAIScmSw3i7fo1bUePx9nzUNyEPpKo8m7d0aEb2VMnWumSS435Xh
         5mEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786978689; x=1787583489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg844Qi5SZrdGikIefqLd2LapEU10ih29HLHILYEwIM=;
        b=NsIHg0IJyQ4uhPmRt6/UT8jw+qB081s1xm8YyCbPbQwysbmul3kvMkVHnsuRXFmNVW
         +CUNFSd0MdMSA2KAtfEV8yGuc2blaqhwOp9HpY9k9HGkpy2uBspbkiinQP08y4MZu7j/
         H348R8r7EMevKgADxpmkm/nr45LrD5nq/52nkOtRJ21wtXPTVFVDXMoKrn9L9y9jsqkE
         aGdyKxtlrBcIXjBQHwPOOhnZELFLibln7PZDn5fb4w6EEWiwZaefZL9JXlsmOnwRAaGW
         Gjkkt+en/N04m/Nl6GBxKLH232HWJ3UHUwu6j0dSz8Q6pgxDqGg9P27KP0IZpalIf1ws
         DhiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpACZfAF8jzx/f3Ai0UYrzFMWtu8RXG+ZZAARm6pFY20D3NdskFq6lWS0aKpLYX3tvj9FfMmtM1kmm/JDYPn6VxBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8qHNVYAK+rnS56AuYgJm7mCXckCZfEsf6XHKQfGwOp2V9N/l/
	tIb1tNLgMztdE0b1xOYfpWJIzAwbnkRBjA+fqh/vQ1CsOdoEF3tL4fuUb4lOvPWfaaTsdqNsPs9
	EwifBhxNYf+BGyKieSnm0yDDNtyxcxUGHMVlT
X-Gm-Gg: AR+sD10VQUIoFuisoPzlyLo/OonBTCv4KCZLIgz23PfQ+gtpQWhnpZSxc0NnKA2GzxM
	EMMgacZQLapu6Pf3VyU1wPeDu5opVBWwtPmCC6kfgJ88KTz3BJALJg7ueGpqgprS9V9kYWme8U6
	sQi5XmNPxdwryh0PtWD+JzWvTdTRtPv0pT9RN6EYZLw0gSlDXl+eBc9Hj/BiyRpgnTtKliD4KZf
	jXBzUV75zOglZOvT6mRvdFI3nokn6/W4L0jsvX5t9tiHdO9dUMTHQox9NEqRgpLg9NpYGsGFfYb
	G7K3PGAOT+iKjN0tpZOzLrQLyJGFGVX1YJRo5Fqzrvx0SZXU9cM5H4CNrMCIp/HZaUrGXKmw/wJ
	dohqVe8VX7aIXPnWXgKBmX0XGZDO12wS873r393k8wd4Gx/QpgSJJ+xQFuSjMGIFM
X-Received: by 2002:a05:600c:c165:b0:499:4892:d022 with SMTP id
 5b1f17b1804b1-4998795bca6mr451259735e9.8.1786978688439; Mon, 17 Aug 2026
 07:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260814191415.2110732-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVKy1QOh6vBGf8xFGTw0c_htgF8JYA-VnDH=muL1G03EA@mail.gmail.com>
In-Reply-To: <CAMuHMdVKy1QOh6vBGf8xFGTw0c_htgF8JYA-VnDH=muL1G03EA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 17 Aug 2026 15:57:41 +0100
X-Gm-Features: AcwNN1XxcpNUj11e1rVVokPqDeZDP7fjvNUGfNBKKU3O8MMkJSpQ_tZbFi19yCE
Message-ID: <CA+V-a8uBo=A40LRYgO47OMwaiT-U9EUXaEbHRxw_hgW+wn1E9w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] watchdog: rzv2h_wdt: Propagate WDTDCR access errors
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Aug 17, 2026 at 10:46=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 14 Aug 2026 at 21:15, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The WDTDCR helpers currently access the register directly using
> > `readl()`/`writel()` and therefore cannot report failures to their call=
ers.
> > WDTDCR is located in a shared syscon region and will be accessed throug=
h
> > regmap in a subsequent change, where register accesses can fail.
> >
> > Make `rzt2h_wdt_wdtdcr_count_start()` and `rzt2h_wdt_wdtdcr_count_stop(=
)`
> > return an error so their callers can propagate failures.
> >
> > Handle these errors in the watchdog start, stop and restart paths and
> > unwind resources acquired before the WDTDCR access. In particular, rest=
ore
> > the reset and clock state and release the runtime PM reference as
> > appropriate when an access fails.
> >
> > The helpers still return zero with the current `readl()`/`writel()`
> > implementation, so this change does not alter the driver's behaviour by
> > itself. It prepares the error handling required for the subsequent regm=
ap
> > conversion of WDTDCR access.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - New patch, split from v2 patch #1 to make thing easier to review.
>
> Thanks for the update!
>
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> > @@ -234,8 +250,19 @@ static int rzv2h_wdt_restart(struct watchdog_devic=
e *wdev,
> >         rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
> >                         WDTCR_RPES_75 | WDTCR_TOPS_1024);
> >
> > -       if (priv->of_data->wdtdcr)
> > -               rzt2h_wdt_wdtdcr_count_start(priv);
> > +       if (priv->of_data->wdtdcr) {
> > +               ret =3D rzt2h_wdt_wdtdcr_count_start(priv);
> > +               if (ret) {
> > +                       if (!active) {
> > +                               reset_control_assert(priv->rstc);
> > +                               clk_disable(priv->oscclk);
> > +                               clk_disable(priv->pclk);
> > +                       } else {
> > +                               reset_control_reset(priv->rstc);
> > +                       }
>
> FTR, this else-branch is also new in v3.
>
Thanks for pointing that out.

Cheers,
Prabhakar

> > +                       return ret;
> > +               }
> > +       }
> >
> >         rzv2h_wdt_ping(wdev);
> >
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
