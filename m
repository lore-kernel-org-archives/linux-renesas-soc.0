Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:32927 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752702AbdFPIV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 04:21:57 -0400
Received: by mail-it0-f67.google.com with SMTP id g184so1771558ita.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jun 2017 01:21:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170615192514.bwf52gi7di436bkm@ninjato>
References: <20170615192514.bwf52gi7di436bkm@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jun 2017 10:21:54 +0200
Message-ID: <CAMuHMdVK-mhRobALx4T--hfrA_rx2qz+ZWUejUO=tEwc=ekiYA@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/i2c-core-dma for renesas drivers
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Jun 15, 2017 at 9:25 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> here is a topic branch for renesas-drivers adding better DMA support to
> the I2C core. It is based on i2c/for-next with the branch
> 'renesas/arm64-dt-for-v4.13' from Simon merged as well. Please pull.

Thank you, looks good!

> The following changes since commit b41c5497755a66628e2ebf4641ce2849c79bb731:
>
>   Merge remote-tracking branch 'renesas/arm64-dt-for-v4.13' into renesas/topic/i2c-core-dma (2017-06-15 16:14:46 +0200)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/i2c-core-dma
>
> for you to fetch changes up to 0780b6c3d3e6079635cfbae3386a1e196da78925:
>
>   i2c: rcar: check for DMA-capable buffers (2017-06-15 16:27:49 +0200)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
