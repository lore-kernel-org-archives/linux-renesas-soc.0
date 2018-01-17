Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:36326 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752612AbeAQNse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 08:48:34 -0500
Date: Wed, 17 Jan 2018 14:41:46 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: alex.williamson@redhat.com, sricharan@codeaurora.org,
        laurent.pinchart+renesas@ideasonboard.com,
        damm+renesas@opensource.se, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] iommu/ipmmu-vmsa: Remove redundant
 of_iommu_init_fn hook
Message-ID: <20180117134146.fcf2dammcuoowiks@8bytes.org>
References: <da664cf8f60c77cbb657cc2e3849560604eaf6da.1515512134.git.robin.murphy@arm.com>
 <12163854e04da92b5de586912bf7257fc0fed79a.1515512134.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12163854e04da92b5de586912bf7257fc0fed79a.1515512134.git.robin.murphy@arm.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 09, 2018 at 04:17:26PM +0000, Robin Murphy wrote:
> Having of_iommu_init() call ipmmu_init() via ipmmu_vmsa_iommu_of_setup()
> does nothing that the subsys_initcall wouldn't do slightly later anyway,
> since probe-deferral of masters means it is no longer critical to
> register the driver super-early. Clean it up.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---

Applied this one, thanks.

The other two are already applied now from your first post.
