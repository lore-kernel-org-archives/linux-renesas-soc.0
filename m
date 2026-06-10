Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031E72C031E;
	Wed, 10 Jun 2026 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108842; cv=none; b=KvfDRNWakXKUZjsmbtmOGUkeDZ05xSe9f6yBiKzfxyyBqwuqsoWsCFzdWPySrjVgoktB63mVhtXDQe3Z0IFM7gqWklODHP83DGso1yMRV54RfgsuT5svCbIBYHmSmkSqvYzfeqqGFX0cMQaciHEr0TmuI9apr+43U5nvoXb+8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108842; c=relaxed/simple;
	bh=psL4ydl0qHDXQLGmziJIUPFdUTmPUVjicfKknp+Bczs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OciNBWc0/fGOmZcNKPtGVo3fSvBIDYfNg3EiRkR2oUTFjbMdJtg6jsKWheTvqkbt2ZIBJJGjYQuRrRNEzo62anR4m8BiYIPp9bQkqGnfHG2PmFnqR+KBtgACqBKHMQccavjQbRSSyyI8P5r7rB2UpYxgdyl3Hty3XbYQPPBdyRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JKIe/BiL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JKIe/BiL"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FC58524;
	Wed, 10 Jun 2026 18:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781108809;
	bh=psL4ydl0qHDXQLGmziJIUPFdUTmPUVjicfKknp+Bczs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JKIe/BiLlChwRaYuUj4Ll3Rq17FsUOlahCSUB6yIKucPMCaZ3fsoryRuf9445ZH/t
	 TExPOF2IerkZs+hTQ0NcchPkILqy6v0xeO99iunLdGG73C6jW0C4X1LMfWkoZDKIaw
	 /znRUaewuDygqHi3u/+qtgd1I+cqiDKXlU7KPbk0=
Message-ID: <8929fce3-c648-4183-a776-0f62c7c666ff@ideasonboard.com>
Date: Wed, 10 Jun 2026 17:27:15 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: ov9282: Remove unused kerneldoc description
To: Ricardo Ribalda <ribalda@chromium.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Tarang Raval <tarang.raval@siliconsignals.io>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, stable@kernel.org
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-1-3c61a482a44e@chromium.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260610-media-ci-7-2-v1-1-3c61a482a44e@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ricardo

On 10/06/2026 17:20, Ricardo Ribalda wrote:
> The field has been removed, but the kerneldoc not. Let's take care of
> this.
> 
> This patch fixes the following warning:
> Warning: drivers/media/i2c/ov9282.c:223 Excess struct member 'mutex'
> description in 'ov9282'
> 
> Cc: stable@kernel.org
> Fixes: 0c69a963a300 ("media: i2c: ov9282: Switch to using the sub-device state lock")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>   drivers/media/i2c/ov9282.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5b6f897a74fc..3ba630ec4f2a 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -197,7 +197,6 @@ struct ov9282_mode {
>    * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
>    * @cur_mode: Pointer to current selected sensor mode
>    * @code: Mbus code currently selected
> - * @mutex: Mutex for serializing sensor controls
>    */
>   struct ov9282 {
>   	struct device *dev;
> 

