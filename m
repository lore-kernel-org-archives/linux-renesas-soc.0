Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:35968 "EHLO
	mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932421AbcGEGqA (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 02:46:00 -0400
Received: by mail-it0-f54.google.com with SMTP id g4so34365431ith.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2016 23:46:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87shvo50ns.wl%kuninori.morimoto.gx@renesas.com>
References: <1467118797-5492-1-git-send-email-geert+renesas@glider.be> <87shvo50ns.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Jul 2016 08:45:59 +0200
Message-ID: <CAMuHMdW9494Jky+7GPw+AvNNVevrVzAqHvXvFYuQp-6757KsvQ@mail.gmail.com>
Subject: Re: renesas-drivers-2016-06-28-v4.7-rc5
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tue, Jul 5, 2016 at 3:40 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> I have pushed renesas-drivers-2016-06-28-v4.7-rc5 to
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git
>>
>> This tree is meant to ease development of platform support and drivers
>> for Renesas ARM SoCs. It is created by merging (a) the for-next branches
>> of various subsystem trees and (b) branches with driver code submitted
>> or planned for submission to maintainers into the development branch of
>> Simon Horman's renesas.git tree.
>>
>> Today's version is based on renesas-devel-20160627-v4.7-rc5.
>
> Can we have new version of below branches for -rc5 branch ?
> Or for next new renesas-drivers ?
>
>         salvator-x-hdmi-prototype-drivers-X
>         salvator-x-hdmi-prototype-integration-X
>
> My picky opinion is that
> it is easy to understand that above additional branch has
> same/similar naming of base branch...
>
>         ex) salvator-x-hdmi-prototype-drivers-20160627-v4.7-rc5

Currently I provide e.g.:

  topic/salvator-x-hdmi-prototype-drivers-v3-rebased2
  topic/salvator-x-hdmi-prototype-integration-v3-rebased4

The drivers branch needs only a rebase when Laurent's for/renesas-drivers
changes, while the integration branch needs a rebase after each
renesas-drivers release.

I'll merge both of them in topic/salvator-x-hdmi-prototype-v3-<date>-<version>.
Would that be OK for you?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
