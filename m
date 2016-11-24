Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:33059 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965895AbcKXPVF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 10:21:05 -0500
Received: by mail-qt0-f176.google.com with SMTP id p16so42801061qta.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Nov 2016 07:19:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWKcfOb6v0GQrcAadhPeM1d8M_EmNicZqpO0+2VfeoBog@mail.gmail.com>
References: <20161120174836.1787-1-pbrobinson@gmail.com> <CAMuHMdWKcfOb6v0GQrcAadhPeM1d8M_EmNicZqpO0+2VfeoBog@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Nov 2016 16:19:44 +0100
Message-ID: <CACRpkdZBfZBiJm2XLo+vw8r8CO7EBv4=jARvpe_f4bfDHbhDBQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: em: depnd on ARCH_SHMOBILE
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Robinson <pbrobinson@gmail.com>,
        Alexandre Courbot <gnurou@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 24, 2016 at 10:38 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sun, Nov 20, 2016 at 6:48 PM, Peter Robinson <pbrobinson@gmail.com> wrote:
>> The GPIO_EM is part of the Renesas SoCs so depend on the arch.

>>  config GPIO_EM
>>         tristate "Emma Mobile GPIO"
>> -       depends on ARM && OF_GPIO
>> +       depends on (ARCH_SHMOBILE || COMPILE_TEST) && OF_GPIO
>
> For ARM SoCs, ARCH_SHMOBILE is being phased out in favor of ARCH_RENESAS.
> Note that ARCH_SHMOBILE is also set for some SuperH SoCs.
>
> However, ARCH_EMEV2 is even more suitable here.

I fixed the patch in-tree to use ARCH_EMEV2 instead.

Thanks!

Yours,
Linus Walleij
