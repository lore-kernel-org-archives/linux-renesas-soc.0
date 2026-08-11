Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5FB32A3EC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457091; cv=none; b=oxnCcyLQImdiHk6ULDTJHfHeTGYSJ6BxLxSWt5scC8TS417EStMhSYFB+Ft520gBCQyzyHXUGpkmewvQwCJsPsTciUhGb5scJmxWO8VnoYgqcJ7Ra/1bOsxrBtKXyHdlG9TLVxTDtnuC9AQWG/zKqu+gWzqT46xI0F8b50RhyUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457091; c=relaxed/simple;
	bh=IDkl6vkZoeWYKZ/5wbwdWG0Gu0/ixXA1xpsExfJyeoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSC6sm4+cKujK3Ljv+zdIjx42yDMx+57aWJjzmlyXcELDCFr4JS9ilfOJMLt0PYOzwPGkYg7Xzde4xwSgJg9X8dAJ4MnuvaUnunxX/WCntA9unET1huIGA0gfoGpV3Y06jeGuzDW28llgfTLz6Wz/eib6y+kJz3tvfhLJkzXvlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97727c2064fso1959817241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 07:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457088; x=1787061888;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t25xdaJP403QlmjguUiNsQy5PNTk/hl8/kCapiHtVCQ=;
        b=NlZ1HFO+XYX6A2W5/LeokOWjbLI4RbT/K1xgc5l3vjo7vKdE+ALw85wjI16RY99l+7
         Bvbas899NNcAvmOaymOX2vYVudewIfyvgjQ60PN/Y+HXBVCdGDUTAffhpCW0flu9Ktnz
         J/T+wMvUfgYOjRcx7dQ2+azg3m7eQ3BzelWO/vq9CkY3mFbSC7EQdwmrfbPjsI7r+FjI
         7vhAWN/CMOeM+hrlR/xb4v+jppHCS40RKQ0zrWZwLHbfete7ALfmDu6X57o4ZhHi0T6x
         A6Dp7eRIYnYTbCsSum9YpEYf/Qy8rEl9Vq6ZQ+DSlzmZa+197HAjn0VXMwZbkfmTgXa9
         zFvw==
X-Gm-Message-State: AOJu0YyXsKB4Eyv8YCns95PiphDxdypXVNxsVHgHgv3o73HCrPAxQ4iI
	rLql+wUJAK0CX3opGQnTNcgDEPvVm3A9JNfx10xf/7lVrdvS5DQ/tVFL5Gujo1HF
X-Gm-Gg: AR+sD10CNl0mK6aMAE79i8TUZq5aElqAY448Sq5BMWYn9weA4AS3vnLdcVpdxIstfMM
	Y2MBZ4loMhcEIs2QKYfAaTFFumdq1XJe6TV5ZoSZ22JIkHlsAwUfl73ucpJbTE8FmbyHNMISyLi
	kgYZtl0Gqi+VzsJUliRNUNnR0/z+SadQeY0SXBJoHm/IOSKxMyBnftJABeB3Przo2S/sWtIAsx+
	DuBW+O2axmFsSolGMRQXtFKp3hhF4bThza12HgVpYCVOWRFCFm/y0L56xGC3h9doIPAHGqQe2jL
	AE90qVzQosSmuLM4tYUuQHW/VbVctPsXZ0srdLBP3k/vFPm/jWMZTRdtY6/oCd/U187x3Z6UqPe
	IYJA4btvIzvjSIneVkJDqOuk/Y/Blwo4Uh8JKSJs2YItpwJb2JhvMcrP3nt7AYWg2qFbSmXK0Yf
	TgV7y5AN+533yo4+IfmTLjVh5hbIQtjRGZy1wxNLwGWc9XevejQhCK252xo0sIXA0DQ+dBMoYwq
	MQKR3VLWfIKm8vCG/n/hYRVVA==
