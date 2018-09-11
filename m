Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:34971 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbeIKNQC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 09:16:02 -0400
MIME-Version: 1.0
References: <878t4eqdkw.wl-kuninori.morimoto.gx@renesas.com> <20180911074802.GO2634@vkoul-mobl>
In-Reply-To: <20180911074802.GO2634@vkoul-mobl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Sep 2018 10:17:39 +0200
Message-ID: <CAMuHMdUGqS0PgS72LFTZS9GmgWZJDjOcTjfxnC4fLCVwbJeA5g@mail.gmail.com>
Subject: Re: [PATCH] dma: sh: convert to SPDX identifiers
To: vkoul@kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

On Tue, Sep 11, 2018 at 9:48 AM Vinod <vkoul@kernel.org> wrote:
> On 07-09-18, 01:58, Kuninori Morimoto wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > This patch updates license to use SPDX-License-Identifier
> > instead of verbose license text.
>
> Thanks but the style is not consistent in files :(
>
> Can we use one only?

Please read
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/license-rules.rst#n69

    2. Style:

       The SPDX license identifier is added in form of a comment.  The comment
       style depends on the file type::

          C source: // SPDX-License-Identifier: <SPDX License Expression>
          C header: /* SPDX-License-Identifier: <SPDX License Expression> */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
