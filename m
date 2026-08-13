Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278BC3515DC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635976; cv=none; b=Wwpe0gHTM4EvmSEQWWuTqqQlqfTEGh2fyIFqHbd+G1aepJJwo6/xiwVx1oKuB40jWperpjC3051oFdO59Lq46Jy4FXKA0Qn+WxE0LPUbh9rmjJYw3Tro/oFz20oo7ESlQL1bj9RtUuZaJFoz4FS8yA7Lq8Y0Qwf2ekfGgK3v734=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635976; c=relaxed/simple;
	bh=CfPCLfqJ1dcGgFqUMf2iTh0mP1Mo/w6V8NMvdvj2Z8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8xwOactNfOPEq3NuCD8atYCxrqPQjLCLKiSLl0myXPWlgu+CCDNMRVgkNygSyXKLJ5lZlpwRMo7QhDr8S10i8IQv2GXYtFNu5CfN5617JNpNI0LVpd6Kn47ImF77ujaTAi4TXtJIXNjunIIteBUKfz/mQDpM9IdsW9Gg1ef3BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so3471576a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635970; x=1787240770;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f67wdn3bVHnBmQlMR3YCbOBtB5lYRlk7n/MkzjvTnN8=;
        b=Wg6MMyZFqk6CqVv6xg1PfLi+fQh0Vfz/sheq1Q+jWIHRtlVnWzyivHMDkyEw5s/WTH
         kfytWXnyOS3LXXNIQUKAtpL6+s3rggfy8qntoGw/8pp6yL463CeePDMvTfYcDBr41d8a
         cmDHFISWurBH3BrVWg4sgy9jq3//59oC7eNZHUwyO7ywEJEPjwLw6BeWniXQqWEz4jiM
         EsSq5D2JkQhoDd5c6cDr9fEF2hhOty8Kud6PQw3V/59z0RjUwcg1cweLAb7U9LxGvpEx
         PaPXAqp9F8bWYqs4+E5o6haBmSfh6GseKT73C96uInmXMZRe4nEu6e89bcMgq7rBYSuC
         NNrg==
X-Forwarded-Encrypted: i=1; AHgh+RqPeAdXC8qK29F33aBYdq7aWPJ3osjxOYoKZQAyYNtOuhRiDzzEPUCVjrkkFkG71cyta4ZpMZ1mFfb/BQAgB79xZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzop6hiuBjhGmCHKB2gKuZJxVsxRK0SvuMUrrA0Zw8cQRlkVktI
	BkYARnoI2GDxrAhPqehH7NQEY1/f8MxacvfufbpzG6FgBLtCH7EO4tLHkLarOpJ4FL4=
X-Gm-Gg: AR+sD11LFA+KoLGd2ULkDLJy0zSz+ofTpH9wP9gaIWgEgK+GHKEvtBBtrllcH7g9xhC
	Tar6LAgpo/bX46VK74VlASh3PR1H8LbxU/yxL6gpGOXm762ahbCWQoG5efGzpjASqDhibE1QmLa
	hPK4rVoO6/eqVHUdIn9/iQfUPA9QDZp4dHR5POQFwQsblLgq7ZSRB8WS1cmqY/VFY5/fdfkLZJ7
	0nZIr7JFrHaTjZBXjHuWSxJBOSUVJ33ZZ1WAhKFuuXPlvRmQRw2E3T7QASCISC7U2J9lPrhlzhj
	H9UK3mdwD9JmUVH3r0KJryADl131gpw8TeBpmGZO3t9w0LdCAlwWHdqW8D6lFwOq8WV0kW7Zbl0
	39qPnwaMgTxih8qyUL/L2cgf0Jqb14/5X+IM94XFlf0o6wHq+b1SHBJgEeWmcGE6Uq0kxfbxQ3m
	O2BvZ7SZDBgbiwJJ75wq+QxDiV8gSz7QmFlqbAF21k0KSlrv+XUN7dTA1YkceAArH2/TJkHvEpZ
	2CYkXy7E4nlatlotLQ4mjjGMQ==
