Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:38318 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752991AbeDZWqY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 18:46:24 -0400
Received: by mail-io0-f194.google.com with SMTP id z4-v6so383058iof.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Apr 2018 15:46:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1523904956-18239-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1523904956-18239-1-git-send-email-jacopo+renesas@jmondi.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Apr 2018 00:46:23 +0200
Message-ID: <CACRpkdYy9kabXXmA7RwqDCMv-z0QSSMfQa7agp4aaBfoxO=QOA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gpio: Add support for r8a77965
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 16, 2018 at 8:55 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

> Add compatible string for R-Car M3-N (r8a77965) in gpio-rcar.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>
> Renesas R-Car M3-N support has been merged for v4.17.
> Document the missing device tree bindings.
>
> v1 -> v2:
> - Add Simon and Rob Reviewed-by tags

Patch applied.

Yours,
Linus Walleij
