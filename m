Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:33802 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751921AbdDKJFn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Apr 2017 05:05:43 -0400
Received: by mail-io0-f170.google.com with SMTP id a103so63115826ioj.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Apr 2017 02:05:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Apr 2017 11:05:41 +0200
Message-ID: <CACRpkdaxdDX71m4EGSHD2OV1gQsCwQeOCyeMDCndPxNpZU-oPw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Renesas RZ/A1 pin and gpio controller
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Wed, Apr 5, 2017 at 4:07 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

> Hi Linus,
>    this is 4th round of gpio/pincontroller for RZ/A1 devices.
>
> As you suggested in v3 review, I have now added what we called pinmux flags
> to the list of standard pinconf generic properties, and we're now using
> generic parsing routines to collect them and apply them when multiplexing
> pins.

I have merged patch 1/9 so you have the necessary infrastructure in place.

If Geert want to send a pull request based on my devel branch that is fine
(but a bit late) else the requirements are there for a merge in the early
v4.12 kernel cycle.

Yours,
Linus Walleij
