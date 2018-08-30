Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33276 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbeH3Pxg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 11:53:36 -0400
Received: by mail-io0-f195.google.com with SMTP id r196-v6so7303825iod.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 04:51:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180829084913.fgdrigpeu3vi7vqs@ninjato>
References: <1534999460-15111-1-git-send-email-yamada.masahiro@socionext.com>
 <1534999460-15111-7-git-send-email-yamada.masahiro@socionext.com> <20180829084913.fgdrigpeu3vi7vqs@ninjato>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 30 Aug 2018 13:51:49 +0200
Message-ID: <CAPDyKFq6wX9jP0c5688fWVAmnZja9OZXbECwoKbKBXuM2r5cbg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] mmc: tmio: refactor CLK_CTL bit calculation
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 29 August 2018 at 10:49, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> +     if (divisor <= 1) {
>> +             clk_sel = 1;
>> +             clk = 0;
>> +     } else {
>> +             clk_sel = 0;
>> +             /* bit7 set: 1/512, ... bit0 set:1/4, all bits clear: 1/2 */
>> +             clk = roundup_pow_of_two(divisor) >> 2;
>> +     }
>
> What about
>
>         clk_sel = (divisor <= 1);
>         clk = clk_sel ? 0 : (roundup_pow_of_two(divisor) >> 2)
>
> More concise, but I think still readable. I don't mind super much,
> though.

Right. So, may I apply Yamada-san's original patch (adding your
tested/reviewed-by tag) and the above as a code-cleanup for you to
address on top?

Kind regards
Uffe
