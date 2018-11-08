Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:35562 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbeKHUYm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 15:24:42 -0500
Received: by mail-vk1-f195.google.com with SMTP id b18so4447633vke.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Nov 2018 02:49:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1541514075.git.horms+renesas@verge.net.au> <CAOesGMjosJGENSm8jjAaZxcr4ehjBB5LF7OQ8PJR-J2kMktfWQ@mail.gmail.com>
In-Reply-To: <CAOesGMjosJGENSm8jjAaZxcr4ehjBB5LF7OQ8PJR-J2kMktfWQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 11:49:32 +0100
Message-ID: <CAMuHMdX-oLaQ8LHRiUjWLHOQ020GKLbbuDURuy0K_Jsp32B17g@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v4.20
To: Olof Johansson <olof@lixom.net>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        arm@kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof,

On Wed, Nov 7, 2018 at 5:03 PM Olof Johansson <olof@lixom.net> wrote:
> On Wed, Nov 7, 2018 at 3:25 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > * R-Car V3H (r8a77980) based Condor board
> >   - Switch from EtherAVB to GEther to match offical boards
> >
> > * RZ/G2E (ra8774c0) SoC: correct documentation of part number
>
> I have to admit, Renesas part numbers have got to be _really_ hard to
> deal with for anyone who has even the slightest hint of dyslexia. :-)

Yeah, for some on them, you can trick people into believing Renesas did
switch to "r" + a truncated commit ID in the HDL source repository ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
