Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:32811 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751962AbcI0GUV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2016 02:20:21 -0400
Received: by mail-lf0-f53.google.com with SMTP id b71so9913009lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2016 23:20:20 -0700 (PDT)
Date: Tue, 27 Sep 2016 08:20:18 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: IPMMU SYS-DMAC iova mapping
 workaround
Message-ID: <20160927062018.GD16263@bigcity.dyn.berto.se>
References: <20160920115433.14772.84308.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160920115433.14772.84308.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On 2016-09-20 20:54:33 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Here's some prototype code that works around the lack of software
> support for mapping I/O devices to the SYS-DMAC hardware via the
> DMA Engine framework when using IOMMU.
> 
> The code itself is one big layering violation that goes through
> the DT and unconditionally maps I/O devices using DMACs via the
> IPMMU device instance into iova space with a 1:1 mapping.
> 
> This very short term prototype will for instance automatically make
> the SCIF serial port function with the IPMMU hardware in case the
> SYS-DMAC is hooked up to the IPMMU device.
> 
> Not to be confused with the more long term solution to allow the
> DMA Engine framework to map I/O device memory dynamically.

Good news, Vinod queued the dma_{map,unmap}_resource API and rcar-dmac 
usage of it yesterday \o/.

> 
> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Applies on top of: renesas-drivers-2016-09-13-v4.8-rc6
> 
>  drivers/iommu/ipmmu-vmsa.c |   75 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> --- 0001/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c	2016-09-20 20:03:37.620607110 +0900
> @@ -19,6 +19,7 @@
>  #include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_iommu.h>
>  #include <linux/platform_device.h>
>  #include <linux/sizes.h>
> @@ -625,6 +626,78 @@ static void ipmmu_domain_free(struct iom
>  	kfree(domain);
>  }
>  
> +static void ipmmu_workaround_map(struct iommu_domain *io_domain,
> +				 struct device *dma_dev, struct resource *res)
> +{
> +	phys_addr_t phys_addr;
> +
> +	dev_info(dma_dev, "map %pr\n", res);
> +
> +	phys_addr = iommu_iova_to_phys(io_domain, res->start);
> +	if (phys_addr)
> +		return;
> +
> +	iommu_map(io_domain, res->start, res->start,
> +		  ALIGN(resource_size(res), SZ_4K),
> +		  IOMMU_READ | IOMMU_WRITE);
> +}
> +
> +static void ipmmu_workaround_dt(struct iommu_domain *io_domain,
> +				struct device *dev,
> +				void (*match)(struct iommu_domain *io_domain,
> +					      struct device *dma_dev,
> +					      struct resource *res))
> +{
> +	struct device_node *np = NULL;
> +	struct of_phandle_args dma_spec;
> +	struct resource r;
> +	int i, cnt;
> +	bool found;
> +
> +	/* Locate I/O devices using the DMAC and map their registers */
> +	while ((np = of_find_all_nodes(np))) {
> +		if (!of_find_property(np, "dmas", NULL))
> +			continue;
> +
> +		cnt = of_property_count_strings(np, "dma-names");
> +		if (cnt < 0)
> +			continue;
> +
> +		found = false;
> +		for (i = 0; i < cnt; i++) {
> +			if (of_parse_phandle_with_args(np, "dmas",
> +						       "#dma-cells", i,
> +						       &dma_spec))
> +				continue;
> +
> +			if (dma_spec.np == dev->of_node)
> +				found = true;
> +
> +			of_node_put(dma_spec.np);
> +		}
> +
> +		if (!found)
> +			continue;
> +
> +		i = 0;
> +		while (!of_address_to_resource(np, i, &r)) {
> +			match(io_domain, dev, &r);
> +			i++;
> +		}
> +	}
> +}
> +
> +static void ipmmu_workaround(struct iommu_domain *io_domain,
> +			     struct device *dev)
> +{
> +	/* only apply workaround for DMA controllers */
> +	if (!strstr(dev_name(dev), "dma-controller"))
> +		return;
> +
> +	dev_info(dev, "Adding iommu workaround to map I/O devices for DMACs\n");
> +	ipmmu_workaround_dt(io_domain, dev, ipmmu_workaround_map);
> +}
> +
>  static int ipmmu_attach_device(struct iommu_domain *io_domain,
>  			       struct device *dev)
>  {
> @@ -678,6 +751,8 @@ static int ipmmu_attach_device(struct io
>  	if (ret < 0)
>  		return ret;
>  
> +	ipmmu_workaround(io_domain, dev);
> +
>  	for (i = 0; i < archdata->num_utlbs; ++i)
>  		ipmmu_utlb_enable(domain, archdata->utlbs[i]);
>  

-- 
Regards,
Niklas S�derlund
