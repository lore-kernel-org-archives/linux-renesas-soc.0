Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:45223 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751870AbeFFMqh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 08:46:37 -0400
Received: by mail-ua0-f196.google.com with SMTP id k14-v6so3887814uao.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jun 2018 05:46:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180528192947.2808-1-wsa+renesas@sang-engineering.com>
References: <20180528192947.2808-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jun 2018 14:46:36 +0200
Message-ID: <CAMuHMdVXrFvg9JqAp9C8pzcYZVMraeRUehgW5G0YszEjwoHb4Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: salvator-x(s): Update I2C ch4 clock to 400kHz
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Mon, May 28, 2018 at 9:29 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Any of the following devices connected to I2C ch4 of the Salvator-X(S)
> boards will operate at 400 kHz:
>
>     PCA9654, 9FGV0841, ADV7482WBBCZ, MAX9611, 5P49V5923, 5P49V6901A
>
> This patch updates the clock frequency to 400 KHz.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [wsa: squashed commits into one]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since V1:
>         * squashed commits into single one
>
>  arch/arm64/boot/dts/renesas/salvator-x.dtsi  | 2 ++
>  arch/arm64/boot/dts/renesas/salvator-xs.dtsi | 2 ++

Any reason this cannot be added to salvator-common.dtsi instead?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
