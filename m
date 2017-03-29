Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:37810 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755152AbdC2KDJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 06:03:09 -0400
Received: by mail-it0-f46.google.com with SMTP id 190so49663874itm.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Mar 2017 03:03:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWVM2K4V+TnUGiW601+OjUBQTbnd9LU7yLGRRew06KxjQ@mail.gmail.com>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-2-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdYjZJ7e0tJy6_jfpRT+UDFWqnu8ZX18-gaAHVZLgW-prA@mail.gmail.com> <CAMuHMdWVM2K4V+TnUGiW601+OjUBQTbnd9LU7yLGRRew06KxjQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Mar 2017 12:03:06 +0200
Message-ID: <CACRpkdayQSv4S7VhbkigYTXCrr8R23dFXRLXSW+OKjjM57-0HQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] pinctrl: Renesas RZ/A1 pin and gpio controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 29, 2017 at 9:30 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Mar 24, 2017 at 4:42 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Fri, Mar 24, 2017 at 4:22 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>>
>> I assume Geert will queue this driver even if it is outside of sh-pfc?
>
> OK for me, thanks. I was actually wondering about that ;-)

Thanks Geert, much appreciated.

Yours,
Linus Walleij
