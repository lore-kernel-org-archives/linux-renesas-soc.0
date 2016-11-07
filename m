Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35742 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751296AbcKGM10 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 07:27:26 -0500
Received: by mail-wm0-f65.google.com with SMTP id a20so5389366wme.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2016 04:27:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXZR3Af5mtrjuGzVwAxDHtOGsv3UizFt3GeEHmM_obtwg@mail.gmail.com>
References: <20160914164716.31512-1-ulrich.hecht+renesas@gmail.com>
 <20160914164716.31512-3-ulrich.hecht+renesas@gmail.com> <CAMuHMdXZR3Af5mtrjuGzVwAxDHtOGsv3UizFt3GeEHmM_obtwg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Nov 2016 13:27:24 +0100
Message-ID: <CAMuHMdUfrzM77ZHG9ae-J_iNKkumCKrkqDFks1dw6RFTTxdeRA@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Thu, Sep 15, 2016 at 8:55 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Sep 14, 2016 at 6:47 PM, Ulrich Hecht
> <ulrich.hecht+renesas@gmail.com> wrote:
>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>> ---
>>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 255 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 255 insertions(+)
>>
>> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
>> index 42db745..607adf7 100644
>> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
>> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
>> @@ -1490,6 +1490,191 @@ static const struct sh_pfc_pin pinmux_pins[] = {
>
>> +/* - HSCIF2 ----------------------------------------------------------------- */

> You forgot to add group C for HSCIF2, which does not exist on H3.

Any plans for an update, fixing that?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
