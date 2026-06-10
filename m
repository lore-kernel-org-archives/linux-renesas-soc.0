Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE242FE066;
	Wed, 10 Jun 2026 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108564; cv=none; b=HhopZ2+/xPeEM9TX7RBKWZ93ldeMmp3xV/cX1vFbflGiPWtzHzOwHqzWNzEkiRdbAnwrzHJEtU4etMl3yYRP96PLoWHEtCxRSQ85vpgVP/w/wfAQzlZ+YjUuSY2KiKpLKHyAjuWs3ENQB0sPpSk2GvqgkkFzxlqvia3IKP1anZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108564; c=relaxed/simple;
	bh=Dn8ba+w9aY0Bt9pG+INLtIHvs6rE2GTTrGIs52UdO2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfH1GLH8IcNPEqu/yYy3+YD9lyRRsDgLPwMXE6GkkCaPhWqoFSjpW3eIE3BFkFCxQvwHBIuLcjIJB2SybpVCBabZ3LAVXp8hB4ec+DiT3HP40ISsqdLq0hVAnvqks/Lz2NSC4LaAsCZcKE6tBtG5r8l7lPg6ZZZF1VHPSie/IcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kjIZ/8jY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kjIZ/8jY"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D8CD524;
	Wed, 10 Jun 2026 18:22:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781108531;
	bh=Dn8ba+w9aY0Bt9pG+INLtIHvs6rE2GTTrGIs52UdO2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kjIZ/8jYp67bIsVo5CFlM2y8ExhLyQhE4siplaAXtQgDBBrfqOYynGmc9qx3hfLAM
	 yBUithz5RKLXZon3B8q5Muhn4v6RkTURSUJsKJgXiQ8hrF+KCpEDWT+Nm92zbU9F4e
	 FiKjk2/BLwIhbUS5cAtzbahKwRGbazlUd4q3JYtk=
Message-ID: <8aba88da-d5b5-4252-9a15-91baad81f1ab@ideasonboard.com>
Date: Wed, 10 Jun 2026 17:22:36 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
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
 linux-renesas-soc@vger.kernel.org
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ricardo - thanks for the patch

On 10/06/2026 17:20, Ricardo Ribalda wrote:
> The variable has been previously removed but not its kerneldoc.
> 
> Also remove the leftover reference to state in the description of qlock.
> 
> This patch fixes the following warning:
> 
> Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> Excess struct member 'state' description in 'rzg2l_cru_dev'
> 
> Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>   drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 5bf334e173d2..b426bc7898bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -116,11 +116,9 @@ struct rzg2l_cru_info {
>    * @scratch_phys:	physical address of the scratch buffer
>    *
>    * @qlock:		protects @queue_buf, @buf_list, @sequence
> - *			@state
>    * @queue_buf:		Keeps track of buffers given to HW slot
>    * @buf_list:		list of queued buffers
>    * @sequence:		V4L2 buffers sequence number
> - * @state:		keeps track of operation state
>    *
>    * @format:		active V4L2 pixel format
>    */
> 

