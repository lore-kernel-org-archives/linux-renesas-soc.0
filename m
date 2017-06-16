Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35228 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753135AbdFPI5r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 04:57:47 -0400
Received: by mail-it0-f66.google.com with SMTP id f20so4325670itb.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jun 2017 01:57:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1497471834-917-2-git-send-email-kbingham@kernel.org>
References: <1497471834-917-1-git-send-email-kbingham@kernel.org> <1497471834-917-2-git-send-email-kbingham@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jun 2017 10:57:45 +0200
Message-ID: <CAMuHMdUNaZVCnYjnoDXZEyNa3Y8ukUjqnx6nBgeOK+0qmJT0CA@mail.gmail.com>
Subject: Re: [GIT PULL for renesas-drivers] ADV748x v5 device-tree.
To: Kieran Bingham <kbingham@kernel.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Wed, Jun 14, 2017 at 10:23 PM, Kieran Bingham <kbingham@kernel.org> wrote:
> Please consider this pull request for the next renesas-drivers release.
>
> This DT update is based on Simon's horms/next branch, but is also dependant
> upon Niklas' VIN driver DT nodes being integrated.

That means "make dtbs" doesn't work in this branch?
I think you need to sync with Niklas, so you can build your branch on
top of his.

> The following changes since commit ab4321dedd764fb6d8fad3463a93b491aabe669d:
>
>   Merge branches 'arm64-dt-for-v4.13', 'drivers-for-v4.13' and 'soc-for-v4.13' into next (2017-06-14 11:05:24 +0200)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git adv748x/dt
>
> for you to fetch changes up to eb130d9433e9cd5b6b0f33715df18697460012ee:
>
>   arm64: dts: renesas: salvator-x: Add ADV7482 support (2017-06-14 15:46:42 +0100)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
