Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89332BDC2A;
	Wed, 10 Jun 2026 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108883; cv=none; b=qgo+xFZ+at5ayXi2uj2X9q+zH6AU6pH3+gtybZbVGA8eRwkhxOz2dNGAKI0dkqngWDs2ikO8Ncfqa5dA75VsTsoVv2JqcpCjNLnVps9cGr5aUbVOJhFxXgAh+JvdRqoUrMS4NuSA75Nb6prlEY8r0pFrhHejo1sH9S1ktfRLjW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108883; c=relaxed/simple;
	bh=cPuoThRwDo0MU55TV2huo4Vv4tJ+HtOl9z5UaFpA8ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8j6MnP4422Dhhph7M4u8zMwRyKuHiviH4xNYy1iQbQPdGJRvsDNv4H2cybOJ1EUNW96rYzBnLc/s6Y7BMljfrpwK4hZBxypc8ew+0m9KA3QXoELyuBjGqZqJZiFeHElwYFF72luR1LpAvUDWPLaohcclcnIFUpKuwNQYFxCf6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mpn3nKjW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mpn3nKjW"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A74B524;
	Wed, 10 Jun 2026 18:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781108850;
	bh=cPuoThRwDo0MU55TV2huo4Vv4tJ+HtOl9z5UaFpA8ZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mpn3nKjWWpHqlJRVyqNHlRMTyrc9dMykbcYuWmaH7VGL49sXpoMzDICRoIm2JOlvb
	 Qj78vLByuyyWGbj8NVAYOgQnzipt7l+rCGJuNXraUuyPst9tN/nXzd+XCg49VCxVxu
	 474+AVHFhNw0wTkHBp6xAQP7DRi6rlQ1z8QbgmTc=
Message-ID: <99ac3dc6-c3b4-47d7-a3ee-1b50573d1b9b@ideasonboard.com>
Date: Wed, 10 Jun 2026 17:27:56 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: mc-entity: Add missing kerneldoc
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
 <20260610-media-ci-7-2-v1-3-3c61a482a44e@chromium.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260610-media-ci-7-2-v1-3-3c61a482a44e@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ricardo

On 10/06/2026 17:20, Ricardo Ribalda wrote:
> The argument args is not documented, and the latest kernel version
> complains about that.
> 
> This fixes the following warning:
> Warning: include/media/media-entity.h:1394 function parameter 'args'
> not described in 'media_entity_call'
> 
> Cc: stable@kernel.org
> Fixes: 48a7c4bac94d ("[media] docs-rst: improve the kAPI documentation for the mediactl")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   include/media/media-entity.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index d9b72cd87d52..fa393e840669 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1387,6 +1387,7 @@ void media_remove_intf_links(struct media_interface *intf);
>    * @entity: entity where the @operation will be called
>    * @operation: type of the operation. Should be the name of a member of
>    *	struct &media_entity_operations.
> + * @args: arguments for the operation.
>    *
>    * This helper function will check if @operation is not %NULL. On such case,
>    * it will issue a call to @operation\(@entity, @args\).
> 

