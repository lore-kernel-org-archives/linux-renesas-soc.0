Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16FC485CF2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525006; cv=none; b=W1RFDblNqA0d01YmtGLQD9eBLzpJmQajzdA4Eo9FlpDP3Yzs0tlGv+iFsTDUmyQap2fdqx4+roK4qlQxCI+w6CZa2EXQiQ0qvTkEoSGzOjsZeG3qrJLKOYWdxRoariwbo9mOD/eCKCcU4X78cu0u4pzGCp3qSG/Bmd2wdvtIIQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525006; c=relaxed/simple;
	bh=2DtpMsYpyVYksuw1OGOXVQZ0XVIysiiC9LDRS8naQq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSUuJykP6hpAXU2mdnSTRfwo81q3D4VHzR1L4FKTAxbLYgs7nXq88VaSKRFX6Ut/4Nto9wcIsch3gQUR6AYz2R4IhOY91PUoKNbih1l30VRpmWtb2aFDJie/+vChTie1lTf662/vJZay75NICoPV2Tfy0g1Nr3rl7t/qLQhRr/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-782df51b4c1so703866137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 05:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525003; x=1789129803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wBhQA37E1Xf0Mr+HPKFsdlUMfZuU0RFIBB/KUd4dqqE=;
        b=HyjYcQYPTg5eNflTJe2zUovhClG1P57xImQNwoJE5cPBCpylOQpIt947xn0Fi2t2sP
         HtWeYOK2fkbvxq1Ixwo0/wJ0emVoAvkaG5PD+GdaeYec10gbmRw1XdzkGRZCZMWDNnk5
         CoSVN5zs7mwzF626egRqDM14i1H17CQ7xprM7AHhloMR0sfAeER7xyjDtho2ARlD8wk6
         bEoQAZ+d2jAqOpK4ZTgUTkvfIvZt8E2ElcVhjmJ7FKUtCmjvEJxuS4m8Ly96RbkuUwR9
         4/OLhBe2FeoKn8UbaEa7xbumkSFFQAXSJ6l5NVh1vV287UUio7t8ICsmaVOlRpeHle0W
         9VDQ==
X-Gm-Message-State: AFuF++kcpP5SOVkyGIE5nILVtF3KfEu6RNhV0gKF0qtnZJ+CPcp4l9u0
	JAjwmLS/lJFwwCGojl06FLTr0ZxBPcgVTLyFm9cZKIDFtpHvxFmY3z5pQVI8w6jjaqU=
X-Gm-Gg: AYBFou2LuVhgXtoF4ZyQvVMmzBkh8NSWPQbFwzkZZk6okWJ6pnZ8WCM+gArOJQfM3tx
	S3H0PNEbTvpZqHQZF5yNZF/vcERT+O+9pQrXWh4efR4yf8CXRnNIH0szG+w6ddA6WLSvnh+kCW3
	Ijycf1fwDFOiKATbC+HNZ5mBiRp/uu0anYRKvNsJY2hVyTki2rIHUGcnZr83oGpfoCe4YbWWmc8
	YJiOdGKZLNllLeAIWYKZu0QxHeeg4Hz7mP6w6V0aAGaGbicqa1lHGtFRuzYhNhEanpFUIY+ibuR
	jLBZqGxNrFGOATxUICCa0b+u1lhNOOz+PcPYZ2o0BY+JOfUn9PMXuL5ZVT4QxUA5WIyi2soNnUt
	PK0NeI56Az1yauqil3S00zTuM903ZJn/vlZBYSSo2UsK6UvRf0Bnq5WtXYOyvJXm6pa8tUtXHvI
	sEEb95FxvkikORGxJChKKotNwVm6DCbF4SAZyi/yXYPMD6EVFb80jlULiU5cND0XeKCc8l8KTa+
	2FTSWbLWnYUpqfNMJGrmk5y/w==
X-Received: by 2002:a05:6102:50a1:b0:785:8f76:654d with SMTP id ada2fe7eead31-78a4aafe94dmr1757892137.13.1788525003408;
        Fri, 04 Sep 2026 05:30:03 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1f14asm1400445241.3.2026.09.04.05.30.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:30:03 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97e9c0da212so638510241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 05:30:02 -0700 (PDT)
X-Received: by 2002:a05:6102:578e:b0:778:4fe0:8297 with SMTP id
 ada2fe7eead31-78a4aa70e09mr2345087137.11.1788525002767; Fri, 04 Sep 2026
 05:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com> <20260825141542.30901-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260825141542.30901-7-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:29:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXavMv7hAnd0WHXuThGemifD8G38Tg2GwvkCjoy3_jzKA@mail.gmail.com>
X-Gm-Features: AcwNN1Uk-vpOhRjUqifYExzXweIhzAcoCntgx4xcaaEfdAuYllug8_vrtZCfUzs
Message-ID: <CAMuHMdXavMv7hAnd0WHXuThGemifD8G38Tg2GwvkCjoy3_jzKA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dmaengine: sh: rcar-dmac: fix style in struct initialization
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 25 Aug 2026 at 16:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> A new member will be added to the struct. Before that, adhere to coding
> style by using a single space when assigning values.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1998,13 +1998,13 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
>  }
>
>  static const struct rcar_dmac_of_data rcar_dmac_data = {
> -       .chan_offset_base       = 0x8000,
> -       .chan_offset_stride     = 0x80,
> +       .chan_offset_base = 0x8000,
> +       .chan_offset_stride = 0x80,
>  };
>
>  static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
> -       .chan_offset_base       = 0x0,
> -       .chan_offset_stride     = 0x1000,
> +       .chan_offset_base = 0x0,
> +       .chan_offset_stride = 0x1000,
>  };
>
>  static const struct of_device_id rcar_dmac_of_ids[] = {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that rcar_dmac_driver below has a few more violations,
which you are indeed not modifying in this series ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
