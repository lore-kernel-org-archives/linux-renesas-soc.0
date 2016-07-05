Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:33897 "EHLO
	mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754189AbcGEHea (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 03:34:30 -0400
Received: by mail-io0-f169.google.com with SMTP id g13so166263658ioj.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2016 00:34:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87lh1g4kfi.wl%kuninori.morimoto.gx@renesas.com>
References: <1467118797-5492-1-git-send-email-geert+renesas@glider.be>
 <87shvo50ns.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdW9494Jky+7GPw+AvNNVevrVzAqHvXvFYuQp-6757KsvQ@mail.gmail.com>
 <87lh1g4kfi.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Jul 2016 09:34:28 +0200
Message-ID: <CAMuHMdU8P8LAFj8bZx+oY8y0ymHenrg2BkNkm-muTwxhEC0dbg@mail.gmail.com>
Subject: Re: renesas-drivers-2016-06-28-v4.7-rc5
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tue, Jul 5, 2016 at 9:31 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> Currently I provide e.g.:
>>
>>   topic/salvator-x-hdmi-prototype-drivers-v3-rebased2
>>   topic/salvator-x-hdmi-prototype-integration-v3-rebased4
>>
>> The drivers branch needs only a rebase when Laurent's for/renesas-drivers
>> changes, while the integration branch needs a rebase after each
>> renesas-drivers release.
>>
>> I'll merge both of them in topic/salvator-x-hdmi-prototype-v3-<date>-<version>.
>> Would that be OK for you?
>
> Thank you for your help.
> New naming rule is easy to understand for me.
> But, I wonder do we need -v3- ?
> We don't use old prototype on latest branch,
> so, <date> and <verion> is very enough ?
> Not a big deal though.

Indeed, we don't need it, as we can identify the prototype patchset version
from the individual topic/salvator-x-hdmi-prototype-drivers-v* and
topic/salvator-x-hdmi-prototype-integration-v* branches that are included.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
