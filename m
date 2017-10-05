Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36022 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbdJEU3s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 16:29:48 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXjD-MpW9sqKtdUasizN8YkWuzChNyduyHz7p-cz38VBg@mail.gmail.com>
References: <20171005120914.465582-1-arnd@arndb.de> <CAMuHMdXjD-MpW9sqKtdUasizN8YkWuzChNyduyHz7p-cz38VBg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 Oct 2017 22:29:47 +0200
Message-ID: <CAK8P3a1BkwquyVgRAsRgt2d5jv7TGoKPhA_gA0p+UQ9Spu_g2w@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: fix non-SMP build
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 5, 2017 at 2:25 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Oct 5, 2017 at 2:09 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>  arch/arm/mach-shmobile/headsmp-apmu.S | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/mach-shmobile/headsmp-apmu.S b/arch/arm/mach-shmobile/headsmp-apmu.S
>> index db4743d2bf91..5672b5849401 100644
>> --- a/arch/arm/mach-shmobile/headsmp-apmu.S
>> +++ b/arch/arm/mach-shmobile/headsmp-apmu.S
>
> As this hasn't been pulled into arm-soc yet (pull request sent though),
> perhaps Simon should squash this fix into the original commit?
> Should we rename headsmp-apmu.S to head-apmu.S?

I'm fine with it either way, just do whatever works best for you here.

     Arnd