X-Received: by 2002:a05:6102:d8a:b0:738:6994:eb8 with SMTP id ada2fe7eead31-76b51e2f7edmr1051140137.0.1786457087677;
        Tue, 11 Aug 2026 07:04:47 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3c138a9esm6648241.3.2026.08.11.07.04.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 07:04:47 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-74d55dac06eso1539781137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 07:04:45 -0700 (PDT)
X-Received: by 2002:a05:6102:1588:b0:739:5cfb:50f6 with SMTP id
 ada2fe7eead31-76b570bd5demr1074532137.11.1786457085103; Tue, 11 Aug 2026
 07:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718182355.50045-1-wsa+renesas@sang-engineering.com> <20260718182355.50045-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260718182355.50045-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 16:04:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUv4JOPkm+2n_sC8_sQNrK_38WtW6_9fjmiByRTCi2vQ@mail.gmail.com>
X-Gm-Features: AUfX_myO1pUucKlAnrAnyjwaRxNmBxc39PeoKlPOgZ9G9aqDuugHqrrftbeyXFY
Message-ID: <CAMuHMdVUv4JOPkm+2n_sC8_sQNrK_38WtW6_9fjmiByRTCi2vQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: renesas: rcar-mfis: add hwspinlock support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

Thanks for your patch!

Any specific reason this is not CCed to the hwspinlock maintainers/list?

On Sat, 18 Jul 2026 at 20:24, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Every MFIS instance has a block of hardware spinlocks. Add support for
> them. Gen4 has only one instance, so the base_id is always 0. Gen5 has
> multiple instances, so the base_id has to be encoded in the info
> description. Also being a provider, a hwspinlock-private header needs
> to be included. Work to refactor the headers is on-going, but will need
> many preparational steps. Until then, we need to live with the special
> include.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/soc/renesas/rcar-mfis.c
> +++ b/drivers/soc/renesas/rcar-mfis.c
> @@ -59,6 +67,9 @@ struct mfis_priv {
>         /* mailbox private data */
>         struct mbox_controller mbox;
>         struct mfis_chan_priv *chan_privs;
> +
> +       /* hwspinlock private data */
> +       struct hwspinlock_device bank;

Please document this member must be last, as it contains a flexible
array, which is not obvious to the casual reader.

>  };
>
>  static u32 mfis_read(struct mfis_reg *mreg, unsigned int reg)
> @@ -86,6 +97,39 @@ static void mfis_write(struct mfis_reg *mreg, u32 reg, u32 val)
>         raw_spin_unlock_irqrestore(&priv->unprotect_lock, flags);
>  }
>
> +/********************************************************
> + *                     HW Spinlocks                    *
> + ********************************************************/
> +
> +#define MFISLCKR8_CH_OFS (MFISLCKR8 - 8 * sizeof(u32))
> +#define hwlock_to_local_id(hwlock) ((hwlock) - &(hwlock)->bank->lock[0])

Perhaps move this to drivers/hwspinlock/hwspinlock_internal.h
for general use, and use it in the existing hwlock_to_id()?

Or else, open-code "hwlock_to_id(lock) - hwlock->bank->base_id" below?

> +
> +static int rcar_mfis_hwsp_trylock(struct hwspinlock *lock)
> +{
> +       struct mfis_priv *priv = lock->priv;
> +       int id = hwlock_to_local_id(lock);
> +       u32 val, reg;
> +
> +       reg = id * sizeof(u32) + (id < 8 ? MFISLCKR0 : MFISLCKR8_CH_OFS);
> +       val = mfis_read(&priv->common_reg, reg);
> +       return !val;
> +}
> +
> +static void rcar_mfis_hwsp_unlock(struct hwspinlock *lock)
> +{
> +       struct mfis_priv *priv = lock->priv;
> +       int id = hwlock_to_local_id(lock);
> +       u32 reg;
> +
> +       reg = id * sizeof(u32) + (id < 8 ? MFISLCKR0 : MFISLCKR8_CH_OFS);
> +       mfis_write(&priv->common_reg, reg, 0);
> +}

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
