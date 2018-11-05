Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42605 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbeKFATE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 19:19:04 -0500
Received: by mail-lf1-f65.google.com with SMTP id q6-v6so6336996lfh.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Nov 2018 06:58:57 -0800 (PST)
Date: Mon, 5 Nov 2018 15:58:54 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/2] renesas: rcar-gen3: add HS400 quirk for SD clock
Message-ID: <20181105145853.GA20989@bigcity.dyn.berto.se>
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
 <CAMuHMdU9KewOQLaNrrWxd3YfLJs+uwto9=fSwo9r6QQCYMy2gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU9KewOQLaNrrWxd3YfLJs+uwto9=fSwo9r6QQCYMy2gA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your feedback.

On 2018-11-05 11:32:15 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Thu, Nov 1, 2018 at 12:26 AM Niklas S�derlund
> <niklas.soderlund@ragnatech.se> wrote:
> > This is the result of the SDHI hackathon for a possible solution to the
> > clock issue on early ES versions. It is based on the Gen2 solution where
> > a row of the possible clock settings are ignored on the effected SoC+ES
> > versions. The first row is not effected when reading settings left by
> > the bootloader, only when the setting the clock.
> 
> To clarify, you decided not to describe the SDH clock in DT, but went for
> heuristics with a quirk instead?
> 
> Is there any chance this can start to bite us in the future?

We discussed this at the SDHI hackfest and we could not think of any 
future situation where this could come back and bite us.

> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas S�derlund
