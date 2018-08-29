Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:52076 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727190AbeH2MnY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 08:43:24 -0400
Received: by mail-it0-f65.google.com with SMTP id e14-v6so6581902itf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Aug 2018 01:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com> <1533628626-26503-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533628626-26503-2-git-send-email-biju.das@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Aug 2018 10:47:21 +0200
Message-ID: <CACRpkdYDJAEmAR6DVofa5g8EbQZ_Vjp7rdEZcL-X9Z4d9VzXQg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] gpio: rcar: Add GPIO hole support
To: Biju Das <biju.das@bp.renesas.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 7, 2018 at 10:03 AM Biju Das <biju.das@bp.renesas.com> wrote:

> GPIO hole is present in RZ/G1C SoC. Valid GPIO pins on bank3 are in the
> range GP3_0 to GP3_16 and GP3_27 to GP3_29. The GPIO pins between GP3_17
> to GP3_26 are unused. Add support for handling unused GPIO's.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Patch applied with Geert's review tag.

Yours,
Linus Walleij
