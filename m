Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:40962 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751629AbeBTMwF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 07:52:05 -0500
Received: by mail-qk0-f181.google.com with SMTP id h129so16190043qke.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2018 04:52:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB0895EAF0145A06D1A11F5B32C0F70@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
 <1518086057-19448-2-git-send-email-geert+renesas@glider.be> <TY1PR06MB0895EAF0145A06D1A11F5B32C0F70@TY1PR06MB0895.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 13:52:04 +0100
Message-ID: <CAMuHMdX1K9SqpBXsfeva55ozgWf1DRLG9JwgfZGW_evcdyzZbw@mail.gmail.com>
Subject: Re: [PATCH/RFC 01/11] clk: renesas: r8a7792: Add rwdt clock
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 12, 2018 at 6:50 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>> Subject: [PATCH/RFC 01/11] clk: renesas: r8a7792: Add rwdt clock
>>
>> Add "rwdt" clock to r8a7792_mod_clks. Also, since we may need to access
>> the watchdog registers at any time, declare the clock as critical.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Acked-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, queued in clk-renesas-for-v4.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
