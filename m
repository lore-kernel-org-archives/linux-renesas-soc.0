Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36440 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1166446AbdDXIJy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 04:09:54 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVvo2XSmvgfDqijur20NBvMchJThsRt86Eijx46meV08Q@mail.gmail.com>
References: <1492624001-3758-18-git-send-email-ykaneko0929@gmail.com> <CAMuHMdVvo2XSmvgfDqijur20NBvMchJThsRt86Eijx46meV08Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Apr 2017 10:09:52 +0200
Message-ID: <CAMuHMdWMXdU-7jyRFbMzm8z8WzYVUPzJFh-jGHbcTXcCT6VJmA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7796: add PWM clock
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 20, 2017 at 7:53 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Apr 19, 2017 at 7:46 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>> From: Ryo Kodama <ryo.kodama.vz@renesas.com>
>>
>> This patch adds PWM clock for PWM.
>>
>> Signed-off-by: Ryo Kodama <ryo.kodama.vz@renesas.com>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> ---
>> This patch is based on the clk-next branch of linux-clk tree.
>>
>>  drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
>> index c5523aa..64714ca 100644
>> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
>> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
>> @@ -156,6 +156,7 @@ enum clk_ids {
>>         DEF_MOD("hscif1",                519,   R8A7796_CLK_S3D1),
>>         DEF_MOD("hscif0",                520,   R8A7796_CLK_S3D1),
>>         DEF_MOD("thermal",               522,   R8A7796_CLK_CP),
>> +       DEF_MOD("pwm",                   523,   R8A7796_CLK_S3D4),
>
> Repeating myself, cfr. my response to Ulrich:
>
>      My copy of the R-Car Gen3 user manual rev. 0.53 says S0D12.

Fixing that up while applying.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
