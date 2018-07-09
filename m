Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:44007 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754444AbeGIN00 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jul 2018 09:26:26 -0400
Received: by mail-io0-f195.google.com with SMTP id y10-v6so2206568ioa.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Jul 2018 06:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20180703151842.28750-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180703151842.28750-1-niklas.soderlund+renesas@ragnatech.se>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Jul 2018 15:26:14 +0200
Message-ID: <CACRpkdbGyfY2Qvr=YNE07jbLTLdu6QnMqmZr6qqFLDE7y-ezRg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a77970: remove SH_PFC_PIN_CFG_DRIVE_STRENGTH
 flag
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 3, 2018 at 5:19 PM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:

> The datasheet does not document any registers to control drive strength,
> and no drive strength registers are for this reason described for this
> SoC. The flags indicating that drive strength can be controlled are
> however set for some pins in the driver.
>
> This leads to a NULL pointer dereference when the sh-pfc core tries to
> access the struct describing the drive strength registers, for example
> when reading the sysfs file pinconf-pins.
>
> Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins.
>
> Fixes: b92ac66a1819602b ("pinctrl: sh-pfc: Add R8A77970 PFC support")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied directly for fixes per Geert's suggestion.

Yours,
Linus Walleij
