Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3BC340280
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111916; cv=none; b=lnwRgH7vjZSXzj7J0Vv35cvZ1jpRNE/Hf21vatiCd+I5smzXgw8RzpSs3Es82jXH6lhH0fxxGxt90wfCFxCC9AAEbcIcDOO4GXN7jMqFOLk90UgmcB1WJZpzV63xUYX6sFDIpUDBJu0Yaiir0UPK8YkhTbQKMt5pX4C19/4L10E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111916; c=relaxed/simple;
	bh=Zgj3hmmN4RJTUHeqodOvvqBbgK64KObjiy/88Ye9B3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3EqQXEpJ9jPrUlv/AfoIrcz+sqT4b1WY/0wWXr08DTMyyXxE0BMqMCItcatHR/8kwvyWfqwiRQNB8K1HptHfU3rAwKhIJcE+tMQPUEUhAG2SiwxH7Ifrxs+omqPDYA6XkCmqWmvcfYqtXmHi7aTdRrjH/9hbZ6rKH4E8Ku6Ccg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74aa416ebb1so815875137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 07:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786111911; x=1786716711;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n3dGYtb3QqmWiAluGhMmPx3EXlypfz3It7NYq8RuA6E=;
        b=QKyAJLE5mysp+XZGRLDHnIEGO/r4e2YaSUnjqLa3gPUQxphtKk76obZlEVnqpIa4/m
         ZmXYD9mAaUdQnMgRMs6EB/1IB5zcvZqDxXcAVYQs/tFHvq5PHgpEg1tNloUVd7YSWf8j
         36ug22Elp/jBHZMAUasY6kj2+Imt3uXLqBHkO9/J5A++nHCwTJoO4B/pr3QRPqYHBNiw
         CmaPImthLEChjgUukC8HE6U5JgcxjhJ+VsaUW5++WUaWoVOaaXloh6FR+PgZo2ukdtvd
         xqgKBZGtWJk5e3rq9UtrpEh1aNQwtUE4L1ySEXZJw8cec9BLFNskxmPy6lvmFtBnsBQl
         ihvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpx4ULM/zrOfUc6JzdTsTrBCp1U28BvapD/FMYIMo9h0LMJAqR9DMifo+qN0qw8htgCILhsKmy3Ej1HCOQjSWYEgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfdXHurJXmRPQRpPTcoIm8YpJy0jEEk3SNcFFqpqfUIcUc/R6/
	j2X74O2m9EkKMJt/KNvHphpcpOVKdoIKKWeMV2t2A6TR6oG29yrqQPi4zKVNnKM8
X-Gm-Gg: AR+sD12PsTGpVwShlNb6PmQs37czJEu486b0MEn3XT1VebIiDMdahIW5/VNfds6ezK4
	8hdfVwTExmKhsvjDBhWxWX9Z1M7g9s/ZlAk75gI4dKaYigexDuqgSJwLl6w7BtmcOiPsyGdEcwO
	tZ42ndsUKebfxVJkihhnOUclKpmucLLTAZ7d0PE5cemfWs2azmaYHj3Vriz/9JmccOB2qgRJHks
	uJ7h2tFZW/ZMLbvf1ZfWrVeqOZwiPCue1nObkBWSJqoY9i0lTHr5NCm1xrksEtYB3MHMSHdzvIq
	/6OStheAmdLslNWQBc/P5U51RcbwnsYLW5JvRnUlLylZbcU7L5gB/+ITv3OF5PAP7OuD/+j9NqZ
	C3hL4NLMN/0wdRi+SR+obkYNtTv4EQYDA69hOq9z6KYtCFp8iWQXtcUYwOg3jxOGSOYYuLx5pdI
	+nz6BiQYXlOsQUYgcNDIwCi69j/5DQ6g16g0iLt/8cHnIa90Llj2zPEu/HcjOOhVKIrUyEiMnc3
	HgxBbVVe3v/HcmKLAAxJ4NRuhZ6oFck3PGN9Zzl
X-Received: by 2002:a05:6102:2c81:b0:737:9edc:36f8 with SMTP id ada2fe7eead31-760e6ed513amr6082284137.1.1786111911544;
        Fri, 07 Aug 2026 07:11:51 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763feadcdf4sm920025137.4.2026.08.07.07.11.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:11:49 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso1279821e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 07:11:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqXip9PgiR3tZPbNujHX92Jw2JZawkmB743x1TtWaVX5YhOAUjy2IVZ0NyzqPi0TEBTApYKFa8skynzYe1E6/34pA==@vger.kernel.org
X-Received: by 2002:a05:6102:4bc2:b0:738:84c:6b3 with SMTP id
 ada2fe7eead31-760e6ed510fmr5852045137.3.1786111907012; Fri, 07 Aug 2026
 07:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729093112.98324-1-biju.das.jz@bp.renesas.com> <20260729093112.98324-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260729093112.98324-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 16:11:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZm38_pYtHngDmczDJ7zvOGbD1zzn7hPc22qS27rxpQA@mail.gmail.com>
X-Gm-Features: AUfX_mz5svUj3oTLm2aUvPAutL-08xrHHuN6UW2c4GdC8R9tEGSmWZ5Vp8cE_rU
Message-ID: <CAMuHMdUZm38_pYtHngDmczDJ7zvOGbD1zzn7hPc22qS27rxpQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] soc: renesas: rz-sysc: Register auxiliary device
 for PWRRDY power sequencer
To: Biju <biju.das.au@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 29 Jul 2026 at 11:31, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that is controlled
> through a power sequencer rather than directly by the SYSC driver.
>
> Add a pwrrdy_pwrseq flag to struct rz_sysc_soc_id_init_data to mark
> SoCs with this property, and set it for RZ/G3L. When set,
> rz_sysc_probe() registers a "pwrseq-pwrrdy" auxiliary device so a
> dedicated driver can handle the PWRRDY sequencing, with automatic
> teardown via devm_add_action_or_reset().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Switched to devm_auxiliary_device_create().
>  * Added regmap parameter to rz_sysc_pwrrdy_pwrseq_init(),so that regmap
>    can be passed as platform data.

Thanks for the update!

> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c

> @@ -84,6 +85,22 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
>         return 0;
>  }
>
> +static int rz_sysc_pwrrdy_pwrseq_init(struct device *dev, struct regmap *regmap,
> +                                     const struct rz_sysc_init_data *data)
> +{
> +       const struct rz_sysc_soc_id_init_data *soc_data = data->soc_id_init_data;
> +       struct auxiliary_device *adev;
> +
> +       if (!soc_data->pwrrdy_pwrseq)
> +               return 0;
> +
> +       adev = devm_auxiliary_device_create(dev, "pwrseq-pwrrdy", (__force void *)regmap);

I don't think you need a cast (copied from a driver passing an
__iomem pointer?)

> +       if (!adev)
> +               return -ENODEV;
> +
> +       return 0;
> +}
> +
>  static const struct of_device_id rz_sysc_match[] = {
>  #ifdef CONFIG_SYSC_R9A08G045
>         { .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
