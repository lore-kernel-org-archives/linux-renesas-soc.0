Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:51524 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbeHJXif (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Aug 2018 19:38:35 -0400
Received: by mail-it0-f68.google.com with SMTP id e14-v6so4449675itf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Aug 2018 14:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <1533626118-26583-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533626118-26583-1-git-send-email-biju.das@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Aug 2018 23:06:51 +0200
Message-ID: <CACRpkdbXv8h4k-6WuOfmjFKiaSBGGP=r-1L69qUVkDZ2KJOhsA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Avoid calling chip->request() for unused gpios
To: Biju Das <biju.das@bp.renesas.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 7, 2018 at 9:21 AM Biju Das <biju.das@bp.renesas.com> wrote:

> Add a check for unused gpios to avoid chip->request() call to client
> driver for unused gpios.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Patch applied with Geert's ACK.

Yours,
Linus Walleij
