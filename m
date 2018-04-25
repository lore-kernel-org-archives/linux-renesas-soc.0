Return-Path: <lorenzo.pieralisi@arm.com>
Date: Wed, 25 Apr 2018 15:13:29 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-pci@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: rcar: Poll more often in rcar_pcie_wait_for_dl()
Message-ID: <20180425141329.GA20923@e107981-ln.cambridge.arm.com>
References: <20180318105253.30532-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180318105253.30532-1-marek.vasut+renesas@gmail.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Sun, Mar 18, 2018 at 11:52:52AM +0100, Marek Vasut wrote:
> The data link active signal usually takes ~20 uSec to be asserted,
> poll the bit more often to avoid useless delays in this function.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Phil Edworthy <phil.edworthy@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/pci/host/pcie-rcar.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I assume this patch is still a valid change, I noticed you split this
series but I think this patch was not updated so I should take it as-is.

Please let me know.

Thanks,
Lorenzo

> diff --git a/drivers/pci/host/pcie-rcar.c b/drivers/pci/host/pcie-rcar.c
> index 93d59f15c589..099998f1923a 100644
> --- a/drivers/pci/host/pcie-rcar.c
> +++ b/drivers/pci/host/pcie-rcar.c
> @@ -528,13 +528,13 @@ static void phy_write_reg(struct rcar_pcie *pcie,
>  
>  static int rcar_pcie_wait_for_dl(struct rcar_pcie *pcie)
>  {
> -	unsigned int timeout = 10;
> +	unsigned int timeout = 10000;
>  
>  	while (timeout--) {
>  		if ((rcar_pci_read_reg(pcie, PCIETSTR) & DATA_LINK_ACTIVE))
>  			return 0;
>  
> -		msleep(5);
> +		udelay(5);
>  	}
>  
>  	return -ETIMEDOUT;
> -- 
> 2.16.2
> 
