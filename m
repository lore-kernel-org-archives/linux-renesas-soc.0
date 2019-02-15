Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75B8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 08:43:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97E2D21B1C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 08:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404425AbfBOInQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 03:43:16 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39560 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404378AbfBOInQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 03:43:16 -0500
Received: by mail-vs1-f68.google.com with SMTP id e16so5337807vsq.6;
        Fri, 15 Feb 2019 00:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iffnJdt48hw0zmoVS3/CnZ5v1OH/KX6fWmxBRy6oWbA=;
        b=K82/JQ/Nf4/WgOzsO8/Kx5/KmtF80q9PixGA1bDFygxSrrdD2JtxPmw+z1qEUc11bJ
         a3Rj4G+51hb3NqIe+rxJo7y8Yv2L+EpeJE0RC59iczME5+SDrIM2CNZr1oyrcBGvH/Ra
         xZunS2feAiTMfO++KDGOfeHMg9xqjs04K1T+LVt9wHIxnqt3us5XwcJfNZUrc3vhJmie
         1BWSajnxuHQT9T3jwqYvbk/HGcymz0jWLCmgR+0NHWF3BGtxXCZX7MNxzy3ewQdlBvya
         A7MNyO8hM+XQG3WuP3PfvIbqvUISNaj8Omod5IrYECDPzFfIuh908srhXeK/CCQJI/ZH
         w+dw==
X-Gm-Message-State: AHQUAuboN0vW8kW2VyGlJnaF1zz0O/Dv7Z4rPyQt0gm26WhYkEEFMtq+
        Th797b+m5s0hoCgZ+gWHG9e0dNMtcqtbknZnXzO2/xOk
X-Google-Smtp-Source: AHgI3IaTVDA7Xfa3MvbqlBLzuwfbAlW78e8PqgcwNcNvks8V2yk0TsS007Is+Bea9VeM+fGlG4gam9k3y3S+bcO4TCY=
X-Received: by 2002:a67:ead0:: with SMTP id s16mr1182061vso.63.1550220194849;
 Fri, 15 Feb 2019 00:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20190125165305.8567-1-geert+renesas@glider.be>
 <20190125165305.8567-3-geert+renesas@glider.be> <20190215081711.rtrflfvrup274g3p@verge.net.au>
In-Reply-To: <20190215081711.rtrflfvrup274g3p@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Feb 2019 09:43:03 +0100
Message-ID: <CAMuHMdXKxL33NYWjjQ28uHV+9UNO=DOYVW2t6_LPjkiztHAP3Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pinctrl: sh-pfc: Validate pinmux tables at
 runtime when debugging
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Feb 15, 2019 at 9:17 AM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Jan 25, 2019 at 05:52:57PM +0100, Geert Uytterhoeven wrote:
> > Perform some basic sanity checks on all built-in pinmux tables when
> > DEBUG is defined, to help catching bugs early.
> >
> > For now the following checks are included:
> >   - Check register and field widths in descriptors for config registers
> >     with variable-width fields,
> >   - Check relations between pin groups and functions:
> >       - All pin functions must refer to existing pin groups,
> >       - All pin groups must be referred to by a pin function,
> >       - Warn if a pin group is referred to by multiple pin functions
> >       (which is OK for backwards-compatibility aliases),
> >   - Provide suggestions for reducing table sizes: reserved fields of
> >     more than 3 bits can better be split in smaller subfields, as the
> >     storage need is proportional to the square of the width of the
> >     (sub)field,
> >
> > Note that a dummy non-matching entry is added to the DT match table for
> > checking r8a7795es1_pinmux_info, as R-Car H3 ES1.0 is matched using
> > soc_device_match() in r8a7795_pinmux_init(), instead of by the DT match
> > table.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Hi Geert,
>
> I noted a few nits below, but in writing them I got to feel
> that perhaps its just me not appreciating the merit of
> some of the idioms used. So feel free to ignore them.
>
> Nits aside,
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thank you!

> > --- a/drivers/pinctrl/sh-pfc/core.c
> > +++ b/drivers/pinctrl/sh-pfc/core.c

> > +static void sh_pfc_check_cfg_reg(const char *drvname,
> > +                              const struct pinmux_cfg_reg *cfg_reg)
> > +{
> > +     unsigned int i, n, rw, fw;
> > +
> > +     if (cfg_reg->field_width) {
> > +             /* Checked at build time */
> > +             return;
> > +     }
> > +
> > +     for (i = 0, n = 0, rw = 0; (fw = cfg_reg->var_field_width[i]); i++) {
>
> nit: The assignment in the conditional expression in the for loop is
>      perhaps not the clearest way to express this, and its

The alternative is:

        for (i = 0, n = 0, rw = 0; cfg_reg->var_field_width[i]; i++) {
                fw = cfg_reg->var_field_width[i];

Or a while (1) { ... } with a break.
IMHO all more ugly and/or less concise than the above.

>      not clear that the parentheses are required.

Oh yes, just like in the conditions of "if" and "while" statements:

    warning: suggest parentheses around assignment used as truth value

>
> > +             if (fw > 3 && is0s(&cfg_reg->enum_ids[n], 1 << fw)) {
> > +                     pr_warn("%s: reg 0x%x: reserved field [%u:%u] can be split to reduce table size\n",
> > +                             drvname, cfg_reg->reg, rw, rw + fw - 1);
> > +                     sh_pfc_warnings++;
> > +             }
> > +             n += 1 << fw;
> > +             rw += fw;
> > +     }

> > +static void sh_pfc_check_info(const struct sh_pfc_soc_info *info)
> > +{
> > +     const struct sh_pfc_function *func;
> > +     const char *drvname = info->name;
> > +     unsigned int *refcnts;
> > +     unsigned int i, j, k;
> > +
> > +     pr_info("Checking %s\n", drvname);
> > +
> > +     /* Check groups and functions */
> > +     refcnts = kcalloc(info->nr_groups, sizeof(*refcnts), GFP_KERNEL);
> > +     if (!refcnts)
> > +             return;
> > +
> > +     for (i = 0; func = &info->functions[i], i < info->nr_functions; i++) {
>
> nit: It might be clearer to set (and declare) func inside the loop.

I agree (probably it made sense at some point during development).

> > +             for (j = 0; j < func->nr_groups; j++) {
> > +                     for (k = 0; k < info->nr_groups; k++) {
> > +                             if (!strcmp(func->groups[j],
> > +                                         info->groups[k].name)) {
> > +                                     refcnts[k]++;
> > +                                     goto next;
>
> nit: goto

Yeah, it's a pity C, unlike PERL, doesn't have "next <LABEL>", to escape
out of one or more loop constructs ;-)

The alternative is "break"...

>
> > +                             }
> > +                     }

... and wrap the below in "if (k == info->nr_groups) { ... }", which makes
sense, as it still doesn't make indentation too deep (probably it did at
some point during development).

> > +
> > +                     pr_err("%s: function %s: group %s not found\n",
> > +                            drvname, func->name, func->groups[j]);
> > +                     sh_pfc_errors++;
> > +
> > +next:                        ;
> > +             }

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
