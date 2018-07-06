Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35688 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754036AbeGFUNR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 16:13:17 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXTF=Zfm7Dm1+_q6yhccQXYsPc=wQaHDBSsq4X7ujg4sQ@mail.gmail.com>
References: <20180706151610.3783638-1-arnd@arndb.de> <CAMuHMdXTF=Zfm7Dm1+_q6yhccQXYsPc=wQaHDBSsq4X7ujg4sQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 6 Jul 2018 22:13:14 +0200
Message-ID: <CAK8P3a3qCAxBKBs0vcr0Y9HXm0DHY7aii4S3P7M010JOkcxCvw@mail.gmail.com>
Subject: Re: [PATCH] soc: r9a06g032: don't build SMP fiiles for non-SMP config
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 6, 2018 at 5:23 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Arnd,
>
> On Fri, Jul 6, 2018 at 5:16 PM Arnd Bergmann <arnd@arndb.de> wrote:
>> Without CONFIG_SMP, we get a build failure:
>>
>> In file included from include/linux/byteorder/little_endian.h:5,
>>                  from arch/arm/include/uapi/asm/byteorder.h:22,
>>                  from include/asm-generic/bitops/le.h:6,
>>                  from arch/arm/include/asm/bitops.h:342,
>>                  from include/linux/bitops.h:18,
>>                  from include/linux/kernel.h:11,
>>                  from include/asm-generic/bug.h:18,
>>                  from arch/arm/include/asm/bug.h:60,
>>                  from include/linux/bug.h:5,
>>                  from include/linux/io.h:23,
>>                  from drivers/soc/renesas/r9a06g032-smp.c:11:
>> drivers/soc/renesas/r9a06g032-smp.c: In function 'r9a06g032_smp_boot_secondary':
>> drivers/soc/renesas/r9a06g032-smp.c:43:21: error: 'secondary_startup' undeclared (first use in this function)
>>   writel(__pa_symbol(secondary_startup), cpu_bootaddr);
>>                      ^~~~~~~~~~~~~~~~~
>>
>> This makes the compilation of that file conditional on SMP support.
>> It would probably be better for consistency to leave that file
>> in arch/arm/mach-shmobile/, matching what we do for all other smp
>> operations.
>
> Shouldn't that comment be moved below the "---"? ;-)

Maybe

> I thought the (10Y ;-) plan was to have no more code under arch/arm/mach-*/?
> Note that the suport for the new RZ/N1D SoC doesn't use any other code in
> mach-shmobile.

The SMP code is the main part we never figured out where else to put,
so it's typically the only thing we still have for new platforms under
arch/arm/.

>> Fixes: cde4f86f9249 ("arm: shmobile: Add the R9A06G032 SMP enabler driver")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
