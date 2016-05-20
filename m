Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:39369 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754089AbcETH25 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 20 May 2016 03:28:57 -0400
Subject: Re: Hard coded register address in "drm: rcar-du: Add DPLL support"?
To: <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
References: <9fc07c0c-0760-a713-5ca0-c70861576467@de.bosch.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <81c7a444-d6f8-747b-edef-646120b120ed@de.bosch.com>
Date: Fri, 20 May 2016 09:28:54 +0200
MIME-Version: 1.0
In-Reply-To: <9fc07c0c-0760-a713-5ca0-c70861576467@de.bosch.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18.05.2016 16:29, Dirk Behme wrote:
> Hi,
>
> I'm not sure on which mailing list this
>
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/commit/drivers/gpu/drm/rcar-du/rcar_du_crtc.c?h=topic/gen3-latest&id=e297be92f09a9e8f9a63e72b8d69440dbf5bbabe
>
> drm: rcar-du: Add DPLL support
>
> is discussed.
>
> But it's the same like with the hard coded MODEMR register: We don't
> want the hard coded
>
> #define PRODUCT_REG 0xfff00044
>
> here.
>
> Are there already patches or plans to convert this to a device tree
> based interface?


Looking into the HW documentation for the product register, this seems 
to be not associated with any hardware block (IP block), but 'just' a 
register somewhere in the address space. Documented in the appendix.

So a device tree based access function for this could be simple. E.g. 
like below [1].

What do you think about this? Where would we put code like this? 
drivers/misc?

Best regards

Dirk

[1]

static struct of_device_id rcar_gen3_prr_ids[] __initdata = {
         { .compatible = "renesas,rcar-gen3-prr" },
         {}
};

int __init rcar_gen3_read_product(u32 *prr)
{
         void __iomem *product;
         struct device_node *np;

         np = of_find_matching_node(NULL, rcar_gen3_prr_ids);
         if (!np) {
                 pr_err("can't find Renesas rcar-gen3-prr device node");
		return -ENOMEM;
         }

         product = of_iomap(np, 0);
         prr = ioread32(product);
         iounmap(product);
         of_node_put(np);

	return 0;
}
