Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:39186 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728968AbeGYPAM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 11:00:12 -0400
Subject: Re: [PATCH/RFC] drivers/vfio: Allow type-1 IOMMU instantiation with
 Renesas IPMMU-VMSA
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        kvm@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
References: <20180725133451.7083-1-geert+renesas@glider.be>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a0128032-9df5-2326-508b-57f02f4d0b74@arm.com>
Date: Wed, 25 Jul 2018 14:48:23 +0100
MIME-Version: 1.0
In-Reply-To: <20180725133451.7083-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 25/07/18 14:34, Geert Uytterhoeven wrote:
> The Renesas IPMMU-VMSA driver is compatible with the notion of a type-1
> IOMMU in VFIO.
> 
> This patch allows guests to use the VFIO_IOMMU_TYPE1 API on hosts
> equipped with a Renesas VMSA-compatible IPMMU.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Lightly tested with sata_rcar on Renesas R-Car H3 ES2.0.
> 
> For testing, this patch and all prerequisites are available in the
> topic/rcar3-virt-gpio-passthrough-v3 branch of my git repository at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
> ---
>   drivers/vfio/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
> index c84333eb5eb59bef..a3e21e7c066596d7 100644
> --- a/drivers/vfio/Kconfig
> +++ b/drivers/vfio/Kconfig
> @@ -21,7 +21,8 @@ config VFIO_VIRQFD
>   menuconfig VFIO
>   	tristate "VFIO Non-Privileged userspace driver framework"
>   	depends on IOMMU_API
> -	select VFIO_IOMMU_TYPE1 if (X86 || S390 || ARM_SMMU || ARM_SMMU_V3)
> +	select VFIO_IOMMU_TYPE1 if (X86 || S390 || ARM_SMMU || ARM_SMMU_V3 || \
> +				    IPMMU_VMSA)

I recall this came up in the context of virtio-iommu too[1], wherein we 
decided that listing individual drivers was actually a bit silly and 
this should simply have ARM || ARM64 for consistency. Looks like there's 
even more justification now :)

Robin.

[1] https://www.mail-archive.com/kvmarm@lists.cs.columbia.edu/msg16235.html

>   	select ANON_INODES
>   	help
>   	  VFIO provides a framework for secure userspace device drivers.
> 
