Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:44382 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751641AbeABOuV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 09:50:21 -0500
Received: by mail-qk0-f195.google.com with SMTP id v188so34205089qkh.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jan 2018 06:50:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171220082527.k7wldjwjxut3j4xz@verge.net.au>
References: <1513698884-26663-1-git-send-email-geert+renesas@glider.be> <20171220082527.k7wldjwjxut3j4xz@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jan 2018 15:50:19 +0100
Message-ID: <CAMuHMdXGVM1qkBNPDN_rrN5mby-iGy8s8VgEz_KmYswmufVohQ@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Mark rcar_sysc_matches[] __initconst
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Dec 20, 2017 at 9:25 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Dec 19, 2017 at 04:54:44PM +0100, Geert Uytterhoeven wrote:
>> rcar_sysc_matches[] is used only by rcar_sysc_pd_init(), which is
>> __init.  Hence mark rcar_sysc_matches[] __initconst.
>>
>> This frees another 1764 bytes (arm32/shmobile_defconfig) or 1000 bytes
>> (arm64/renesas_defconfig) of memory after kernel init.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <simon.horman@netronome.com>

Thank you.
Please note this is a patch intended for your soc-for-v4.16 branch ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
