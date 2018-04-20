Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-by2nam03on0066.outbound.protection.outlook.com ([104.47.42.66]:39341
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753541AbeDTHY1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 03:24:27 -0400
Subject: Re: [PATCH 46/61] spi: simplify getting .drvdata
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-kernel@vger.kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-47-wsa+renesas@sang-engineering.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <80e6c822-094e-fded-d8bd-28f4cb7d14ad@xilinx.com>
Date: Fri, 20 Apr 2018 09:24:04 +0200
MIME-Version: 1.0
In-Reply-To: <20180419140641.27926-47-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19.4.2018 16:06, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/spi/spi-cadence.c      | 6 ++----
>  drivers/spi/spi-zynqmp-gqspi.c | 6 ++----
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
> index 5c9516ae4942..de394422b611 100644
> --- a/drivers/spi/spi-cadence.c
> +++ b/drivers/spi/spi-cadence.c
> @@ -686,8 +686,7 @@ static int cdns_spi_remove(struct platform_device *pdev)
>   */
>  static int __maybe_unused cdns_spi_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct spi_master *master = platform_get_drvdata(pdev);
> +	struct spi_master *master = dev_get_drvdata(dev);
>  
>  	return spi_master_suspend(master);
>  }
> @@ -702,8 +701,7 @@ static int __maybe_unused cdns_spi_suspend(struct device *dev)
>   */
>  static int __maybe_unused cdns_spi_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct spi_master *master = platform_get_drvdata(pdev);
> +	struct spi_master *master = dev_get_drvdata(dev);
>  	struct cdns_spi *xspi = spi_master_get_devdata(master);
>  
>  	cdns_spi_init_hw(xspi);
> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
> index 18aeaceee286..3608db4ff368 100644
> --- a/drivers/spi/spi-zynqmp-gqspi.c
> +++ b/drivers/spi/spi-zynqmp-gqspi.c
> @@ -918,8 +918,7 @@ static int zynqmp_qspi_start_transfer(struct spi_master *master,
>   */
>  static int __maybe_unused zynqmp_qspi_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct spi_master *master = platform_get_drvdata(pdev);
> +	struct spi_master *master = dev_get_drvdata(dev);
>  
>  	spi_master_suspend(master);
>  
> @@ -939,8 +938,7 @@ static int __maybe_unused zynqmp_qspi_suspend(struct device *dev)
>   */
>  static int __maybe_unused zynqmp_qspi_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct spi_master *master = platform_get_drvdata(pdev);
> +	struct spi_master *master = dev_get_drvdata(dev);
>  	struct zynqmp_qspi *xqspi = spi_master_get_devdata(master);
>  	int ret = 0;
>  
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
