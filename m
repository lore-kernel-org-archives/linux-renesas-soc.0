Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:37584 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751263AbdH3JJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 05:09:44 -0400
Received: by mail-pf0-f194.google.com with SMTP id a2so3959870pfj.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Aug 2017 02:09:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6cad207c-8f9e-3ed9-36e7-16963a6a3892@de.bosch.com>
References: <705d6de1-a037-f1e1-8c61-7b5aa5e0f30a@de.bosch.com>
 <CAMuHMdVuBqSLjMg+r1y7_TRSDL5r1tLhTewfgr5xU9hZup=PLA@mail.gmail.com>
 <1664e732-4e38-06fb-cfef-d42b49a45d62@de.bosch.com> <CAMuHMdXzuUzGnUkMfMdMcV5fCcsLn5uP4XQUkh9tfzAsfo0_ww@mail.gmail.com>
 <6cad207c-8f9e-3ed9-36e7-16963a6a3892@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Aug 2017 11:09:44 +0200
Message-ID: <CAMuHMdXJfrwvK+N8pek6y4ZMQ_oVo2dh+J5Wse5wDpEBGMeUuQ@mail.gmail.com>
Subject: Re: clk: renesas: rcar-gen3: Status of Z* clocks?
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Tue, Aug 29, 2017 at 12:36 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> On 29.08.2017 11:44, Geert Uytterhoeven wrote:
>> On Tue, Aug 29, 2017 at 11:15 AM, Dirk Behme <dirk.behme@de.bosch.com>
>> wrote:
>>>
>>> But ZG and with this module clock #112 is still missing, no?
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=aa7b99b06d280e4151e
>>>
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=a03bfd8abc9572800fb5043
>>
>>
>> The ZG bits in the FRQCRB register are documented to exist on R-Car D3
>> only.
>
> ... what contradicts
>
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=a03bfd8abc9572800fb5043
>
> and the 3DGE module clock in e.g. MSTPSR1 which is documented for H3 and
> M3-W, too, and Table 8.1a List of Clocks [R-Car H3] ZG -> 3DGE etc.

That commit doesn't use CLK_TYPE_GEN3_ZG, but models ZG as PLL4/4,
which matches the block diagram and the list of clocks.
So that one is acceptable (modulo upstream (non)use of  the 3DGE module?).

Later, ZG is changed to use the non-documented bits, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=054863e7a5855be9b4652c588c140d49bede4dc4

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
