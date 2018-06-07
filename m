Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:39561 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753153AbeFGTs4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 15:48:56 -0400
MIME-Version: 1.0
In-Reply-To: <1528400696-32609-1-git-send-email-clabbe@baylibre.com>
References: <1528400696-32609-1-git-send-email-clabbe@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Jun 2018 21:48:54 +0200
Message-ID: <CAMuHMdV1Utg+UgdRE1k9wL10r4P-rN6C7v9i2WcYxPMyH4J6ww@mail.gmail.com>
Subject: Re: [PATCH] iommu/shmobile: Remove unused include/linux/platform_data/sh_ipmmu.h
 header
To: Corentin Labbe <clabbe@baylibre.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <jroedel@suse.de>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 7, 2018 at 9:44 PM, Corentin Labbe <clabbe@baylibre.com> wrote:
> include/linux/platform_data/sh_ipmmu.h is unused since commit ae50dc4874c5 ("iommu/shmobile: Remove unused Renesas IPMMU/IPMMUI")
> Let's remove it.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
