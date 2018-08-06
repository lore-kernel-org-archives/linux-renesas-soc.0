Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:37859 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbeHFN3D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 09:29:03 -0400
MIME-Version: 1.0
References: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Aug 2018 13:20:14 +0200
Message-ID: <CAMuHMdWAg8VmXpx_R2ROO-PwjaoWFv6Sc8PpoJqePkXGNh9rvw@mail.gmail.com>
Subject: Re: [PATCH] ata: sata_rcar: exclude setting of PHY registers in Gen3
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-ide@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Tejun Heo <tj@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Mon, Aug 6, 2018 at 12:43 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>
> According to documentation, setting of PHY registers is unnecessary with
> R-Car Gen3. The registers are not even described. So, don't initialize
> them.
>
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [wsa: updated commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> Tested with a Renesas R-Car M3N Salvator-XS board. I did a platform suspend to
> check if the controller and PHY work properly after resume.

"platform suspend"? Is that s2ram aka a full PSCI system suspend?
I guess not, as it is supposed to fail without PCA9654 suspend/resume support...

So more information is needed to convince me ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
