Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:34219 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752230AbeBTPV0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 10:21:26 -0500
Received: by mail-qt0-f194.google.com with SMTP id d14so16801213qtg.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2018 07:21:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d1ccc505-8ca2-f396-77f8-eed3f9fbd3ee@ideasonboard.com>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1518696091-23561-5-git-send-email-ulrich.hecht+renesas@gmail.com> <d1ccc505-8ca2-f396-77f8-eed3f9fbd3ee@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 16:21:25 +0100
Message-ID: <CAMuHMdWzkjnzbubV2HG7J8m2k63nTFWJD7gwH1TQXAN_M9i9yg@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: sh-pfc: r8a77995: Add DU pins, groups and function
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 1:38 PM, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> On 15/02/18 12:01, Ulrich Hecht wrote:
>> This patch adds DU pins, groups and function for the R8A77995 (D3) SoC.
>>
>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>
> All of your pin values check out.
> (And it highlights that I may have left a copy/paste/fail-to-update on the
> du_disp in my version)
>
> Generic question below regarding DOTCLK naming, but it's not a blocker to this
> patch, so:
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
and queueing in sh-pfc-for-v4.17.

>> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
>> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c

>> +static const unsigned int du_clk_in_1_pins[] = {
>> +     /* CLKIN */
>> +     RCAR_GP_PIN(1, 28),
>> +};
>> +static const unsigned int du_clk_in_1_mux[] = {
>> +     DU_DOTCLKIN1_MARK
>> +};
>> +static const unsigned int du_clk_out_0_pins[] = {
>> +     /* CLKOUT */
>> +     RCAR_GP_PIN(1, 24),
>> +};
>> +static const unsigned int du_clk_out_0_mux[] = {
>> +     DU_DOTCLKOUT0_MARK
>> +};
>
> Why do the DOTCLKOUT and DOTCLKIN pins get named clk_out_ and clk_in_ ?
>
> All of the other pins seem to entirely follow the pin name as per the datasheet,
> except for these.

Historical reasons, I guess. It's the case on all older SoCs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
