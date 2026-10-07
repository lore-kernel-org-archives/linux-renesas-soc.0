Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA3F49B47B;
	Wed,  7 Oct 2026 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370233; cv=none; b=splVGbYyT55qzNk0p5q0Pwair6rjaR2ewLQ5P5rXVf86/UMuEQkeUAHOVaHycFPYeltUsPTkjhFPttTYSFB32r/q3te2QCNp+m08Fj31gcQok49GI7y2AIkhS6XpXCTDakAq7BCeAOcSdtdp4pHya583b7kdVxskVT4HISdnJkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370233; c=relaxed/simple;
	bh=nZx5QajvvXnxEGPvC9NiwAbFgIYlybhrjHaBbwcB6YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVsCV8VEgeyr6e6F47UW7XW7b9rbZu+ezChTLgtODaTR125YSxIJIeO3zUTwJxXK27WjuvIXGat9Rmf6seSTDqrwEju7loptuBvbtOXM4OLsE9TbxVTsYmus7CCW2UYaLmhK+bjpSJ/a0Im/RtppjLm79KZDWkcLKcNwpiWvm6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sS2emzYF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sS2emzYF"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AC7E2C6;
	Wed,  7 Oct 2026 12:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791370079;
	bh=nZx5QajvvXnxEGPvC9NiwAbFgIYlybhrjHaBbwcB6YI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sS2emzYFJHAv6y1wjcvEyOvMaBW0jbtEjB5UQ3gXJnxk2LWbtBlbmK24AhnKbBfj1
	 QDyVhfAS6grLAFGKt0pcURCE5YzVzjH4+iNCTTuqdX/LMg+R8QP/42ILvVDUg3gaux
	 weylgZrgorqF7vFdrUIleZn7Low9VElC5z5HxJB0=
Message-ID: <5bc1553b-465b-42d1-a4b0-66a514b897d3@ideasonboard.com>
Date: Wed, 7 Oct 2026 11:49:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
To: Linus Walleij <linusw@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus

On 28/09/2026 13:21, Linus Walleij wrote:
> Mali-C55 exposes separate full-resolution and UV DMA writer line-tick
> interrupts in addition to its combined core interrupt.
> 
> Describe these optional interrupts, keeping the core interrupt first and
> requiring only that entry to preserve support for existing device trees.
> Extend the example to show all three interrupts using mock interrupt
> numbers.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>   Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> index fc4fcd19922a..8fcc46660b75 100644
> --- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -18,7 +18,11 @@ properties:
>       maxItems: 1
>   
>     interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Combined ISP core interrupt
> +      - description: Full-resolution DMA writer line-tick interrupt
> +      - description: Full-resolution UV DMA writer line-tick interrupt

As with the IVC, perhaps an interrupt-names entry would also be useful?

Thanks
Dan

>   
>     clocks:
>       items:
> @@ -75,7 +79,10 @@ examples:
>         clock-names = "vclk", "aclk", "hclk";
>         resets = <&resets 0>, <&resets 1>, <&resets 2>;
>         reset-names = "vresetn", "aresetn", "hresetn";
> -      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +      /* Example interrupt numbers. */
> +      interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 101 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
>   
>         port {
>           isp_in: endpoint {
> 

