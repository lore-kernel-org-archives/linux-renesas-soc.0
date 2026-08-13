Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C079930E858
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635395; cv=none; b=IlhLBtlrU7GYO/e9FAtRYP3d6sxrzGyg8enZ/TooLImHumuVnTY2Sz2pNBB+bJhVLcRQqBIaA/q++uUUmsMJ7DQcJa/v9qWqfWGuPlLd5bbc80xkqLw1ka9U+laWJ3E1ffbwMUgj0wVvINxOI4nA3PVQ0xzadB8XfX4ZI5tYMJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635395; c=relaxed/simple;
	bh=vzsqRgKK6xb+qXIWqmZLoli+ye1tIEurLtQ8ZUQVhRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxTOKojDuZh6mh1zPo67UFGAww373pgB/60nkA8xZ9RqcjGjGNtSEOjhQr2tWYFkpz6QkN37zaMmiSpFBJQQoCeRaYZq3cCrCUy7EGB991p6x/bQX7s4+Qar+Fbrc4TIPrJFh+inahGxGDISba5qHJDMogHvsDuZPUlzx1CZKSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1575746a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635383; x=1787240183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8HfO2oqGvHcLZthk9jR7PnHTZYqhjJfeV3Z47WsDvdU=;
        b=Ag4PURJrN46Uywb+EMkDDy5N9jsb6RsKMIs3SeqUOW0FHnNAVkjwhePOttmUQoZZVB
         2+E0RxZ0BvlonKizBBTKAmrTgrCiThkl34yv507Y2J39jFoXI6RjVkUMRgjYYqGc/OjE
         mmpFDRSQLs7qaRAs/qLJStckNzOCwtXQrncg1cPCBBegSg871SSzsjTVd6vbzco9wsi9
         w7cQ++A6Ieq9aZmlE20MKANFVefcOFDPYU7tGjmnVSKBXMpJmQ6eJ/VbWfxMg0G2OvUo
         h0zpeYeCZ1RpTmQZlWvb57D+0CIxECuL5m1eEF/2IvzQQ+ZLDPBzlnGSeX3DFRg4hlLL
         SqQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSDweoBKvQaMShX5J2FhlC7XqQDV04z5ImD50aAsoTTxaxQGqy3X+7K4X0Y7IWbPFq2OM1e9DVaZbvXmJSoN4Ugg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXRD1ISn72vBhNp87zYi9aN/cfj6Kr+KoyFb6UpXhyl8NqHOPB
	5T8IawPkTGTwiGWZd4EK2rT32RolZHxlhzRE03BRTR28vtxp/+62zVNWklAfmygCSM0=
X-Gm-Gg: AR+sD13ND5p3LXABS/XgrlSusEwgcdKgMVAYNvD8A0pUZcwimCxOqbc7FF7e0EnpLTh
	6wuAGXa9oc13L2Mdmc9pKMAPKQS0aUbmlNSff9Si2rrWRH2x4qSFHQI0LVuVfqzV8KgiMPtwHfg
	GNn9NTbPUNOw+z2o/GVcOrhFmIth4OcnXlJlQ9xZ9sfUjmCZ0DJdQ832sGHOJANtKpzT16uC019
	k9APp5xPqNBaGKhc50bS5EAEA96hHqCF3nznxoEA793udbPPjbolHS0xjjQWBfj477wVY7AAC4E
	kgQSWemkuYQKq1CuPMZOCvIbcqzQiqeLCw1Pm0vK2asHjBCH5BbThPZtxhcZjlYuUTSL4Nox2PY
	uWZDHowBpzfofn38jPzB8LBGJ9JzI1idKqTtEqTngtvG8l9nnn791zGa+kQu5G8MQpdgdVsupR+
	t2In/272tpYwhlnkLDANxakWzZA6yZttuBq9mVQAlszH4HfrrAQplxNEbJ7gOhf/nUSl50VOrkk
	YzVh6f5aS5pQaT7jCTz5p9UfQ==
X-Received: by 2002:a05:6402:e96:b0:6a0:a492:1f46 with SMTP id 4fb4d7f45d1cf-6a3805d4cc5mr3495555a12.8.1786635383013;
        Thu, 13 Aug 2026 08:36:23 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a37f8a24dasm1107730a12.14.2026.08.13.08.36.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:36:22 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a144c8eea2so1626779a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqALFNsOxLIh2xpD57eQq0Vz/6JA0lPi+d+hdpI08PPHhy8Zj9wbTvhE7KS9sm0JcWiRliZ5s+weYzQuOFw1Wpu4Q==@vger.kernel.org
