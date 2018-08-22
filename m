Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:44515 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbeHVR3N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 13:29:13 -0400
Received: by mail-ua1-f68.google.com with SMTP id l2-v6so1099011uaf.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 07:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180810122602.5w2tackcqwoeclj6@verge.net.au> <TYXPR01MB1518C6FA9560CD45BF7684F9A8390@TYXPR01MB1518.jpnprd01.prod.outlook.com>
 <20180817091956.vm77iv73cwkkjelv@verge.net.au> <20180817093854.dz6xqwqcf4z7ncxu@verge.net.au>
 <20180817105237.7tnijrheywh3fx46@verge.net.au>
In-Reply-To: <20180817105237.7tnijrheywh3fx46@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Aug 2018 16:03:56 +0200
Message-ID: <CAMuHMdXgUBJBJe_vkaT618c99SDXtXN247UZLUhst4cU+WgP9w@mail.gmail.com>
Subject: Re: [LTSI-dev] [GIT PULL LTSI-4.14] Renesas SoCs and Drivers to v4.18-rc8
To: Simon Horman <horms@verge.net.au>
Cc: Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        ltsi-dev@lists.linuxfoundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Aug 17, 2018 at 12:53 PM Simon Horman <horms@verge.net.au> wrote:
> please find the details of the corrected tag below:
>
> The following changes since commit 2ae6c0413b4768f9d8fc6f718a732f9dae014b67:
>
>   Linux 4.14.61 (2018-08-06 16:20:52 +0200)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.14.61/snapshot-to-v4.18-rc8+fixes-flattened
>
> for you to fetch changes up to cc88cfdc0571385f098e82db47f5a16b6f44726e:
>
>   i2c: rcar: use the new get_bus_free callback (2018-08-09 17:22:00 +0200)
>
> ----------------------------------------------------------------
> LTSI-v4.14 Backports for Renesas SoCs (to v4.18-rc8)
>
> Base:
> * v4.14.61
> * Similar backport of components for Renesas SoCs to v4.17

Thanks for your submission!

I subjected this to the same testing I do for each renesas-drivers release.
I have detected no regressions, only increased functionality.

Note that the description of commit 2e36d0f21ab5e4f1 ("usb: xhci: Add DbC
support in xHCI driver") contains 2 cherry-picked lines:

    (cherry picked from commit dfba2174dc421ecad8dc50741054a305cd3ba681)
    Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
    (cherry picked from commit 53529a76f6e18b4a08c11c59303d9401bb2aa3b6)
    Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

The first one points to a valid upstream commit.
The second one points to a backport of that commit in your backport
repository.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
