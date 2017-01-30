Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:37173 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753286AbdA3Nvu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 08:51:50 -0500
Received: by mail-it0-f49.google.com with SMTP id r185so101455666ita.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2017 05:51:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Jan 2017 14:51:42 +0100
Message-ID: <CACRpkdYzbquN_5eFepT6BhNgfM2FxwrjvYsMRD4o2NN4-O4kfw@mail.gmail.com>
Subject: Re: [RFC 0/5] Renesas RZ series pinctrl driver
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ext Tony Lindgren <tony@atomide.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

>    after having discussed in great detail the RZ series per-pin PFC hardware
> peculiarities, this is a proposal for a possible pin-based pin controller
> driver for SoC devices of Renesas RZ family.
>
> This RFC series adds a minimal driver infrastructure which supports pin
> multiplexing via explicit per-pin settings performed in device tree sources.

I think this is what Laurent had in mind when he said something about
that he should have taken the per-pin approach from day 1.

I would especially like to see Laurent's review and ACK on this series
for that reason so we don't create something less than what he is
expecting for the future of Renesas pin control.

The series as such seems fine and is reusing Tony's work to generalize
pin controllers putting functions and groups into the device tree in a nice
way, which makes it relevant for him to have a look as well, if he has
time.

Yours,
Linus Walleij
