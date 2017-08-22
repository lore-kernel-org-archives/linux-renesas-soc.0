Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34815 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932523AbdHVNj6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 09:39:58 -0400
Received: by mail-oi0-f48.google.com with SMTP id j144so57890838oib.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Aug 2017 06:39:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1502881936-39357-1-git-send-email-biju.das@bp.renesas.com>
References: <1502881936-39357-1-git-send-email-biju.das@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Aug 2017 15:39:57 +0200
Message-ID: <CACRpkdZzQfe-Mdv0hnf_rTHh0KwX9QrKOUUd0tam_DndkCTy5A@mail.gmail.com>
Subject: Re: [PATCH ] gpio: rcar: Add r8a7745 (RZ/G1E) support
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

On Wed, Aug 16, 2017 at 1:12 PM, Biju Das <biju.das@bp.renesas.com> wrote:

> Renesas RZ/G1E (R8A7745) SoC GPIO blocks are identical to the R-Car Gen2
> family. Add support for its GPIO controllers.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Patch applied with the ACKs

Yours,
Linus Walleij
