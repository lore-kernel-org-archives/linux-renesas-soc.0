Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46294 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbeK1En4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 23:43:56 -0500
Received: by mail-lj1-f194.google.com with SMTP id v15-v6so20829051ljh.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Nov 2018 09:45:16 -0800 (PST)
Subject: Re: [PATCH 4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
 <0e51165d-65cb-1522-3174-b63818180070@cogentembedded.com>
 <CAMuHMdX6n860T9oOgYiqxiF0QpNyKqEtQW9yEksAv_A02Z9qRw@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5cb1471a-db86-e074-6585-10d625738d5a@cogentembedded.com>
Date: Tue, 27 Nov 2018 20:45:09 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX6n860T9oOgYiqxiF0QpNyKqEtQW9yEksAv_A02Z9qRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/23/2018 03:59 PM, Geert Uytterhoeven wrote:

>> Add the RPCSRC internal clock on R-Car V3H (R8A77980) -- it's controlled
>> by the RPCCKCR.DIV[4:3] on all the R-Car gen3 SoCs except V3M (R8A77970)
>> but the encoding of this field is different between SoCs.
> 
> Given the tables and encoding are the same on H3, M3-W, M3-N, and V3H,
> I think it makes sense to move the common support to rcar-gen3-cpg.c.

   Done.

> Heck, you could even just select a different table on D3/E3 using
> soc_device_match(), if only one encoding would not select a different parent
> clock :-(

   Indeed...

>> Add the RPC[D2] clocks (derived from this internal clock) and the RPC-IF
>> module clock as well...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
>> --- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
>> +++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
[...]
>> +               const struct clk *parent = clks[core->parent];
>> +
>> +               if (IS_ERR(parent))
>> +                       return ERR_CAST(parent);
>> +
>> +               return clk_register_divider_table(NULL, core->name,
>> +                                                 __clk_get_name(parent), 0,
>> +                                                 base + CPG_RPCCKCR, 3, 2, 0,
>> +                                                 cpg_rpcsrc_div_table, NULL);
> 
> Don't you need a spinlock (last parameter, currently NULL)?
> This needs to be synchronized with controlling the RPCD2 and RPC clocks,
> as they operate on the same register.

   Indeed. How about the RMW accesses to the other register? I'd like to place
the lock/unlock right in cpg_reg_modify()...

> However, that would deadlock, as enabling e.g. RPC-IF will enable
> all parent clocks?

  Could toy please elaborate?

>> +       } else  {
>> +               return rcar_gen3_cpg_clk_register(dev, core, info, clks, base,
>> +                                                 notifiers);
>> +       }
> 
> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
