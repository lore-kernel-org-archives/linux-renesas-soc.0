Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:32783 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750727AbcIGWIq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 18:08:46 -0400
Received: by mail-oi0-f45.google.com with SMTP id y2so46277868oie.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Sep 2016 15:08:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1473158139-8291-1-git-send-email-horms+renesas@verge.net.au>
References: <1473158139-8291-1-git-send-email-horms+renesas@verge.net.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2016 00:08:45 +0200
Message-ID: <CACRpkdaq+Wfh2hXT9xuAuoSisr8bbiMpHCLCQdM-xvcefUEFuw@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Add r8a7796 (R-Car M3-W) support
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Alexandre Courbot <gnurou@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 6, 2016 at 12:35 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:

> R-Car Gen3's GPIO blocks are identical to Gen2's in every respect.
>
> Based on work for the r8a7795 (R-Car H3) by Ulrich Hecht.
>
> Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Patch applied.

Yours,
Linus Walleij
