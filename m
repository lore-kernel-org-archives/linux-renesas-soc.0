Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:36671 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755283AbeBOKcr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:32:47 -0500
Received: by mail-qk0-f173.google.com with SMTP id 15so30260142qkl.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2018 02:32:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180215101944.qtiquqqhgmg3gbrt@katana>
References: <20180215100208.24646-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdVO7sxRjj7h=ar+bA8B3Art=Yyyr66cRqC30pw3Zz+Vag@mail.gmail.com> <20180215101944.qtiquqqhgmg3gbrt@katana>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Feb 2018 11:32:46 +0100
Message-ID: <CAMuHMdXxPk=78D-hFrZvsByCEqh=+JY8C0iCdDy8FzTBPxnKDQ@mail.gmail.com>
Subject: Re: [PATCH V2] ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Feb 15, 2018 at 11:19 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> As the code now always sends 3 i2c msgs to all 3 possible regulators, we
>> may accidentally talk to another device at 0x70 on other boards than Stout.
>
> It sends per device, so unless there is a device named "da9210" at
> addr 0x70, nothing will happen? Am I missing something?

As soon as one of the affected devices is instantiated, it has to shut up
all devices. This is done by sending the whole da9xxx_msgs[] array,
which needs modification now we have boards with two or three devices.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
