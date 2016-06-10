Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35847 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933087AbcFJMse (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 08:48:34 -0400
MIME-Version: 1.0
In-Reply-To: <4919239.TD95LLyWB6@avalon>
References: <1465553103-6345-1-git-send-email-geert+renesas@glider.be>
 <1465553103-6345-3-git-send-email-geert+renesas@glider.be> <4919239.TD95LLyWB6@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jun 2016 14:48:32 +0200
Message-ID: <CAMuHMdXWoYv5Yu56L-Kzu8gJ1HJEQ++qud-yDEfwoanJKiGu6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: sh-pfc: Improve core and user API separation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	linux-renesas-soc@vger.kernel.org,
	Linux-sh list <linux-sh@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Fri, Jun 10, 2016 at 2:16 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Friday 10 Jun 2016 12:05:02 Geert Uytterhoeven wrote:
>> The Renesas Pin Function Controller uses two header files:
>>   - sh_pfc.h, for use by both core code and SoC-specific drivers,
>>   - core.h, for internal use by the core code only.
>>
>> Several SoC-specific drivers include core.h, as they need the sh_pfc
>> structure, which is passed explicitly to the various SoC-specific
>> callbacks, and used there.
>>
>> Hence move its definition from core.h to sh_pfc.h, and remove the
>> inclusion of core.h from all SoC-specific files.
>
> The idea behind sh_pfc.h is to store all structures and macros needed by the
> SoC drivers to define SoC data, in order to keep core.h clean. It you move

So should there be 3 includes:
  1. structures and macros needed by the SoC drivers to define SoC data,
  2. internal API,
  3. API for users (SoC-specific drivers)?

> most of core.h to sh_pfc.h I'd rather merge the two files.

That's the other option...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
