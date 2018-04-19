Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:55006 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752337AbeDSPQb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 11:16:31 -0400
Subject: Re: [PATCH 09/61] dmaengine: qcom: simplify getting .drvdata
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Vinod Koul <vinod.koul@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-10-wsa+renesas@sang-engineering.com>
From: Sinan Kaya <okaya@codeaurora.org>
Message-ID: <0d22fa16-1511-33ed-363e-fc42e4287aa0@codeaurora.org>
Date: Thu, 19 Apr 2018 11:16:26 -0400
MIME-Version: 1.0
In-Reply-To: <20180419140641.27926-10-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 4/19/2018 10:05 AM, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/dma/qcom/hidma.c          | 3 +--
>  drivers/dma/qcom/hidma_mgmt_sys.c | 6 ++----
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index 963cc5228d05..43d4b00b8138 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -616,8 +616,7 @@ static irqreturn_t hidma_chirq_handler_msi(int chirq, void *arg)
>  static ssize_t hidma_show_values(struct device *dev,
>  				 struct device_attribute *attr, char *buf)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct hidma_dev *mdev = platform_get_drvdata(pdev);
> +	struct hidma_dev *mdev = dev_get_drvdata(dev);
>  
>  	buf[0] = 0;
>  
> diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
> index d61f1068a34b..cbb89eafd844 100644
> --- a/drivers/dma/qcom/hidma_mgmt_sys.c
> +++ b/drivers/dma/qcom/hidma_mgmt_sys.c
> @@ -107,8 +107,7 @@ static struct hidma_mgmt_fileinfo hidma_mgmt_files[] = {
>  static ssize_t show_values(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct hidma_mgmt_dev *mdev = platform_get_drvdata(pdev);
> +	struct hidma_mgmt_dev *mdev = dev_get_drvdata(dev);
>  	unsigned int i;
>  
>  	buf[0] = 0;
> @@ -125,8 +124,7 @@ static ssize_t show_values(struct device *dev, struct device_attribute *attr,
>  static ssize_t set_values(struct device *dev, struct device_attribute *attr,
>  			  const char *buf, size_t count)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct hidma_mgmt_dev *mdev = platform_get_drvdata(pdev);
> +	struct hidma_mgmt_dev *mdev = dev_get_drvdata(dev);
>  	unsigned long tmp;
>  	unsigned int i;
>  	int rc;
> 

Reviewed-by: Sinan Kaya <okaya@codeaurora.org>

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
