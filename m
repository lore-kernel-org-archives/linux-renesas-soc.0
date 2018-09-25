Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it1-f193.google.com ([209.85.166.193]:53485 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbeIYQui (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Sep 2018 12:50:38 -0400
Received: by mail-it1-f193.google.com with SMTP id q70-v6so6145769itb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Sep 2018 03:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <1537544044-57906-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1537544044-57906-1-git-send-email-biju.das@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Sep 2018 12:43:30 +0200
Message-ID: <CACRpkdbn3PX6Hk6TtcHPNT0BtGKRXMcCJejOnK5y4_cV=CQMZw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Add r8a7744 (RZ/G1N) support
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

On Fri, Sep 21, 2018 at 5:41 PM Biju Das <biju.das@bp.renesas.com> wrote:

> Renesas RZ/G1N (R8A7744) SoC GPIO blocks are identical to the R-Car Gen2
> family. Add support for its GPIO controllers.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
