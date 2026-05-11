Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A643FB7F6;
	Mon, 11 May 2026 14:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510034; cv=none; b=jM48nL92d3eGGVlvAWx0TZlz8mTm6acX61Wwq0nIt7KowmNF1tx3JV7SHdU1jfqknz8SK/LijHGojaAPjRmXGcRZcqKqrSis8hcBuqDcmmg7XymuhNcx4H5QxTfJT0f4Y34Zd6xZXFEq0ic97q+Ch0q8W0ipBxqKxwKg3Xuoqx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510034; c=relaxed/simple;
	bh=0fj7wnBYDccuNpTcPoV6mvHs/A8YIPy1/bY/3l+gszc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoNWefHhtNyXCTilcIjv1j26BRBemPoIlN0Dq4JuF7sH2L9oyc7FFjxehfSOg0MJVQqeXQf7u8NC+VsrR50YQTnTDMVLfnHxmjIfwE3gyw3HJDL6W/BULxKhKpqSS+OvGKj83g4tfNEqrlP3O+ED6XSlkzph+r3qZH+5+mELWRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cBbfUvQ0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cBbfUvQ0"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08CA19D1;
	Mon, 11 May 2026 16:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778510024;
	bh=0fj7wnBYDccuNpTcPoV6mvHs/A8YIPy1/bY/3l+gszc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cBbfUvQ03v2itHNZACVFzJQbYUWFHuV1VFRi4O2Ic1JUt4qHIZM/pzGf2ga+yx7TG
	 iuBBH4CXK/fHRiEEFNFz3DIzHH7lM7CfwsN1k8Y5JkAEw3B40aZXXfkoAcjHxRyVYk
	 EJNrt5zF2jB3w3UKc5QXNLL+9qocNLqnr6nblIKU=
Message-ID: <ab7b83b6-e2ba-4578-bb62-ec074584cdd5@ideasonboard.com>
Date: Mon, 11 May 2026 15:33:48 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rzv2h-ivc: Add myself as co-maintainer
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20260511143239.136253-1-jacopo.mondi@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260511143239.136253-1-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Jacopo!

On 11/05/2026 15:32, Jacopo Mondi wrote:
> Add myself as co-maintainer of the RZ/V2H(P) IVC block.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Acked-by: Daniel Scally <dan.scally@ideasonboard.com>

or whatever other tag is appropriate :)

> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 81d53481d3f7..f2be8f02dffb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22751,6 +22751,7 @@ F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> 
>   RENESAS RZ/V2H(P) INPUT VIDEO CONTROL BLOCK DRIVER
>   M:	Daniel Scally <dan.scally@ideasonboard.com>
> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> --
> 2.53.0
> 

