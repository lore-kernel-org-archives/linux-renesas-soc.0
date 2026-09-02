Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2DD30D3F6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332739; cv=none; b=ID/dkhkfj6ELeLyfIP+UIrzcC+z4IdIDJi2cBNLcBENwClKQyQTPk/xbPsRu84K52H0w9SPjoHC5Al049drDUBkX8d9+ETwI1ENn3odfv4B/VeR2qqgjGvgmNoK7a0b5EdUsXV05TtiqKA1NYxG60wmKK7l2CgO1wEu3aGlG3Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332739; c=relaxed/simple;
	bh=fzDpYNuECOcmrly29xrZFaME995vWnsllDCrIFhx8dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+FRpmbeMM5ydvfBROAYR8gtP5RltVCuZR1LGxqDOSDfAOH66FVUw1jJiVAdKmwjYjzxzOvYc6hdmfSbeQfEoegXf37NXlsmhUvHi1Frv+REiRA6klv0U3Zsn4fi24+8+TuWb0VyIsAFrjn8OA6HHUfAdhl2vpfprzA0NO6rfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c65d654c23so301220e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 00:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332736; x=1788937536;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=34YhfY3hqkRc1EY3EtPWnzhtL96VmHVIc4hAuYVzERo=;
        b=R0eeSjq2w+/SNEPzgJhwh/HuJehojXH6WM84h9hHipY9cKy0QyILAiwFii/PHc6h8v
         p4CRfLM1Ie0nMUxRo/bVqceaaVpKcZUxzTd5Jceg6ANO0ijFg/6Hg2xGYYe7cTPsZs3z
         NYox4v/GbAJvuKt6FAOB1foYItu++lbn4zQZ73wWrjMgHvMUqtnRlL8MyqoTSxKkF6nG
         RTo8s838vKRv/o7x7Tfd3ZfPHDkc+0f1eEpHRKAPTwbTf6vi/hH0Y42dTfAHMICNLdHF
         B+8dwKkkaQkCxGWKvRZQZ9LUX4EKak6ho3Rj5CW9iM04mJ/9R9oOwjaD63se5dJAhomC
         sEfA==
X-Forwarded-Encrypted: i=1; AKwUvByTsmabpD52IvFvNMpGPOsjY4PQTjO3k+pBau8gNMXnypb4tRed1sSB0Ut45VDG7audkhVHftx9dcEXPPkZNhyaNA==@vger.kernel.org
X-Gm-Message-State: AFuF++nhUz7NKnNddI2IenaI1QhvY82MkOz0+fMHgjghVcIVYBNT4HyM
	bh36Evxap/c8mLIGslGI9PQAXbZRvsWbGMqIiRdEZslYE1YePNMPB5QbTdc/8hCQ
X-Gm-Gg: AYBFou1Qg1E19BEH26yzgW61bMzff7rfQSEzjyTXo305zk5JQStU5/yfOxprhZih1mt
	dwC80yaI1Rgd14SnQx4/DLI8/LXldvElz7WvuGbu6Gs8OabO5GZhmetdN9+vrjXuo5DFNVRM1Ro
	r9J8STs7QU6v4ryxF5fIj/5BRpSt7wLIVaZ2IrD1E78Zkxw5fb8Jx1nw4dAlrGhCDQzXbgRmkIi
	/bP9oJy79u2F455oLGLxyk5+Ngp/qmlSuXquDhSz5RKA2AU+9q2jma9rL2BPZoWyV3ZYPl0l3eF
	2CJ7eTWIM9zc6WWxadbp7mN4CZobWYmTBfmne2NuIS8QKy4pawNrBsEH6gR+Qn003SQ34BPs8Fw
	TjopBtRMRPmREuz2aZvW2aIqt24wpVmvQ3Dna4B25g5i6qgpwWme2qw2hTvj6l+mSZI045P3gIu
	ypZLbMjn4QfvsynT9O0xxJ+9JjqGeIAh5qLvqMuBTJH/KV8/AUsKWlYogTG3WdqBqr8ywb8xo4p
	77w3wZ7F9s03pyrTDjWj/dw7Q==
X-Received: by 2002:a05:6122:3284:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c7d23a6cf7mr1053204e0c.0.1788332735843;
        Wed, 02 Sep 2026 00:05:35 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980673c778bsm1635336241.8.2026.09.02.00.05.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:05:35 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so250983241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 00:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZ93bg074fOi3PSrLWhsWwhQbgX4vnJzvvMIuP9tfVf/+F7eELZn62Agh18xZ5A3lBPvUvnLxlZSz/QZFX4rDULA==@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-78a1f1f13e9mr820442137.4.1788332734870; Wed, 02 Sep 2026
 00:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-rzn1-miic-fix-array-v2-0-3e907049e770@reliablecontrols.com>
 <20260901-rzn1-miic-fix-array-v2-1-3e907049e770@reliablecontrols.com>
In-Reply-To: <20260901-rzn1-miic-fix-array-v2-1-3e907049e770@reliablecontrols.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 09:05:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVs4Y+=_Q72QwdHbO=V_Y_-wS2vMzX=Qw5RYoZeXYT94w@mail.gmail.com>
X-Gm-Features: AcwNN1VbxvsNj-N5m50LAojrEK604jhD7foSU4OSV3X2c4XmawrkeMppBtuO5-Q
Message-ID: <CAMuHMdVs4Y+=_Q72QwdHbO=V_Y_-wS2vMzX=Qw5RYoZeXYT94w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: pcs: rzn1-miic: Fix config array initialization
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Kyle,

CC Prabhakar

On Tue, 1 Sept 2026 at 17:53, Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Fix memset parameters to initialize the entire DT value array
>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Thanks for your patch!

You forgot to add
Fixes: f39e968dc168a7bd ("net: pcs: rzn1-miic: Move configuration data
to SoC-specific struct")
as requested in my review of v1.

> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -683,7 +683,7 @@ static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
>         if (!dt_val)
>                 return -ENOMEM;
>
> -       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val));
> +       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val) * miic->of_data->conf_conv_count);
>
>         if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf) == 0)
>                 dt_val[0] = conf;
>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
