Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41328 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbeHaO4F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 10:56:05 -0400
Received: by mail-lj1-f195.google.com with SMTP id y17-v6so9719840ljy.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Aug 2018 03:49:10 -0700 (PDT)
Date: Fri, 31 Aug 2018 12:49:08 +0200
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
Message-ID: <20180831104907.GH28374@bigcity.dyn.berto.se>
References: <20180830213843.14680-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWTPNxUQ+Go-CPe3KZqr9eoLTaegbvE2OdmwHhBi6n+hg@mail.gmail.com>
 <20180831075703.GG28374@bigcity.dyn.berto.se>
 <CAMuHMdWa-c1QcYN_moyck4J1Dte3LyEHfRZ5Ai915UX82CxbPw@mail.gmail.com>
 <20180831094439.ldljak3bnmehh6vs@ninjato>
 <CAMuHMdX9p2sgQhpgbLmW4KGRyxEsbXD4=OEfm3QfM-cyLKK84A@mail.gmail.com>
 <20180831103524.enm2v7zeysngqsdw@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180831103524.enm2v7zeysngqsdw@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-08-31 12:35:24 +0200, Wolfram Sang wrote:
> 
> > Promote drivers/gpu/drm/exynos/exynos_drm_iommu.c:configure_dma_max_seg_size()
> > to a generic helper?
> 
> Yes!
> 

If that is promoted should not
drivers/gpu/drm/exynos/exynos_drm_iommu.c:clear_dma_max_seg_size() also 
be promoted? And if so should this patch revert back to v1 with a custom 
remove function which clears and free the dma_parms ?

-- 
Regards,
Niklas S�derlund
