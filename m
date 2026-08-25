Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F30F3F1AB8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662454; cv=none; b=Lbq9a78UIAjTNNDImBNb7CbLBCzYiJJGBy/vcg4FsEOF0W0MPBeo44By9zNIy/kzUsoyKQnncb9BpS162VkYNQ2z2q6bqa5x0VLGs6P2JGiaqQ/Yn7Rvb4+ysQ0i3x/FioG19Xj4ueli2rAk2BdR7ptpDYj5HObd+3/trkxQE4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662454; c=relaxed/simple;
	bh=CaotQxU7iNU6c524dtH/JOUWSksfXQDDVYiUOPk3TkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IoPhW3ENZFUoWasP7Sj27rYLC3PgPxCnBSjInCI4usqGbDNdktOjI0FvnTIRY+HtPD74jMTxCjoMXOSU6Fd12FSWQYTAUDtyjmY0Slqty8xQyyeDhjCsywKSkAKZEO2dPAak58GSae3dMw5nOics52qUhf7cR9Ro/Bze76gur1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so693708e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662451; x=1788267251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Edl2lWOUjsEtEInWLfhIYEcuR1CiWfh9q8iac3qNwFA=;
        b=G8SiMOpubxxVXE1UJtZq+0AGAwW53+erTb/rW88GXIhKC7dCkyoXH09F3U3oxNL6w+
         /FTCdk5anpqWVgO85e+nmIlpJg9/d2IKqgx37qQyNqr5MX2SeyKa8+Lb4u2rLXs5pOcz
         7Q3PYEktuPqFmHGIY3p8OrFaouPn/SBc4bEUnBXx93qhKYy6/89vte68q36VOUgBHrQr
         4hvnARlQgl4C74zUBbILrn8DaRcftYsG0y+bUAiiFQOSi3CP0ClOrAQECAA+3sK+W4XE
         KRV7I3cbTHQMSh0Xarqv91FQY/UPih/9qJ7E4+Hc1lv68v6YknBc0MFnAVZdlTr1YA//
         67JQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpca8s7iy4YGcUwbv910ZywpnFHlikwvzUXajVNSxnHg4EvYHu4qcnhhdL1hQzsm0evrCsobA10KjXTSGPDmiMSgg==@vger.kernel.org
X-Gm-Message-State: AFuF++m+TpH8ZoBQoEtZc83ptlHZoodVBE8cEKh8vJ9SXVNEXLCGuF5S
	AsG22/ogM7MybbETIrrtk1IWxT/tODSCETEuDdoTzC1r5oHm7HGEaAEmi1TjYF+T5Wc=
X-Gm-Gg: AR+sD10RQovV7zNqf7wYmG0l454oCsyT+XMTJvC+8JiRuGbj/HLydNUZLUhN5/s4QDH
	MzQnQ9NsmDXjzxRv4FbCg/NKuQL0cvz25gQbWmabKgwONUw3JILFVaWEYeGaSzdXYKru9IIAEhZ
	g6zSNxbgMDJjEKXX8JtjCzBXXan5UNiJld9BJJ+pXUhUY2B/1eTU77bOVbDVV8Rh3KkcHZkAYgo
	QEbS0mn9DP19a1gbcMmYdUO93pncNRTbpRxmlewBMTP7ZpLJrvCnUc2b8QFoO0P7AY96xamlL12
	p+lJbe3X2muNEtl6QdFh2rVfnYEsrLyw96kC8Yqa8EHK9rq7T6kvATo2CZIgfRBe6cgKCMWNn9k
	ScwBkUZRGPLIZw68le25bJ3V/5Sll4rutFQrT8Oa4wmyUFMe+8pcv24VVVQ4VXQJhk8cMB4g9BO
	m8IWeTBY9ma6Q3L+WBtak7LvEw9xmSjmnJ1O3ft4Q6qbgyXqu54cBcltpkT97qqQK93mnGB8lMQ
	ebsuaOgjwcIGJ0YRp3O4tDJTA==
