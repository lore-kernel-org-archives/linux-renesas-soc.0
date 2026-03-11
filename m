Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA1C1A6805;
	Wed, 11 Mar 2026 06:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773209750; cv=none; b=lXwKosqG5gzIETAhe/Efofgnr8VAXByL8LaehURUldyiOIMwDiBzJNLi707cKgYRWBItrM4o4p5m1t9iu76YyzgIm6HKbJxXfvy/RssUfhs9WuC7x/vdVqgtv9lhFz+QwxvLW7encuhL7Lt815rrqgzKmPhMegrZzvu6We3hL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773209750; c=relaxed/simple;
	bh=qKtkeYyFhO6JI0HOecDpKA7+t09P9i18Ips+H7V7f3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6ewEfd4cTOviXwpGosr1dE+WKVTHPesz4ZiwApvG7rUbgFr7PFcXQEu+EpDVZ011AyiVSbe4hbIGuiydIonE6jpsPvu7TT3TMuCwXnvlUqUGukTXTMiW5+gaX1zSClPyBZ4fZaXGNoeE86HttZKaEkwVl1JvFXQLAKd1gNl/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FBZMl6ju; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FBZMl6ju"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54BAD4B3;
	Wed, 11 Mar 2026 07:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773209679;
	bh=qKtkeYyFhO6JI0HOecDpKA7+t09P9i18Ips+H7V7f3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FBZMl6juEGe1XRMNCESO6CKU7IG3iKgJ/Km4bovsqfmz/w9YCf4USf9OpfK1Jo/j/
	 3GmnaDnSX5duu2ZUuAPbu1VuCXm0r5IzAvV3PiAzEobXq62lNn9icxu7amFIFd61PN
	 fMFFMmD0XHw8NgbsfTyz0UONtZVRNY68DrEWGFUs=
Message-ID: <0a8c0467-04f7-4b8f-8988-cb5665ca1d68@ideasonboard.com>
Date: Wed, 11 Mar 2026 08:15:43 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: renesas: vsp1: Fix NULL pointer deref on module
 unload
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Ping. Would be good to have this fix merged.

 Tomi

On 15/01/2026 11:22, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> When unloading the module on gen 4, we hit a NULL pointer dereference.
> This is caused by the cleanup code calling vsp1_drm_cleanup() where it
> should be calling vsp1_vspx_cleanup().
> 
> Fix this by checking the IP version and calling the drm or vspx function
> accordingly, the same way as the init code does.
> 
> Fixes: d06c1a9f348d ("media: vsp1: Add VSPX support")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 6c64657fc4f3..30df9b36642d 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -240,8 +240,12 @@ static void vsp1_destroy_entities(struct vsp1_device *vsp1)
>  		media_device_unregister(&vsp1->media_dev);
>  	media_device_cleanup(&vsp1->media_dev);
>  
> -	if (!vsp1->info->uapi)
> -		vsp1_drm_cleanup(vsp1);
> +	if (!vsp1->info->uapi) {
> +		if (vsp1->info->version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
> +			vsp1_vspx_cleanup(vsp1);
> +		else
> +			vsp1_drm_cleanup(vsp1);
> +	}
>  }
>  
>  static int vsp1_create_entities(struct vsp1_device *vsp1)
> 
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20260115-rcar-vsp-crash-fix-8d4871f0f39e
> 
> Best regards,

