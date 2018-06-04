Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:40469 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750866AbeFDIt5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 04:49:57 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVb2q=S6ucYCpwnVse-COefcuUGT6DO5Ympo+BjiVN9sg@mail.gmail.com>
References: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
 <c83970ff-337d-6628-6976-e1665c44dd0b@cogentembedded.com> <CAMuHMdVb2q=S6ucYCpwnVse-COefcuUGT6DO5Ympo+BjiVN9sg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Jun 2018 10:49:56 +0200
Message-ID: <CAMuHMdViPmSvQtHLCkEKfESJ-Cop9bdUz=yq9pe=zFW3AiX15g@mail.gmail.com>
Subject: Re: [PATCH 1/3] sh_eth: make sh_eth_soft_swap() work on ARM
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 4, 2018 at 10:48 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sat, Jun 2, 2018 at 9:37 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
>> Browsing  thru the driver disassembly, I noticed that ARM gcc generated
>> no  code  whatsoever for sh_eth_soft_swap() while building a little-endian
>> kernel -- apparently __LITTLE_ENDIAN__ was not being #define'd, however
>> it got implicitly #define'd when building with the SH gcc (I could only
>> find the explicit #define __LITTLE_ENDIAN that was #include'd when building
>> a little-endian kernel).  Luckily, the Ether controller  only doing big-
>> endian DMA is encountered on the early SH771x SoCs only and all ARM SoCs
>> implement EDMR.DE and thus set 'sh_eth_cpu_data::hw_swap'. But anyway, we
>> need to fix the #ifdef inside sh_eth_soft_swap() to something that would
>> work on all architectures...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Forgot to say: nice catch ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