X-Received: by 2002:a05:6122:6603:b0:575:f155:8cd4 with SMTP id 71dfb90a1353d-5c64162a125mr1974735e0c.0.1787662451462;
        Tue, 25 Aug 2026 05:54:11 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c6238a66cdsm6095269e0c.0.2026.08.25.05.54.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:54:10 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7377dde7bc6so581113137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:54:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RruJO8WF3e7V0SuPwlI8I8LR2BwvK6mX83sBi+H9MNByslFAzQfaiFc6Jo3KV2s3YGpxnli5j08IwbP2C/B4/lVUA==@vger.kernel.org
X-Received: by 2002:a05:6102:3b15:b0:736:f95c:4bd4 with SMTP id
 ada2fe7eead31-77fd370acd5mr1148905137.6.1787662449703; Tue, 25 Aug 2026
 05:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev> <20260819143553.2478984-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260819143553.2478984-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoS=LZ94aYQ=Tm4n+R_L-1t7gZQ2vvHVZMfanxb=1yHg@mail.gmail.com>
X-Gm-Features: AcwNN1UP9Sje02JijQSgDxiN9g9qyPwNFW9wB2YgLhT-mIKpO45iKkt9fOTFuRw
Message-ID: <CAMuHMdXoS=LZ94aYQ=Tm4n+R_L-1t7gZQ2vvHVZMfanxb=1yHg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 19 Aug 2026 at 16:36, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The previous code handled power sources using a mixture of power
> source specific definitions and lookups in the available_ps[] array.
> Unify the power source handling by introducing
> struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
> source through its power source value, associated register value,
> associated capabilities (e.g. Ethernet), and associated IOLH index.
>
> Introduce two new functions, rzg2l_ps_to_desc() and
> rzg2l_pwr_reg_val_to_desc(), using the
> RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
> implementations are similar.
>
> These functions retrieve a power source descriptor based on either a
> power source value or a power source register value. Other functions
> that need to perform power source specific operations can call them to
> retrieve the corresponding power source descriptor.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -440,7 +439,65 @@ struct rzg2l_pinctrl {
>         u32                             clone_offset;
>  };
>
> -static const u16 available_ps[] = { 1800, 2500, 3300 };
> +/**
> + * struct rzg2l_pinctrl_ps_desc - RZ/G2L power source descriptor
> + * @caps: Capabilities that applies to the power source
> + * @iolh_index: IOLH index
> + * @ps: Power source value
> + * @pwr_reg_val: Power source register value
> + */
> +struct rzg2l_pinctrl_ps_desc {
> +       u32 caps;
> +       enum rzg2l_iolh_index iolh_index;
> +       u16 ps;
> +       u16 pwr_reg_val;
> +};
> +
> +#define RZG2L_PINCTRL_PS_DESC(_ps, _pwr_reg_val, _caps, _iolh_index) \
> +       { \
> +               .ps = _ps, \
> +               .pwr_reg_val = _pwr_reg_val, \
> +               .caps = _caps, \
> +               .iolh_index = _iolh_index, \
> +       }
> +
> +/* Keep the entries with .caps set in the first positions. */
> +static const struct rzg2l_pinctrl_ps_desc available_ps[] = {
> +       /* Ethernet I/O domain voltage 2.5V */
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_2V5),
> +       /* I/O domain voltage 1.8V */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, 0, RZG2L_IOLH_IDX_1V8),
> +       /* I/O domain voltage 3.3V */
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, 0, RZG2L_IOLH_IDX_3V3),
> +};
> +
> +#define RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(_name, _desc_member, _caps)  \
> +static const struct rzg2l_pinctrl_ps_desc *_name(u16 _desc_member, u32 _caps)  \
> +{                                                                              \
> +       const struct rzg2l_pinctrl_ps_desc *desc = NULL;                        \
> +                                                                               \
> +       for (unsigned int i = 0; i < ARRAY_SIZE(available_ps); i++) {           \
> +               if (available_ps[i]._desc_member == _desc_member) {             \
> +                       if (available_ps[i].caps) {                             \
> +                               if (available_ps[i].caps & caps) {              \

"_caps", as pointed out by Sashiko.

> +                                       desc = &available_ps[i];                \
> +                                       break;                                  \
> +                               } else {                                        \
> +                                       continue;                               \
> +                               }                                               \
> +                       } else {                                                \
> +                               desc = &available_ps[i];                        \
> +                               break;                                          \
> +                       }                                                       \
> +               }                                                               \
> +       }                                                                       \

You can reduce indentation, and simplify the code, by restructuring
the checks:

    for (unsigned int i = 0; i < ARRAY_SIZE(available_ps); i++) {
            if (!available_ps[i]._desc_member == _desc_member)
                    continue;

            if (!available_ps[i].caps) {
                    desc = &available_ps[i];
                    break;
            }

            if (available_ps[i].caps & caps) {
                    desc = &available_ps[i];
                    break;
            }
    }

> +                                                                               \
> +       return desc;                                                            \
> +}
> +
> +RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(rzg2l_ps_to_desc, ps, caps)
> +RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(rzg2l_pwr_reg_val_to_desc, pwr_reg_val, caps)
>
>  static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
>                                               u64 pincfg,

