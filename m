Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v3 01/09] iommu/ipmmu-vmsa: Introduce features, break out
 alias
To: Magnus Damm <magnus.damm@gmail.com>, joro@8bytes.org
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
 <148897089355.16106.305846051553789544.sendpatchset@little-apple>
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        m.szyprowski@samsung.com
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <fe78313c-5cb8-d6d3-428e-deff2851d938@arm.com>
Date: Wed, 8 Mar 2017 11:53:48 +0000
MIME-Version: 1.0
In-Reply-To: <148897089355.16106.305846051553789544.sendpatchset@little-apple>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On 08/03/17 11:01, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Introduce struct ipmmu_features to track various hardware
> and software implementation changes inside the driver for
> different kinds of IPMMU hardware. Add use_ns_alias_offset
> as a first example of a feature to control if the secure
> register bank offset should be used or not.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Changes since V2:
>  - None
> 
>  Changes since V1:
>  - Moved patch to front of the series
> 
>  drivers/iommu/ipmmu-vmsa.c |   35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> --- 0007/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c	2017-03-07 12:25:47.000000000 +0900
> @@ -32,11 +32,15 @@
>  
>  #define IPMMU_CTX_MAX 1
>  
> +struct ipmmu_features {
> +	bool use_ns_alias_offset;
> +};
> +
>  struct ipmmu_vmsa_device {
>  	struct device *dev;
>  	void __iomem *base;
>  	struct list_head list;
> -
> +	const struct ipmmu_features *features;
>  	unsigned int num_utlbs;
>  	spinlock_t lock;			/* Protects ctx and domains[] */
>  	DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
> @@ -999,13 +1003,33 @@ static void ipmmu_device_reset(struct ip
>  		ipmmu_write(mmu, i * IM_CTX_SIZE + IMCTR, 0);
>  }
>  
> +static const struct ipmmu_features ipmmu_features_default = {
> +	.use_ns_alias_offset = true,
> +};
> +
> +static const struct of_device_id ipmmu_of_ids[] = {
> +	{
> +		.compatible = "renesas,ipmmu-vmsa",
> +		.data = &ipmmu_features_default,
> +	}, {
> +		/* Terminator */
> +	},
> +};
> +
> +MODULE_DEVICE_TABLE(of, ipmmu_of_ids);
> +
>  static int ipmmu_probe(struct platform_device *pdev)
>  {
>  	struct ipmmu_vmsa_device *mmu;
> +	const struct of_device_id *match;
>  	struct resource *res;
>  	int irq;
>  	int ret;
>  
> +	match = of_match_node(ipmmu_of_ids, pdev->dev.of_node);

of_device_get_match_data() makes this a lot easier.

> +	if (!match)
> +		return -EINVAL;

Also, if the driver is DT-only per the other series, note that this
cannot happen anyway, since of_driver_match_device() would have to have
found a match for your probe function to be called in the first place.

Robin.

> +
>  	mmu = devm_kzalloc(&pdev->dev, sizeof(*mmu), GFP_KERNEL);
>  	if (!mmu) {
>  		dev_err(&pdev->dev, "cannot allocate device data\n");
> @@ -1016,6 +1040,7 @@ static int ipmmu_probe(struct platform_d
>  	mmu->num_utlbs = 32;
>  	spin_lock_init(&mmu->lock);
>  	bitmap_zero(mmu->ctx, IPMMU_CTX_MAX);
> +	mmu->features = match->data;
>  
>  	/* Map I/O memory and request IRQ. */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -1035,7 +1060,8 @@ static int ipmmu_probe(struct platform_d
>  	 * Offset the registers base unconditionally to point to the non-secure
>  	 * alias space for now.
>  	 */
> -	mmu->base += IM_NS_ALIAS_OFFSET;
> +	if (mmu->features->use_ns_alias_offset)
> +		mmu->base += IM_NS_ALIAS_OFFSET;
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> @@ -1084,11 +1110,6 @@ static int ipmmu_remove(struct platform_
>  	return 0;
>  }
>  
> -static const struct of_device_id ipmmu_of_ids[] = {
> -	{ .compatible = "renesas,ipmmu-vmsa", },
> -	{ }
> -};
> -
>  static struct platform_driver ipmmu_driver = {
>  	.driver = {
>  		.name = "ipmmu-vmsa",
> 
