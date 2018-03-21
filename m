Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:40256 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751455AbeCUJzp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Mar 2018 05:55:45 -0400
Received: by mail-qk0-f175.google.com with SMTP id o64so4759313qkl.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Mar 2018 02:55:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e381eeea-7986-d980-fc02-354a80f8f58b@cogentembedded.com>
References: <152153161677.8310.9675462405281337962.sendpatchset@little-apple> <e381eeea-7986-d980-fc02-354a80f8f58b@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Mar 2018 10:55:43 +0100
Message-ID: <CAMuHMdX11Y1pKePrE=YOZyekcZNkPfN4bx6MzYCG8qgWPKp-ug@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Adjust r8a77980 ifdef
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 20, 2018 at 8:04 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 03/20/2018 10:40 AM, Magnus Damm wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Adjust the R8A77980-specific #ifdefs to use CLK instead of ARCH
>> to follow same style as other SoCs.
>
>    I guess we should add:
>
> Fixes: ce15783c510a ("clk: renesas: cpg-mssr: add R8A77980 support")
>
>    Hopefully, it would be an immutable SHA1...
>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thank you, will queue in clk-renesas-for-v4.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
