Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1503564738-32392-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1503564738-32392-1-git-send-email-jacopo+renesas@jmondi.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 31 Aug 2017 14:45:47 +0200
Message-ID: <CACRpkdZXvjOkafYLDyKMshcH36s38tQ0wMbdz1CKpb1OhKKxOQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rza1: Remove suffix from gpiochip label
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 24, 2017 at 10:52 AM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:

> The OF node name already contains the gpio chip identifier, no need to
> append it when creating the label.
>
> The following debug message clearly shows the suffix is not required
> "pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-0-0 with 6
> pins"
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Patch applied.

Yours,
Linus Walleij
