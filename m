Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7941D63F3;
	Mon, 23 Mar 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275626; cv=none; b=Ki6+Iabh1w8DEY1SXWn7fVXpnPX08pg3mlYxmSip6bi7FoNGR8f2004XSnXDDweGjqp6BdEul1vJIYCGmg/dV6FQ16CbptyHgeLjzT8QsSN56TmHw7xs0QxEKyGzoWZOQFvOALJYH85sxdyEdXEIMFUjFRLV9I9JLbUZTVtQO0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275626; c=relaxed/simple;
	bh=flg7ElwyU59BsGjspbazLSKnxQYip83CnYjxh+Wig2w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=U4/c4lyNDQlzzTapwWvl4z4LmqXragNDZKS5hsY7wzdS7wYfmXWL6ZrIsxUi+FYw0kgQUmqJQOPtcwxvzsHCZTK1V5UTEDxn0NX252N1GxE3+2KBo7WtglpPl2m/gymocKSceltZB3ZhJFBxutwIpHz30PvO6iCz4wD8DXgiGww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=V57JBstp; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="V57JBstp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=OmxJ1apwp+OWULkeu85yy8mpbmRe+k4PsouBkcueBoc=; b=V57JBstp+y9wrbGTRv998IMyEq
	6lIpMt9N5WURxMfOOmTgTV3bZNy/8ZSvBwa3xO53FRSt6aeUfRHx+AKIIxf7SiITfnkMsLf/amPG/
	EI/BNnOVvxnB4TE0l4Yws9m5ORxB+jrsBqVMgYtjE75YTqHJjJWKDvJGKyhWIwkkug4k=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w4g8d-000000006rQ-34YE;
	Mon, 23 Mar 2026 10:20:15 -0400
Date: Mon, 23 Mar 2026 10:20:15 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chris Brandt <chris.brandt@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Sam Ravnborg
 <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/4] drm: renesas: rzg2l_mipi_dsi: Increase reset
 deassertion delay to 1 msec
Message-Id: <20260323102015.957b2f855b7d54aa5d33869d@hugovil.com>
In-Reply-To: <20260319164833.409126-5-biju.das.jz@bp.renesas.com>
References: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
	<20260319164833.409126-5-biju.das.jz@bp.renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --

Hi Biju,

On Thu, 19 Mar 2026 16:48:28 +0000
Biju <biju.das.au@gmail.com> wrote:

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
> requires waiting more than 1 msec after deasserting the CMN_RSTB signal
> before the DSI-Tx module is ready. Increase the delay from 1 usec to
> 1 msec by replacing udelay(1) with fsleep(1000).
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

In your first submission, I commented that "...this should be backported
to stable branches (missing Fixes / Cc: stable tags)?" and you answered
with "Agreed, will add fixes/stable tags".

If you still agree, this patch should be #3 in your list, so that it is
easier/straightforward to backport to stable branches.


> ---
> v1->v2:
>  * Updated commit header and description.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 5020be0f72ac..715872130780 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -807,7 +807,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  		if (ret < 0)
>  			goto err_phy;
>  
> -		udelay(1);
> +		fsleep(1000);
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 
> 


-- 
Hugo Villeneuve
