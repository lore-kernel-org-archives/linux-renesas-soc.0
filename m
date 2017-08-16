Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:37144 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752172AbdHPOb0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 10:31:26 -0400
Received: by mail-pf0-f194.google.com with SMTP id p13so1520482pfd.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2017 07:31:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170615192514.bwf52gi7di436bkm@ninjato>
References: <20170615192514.bwf52gi7di436bkm@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2017 16:31:25 +0200
Message-ID: <CAMuHMdUW1s2wK9N=yoxxL5tzMN01jJ9yF1QPu_UOVMnMwLN5eQ@mail.gmail.com>
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
>
> Kind regards,
>
>    Wolfram
>
>
> The following changes since commit b41c5497755a66628e2ebf4641ce2849c79bb731:
>
>   Merge remote-tracking branch 'renesas/arm64-dt-for-v4.13' into renesas/topic/i2c-core-dma (2017-06-15 16:14:46 +0200)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/i2c-core-dma

I took the liberty to upgrade to renesas/topic/i2c-core-dma-v3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
