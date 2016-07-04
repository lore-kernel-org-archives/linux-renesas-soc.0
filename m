Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36775 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753362AbcGDTSx (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 4 Jul 2016 15:18:53 -0400
MIME-Version: 1.0
In-Reply-To: <37b292fe-3a14-62d6-bdc5-7f7e5e93d958@cogentembedded.com>
References: <1748403.xeiuK39ynx@wasted.cogentembedded.com> <6941131.ZKfJHhvm82@wasted.cogentembedded.com>
 <CAMuHMdXYLg7nQ1rTHnuTG2-2J1veApAcizA6j_5-UE1jPs2TPA@mail.gmail.com> <37b292fe-3a14-62d6-bdc5-7f7e5e93d958@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Jul 2016 21:18:52 +0200
Message-ID: <CAMuHMdV2rmsNt-3SLWoHTsHgGjMsF+AdjmFHKdoEL4xNVca-yA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: fix overly long lines
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Mon, Jul 4, 2016 at 9:15 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 07/01/2016 10:50 AM, Geert Uytterhoeven wrote:
>>> The PORT_GP_CFG_<n>() macros take up more than 80 columns -- and not for
>>> a good reason. Make the header file checkpatch.pl-proof at least in this
>>> respect...
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> But it doesn't apply, due to "pinctrl: sh-pfc: Initial R8A7796 PFC
>> support"
>
>    ... and *still* not merged? Or am I looking at a wrong tree? :-/

No, it's not yet merged. IIRC, there were review comments ;-)

>> which was submitted one day earlier.
>
>    I don't think that matters... What matters are the order of merges.

Right... It's getting a bit late for v4.8, though...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
