Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:38897 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753313AbeFGHk5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 03:40:57 -0400
MIME-Version: 1.0
In-Reply-To: <3317638e-8688-35ef-ab61-7281312f2c3f@gmail.com>
References: <20180606100003.17067-1-marek.vasut+renesas@gmail.com>
 <20180606100003.17067-4-marek.vasut+renesas@gmail.com> <CAMuHMdXdoAaBbx+_G3+n=e+zki3z20t7ATXttDUnmYRu95HMVA@mail.gmail.com>
 <3317638e-8688-35ef-ab61-7281312f2c3f@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Jun 2018 09:40:54 +0200
Message-ID: <CAMuHMdWsZYDeqS4jao0isVVVpG+gFFW1LkOGhcnU7U3+6reHAA@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] mfd: da9063: Use REGMAP_IRQ_REG
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Wed, Jun 6, 2018 at 6:06 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 06/06/2018 01:31 PM, Geert Uytterhoeven wrote:
>> On Wed, Jun 6, 2018 at 11:59 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>> Convert the regmap_irq table to use REGMAP_IRQ_REG().
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Again:
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Added.
>
> And the obvious question is, what do you all use to collect these tags?
> Doing it manually sucks.

1. Add green star (in gmail) to email supplying tag,
2. Once in a while, filter using has:green-star, and git rebase -i my queue,
   adding tags and changelogs to the commits in git.

Hope this helps.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
