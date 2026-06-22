Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81EB399892
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135007; cv=none; b=qs1dzj2cqi8G0JsIMZrFiUYZl9oOrXWc+3pUwHxU/3fEM+xlyVe9rGOQdy1kD97oA6lp94gd8JWuR+j6M7ws/KUm0Pmgufw1qgqZGHeV02+mycLAZo8K/s+yzHydDSnziYEVUh9xKMEyeNhe/9xAZq7ClD1igBaRixh+wgWFb+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135007; c=relaxed/simple;
	bh=RB/U9/SqXO4toFyXQ7ljED/ZYf6SNtmo00cb3STVjcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXfmxSRA73yO2fQok3/Xz1B/BDdZDI7i0PYb1jyDVo0p6JWgrEqKh2Iz7+CfLeEd9J+KSWxWzSqRotYRMfndBwrMb02shWM1o+ovI+jT7Guk63li0J4SY9DItfNwohLhnvLAJhXzmq0i/gOzd4UoxJ+JN3UPDPDSDUPZWLurRiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6977dc206afso3719223a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135004; x=1782739804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLj3JU4PUcmcPvY1doGuWfaGgGmqLxqiegHMVeBGupc=;
        b=aN5ukKwrmhx20ZZa0UOOBvDQon+BXFvNryX+1UXh8h8TDDNKVhFvmzpSfYhr8SGbXl
         pafPIJao/NaDQZi27HOMu1Z/dkeCuHCIu+PZqnGtOQI77LQcbdlWTPKNliHIqZV/abwf
         s147B3U+uAZa0IP4WOzxdcv3QEOKDh50RHCBX61kz5fCAX6Qa8tAU4TuKEFiosWfWFFu
         ISehsm4/F9KdFD3PddLOBAA1lYx5seyJkVg1bBjFG90a3pGiz8zlWzR8GlzIz3ntXgxD
         IxKgaBHSwLrFdspUlXpYl4dVKnSWRPH5KtCa7zyfd+Xoc6xfRQvJe8DtDvh/S8Xsheg4
         LHog==
X-Forwarded-Encrypted: i=1; AFNElJ9UiCOyIYRhfw0v/042zI63s8l+FJ1IRI/EsVUmcKjE9l+FTipC2LEmTWcFB3VygVMfwJ9759GcypTKcjVlcccXRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMe6SXyyh6Ud8Hu03uWJIaEt7Nz+VpSRsMc1mrUe/DlxVgy9k7
	5BVwRgT8pvC19syk1LRho7b/ecxV7wvX102zNv27CPQRDEPWcu7IudIYAgOhsca63ng=
X-Gm-Gg: AfdE7ckuUMP98jvhbfYHND6bD7t1x9UtkLZQoJ0umHN5jOOzWNFvf3DN1FmJznc/xn6
	YHlCYttSnMPmxYdTedBNHb5ZR05Or6QOuLihm9w7e2LIQHCr6OxEcPt7LlW+5Bjv5OPBcTpJ7uv
	ySeyTQsxYujHJJhbFu7EcpaD0P8tPHemrmZZFW+5a7+zEhczqo5532NiiNevl9+bA6gylakOoeY
	zCd6wd40XtOaXKGkGoRrSMYMdQstwAHwM1mzGCKDdTqkrKXXDBGMzUy5EAHfzzKnma87IVsmTE5
	XZf8XImMoSYKCDhVhjhEi/tOp1iARAcRKXkITw1IxqYNwrFFdDyuYoACHrvULc0jWRa5QxIyu1o
	An5F5bBuFDixg+X7YlGi0/n2EZGu5NnbaBxHCbUvqFmQKWBX0yy98KW0RixbEi8/XALsWOwIRsH
	0uEzh4seUaEkVFNaj6KmmprLJ4PBtiUc7mCrQWp3Dwp/VUlwBKxA==
X-Received: by 2002:a05:6402:43c4:b0:695:572a:7aa8 with SMTP id 4fb4d7f45d1cf-696e5104ed3mr6253958a12.20.1782135004223;
        Mon, 22 Jun 2026 06:30:04 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b84eda2sm3208659a12.9.2026.06.22.06.30.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:30:03 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c07a6527453so615639466b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:30:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8NlzrGcEc0uQzP7sB5icKx73e8e6DpCEOvM2A1OeMqzHFcFfaedDhxdI3r2uJq0nlJ2GidWpn0NVw0eEJyLacCSw==@vger.kernel.org
X-Received: by 2002:a17:907:9d17:b0:c0d:2bb6:26cb with SMTP id
 a640c23a62f3a-c0d2bb629cemr396196266b.15.1782135002916; Mon, 22 Jun 2026
 06:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com>
 <20260619083951.3777556-2-john.madieu.xa@bp.renesas.com> <CAMuHMdVVm8CjeBthANW7BCJ2+4jByCfVamwe-NGPb1YzZQy_bg@mail.gmail.com>
In-Reply-To: <CAMuHMdVVm8CjeBthANW7BCJ2+4jByCfVamwe-NGPb1YzZQy_bg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:29:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_4nHapRC6Pno5EErpfWUkx=qq9pttqmwcePF+SRNAhw@mail.gmail.com>
X-Gm-Features: AVVi8Cfx65bGnizwOElRTBPHTkl7a9_9NO5GiORsLyjcgM_By7PVjIynR8HUnPg
Message-ID: <CAMuHMdW_4nHapRC6Pno5EErpfWUkx=qq9pttqmwcePF+SRNAhw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jun 2026 at 12:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 19 Jun 2026 at 10:40, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > Add the snd_rzg3e node for the RZ/G3E SoC with all sub-components:
> >
> > - SSI (Serial Sound Interface) units 0-9
> > - SSIU (Serial Sound Interface Unit) units 0-27
> > - SRC (Sample Rate Converter) units 0-9
> > - CTU (Channel Transfer Unit) units 0-7
> > - DVC (Digital Volume Control) units 0-1
> > - MIX (Mixer) units 0-1
> >
> > Sub-node names follow the new RZ/G3E sound binding: unprefixed
> > 'ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu' wrapper nodes instead of
> > the legacy 'rcar_sound,xxx' R-Car prefix.
> >
> > Wire up all 5 DMA controllers (dmac0-dmac4) for each audio sub-node
> > with repeated channel names, so that the DMA core can pick the first
> > available controller.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >
> > Chqnges:
> >
> > v6: No changes.
>
> So same stylistic issues as v5.
> No need to resend just for this (every resend consumes review time on
> my side), I may fix it while applying.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3 with the style issues fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
