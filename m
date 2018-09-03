Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33800 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728430AbeICVmv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Sep 2018 17:42:51 -0400
Received: by mail-lj1-f193.google.com with SMTP id f8-v6so1026412ljk.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Sep 2018 10:21:45 -0700 (PDT)
Date: Mon, 3 Sep 2018 19:21:42 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] mmc: renesas_sdhi_internal_dmac: set scatter/gather
 max segment size
Message-ID: <20180903172142.GL28374@bigcity.dyn.berto.se>
References: <20180830213843.14680-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWTPNxUQ+Go-CPe3KZqr9eoLTaegbvE2OdmwHhBi6n+hg@mail.gmail.com>
 <20180831075703.GG28374@bigcity.dyn.berto.se>
 <CAMuHMdWa-c1QcYN_moyck4J1Dte3LyEHfRZ5Ai915UX82CxbPw@mail.gmail.com>
 <20180831094439.ldljak3bnmehh6vs@ninjato>
 <CAMuHMdX9p2sgQhpgbLmW4KGRyxEsbXD4=OEfm3QfM-cyLKK84A@mail.gmail.com>
 <20180831103524.enm2v7zeysngqsdw@ninjato>
 <20180831104907.GH28374@bigcity.dyn.berto.se>
 <20180831110459.gv77k7v3pl2k65kd@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180831110459.gv77k7v3pl2k65kd@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 2018-08-31 13:04:59 +0200, Wolfram Sang wrote:
> On Fri, Aug 31, 2018 at 12:49:08PM +0200, Niklas S�derlund wrote:
> > On 2018-08-31 12:35:24 +0200, Wolfram Sang wrote:
> > > 
> > > > Promote drivers/gpu/drm/exynos/exynos_drm_iommu.c:configure_dma_max_seg_size()
> > > > to a generic helper?
> > > 
> > > Yes!
> > > 
> > If that is promoted should not
> > drivers/gpu/drm/exynos/exynos_drm_iommu.c:clear_dma_max_seg_size() also 
> > be promoted? And if so should this patch revert back to v1 with a custom 
> > remove function which clears and free the dma_parms ?
> 
> My preference would be easy to use helpers for drivers because this is
> easy to get wrong. I think we need to discuss with the creators of that
> API:
> 
> a) if the drm/exynos driver does the right thing(tm)
> b) if these functions should be generic helpers
> c) when to clear the pointer (a bit related to a))
> 
> Niklas, do you have an interest to do that? Or would you rather go with
> SDHI hacking? :) I can do it, too.
> 

If you would like to spearhead this please go a head :-) If not please 
let me know so it won't fall thru the cracks.

-- 
Regards,
Niklas S�derlund
