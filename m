Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CACRpkdbkBtJGJ_5MVy2QSAa0zcKVm=_H+vC_kH4AUcX58TiaLg@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-3-git-send-email-jacopo+renesas@jmondi.org> <CACRpkdbkBtJGJ_5MVy2QSAa0zcKVm=_H+vC_kH4AUcX58TiaLg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 28 Apr 2017 19:23:17 +0300
Message-ID: <CAHp75VfTTQAHkZs3peTa3EE6v0FBw7D0W2q+5OO2WKA38SGE+g@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] pinctrl: generic: Add macros to unpack properties
To: Linus Walleij <linus.walleij@linaro.org>
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
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 28, 2017 at 11:16 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Thu, Apr 27, 2017 at 10:19 AM, Jacopo Mondi
> <jacopo+renesas@jmondi.org> wrote:

> But why.
>
> I have these two static inlines just below your new macros:

+1.

> We generally prefer static inlines over macros because they are easier
> to read.

Not only. It adds type checking as well AFAIUC.

-- 
With Best Regards,
Andy Shevchenko
