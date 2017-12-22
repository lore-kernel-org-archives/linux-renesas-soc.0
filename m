Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:37480 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750961AbdLVIEf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Dec 2017 03:04:35 -0500
MIME-Version: 1.0
In-Reply-To: <20171221203125.GH27115@w540>
References: <1510743363-25798-1-git-send-email-jacopo+renesas@jmondi.org>
 <1510743363-25798-6-git-send-email-jacopo+renesas@jmondi.org>
 <1742042.6TTT7UTHfg@avalon> <20171221203125.GH27115@w540>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Dec 2017 09:04:34 +0100
Message-ID: <CAMuHMdWM+YwBeW6vQaP43huJ-fPJkP69qJ0DMBrQT62KX6D8ow@mail.gmail.com>
Subject: Re: [PATCH v1 05/10] arch: sh: migor: Use new renesas-ceu camera driver
To: jacopo mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Thu, Dec 21, 2017 at 9:31 PM, jacopo mondi <jacopo@jmondi.org> wrote:
> On Tue, Dec 12, 2017 at 12:00:43PM +0200, Laurent Pinchart wrote:
>> On Wednesday, 15 November 2017 12:55:58 EET Jacopo Mondi wrote:
>> The TV_IN_EN and CAM_EN signals (PTT2 and PTT0 GPIOs respectively) shouldn't
>> be difficult either. You can expose them as the PDN and PWDN GPIOs for the
>> OV7720 and TW9910 and handle them in the respective drivers. CAM_EN also
>> controls the digital video bus multiplexing, and unless I'm mistaken it will
>> just work as a side effect of power down signal control as long as you make
>> sure that the OV7720 remains in power down when not selected as the CEU input.
>
> Same as above, should I "gpio_request" or even better use the new
> "gpiod_" APIs in setup.c and pass to driver the result of the request
> or should I request the gpios in the drivers?

Can gpiod_add_lookup_table() provide a solution?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
