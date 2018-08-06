Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:39390 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729989AbeHFM4Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 08:56:25 -0400
Received: by mail-it0-f67.google.com with SMTP id g141-v6so17444958ita.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Aug 2018 03:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com> <1533219087-33695-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533219087-33695-3-git-send-email-biju.das@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Aug 2018 12:47:44 +0200
Message-ID: <CACRpkdYhhy+Wxgy+1GzSas6_yvUZMA2NbcpJw4ZwaNvXnX-PmQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: gpio: rcar: Add gpio-reserved-ranges support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju!

Thanks for the patches and sorry for slow feedback.
Luckily you have Geert to help out and I can see this is already
getting in nice shape.

On Thu, Aug 2, 2018 at 4:17 PM Biju Das <biju.das@bp.renesas.com> wrote:

> Update the DT bindings documentation with the optional gpio-reserved-ranges
> properties.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
(...)
> +  - gpio-reserved-ranges: Set of tuples to specify the unused GPIOs.This
> +    property indicates the start and size of the GPIOs that can't be used.
> +
>  Please refer to gpio.txt in this directory for details of gpio-ranges property
>  and the common GPIO bindings used by client devices.

You see it yourself if you look at the context below: just refer to the existing
documentation in gpio.txt as this is a standard bindings.

The absolutely best (IIUC) is:

gpio-ranges: See gpio.txt
gpio-reserved-ranges: See gpio.txt

Maybe you could add an extra example using the reserved ranges?

Yours,
Linus Walleij