> @@ -1191,32 +1240,21 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
>         return 0;
>  }
>
> -static bool rzg2l_ps_is_supported(u16 ps)
> +static bool rzg2l_ps_is_supported(u16 ps, u32 caps)
>  {
> -       unsigned int i;
> +       const struct rzg2l_pinctrl_ps_desc *desc = rzg2l_ps_to_desc(ps, caps);
>
> -       for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
> -               if (available_ps[i] == ps)
> -                       return true;
> -       }
> -
> -       return false;
> +       return !!desc;

No need for the "!!".
Then this function becomes very simple, and you can just call
rzg2l_ps_to_desc(ps, caps) in the callers instead.

>  }
>
> -static enum rzg2l_iolh_index rzg2l_ps_to_iolh_idx(u16 ps)
> +static enum rzg2l_iolh_index rzg2l_ps_to_iolh_idx(u16 ps, u32 caps)
>  {
> -       unsigned int i;
> +       const struct rzg2l_pinctrl_ps_desc *desc = rzg2l_ps_to_desc(ps, caps);
>
> -       for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
> -               if (available_ps[i] == ps)
> -                       break;
> -       }
> +       if (!desc)
> +               return RZG2L_IOLH_IDX_NA;
>
> -       /*
> -        * We multiply with RZG2L_IOLH_MAX_DS_ENTRIES as we have
> -        * RZG2L_IOLH_MAX_DS_ENTRIES DS values per power source
> -        */
> -       return i * RZG2L_IOLH_MAX_DS_ENTRIES;
> +       return desc->iolh_index;

Perhaps

    return desc ? desc->iolh_index : RZG2L_IOLH_IDX_NA;

?

>  }
>
>  static u16 rzg2l_iolh_val_to_ua(const struct rzg2l_hwcfg *hwcfg, u32 caps, u8 val)

> @@ -1797,7 +1839,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
>
>         /* Apply power source. */
>         if (settings.power_source != pctrl->settings[_pin].power_source) {
> -               ret = rzg2l_ps_is_supported(settings.power_source);
> +               ret = rzg2l_ps_is_supported(settings.power_source, cfg);
>                 if (!ret)
>                         return -EINVAL;

As rzg2l_ps_is_supported() returns a bool, there is no need to keep its
return value in "ret" for later use.

After eliminating rzg2l_ps_is_supported(), this can just become

    if (!rzg2l_ps_to_desc(settings.power_source, cfg)
            return -EINVAL;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
