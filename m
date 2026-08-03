Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A792765E2
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Aug 2026 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762871; cv=none; b=r9nUzwus6PLQUsADfJ0klw3jnXfVYIppFbfRXmUGmiVl9fkhHYheYzOEtqfFVLr4h3f6H9HYnJRfJBfClhTiPSpqthCHdI/Ol1NCEMdlAhwv465a+Ybenty5esoBWFX9q5nRuQUuuqYkz3qMNqazveNxN6FaooLgSg1cDoAQyvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762871; c=relaxed/simple;
	bh=wpRAEVGSk5EIt33MrZa1qKsoJY/CcW69bNAQso5cJjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s94cvcWHX5Ae5rYrInybCKxQSqnQIu2ZXX2KFRP9Z3Kw6SdpdOQeWYh6csDrp7U6BfL6Or1pEj6RIqBQtpaSaqUd2/1lTPtfvdm9Ye/hlqn495PhGdadyEcmMbrtZjypMRUsiINhxkqIKKSxapzySrvwfVZPInMOfQl4xWIDb/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so1637025e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2026 06:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762863; x=1786367663;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s3m1f4gLLLciDRPIgPDtS8bZatt98aWtSkUwBrLRSjA=;
        b=sVCM0qwPpZhHEH0T1POB8T2ewq+kbwkdDDifHUWIqkyIW5ynmzsvTTBuRF3SDID1jG
         U3at7tu9tqMloKa3qbhGpnevRjMNsiFX3tBeVsWvyc3WoYxEaKfzinky4zcgvRJVw3Iw
         YZOOxu7VNZ9yU+aWFhWx0VFr7THAyB42+OXebkP0wDsXHCWhY4z1Yvw4yIN+gEOksTi0
         KdBre8NsfL4ajRsGpIWIfJ/SuOaEIeJL2YK+YWuvujrqZDgYNKMCJk4YWJmWepZkCrhW
         lDEw5WiIuTvfoAQrZDrSUmGXSaoAHnplr3h6uNwaijvyAYsBtdVknAyR4OhQpl6ccAWm
         0r/g==
X-Gm-Message-State: AOJu0YzDBydGOHd3+35BJqsjvvMFW5h8qpkgrX5NQVptuMchHiKtyPgu
	sqfnN1bHkCcx/IVqrM4v1ierptlNsl+gDMBSM22eCVnaqTd5Z5X2ze6TQy5iWJS3
X-Gm-Gg: AR+sD11hJYHCNaPOWwZC8yKvpcXf3UlmdMZURlKbzWnkKg4AaCYj1c+HMOCSu8o16n1
	QmJJzWxs/tCP8nwSIsQ8kQHSlUCO1e9CMfFrGFB1Ar3thJASLrjjtgBVyjtZnMkD9tQUnjlbQ9A
	ZrgaqxeX8AuoYD4shgoUOrRZBTRpT7E7WY2bqLT4lOjUJ9n5s3ncNcFJD2KZkEz6kEd+t7zcsPp
	8T1xSlLrasGMrSPjhwLzhZy163W3M0TkWDtIX31h/RN0WwvYULlG8GdbfjbDeeEL0u5hvNO1yfk
	tNivXPwM9v3e3i0UC+SNEv1POGGmsJyVwawHiPkBCUmcvK5hNkmWHZ0IssMGV+lcdpYHgUM6NH/
	bYSIQDwFOTCuIoE0Ftigl/1HyhtUTT1UIR6Ytko8YSUt+l8lTQ4nOeR1PqrVAfohA8PAbAuatUB
	gXVZ1ASoqiijs7OIbaUeh8fChyNf7s2ZgrgU3hNBzpdcNQLR59AeHEgUnzmgNZIuVb4FSQXzvRd
	iUQHKx5iCfYalLHoB2p7uJH6Q==
X-Received: by 2002:a05:6122:1b0c:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c387617ccdmr2233303e0c.3.1785762863568;
        Mon, 03 Aug 2026 06:14:23 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37eac0850sm8217460e0c.1.2026.08.03.06.14.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 06:14:23 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so450853241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2026 06:14:23 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec1:b0:740:177:f357 with SMTP id
 ada2fe7eead31-75b21b5cddamr7351232137.6.1785762863033; Mon, 03 Aug 2026
 06:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727122546.4232-4-wsa+renesas@sang-engineering.com> <20260727122546.4232-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260727122546.4232-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 15:14:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVAgjguscFMKd7u1XPuZEkB7mH9-G-Y8nYfXqbzJ2hH9Q@mail.gmail.com>
X-Gm-Features: AUfX_mzjV3ChZNmkKXmVTHVzhvZIDU94wJyunanhT_HiX5hV15YK6vYRfgEHgVU
Message-ID: <CAMuHMdVAgjguscFMKd7u1XPuZEkB7mH9-G-Y8nYfXqbzJ2hH9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: rcar: add R-Car Gen5 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 27 Jul 2026 at 14:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To support the next generation of R-Car SoCs, we need to skip polling
> the reset status. SCMI doesn't support it and the firmware must take
> care of this anyhow. Other than that, the driver works fine as-is.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch, which is now commit 87e713f200481106 ("i2c:
rcar: add R-Car Gen5 support") in i2c/i2c/i2c-next.

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c

> @@ -900,8 +901,12 @@ static int rcar_i2c_do_reset(struct rcar_i2c_priv *priv)
>         if (ret)
>                 return ret;
>
> -       return read_poll_timeout_atomic(reset_control_status, ret, ret == 0, 1,
> -                                       100, false, priv->rstc);
> +       /* SCMI based resets don't need to poll for success */
> +       if (priv->devtype < I2C_RCAR_GEN5)
> +               return read_poll_timeout_atomic(reset_control_status, ret, ret == 0,
> +                                               1, 100, false, priv->rstc);

How to differentiate between using SCMI and running on bare metal?
The latter still needs polling.

I think you should call reset_control_status() first, and check for
-ENOTSUPP, which would indicate that reset status is not available.

> +
> +       return 0;
>  }
>
>  static int rcar_i2c_master_xfer(struct i2c_adapter *adap,

> @@ -1194,9 +1200,15 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>                         goto out_pm_put;
>                 }
>
> -               ret = reset_control_status(priv->rstc);
> -               if (ret < 0)
> -                       goto out_pm_put;
> +               /*
> +                * Gen5+ uses SCMI based reset which cannot report status.
> +                * Firmware has to ensure proper reset
> +                */
> +               if (priv->devtype < I2C_RCAR_GEN5) {
> +                       ret = reset_control_status(priv->rstc);
> +                       if (ret < 0)
> +                               goto out_pm_put;
> +               }

Likewise, i.e. call reset_control_status() unconditionally, and
ignore -ENOTSUPP.

>
>                 /* hard reset disturbs HostNotify local target, so disable it */
>                 priv->flags &= ~ID_P_HOST_NOTIFY;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
