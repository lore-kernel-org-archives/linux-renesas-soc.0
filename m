Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:38955 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752864AbdLMMem (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 07:34:42 -0500
Received: by mail-lf0-f66.google.com with SMTP id l81so2440005lfl.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2017 04:34:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171213122052.GG6416@sirena.org.uk>
References: <1513102155-47925-1-git-send-email-biju.das@bp.renesas.com> <20171213122052.GG6416@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2017 13:34:40 +0100
Message-ID: <CAMuHMdVY5PwEvZYBzC_f-W_n9ATST4_tfPBO4CakYo-93DvLtA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: ASoC: rsnd: Add device tree support for r8a774[35]
To: Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mark,

On Wed, Dec 13, 2017 at 1:20 PM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Dec 12, 2017 at 06:09:15PM +0000, Biju Das wrote:
>> Document r8a774[35] specific compatible strings. The Renesas RZ/G1[ME]
>> (r8a774[35]) sound modules are identical to the R-Car Gen2 family.
>> No driver change is needed as the fallback compatible string
>> "renesas,rcar_sound-gen2" activates the right code in the driver.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem.  This makes it easier for people to identify relevant
> patches.  Look at what existing commits in the area you're changing are
> doing and make sure your subject lines visually resemble what they're
> doing.

The confusing part here is that for most[*] subsystems, patches touching
only DT bindings should have a "dt-bindings" prefix, while patches touching
both DT bindings and driver code should have the drivers' subsystem prefix.

[*] I think you're about the only maintainer who insists on patches touching
only DT bindings having the drivers' subsystem prefix, which people tend to
forget, if they're even aware of that rule...

Can we improve this?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
