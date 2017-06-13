Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35955 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752671AbdFMG5O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jun 2017 02:57:14 -0400
Received: by mail-io0-f195.google.com with SMTP id i93so12048883iod.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2017 23:57:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1497314657-15984-1-git-send-email-kbingham@kernel.org>
References: <1497314657-15984-1-git-send-email-kbingham@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jun 2017 08:56:59 +0200
Message-ID: <CAMuHMdXCALSt68C6QM95Xb7_hjUBqg6op5+uBWyJVMAREfY0AQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] media: ADV748x driver
To: Kieran Bingham <kbingham@kernel.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Tue, Jun 13, 2017 at 2:44 AM, Kieran Bingham <kbingham@kernel.org> wrote:
> Please consider including this driver (based on linux-media/master) for renesas-drivers.

Thanks, looks good!

> The following changes since commit 47f910f0e0deb880c2114811f7ea1ec115a19ee4:
>
>   [media] v4l: subdev: tolerate null in media_entity_to_v4l2_subdev (2017-06-08 16:55:25 -0300)
>
> are available in the git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/kbingham/rcar.git adv748x/for-renesas-drivers

BTW, most people prefer "git://git.kernel.org/..."

>
> for you to fetch changes up to fdae35a2e755e7d2e06d652c2e64343b7f82fce1:
>
>   media: i2c: adv748x: add adv748x driver (2017-06-13 01:40:24 +0100)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
