Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36461 "EHLO
	mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753302AbcFQQUA (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 12:20:00 -0400
Received: by mail-it0-f67.google.com with SMTP id h190so11356608ith.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2016 09:19:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAO3366zM=x5HSOMZ6WqEhTr5piQQdSV6vnr7qE48c=Bvm612LQ@mail.gmail.com>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
 <1466072862-28030-4-git-send-email-geert+renesas@glider.be> <CAO3366zM=x5HSOMZ6WqEhTr5piQQdSV6vnr7qE48c=Bvm612LQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jun 2016 18:19:58 +0200
Message-ID: <CAMuHMdXm63mXvhAmjcNg-jLavB0s5Vsq1Jg49Zaxv2Q2MptpmQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] soc: renesas: rcar-sysc: Make rcar_sysc_init()
 init the PM domains
To: Ulrich Hecht <ulrich.hecht@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	"open list:MEDIA DRIVERS FOR RENESAS - FCP"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Fri, Jun 17, 2016 at 5:57 PM, Ulrich Hecht <ulrich.hecht@gmail.com> wrote:
>> --- a/drivers/soc/renesas/rcar-sysc.c
>> +++ b/drivers/soc/renesas/rcar-sysc.c
>> @@ -164,15 +164,6 @@ static bool rcar_sysc_power_is_off(const struct rcar_sysc_ch *sysc_ch)
>>         return false;
>>  }
>>
>> -void __iomem *rcar_sysc_init(phys_addr_t base)
>> -{
>> -       rcar_sysc_base = ioremap_nocache(base, PAGE_SIZE);
>> -       if (!rcar_sysc_base)
>> -               panic("unable to ioremap R-Car SYSC hardware block\n");
>
> Is this check no longer necessary?

If this failed (out of memory) this early in the boot process, we're gonna die
anyway.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
