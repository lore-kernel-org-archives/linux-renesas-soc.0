Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39360 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728634AbeKOUVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 15:21:18 -0500
Received: by mail-lf1-f65.google.com with SMTP id n18so13740362lfh.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Nov 2018 02:14:05 -0800 (PST)
MIME-Version: 1.0
References: <1541505156-8097-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1541505156-8097-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Nov 2018 11:13:52 +0100
Message-ID: <CACRpkda+YcxCOQeSo=2Jk5S2b4Sa7WcROeaJitzgPcBzM1qBrA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge/sii902x: Fix EDID readback
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Dave Airlie <airlied@linux.ie>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i2c@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 6, 2018 at 12:52 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:

> While adding SiI9022A support to the iwg23s board, it came
> up that when the HDMI transmitter is in pass through mode the
> device is not compliant with the I2C specification anymore,
> as it requires a far bigger tbuf, due to a delay the HDMI
> transmitter is adding when relaying the STOP condition on the
> monitor i2c side of things.
>
> When not providing an appropriate delay after the STOP condition
> the i2c bus would get stuck. Also, any other traffic on the bus
> while talking to the monitor may cause the transaction to fail
> or even cause issues with the i2c bus as well.
>
> I2c-gates seemed to reach consent as a possible way to address
> these issues, and as such this patch is implementing a solution
> based on that. Since others are clearly relying on the current
> implementation of the driver, this patch won't require any DT
> changes.
>
> Since we don't want any interference during the DDC Bus
> Request/Grant procedure and while talking to the monitor, we
> have to use the adapter locking primitives rather than the
> i2c-mux locking primitives.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> ---
> v2->v3:
> * Incorporated comments from Boris Brezillon and Peter Rosin

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Do you need help to apply this to drm-misc or do you
have commit access?

Yours,
Linus Walleij
