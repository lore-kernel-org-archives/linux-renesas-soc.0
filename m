Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:37524 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750823AbdFUMVO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 08:21:14 -0400
Received: by mail-it0-f49.google.com with SMTP id m47so2186038iti.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2017 05:21:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170621120309.GD17965@verge.net.au>
References: <87injs25la.wl%kuninori.morimoto.gx@renesas.com>
 <20170620132038.GG14340@verge.net.au> <87bmpi8atz.wl%kuninori.morimoto.gx@renesas.com>
 <20170621120309.GD17965@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jun 2017 14:21:11 +0200
Message-ID: <CAMuHMdUjMb85X17H9xYDQgTrRSCRFzTPDyEg4WCfmC8gHrk=XA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: defconfig: ak4613/renesas sound will be kernle module
To: Simon Horman <horms@verge.net.au>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Jun 21, 2017 at 2:03 PM, Simon Horman <horms@verge.net.au> wrote:
> Compile the renesas sound and ak4613 drivers to reduce the ARM64 kernel

... as modules ...

Else you increase size ;-)

> size. These modules are currently only used by Renesas platforms so
> there should little risk of negative impact of this change on other users.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
