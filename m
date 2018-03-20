Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:38859 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751459AbeCTJhX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 05:37:23 -0400
Received: by mail-qk0-f196.google.com with SMTP id 132so887032qkd.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Mar 2018 02:37:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB1562ED183D137FA48FCBC7DB8AD70@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <cover.1521208546.git.horms+renesas@verge.net.au>
 <faa6c0071114fd433e83dddd3a42fba547ca9a67.1521208546.git.horms+renesas@verge.net.au>
 <TY1PR01MB1562ED183D137FA48FCBC7DB8AD70@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Mar 2018 10:37:21 +0100
Message-ID: <CAMuHMdXdvH4Ywj_3rr8MSi-9AKN=WoDtdwHQdAJF=w0RJ8maaA@mail.gmail.com>
Subject: Re: [PATCH 42/52] ARM: dts: r7s72100: add USB device to device tree
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Mar 16, 2018 at 4:02 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, March 16, 2018 1, Simon Horman wrote:
>> From: Chris Brandt <chris.brandt@renesas.com>
>>
>> Add USB device support.
>>
>> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> This patch is already in mainline:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a99b6ad4da2f90969bb2ebb426c1d3dd0089fa4
>
> Pushed by Greg.
>
> At one point Greg applied it, then reverted it (as requested by Geert),
> but then somehow it still went in.

It's not present in upstream:

$ git grep usbhs0 v4.16-rc6 -- arch/arm/boot/dts/r7s72100.dtsi
$

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
