Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35544 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932193AbdEKI57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 May 2017 04:57:59 -0400
MIME-Version: 1.0
In-Reply-To: <20170426070925.GA25517@verge.net.au>
References: <1493141161-28069-1-git-send-email-geert+renesas@glider.be> <20170426070925.GA25517@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2017 10:57:57 +0200
Message-ID: <CAMuHMdUnVXfUTok=cA7-eE-fFJsJYfRkpXqzLchJXPnvFYT=Vw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Do not build clk-div6 for R8A7792
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 26, 2017 at 9:09 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Apr 25, 2017 at 07:26:01PM +0200, Geert Uytterhoeven wrote:
>> R-Car V2H does not have "DIV6" programmable clocks, hence there is no
>> need to build clk-div6.o.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> To be queued up in clk-renesas-for-v4.13.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, queued.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
