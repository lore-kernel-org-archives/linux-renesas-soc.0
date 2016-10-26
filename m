Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33571 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966337AbcJZNXk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 09:23:40 -0400
Received: by mail-lf0-f41.google.com with SMTP id x79so6276595lff.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Oct 2016 06:23:36 -0700 (PDT)
Subject: Re: [PATCH v4 0/7] Add R8A7743/SK-RZG1M board support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <2719479.geOc9vqcRS@wasted.cogentembedded.com>
 <CAMuHMdUNgnYc1O7DATNH1r9SQ72eqtxwFvqcen08Tq+Er3LuvQ@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1a85f851-29ec-1c14-8905-8b0645f5bb1c@cogentembedded.com>
Date: Wed, 26 Oct 2016 16:23:33 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUNgnYc1O7DATNH1r9SQ72eqtxwFvqcen08Tq+Er3LuvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/26/2016 03:08 PM, Geert Uytterhoeven wrote:

>>    Here's the set of 8 patches against Simon Horman's 'renesas.git' repo's
>> 'renesas-devel-20161021-v4.9-rc1' tag. I'm adding the device tree support for
>> the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
>> seems identical to the R8A7791/Porter board. The device tree patches depend on
>> the R8A7743 CPG/MSSR driver series just posted in order to compile and work.
>
> They depend only on "[PATCH v3 1/2] ARM: shmobile: r8a7743: add CPG clock
> index macros" of that series, right?
>
> "[PATCH v3 2/2] clk: renesas: cpg-mssr: add R8A7743 support" is not needed,

    How would "clocks" props _work_ without this patch?

> and introduces an additional dependency on "[PATCH 1/3] clk: renesas:
> cpg-mssr: add common R-Car Gen2 support".

    Yes, of course...

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
