Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF88C4338F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 25 Aug 2021 15:43:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11CDA610A0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 25 Aug 2021 15:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240904AbhHYPom (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 25 Aug 2021 11:44:42 -0400
Received: from 8bytes.org ([81.169.241.247]:41740 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240461AbhHYPol (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 11:44:41 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 6C1D3922; Wed, 25 Aug 2021 17:43:54 +0200 (CEST)
Date:   Wed, 25 Aug 2021 17:43:51 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Will Deacon <will@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel test robot <lkp@intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] iommu/io-pgtable: Abstract iommu_iotlb_gather access
Message-ID: <YSZlN6vnv77cJPFJ@8bytes.org>
References: <83672ee76f6405c82845a55c148fa836f56fbbc1.1629465282.git.robin.murphy@arm.com>
 <CAMuHMdXL7ZtY8kBx=RHsRy1JECsGPDe+E3SM=--w7bUHMYHFBQ@mail.gmail.com>
 <ad5ae140-6398-a2d2-ed90-2d59cab01f0f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5ae140-6398-a2d2-ed90-2d59cab01f0f@arm.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 24, 2021 at 04:33:16PM +0100, Robin Murphy wrote:
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks for confirming!

Sorry for the delay, the new tree containing this fix has been pushed
out now.
