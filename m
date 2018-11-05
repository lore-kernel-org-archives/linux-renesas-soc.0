Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:46817 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbeKETv2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 14:51:28 -0500
Received: by mail-ua1-f67.google.com with SMTP id v24so2961690uap.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Nov 2018 02:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 11:32:15 +0100
Message-ID: <CAMuHMdU9KewOQLaNrrWxd3YfLJs+uwto9=fSwo9r6QQCYMy2gA@mail.gmail.com>
Subject: Re: [PATCH 0/2] renesas: rcar-gen3: add HS400 quirk for SD clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Thu, Nov 1, 2018 at 12:26 AM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> This is the result of the SDHI hackathon for a possible solution to the
> clock issue on early ES versions. It is based on the Gen2 solution where
> a row of the possible clock settings are ignored on the effected SoC+ES
> versions. The first row is not effected when reading settings left by
> the bootloader, only when the setting the clock.

To clarify, you decided not to describe the SDH clock in DT, but went for
heuristics with a quirk instead?

Is there any chance this can start to bite us in the future?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
