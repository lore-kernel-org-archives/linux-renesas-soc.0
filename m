Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068503F888C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068996; cv=none; b=rRfU2LgIdQn196EUh8sAORJtRz7Jq6KbskUieBdZmcIvHa/5vM6m9pDwv2/4wU2uuWhb+UlfzjKZ0jzcG38a3D7UN6aRyxQ5gWSG5heYByE2udEjjk02jB/eNVBaaPelF+WVGgmn468cHHHEzjCV4Sl9LXXqa6lvhl2yh9RK99M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068996; c=relaxed/simple;
	bh=zQAGAJqK01u1hsgk9tM79y+qHgIMow8bJd7VCIfEqak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lu9STeC7UyYUehxTJpqSSKOde6ZNJHXsfiLtRczrBLkvjsgtVp3C3LPqMi79wxgOOr+9gdgoEB956VJIX5vpqxWGAQLoAGXC7plohMXkNOBeJh6JPDk4kefR0ysTP5nZMFfPCrYco6EmmFuXJD4uAET2r2U2YQMEBY53ZWTRfJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-7856441f7dcso1518262137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 02:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068994; x=1790673794;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gxG2KWqjG9DQXNsqNUjR1bwSMAhv13VrmESGniF7QY0=;
        b=lsYC/f6sZ13fJ8v1lpHg8aQiypmOTCAAadXjmthbqQ0KyJempqeMYugQmkfzGB1pvo
         CAnJspznLEJs4cuHPhcKbsZbfjfZGu9V/xqI3cjaoSpsssGdfCbHqZQsSTmObFxSW7rd
         f3YPPnVcxIixWUXtMLOeiaRQBGdCxVhvidM50LaF7wb/tofKSB2wzmbuz/+8tpiv/8Ys
         /LCTa7P72+c0+FMZ5PGuuZP847VVWYPOnlFmNegejA1It8diOk0diWyb1agB3tTkvJaw
         EiBPy5smsfvgPG7oje0CS5DdxL/XpycGpSFm+0znxju2eQvfwuA6EPv/hA2zb2nOjgP5
         C/NA==
X-Forwarded-Encrypted: i=1; AKwUvBy41szE2SIL5jryOEY6SvmDFS2zf7UjqssIQ7g8S8E3cOLgEYa/IbfiETo6yRNPu1u0sNuCqg9YFBs5lKzqSUbqzg==@vger.kernel.org
X-Gm-Message-State: AFuF++l7ftXYryjEsYbBVEYSrXbGVvPDZFPdNwanA7mwE0NLjBomUf13
	Sezd73gXSt8OSQpcJ4XnwhyiVDcg7U9hiOWXtjXgSbiL253iVwY6RClNJ2ePy00J3XI=
X-Gm-Gg: AYBFou3CI9a//lECFtnphAz8bI7pWTqve50qgBb63FMZ0S5swGLHAuK6Af4OPznEMJB
	d3BxMnz0A6EkQruBvSzMm09/q7zxz+7Pi0IqfWrB4IcIs5nwy2e3lbZh0Zcarqge8qPacwVQFM/
	Nzap8ZPMHdTUsxOYbEnD1z3X6RJPvWSyZezWDM7aEFUS6ei9snJAKAN0XpFJlUcapTYZ03V0Qf0
	ipXC42ReOSqPSE3oN3XeMnSVLQy9VH/WkC6VjDoUfXEVSeHJV6ecuANnA6a1qprTwBFIbP1kXDh
	GHsXI6jDSTsKM0PivqSZGvf9mWRK09gAzzeJATKcllZukB8I5wufuGlLtH/sze86LtDi//S9u7K
	7bv8gRymmMF1bC/UeW/N1rJ0nqtHFayJXOX23qj/EFFZ0kTIx9SBFrDQzkf2HZoDrufQBKlTV51
	nq513Ja6dbK0ccUNwoVbRMrrxxFpa5YkB2iDI76HE30ClvYZcRk6HZP16neBCKN5DHu8KaNFmA1
	pBkuTfmdc/bw2OFtnTNMRQM/hsp2RB9sY4e
X-Received: by 2002:a05:6102:4245:b0:7a7:79c5:d3a7 with SMTP id ada2fe7eead31-7a779c5d50emr5125324137.12.1790068993736;
        Tue, 22 Sep 2026 02:23:13 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9850d383bacsm1138195241.2.2026.09.22.02.23.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:23:13 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-79189dbfb32so765035137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 02:23:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByFi6jJ7UarfkmEI0ZDQ9BL3L1AHOTm9zj2VDGPL2G8Qk6n3cXcSmLKAsywxkdwbVP0t5JnZPpvpZCfqS/r8V5sZQ==@vger.kernel.org
X-Received: by 2002:a05:6102:e10:b0:7a8:1817:276f with SMTP id
 ada2fe7eead31-7a8181729a3mr5004222137.37.1790068993345; Tue, 22 Sep 2026
 02:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-mb-rcar-sysc-v1-1-fb25996bb2f4@vt.edu>
In-Reply-To: <20260921-mb-rcar-sysc-v1-1-fb25996bb2f4@vt.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 11:23:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSA=firVaQ8HQ-ztKd+Em16Xj3LTfcLLk9SHBw2gCE=w@mail.gmail.com>
X-Gm-Features: AclHuK-dqoaxKnjPGxgLEKwBtvJRMWUy2-_GWvI3MviqiUfHAePyiKA8wtVLn60
Message-ID: <CAMuHMdUSA=firVaQ8HQ-ztKd+Em16Xj3LTfcLLk9SHBw2gCE=w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar-sysc: publish the external
 request mask
To: jaidevshastri@vt.edu
Cc: Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jaidev,

On Tue, 22 Sept 2026 at 03:18, Jaidev Shastri via B4 Relay
<devnull+jaidevshastri.vt.edu@kernel.org> wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
>
> rcar_sysc_pd_init() maps the SYSC registers and stores rcar_sysc_base,
> rcar_sysc_extmask_offs and rcar_sysc_extmask_val with plain stores,
> before it registers the power domains. rcar_sysc_power() tests
> rcar_sysc_extmask_val and then writes through rcar_sysc_base at that
> offset, from genpd on any CPU.
>
> Publish the mask value last with smp_store_release() and read it once
> with smp_load_acquire() in rcar_sysc_power().
>
> Found with MBCheck, a static herd7-based memory consistency checker.
>
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>

Thanks for your patch!

Have you tested it?

> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -106,15 +106,19 @@ static int rcar_sysc_power(const struct rcar_sysc_pd *pd, bool on)
>         unsigned int chan_mask = BIT(pd->chan_bit);
>         unsigned int status, k;
>         unsigned long flags;
> +       u32 extmask_val;
>         int ret;
>
>         spin_lock_irqsave(&rcar_sysc_lock, flags);

Isn't the spin_lock acquisition a sufficient barrier?

>
> +       /* Pairs with the smp_store_release() in rcar_sysc_pd_init(). */
> +       extmask_val = smp_load_acquire(&rcar_sysc_extmask_val);
> +
>         /*
>          * Mask external power requests for CPU or 3DG domains
>          */
> -       if (rcar_sysc_extmask_val) {
> -               iowrite32(rcar_sysc_extmask_val,
> +       if (extmask_val) {
> +               iowrite32(extmask_val,
>                           rcar_sysc_base + rcar_sysc_extmask_offs);
>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
