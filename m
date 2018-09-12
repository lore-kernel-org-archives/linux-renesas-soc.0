Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbeILOqt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 10:46:49 -0400
Date: Wed, 12 Sep 2018 15:12:55 +0530
From: Vinod <vkoul@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH] dma: sh: convert to SPDX identifiers
Message-ID: <20180912094255.GI2766@vkoul-mobl>
References: <878t4eqdkw.wl-kuninori.morimoto.gx@renesas.com>
 <20180911074802.GO2634@vkoul-mobl>
 <CAMuHMdUGqS0PgS72LFTZS9GmgWZJDjOcTjfxnC4fLCVwbJeA5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUGqS0PgS72LFTZS9GmgWZJDjOcTjfxnC4fLCVwbJeA5g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11-09-18, 10:17, Geert Uytterhoeven wrote:
> Hi Vinod,
> 
> On Tue, Sep 11, 2018 at 9:48 AM Vinod <vkoul@kernel.org> wrote:
> > On 07-09-18, 01:58, Kuninori Morimoto wrote:
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >
> > > This patch updates license to use SPDX-License-Identifier
> > > instead of verbose license text.
> >
> > Thanks but the style is not consistent in files :(
> >
> > Can we use one only?
> 
> Please read
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/license-rules.rst#n69
> 
>     2. Style:
> 
>        The SPDX license identifier is added in form of a comment.  The comment
>        style depends on the file type::
> 
>           C source: // SPDX-License-Identifier: <SPDX License Expression>
>           C header: /* SPDX-License-Identifier: <SPDX License Expression> */

Right and I missed patch is doing for both c & h files, my bad

Applying this now.

Btw I have sent the series for dma_slave_config direction removal, sh/
drivers turned to be bit more, can you guys take care of it please?

-- 
~Vinod
