Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:43546 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751751AbeEDIas (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 May 2018 04:30:48 -0400
MIME-Version: 1.0
In-Reply-To: <CAH1o70K+T+B=mVWWZLqqRTcRVR3Uw7+Vyszm3vXewjpyb6mrcQ@mail.gmail.com>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
 <1525031296-16512-2-git-send-email-ykaneko0929@gmail.com> <CAMuHMdXx87yu-Q-9AghGr73ynSryXLBnrKATbTH7YiwD5v8WKA@mail.gmail.com>
 <CAH1o70K+T+B=mVWWZLqqRTcRVR3Uw7+Vyszm3vXewjpyb6mrcQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 May 2018 10:30:47 +0200
Message-ID: <CAMuHMdUuiXjBrAaV7U1Zauf8GT1AAV6_7n7uE2ytwjSYEe0RaA@mail.gmail.com>
Subject: Re: [PATCH/RFT 1/3] pinctrl: sh-pfc: r8a77965: Add SDHI pins, groups
 and functions
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kaneko-san,

On Fri, May 4, 2018 at 10:28 AM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> 2018-05-02 18:16 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
>> On Sun, Apr 29, 2018 at 9:48 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>>
>>> This patch adds SDHI{0,1,2,3} pins, groups and functions to the R8A77965
>>> SoC.
>>>
>>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>>
>> Thanks for your patch!
>>
>> The pins, groups, and functions are correct, so
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>.
>> i.e. queuing in sh-pfc-for-v4.18, after fixing up the below.
>
> Thanks for your review!
> I will fix up the below in V2.

There's no need to send a v2, as I have already fixed and applied your patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
