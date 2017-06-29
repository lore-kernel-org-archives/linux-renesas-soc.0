Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:33397 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752536AbdF2MXk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Jun 2017 08:23:40 -0400
Received: by mail-io0-f176.google.com with SMTP id h64so5854997iod.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jun 2017 05:23:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1498055229-42052-1-git-send-email-biju.das@bp.renesas.com>
References: <1497619944-61410-1-git-send-email-biju.das@bp.renesas.com> <1498055229-42052-1-git-send-email-biju.das@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Jun 2017 14:23:38 +0200
Message-ID: <CACRpkdaHb8GnwTc0D0B9TtYC=LUa0ZdDK90xKwydg=s4z-VxMQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: rcar: Add R8A7743 (RZ/G1M) support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Alexandre Courbot <gnurou@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 21, 2017 at 4:27 PM, Biju Das <biju.das@bp.renesas.com> wrote:

> Renesas RZ/G1M (R8A7743) SoC GPIO blocks are identical to the R-Car Gen2
> family. Add support for its GPIO controllers.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
> v1->v2
> * Modified the text "RZ-G1M" to "RZ/G1M"

Patch applied with the ACKs.

Yours,
Linus Walleij
