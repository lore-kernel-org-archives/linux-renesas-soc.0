Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:37810 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932738AbdC2Bnu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 21:43:50 -0400
Received: by mail-it0-f53.google.com with SMTP id 190so40469205itm.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Mar 2017 18:43:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170324164559.GA15925@w540>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-2-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdYjZJ7e0tJy6_jfpRT+UDFWqnu8ZX18-gaAHVZLgW-prA@mail.gmail.com> <20170324164559.GA15925@w540>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Mar 2017 03:43:48 +0200
Message-ID: <CACRpkdb48JqghacTsJfiPWHZdpfD1cg1Z7rVWQJO+BmVpVbKHg@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] pinctrl: Renesas RZ/A1 pin and gpio controller
To: jacopo <jacopo@jmondi.org>
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

On Fri, Mar 24, 2017 at 5:45 PM, jacopo <jacopo@jmondi.org> wrote:

> I initially created a whole new sub-directory where all the Renesas
> devices with this kind of pin controller would have gone
> (drivers/pinctrl/rz-pfc) but since as of now the only available
> hardware of that type is RZ/A1 and some of its variants, we decided to go
> with a single driver supporting that platform only.
> If more will come, we'll think about supporting them through this
> driver if possible, or create a dedicated directory.
>
> Are you ok with this?

Yep it's OK. It's no big deal to move it into a new subdir if many
new drivers start popping in anyway.

Right now I see the use of renesas,pins as the only big blocker,
I would much like it to use just pins = <>;

Yours,
Linus Walleij
