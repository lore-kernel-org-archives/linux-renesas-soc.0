Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1970390214;
	Wed,  7 Oct 2026 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369851; cv=none; b=H03aW2uSeT+4izymziJUk3YRKD6h+wRD6c0QQ1K8IIOVOTj8gMm9v/5qxqwUTARMMMAMQgjCdCkNwIUtbBxN20uPLfxbmHm46ulEt4jW5+5lb9ypGxaMCZIRqT4wjpVU7M8PScG8OkUtXW1aNfen8uAFrpv0iDNWNWwRF5VRleU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369851; c=relaxed/simple;
	bh=ZSt1VCxcv8vWZabEwWw2btpSw9/kR+tRGemyzKcLuWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUi6d7NXcYEhHV1Vo2ekws9yzlZ2q4KcAhFG22Ab4vw2BCIvInIVOp8pOLpTN2qJN0bx6WCronJml1apZQPp31O0WyRjAAa0AK6UMFJ8BKssZ0VSW3vc+yIjcjUFiDt/GIWHCztLHMphrwzQmylIc/XN4RvDj6nh4thf+iJXTis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kBAxB56r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kBAxB56r"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12C962C6;
	Wed,  7 Oct 2026 12:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791369701;
	bh=ZSt1VCxcv8vWZabEwWw2btpSw9/kR+tRGemyzKcLuWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kBAxB56rD67LE+mrEaCiXsndq6hIO9UtMsLKWP3Vru4jfc35ZnD2CmX5BYKzEjJr3
	 RUJn8KHHv6ROeUf3YV0e+XJ5g3+OcHQ4Z9ttW9mFrpGJRZcGZHcOihbSH3jOaXwbeu
	 j0Alc/snJd9yjXQHL//hi64FoHSOon/DjVNDWIm4=
Message-ID: <5966b6e4-77c9-40d5-8ba1-b005fcd60022@ideasonboard.com>
Date: Wed, 7 Oct 2026 11:43:35 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: media: renesas,r9a09g057-ivc:
 Describe additional interrupts
To: Linus Walleij <linusw@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-1-2cf7eb746ebb@kernel.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-1-2cf7eb746ebb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus

On 28/09/2026 13:21, Linus Walleij wrote:
> The RZ/V2H IVC provides input frame-start and frame-stop completion
> interrupts alongside its input frame-end interrupt.
> 
> Describe these optional interrupts, keeping frame end first and requiring
> only that entry to preserve support for existing device trees. Extend the
> example to show all three interrupts using mock interrupt numbers.
> 
> Assisted-by: LLM
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>   .../devicetree/bindings/media/renesas,r9a09g057-ivc.yaml      | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> index c09cbd8c9e35..3eeb1a92c9cf 100644
> --- a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> @@ -21,7 +21,11 @@ properties:
>       maxItems: 1
>   
>     interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Image input frame-end interrupt
> +      - description: Image input frame-start interrupt
> +      - description: Frame-stop processing completion interrupt

Perhaps interrupt-names too?

Thanks
Dan

>   
>     clocks:
>       items:
> @@ -92,7 +96,10 @@ examples:
>                  <&cpg 0xd3>;
>         reset-names = "reg", "axi", "isp";
>   
> -      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +      /* Example interrupt numbers. */
> +      interrupts = <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
>   
>         port {
>           ivc_out: endpoint {
> 

