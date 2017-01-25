Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:40280 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751016AbdAYQ2b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 11:28:31 -0500
Subject: Re: [PATCH/RFC 2/4] iommu: iova: use __alloc_percpu_gfp() with
 GFP_NOWAIT in init_iova_rcaches()
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        joro@8bytes.org
References: <1485348842-23712-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1485348842-23712-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, magnus.damm@gmail.com
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0d346868-bb13-b632-d05f-434b8e2ec391@arm.com>
Date: Wed, 25 Jan 2017 16:28:28 +0000
MIME-Version: 1.0
In-Reply-To: <1485348842-23712-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 25/01/17 12:54, Yoshihiro Shimoda wrote:
> In the future, the init_iova_rcaches will be called in atomic.

That screams "doing the wrong thing". The sole point of the rcaches is
to reuse IOVAs, whereas the main point of this series seems to involve
not reusing IOVAs. The fact that we have to affect the allocation of
something we explicitly want to avoid using, rather than, say, not
allocating it at all, is a bit of a red flag.

Also, the rcaches are rather big. Allocating all this lot in atomic
context is not necessarily going to be the best idea.

Robin.

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/iommu/iova.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index b7268a1..866ad65 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -723,7 +723,9 @@ static void init_iova_rcaches(struct iova_domain *iovad)
>  		rcache = &iovad->rcaches[i];
>  		spin_lock_init(&rcache->lock);
>  		rcache->depot_size = 0;
> -		rcache->cpu_rcaches = __alloc_percpu(sizeof(*cpu_rcache), cache_line_size());
> +		rcache->cpu_rcaches = __alloc_percpu_gfp(sizeof(*cpu_rcache),
> +							 cache_line_size(),
> +							 GFP_NOWAIT);
>  		if (WARN_ON(!rcache->cpu_rcaches))
>  			continue;
>  		for_each_possible_cpu(cpu) {
> 