X-Received: by 2002:a05:6402:42d1:b0:6a0:6978:bee0 with SMTP id
 4fb4d7f45d1cf-6a3805dd5f3mr3355685a12.9.1786635382098; Thu, 13 Aug 2026
 08:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:36:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLEuC5CFKH4KEUo6H++rp6N=0X7Vd4ffOm2K=hQNPGzg@mail.gmail.com>
X-Gm-Features: AUfX_mzZK_XqQEToCXzSXsA3RQo5nMa-PCSiTS9b3hgORV81WkefGByzaZwI1FY
Message-ID: <CAMuHMdWLEuC5CFKH4KEUo6H++rp6N=0X7Vd4ffOm2K=hQNPGzg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 10 Jul 2026 at 13:36, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The current functions used to get/set the pin power source check the
> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
> code to be extended for other power source functionalities (e.g. I3C on
> RZ/G3S), generalize the functions used to get/set the pin power source.
>
> For this, introduce the struct rzg2l_register_masks data structure whose
> purpose is to store SoC specific register bit masks. The members of this
> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
> corresponding to a SoC specific power source capability.
>
> The conversion between HW specific power source values and SW specific
> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
> rzg2l_ps_to_pwr_reg_val().
>
> Finally, to keep the code generic, the register update in
> rzg2l_set_power_source() was changed to a read-modify-write approach to
> cover all cases.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

>  static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
> -                                u32 caps, u8 *mask)
> +                                const struct rzg2l_register_masks *masks,
> +                                u32 caps, u16 *offset, u8 *mask)

Yes, always returning an offset and mask is what I had in mind before.

>  {
> -       if (caps & PIN_CFG_IO_VMC_SD0)
> -               return SD_CH(regs->sd_ch, 0);
> -       if (caps & PIN_CFG_IO_VMC_SD1)
> -               return SD_CH(regs->sd_ch, 1);
> -       if (caps & PIN_CFG_IO_VMC_ETH0)
> -               return ETH_POC(regs->eth_poc, 0);
> -       if (caps & PIN_CFG_IO_VMC_ETH1)
> -               return ETH_POC(regs->eth_poc, 1);
> -       if (caps & PIN_CFG_IO_VMC_QSPI)
> -               return QSPI;
> +       *mask = PVDD_MASK;
> +
> +       if (caps & PIN_CFG_IO_VMC_SD0) {
> +               *offset = SD_CH(regs->sd_ch, 0);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_SD1) {
> +               *offset = SD_CH(regs->sd_ch, 1);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_ETH0) {
> +               *offset = ETH_POC(regs->eth_poc, 0);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_ETH1) {
> +               *offset = ETH_POC(regs->eth_poc, 1);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_QSPI) {
> +               *offset = regs->qspi;
> +               return 0;
> +       }
>         if (caps & PIN_CFG_OTHER_POC_MASK) {
> +               *offset = regs->other_poc;
>                 if (caps & PIN_CFG_PVDD1833_OTH_AWO_POC)
> -                       *mask = BIT(0);
> +                       *mask = masks->other_poc_pvdd1833_oth_awo_poc;
>                 else if (caps & PIN_CFG_PVDD1833_OTH_ISO_POC)
> -                       *mask = BIT(1);
> +                       *mask = masks->other_poc_pvdd1833_oth_iso_poc;
>                 else
> -                       *mask = BIT(2);
> +                       *mask = masks->other_poc_wdtovf_n_poc;
> +               return 0;
> +       }
>
> -               return OTHER_POC;
> +       return -EINVAL;
> +}
> +
> +static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
> +{
> +       switch (val) {
> +       case PVDD_1800:
> +               return 1800;
> +       case PVDD_2500:
> +               return 2500;
> +       case PVDD_3300:
> +               return 3300;
> +       }
> +
> +       return -EINVAL;
> +}

This function returns a valid value, or an error code...

> +
> +static int rzg2l_ps_to_pwr_reg_val(u8 *val, u32 ps, u32 caps)
> +{
> +       switch (ps) {
> +       case 1800:
> +               *val = PVDD_1800;
> +               return 0;
> +       case 2500:
> +               if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
> +                       return -EINVAL;
> +               *val = PVDD_2500;
> +               return 0;
> +       case 3300:
> +               *val = PVDD_3300;
> +               return 0;
>         }
>
>         return -EINVAL;

... while the inverse function stores the value in an output pointer
on succes. Perhaps this should be changed, for consistency?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
