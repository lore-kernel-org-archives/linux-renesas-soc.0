Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35352 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753088AbeDZJCc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 05:02:32 -0400
Received: by mail-io0-f195.google.com with SMTP id d26-v6so30179166ioc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Apr 2018 02:02:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1524558425-8285-1-git-send-email-biju.das@bp.renesas.com>
References: <1524558425-8285-1-git-send-email-biju.das@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Apr 2018 11:02:31 +0200
Message-ID: <CACRpkdYQt1jsH=juzMxUafyZSpaLmeahRycQDjnohi4f=P28wQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Add r8a77470 (RZ/G1C) support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 10:27 AM, Biju Das <biju.das@bp.renesas.com> wrote:

> Renesas RZ/G1C (R8A77470) SoC GPIO blocks are identical to the R-Car Gen2
> family. Add support for its GPIO controllers.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Patch applied to the GPIO tree with all the review tags.

Yours,
Linus Walleij
