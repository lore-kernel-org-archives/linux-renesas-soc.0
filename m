Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7022340404;
	Wed,  3 Jun 2026 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780483763; cv=none; b=ox1AZZaF+0VdanC2XQ0lRO5qiLD/HTPFGGxqx25r+n7h0IY/DXjRvhd9fB4B055k9sWO2EHzYFklv3pu7LjVlWE7iWUPA2lDw7Af4fkrmXaTzAR9zBWJ7bgz1IXZb+8Ydun+abQHg+gK6G7cwGw3nx72PwstJyh1jBb8uqIA25A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780483763; c=relaxed/simple;
	bh=Yf2jP1ZX0qj4lwlQlAgE2125rmoRW5rzDlkT8dT4y+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/pFLewy0QsU2KV4odwJIDhbdtiug0Ty5L8w27KKElOJqcwXr9yZhaGT/ruOYua0Vg/emHdJoZoAQXB8MF2HN3NLx7XN16zeZPlq1SioKe/60sokExZZNeYKiuArWxFtQ29GTxzFIWF/TzsqqRWYklV6muOgONsb47MqdS7Yr64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qnTovOA3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qnTovOA3"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A815664;
	Wed,  3 Jun 2026 12:48:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780483730;
	bh=Yf2jP1ZX0qj4lwlQlAgE2125rmoRW5rzDlkT8dT4y+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qnTovOA32ODYMpq2ijsWTPhq0lPEYZBr+XQCama1K+BW0iQr6BAh+Tq9uylRZ4J+q
	 45w7yDiSjuQyPKZ0EIFcejUJdG71kJOihBbGnhBNiYrqp1/4XimE8I02ZswVE0QvzP
	 k5rWTz7oeuC4mwoeyxUKGb2iOa9EzhSEZ/wh5MUU=
Date: Wed, 3 Jun 2026 12:49:11 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/13] media: Add RPP_X1_PARAMS and RPP_X1_STATS meta
 formats
Message-ID: <aiAGShBotGpjm64f@zed>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260516211320.3041412-2-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

On Sat, May 16, 2026 at 11:13:08PM +0200, Niklas Söderlund wrote:
> From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
>
> Register V4L2 metadata fourcc codes for the Dreamchip RPP-X1 ISP
> parameters and statistics buffers. These formats are used by the driver
> to exchange ISP configuration and 3A statistics with userspace through
> the extensible parameters framework.
>
> Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Depending on the discussion on
[PATCH 0/6] media: v4l2-isp: Add support for extensible statistics
we might be able to drop these two.

In case we don't is it intentional to split documenting them to a
later patch ?

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a2b650f4ec3c..cd3f4a86e27f 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_RPP_X1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
> +	case V4L2_META_FMT_RPP_X1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index eda4492e40dc..1f78b5378b3b 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -889,6 +889,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
>  #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
>
> +/* Vendor specific - used for Dreamchip RPP-X1 ISP */
> +#define V4L2_META_FMT_RPP_X1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
> +#define V4L2_META_FMT_RPP_X1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> --
> 2.54.0
>