X-Received: by 2002:a05:6402:52dc:b0:69a:a279:dc10 with SMTP id 4fb4d7f45d1cf-6a3805f8791mr3074225a12.10.1786635970430;
        Thu, 13 Aug 2026 08:46:10 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a381d38852sm954648a12.6.2026.08.13.08.46.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:46:08 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so3471508a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoJrgYte20VCs+NKwikZB7OtGCzifJjPp/eRwI+v/npgs/Be8P++nVqQWGRtoA+89pmJAzPJNMUub9WTbTaEnjzCg==@vger.kernel.org
X-Received: by 2002:a05:6402:52dc:b0:69a:a279:dc10 with SMTP id
 4fb4d7f45d1cf-6a3805f8791mr3074088a12.10.1786635968409; Thu, 13 Aug 2026
 08:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
 <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
 <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev> <TY3PR01MB113468890DC8B12E1E43A54A986FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7cd113ad-3673-4f2b-97f3-aa1df4259a53@tuxon.dev> <TY3PR01MB1134672AC39737CA91F8FDBA886FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <68280642-0e36-4ba3-ae8d-486fb72ede77@tuxon.dev>
In-Reply-To: <68280642-0e36-4ba3-ae8d-486fb72ede77@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:45:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpgiGEJy74aAT4jq-YNDbFFi5S=vd_sfAJMMsgb24wmw@mail.gmail.com>
X-Gm-Features: AUfX_mwcukJIe17S8Tb__TpvCkLYwUOgvMbQ_VM8hDzlQY5Jb81CWcypwteZOLo
Message-ID: <CAMuHMdVpgiGEJy74aAT4jq-YNDbFFi5S=vd_sfAJMMsgb24wmw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, 
	"linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu, Biju,

On Tue, 14 Jul 2026 at 09:26, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 7/13/26 18:15, Biju Das wrote:
> >> From: claudiu beznea<claudiu.beznea@tuxon.dev>
> >> On 7/13/26 16:56, Biju Das wrote:
> >>>> From: claudiu beznea<claudiu.beznea@tuxon.dev>
> >>>> On 7/12/26 17:55, Biju Das wrote:
> >>>>>> From: Claudiu Beznea<claudiu.beznea+renesas@tuxon.dev>
> >>>>>> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V.
> >>>>>> The pin controller provides a register to select between these two options.
> >>>>>> Update the Renesas RZ/G2L pin controller driver to allow selecting the I3C power source on RZ/G3S
> >> SoC.
> >>>>>> Reviewed-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> >>>>>> Tested-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> >>>>>> Signed-off-by: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>

> >>>>>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >>>>>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >>>>>> @@ -281,6 +288,11 @@ struct rzg2l_register_masks {
> >>>>>>                          u8 other_poc_pvdd1833_oth_iso_poc;
> >>>>>>                          u8 other_poc_wdtovf_n_poc;
> >>>>>>                  };
> >>>>>> +
> >>>>>> +                /* RZ/G3S masks */
> >>>>>> +                struct {
> >>>>>> +                        u8 i3c_set_poc;
> >>>>> How this POC is different from Ethernet, SDHI and XSPI POC?
> >>>> Different bit mask and offset for I3C SET_POC compared with ETH, SDHI, XSPI.
> >>> RZ/G3L has i3c_set_poc, which has same bitmask as other_poc_wdtovf_n_poc.
> >>> Maybe create register specific masks??
> >>>
> >>> struct other_poc and struct i3c_set instead of union. So that both
> >>> RZ/G3L and RZ/G3S can share the same struct for i3c.
> >> When RZ/G3L I3C POC support will be added the i3c_set_poc member of struct rzg2l_register_masks could be
> >> moved as common member:
> >>
> >> Current code base allows for this extension. You can have:
> >> struct rzg2l_register_masks {
> >> +       /* Common masks. */
> >> +       u8 i3c_set_poc;
> >>           union {
> > OK, This union will go when we add RZ/G3L.
> >
> >>                   /* RZ/G3L masks */
> >>                   struct {
> >>                           u8 other_poc_pvdd1833_oth_awo_poc;
> >>                           u8 other_poc_pvdd1833_oth_iso_poc;
> >>                           u8 other_poc_wdtovf_n_poc;
> >>                   };
> >> -               /* RZ/G3S masks */
> >> -               struct {
> > Looks, this struct not needed now. struct with single member
> > has no value at all.
>
> I'll let Geert decide if he wants me to drop it.

I like having a struct for grouping, even for a single member, for
consistency, as the other union member is a struct.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
