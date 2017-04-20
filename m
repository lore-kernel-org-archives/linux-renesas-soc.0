Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34524 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031205AbdDTKLo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 06:11:44 -0400
MIME-Version: 1.0
In-Reply-To: <3839999.H9bRVaxdVd@avalon>
References: <1492681746-20005-1-git-send-email-geert+renesas@glider.be> <3839999.H9bRVaxdVd@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2017 12:11:41 +0200
Message-ID: <CAMuHMdWYWWVuFWz7kULLbZeOxVAssFQ584cO45THrLQ6FwTYSA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add group for AVB MDIO and MII pins
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Thu, Apr 20, 2017 at 12:02 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thursday 20 Apr 2017 11:49:06 Geert Uytterhoeven wrote:
>> Group the AVB pins into similar groups as found in other sh-pfc drivers.
>> The pins can not be muxed between functions other than AVB, but their
>> drive strengths can be controlled.
>>
>> The group avb_mdc containing ADV_MDC and ADV_MDIO is called avb_mdio on
>> other SoCs.  In pfc-r8a7796 the avb_mdc group already existed and is in
>> use in DT. Therefore add the ADV_MDIO pin to the existing group instead
>> of renaming it.
>
> This clearly shows that we need a few kernel releases to test PFC-related code
> and DT before we can commit to an ABI. How do you think we should handle this
> ?

That's a difficult question ;-)

For now I'd like to treat R-Car M3-W the same as H3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
