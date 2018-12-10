Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51439 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbeLJMhK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:37:10 -0500
Received: by mail-wm1-f65.google.com with SMTP id s14so10796759wmh.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 04:37:09 -0800 (PST)
Subject: Re: [PATCH v4 1/5] nvmem: check invalid number of bytes in
 nvmem_device_{read,write}
To: Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1544182066-31528-1-git-send-email-biju.das@bp.renesas.com>
 <1544182066-31528-2-git-send-email-biju.das@bp.renesas.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3c09d148-7102-1ee5-770a-009e40de6168@linaro.org>
Date: Mon, 10 Dec 2018 12:37:06 +0000
MIME-Version: 1.0
In-Reply-To: <1544182066-31528-2-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Thanks for the patch.

On 07/12/18 11:27, Biju Das wrote:
> Add check in nvmem_device_{read,write}()to ensure that nvmem core never
> passes an invalid number of bytes.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V3-->V4
> 	* New patch.
> ---
>   drivers/nvmem/core.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 

Its better to move checks from 
bin_attr_nvmem_read()/bin_attr_nvmem_write() into nvmem_reg_read() and 
nvmem_reg_write(), so its easy to maintain, rather than adding them to 
each function.

> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index d9fd110..db7de33 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -1433,10 +1433,21 @@ int nvmem_device_read(struct nvmem_device *nvmem,
>   		      size_t bytes, void *buf)
>   {
>   	int rc;
> +	size_t new_bytes;
>   
>   	if (!nvmem)
>   		return -EINVAL;
>   
> +	/* Stop the user from reading */
> +	if ((offset >= nvmem->size) || (bytes == 0))
> +		return 0;
> +
> +	if (unlikely(check_add_overflow(bytes, offset, &new_bytes)))
> +		return -EOVERFLOW;
> +
> +	if (new_bytes > nvmem->size)
> +		bytes = nvmem->size - offset;
> +
>   	rc = nvmem_reg_read(nvmem, offset, buf, bytes);
>   
>   	if (rc)
> @@ -1461,16 +1472,29 @@ int nvmem_device_write(struct nvmem_device *nvmem,
>   		       size_t bytes, void *buf)
>   {
>   	int rc;
> +	size_t new_bytes;
>   
>   	if (!nvmem)
>   		return -EINVAL;
>   
> +	/* Stop the user from writing */
> +	if (offset >= nvmem->size)
> +		return -ENOSPC;
> +
> +	if (bytes == 0)
> +		return 0;
> +
> +	if (unlikely(check_add_overflow(bytes, offset, &new_bytes)))
> +		return -EOVERFLOW;
> +
> +	if (new_bytes > nvmem->size)
> +		bytes = nvmem->size - offset;
> +
>   	rc = nvmem_reg_write(nvmem, offset, buf, bytes);
>   
>   	if (rc)
>   		return rc;
>   
> -

Unrelated change!


--srini
>   	return bytes;
>   }
>   EXPORT_SYMBOL_GPL(nvmem_device_write);
> 
