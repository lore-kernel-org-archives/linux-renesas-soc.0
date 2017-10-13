Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:45112 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752984AbdJMTyt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 15:54:49 -0400
Received: by mail-oi0-f66.google.com with SMTP id f66so15950676oib.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2017 12:54:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1507918320.git.robin.murphy@arm.com>
References: <cover.1507918320.git.robin.murphy@arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 Oct 2017 21:54:47 +0200
Message-ID: <CAK8P3a2oCaFuuAuLVaVnepryKDKFzemK8CO9W+dTZSpmvzxQhw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ipmmu-vmsa cleanup
To: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 13, 2017 at 8:23 PM, Robin Murphy <robin.murphy@arm.com> wrote:
> Arnd reports a build warning[1] thanks to me missing ipmmu-vmsa's second
> set of ops when converting io-pgtable-arm users to the new iommu_iotlb_*
> callbacks. Rather than just treat the symptom with a point fix, this
> seemed like a good excuse to clean up the messy #ifdeffery and
> duplication in the driver that led to the oversight in the first place.
>
> Build-tested successfully for arm64, ARM, and ARM + CONFIG_IOMMU_DMA.

Very nice. I looked over the patches and while I only understood half of
what you do and why it was different to start with, I very much welcome
the end result.

       Arnd
