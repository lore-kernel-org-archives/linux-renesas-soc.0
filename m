Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33015 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750757AbcKEVZV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Nov 2016 17:25:21 -0400
Received: by mail-lf0-f52.google.com with SMTP id c13so87810457lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Nov 2016 14:25:20 -0700 (PDT)
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: add R8A7745 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <13079532.zQoaX56ouR@wasted.cogentembedded.com>
 <5012234.NZmvoVqhq0@wasted.cogentembedded.com>
 <CAMuHMdUD_U5YqOnWv3Oo8P_Oxbh=qMP9wAtJmEgt-2eW4y3XqQ@mail.gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <34a88248-72db-e526-d6e7-30ac2009415b@cogentembedded.com>
Date: Sun, 6 Nov 2016 00:25:15 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUD_U5YqOnWv3Oo8P_Oxbh=qMP9wAtJmEgt-2eW4y3XqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/02/2016 06:47 PM, Geert Uytterhoeven wrote:

>> Add RZ/G1E (R8A7745) Clock  Pulse Generator / Module Standby and Software
>> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
>> (and RZ/G) code.
>>
>> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
>> <geert+renesas@glider.be>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Thanks a lot for your patch!
>
>> --- /dev/null
>> +++ linux/drivers/clk/renesas/r8a7745-cpg-mssr.c
>> @@ -0,0 +1,261 @@
[...]
>> +static const struct mssr_mod_clk r8a7745_mod_clks[] __initconst = {
>
>> +       DEF_MOD("fdp1-1",         118,  R8A7745_CLK_ZS),
>
> FDP1-1 does not exist on RZ/G1E.

    Sorry, I somehow forgot about this one... will respin!

MBR, Sergei
