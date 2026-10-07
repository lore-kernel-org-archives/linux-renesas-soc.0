Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3D149EC78;
	Wed,  7 Oct 2026 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370274; cv=none; b=AW6WRxozBEnAY87Ln5uIDeOO09O/NBiBxqXo2B7/ag7AveehXRJ7kPSXoLiQeKxD01TphAlMTm9aaGIPj5NiPiaYScDhUFzHh5C6EMhg3jhKq5amZ/c4i03g4j+LYocpGXU4mCf5d96ZL5shJv7mVq3pZPusoFPw3OIeA+FIccg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370274; c=relaxed/simple;
	bh=wrVJSdTwL83WhykP/s9gp+xedH5AQcJR+0ruj6chmEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKQsgokArXYzu+WMsecK/8mWVG2HOIwNz4Je+ExJcv7ZbBoj2mtGawUPgX/YkqyqLUE00eEjRUhIRFJsT29OevftZGKOkui+jAIq4nGet0kTolELKAH5TwX2GanQ1tZJRFsePV7xvFePPHNMEN+rEssJJxznWpjwpqv3+Zv63+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g9K6tA94; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g9K6tA94"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6385E2C6;
	Wed,  7 Oct 2026 12:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791370120;
	bh=wrVJSdTwL83WhykP/s9gp+xedH5AQcJR+0ruj6chmEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g9K6tA94gIpbgFV5gP/E0xEhxJ6esjM+tl1oiitf/DEnnnQ1M9KLZ4piqx1+tf0KS
	 IJGotYv1z2CuVCzGO5DoZ9hOtEHq7b3BaBxoZmgzuUVfhdxj2/2Tn9RZ7BRhs2H06e
	 sXlmuI+eva/V6GfH4otAw4uMlL2vUxAzcZM7g7dE=
Message-ID: <9ed68c19-2c12-4b1e-9c58-f458eeeb9ca5@ideasonboard.com>
Date: Wed, 7 Oct 2026 11:50:34 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: media: arm,mali-c55: Add power domain
To: Linus Walleij <linusw@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus

On 28/09/2026 13:21, Linus Walleij wrote:
> Some Mali-C55 integrations place the ISP in a power domain. In
> particular, RZ/V2H uses the CPG domain to manage its module clocks
> through runtime PM.
> 
> Allow a single power domain and describe it in the example. Keep the
> property optional for integrations that do not expose a power domain.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> index 8fcc46660b75..3a11d3f8488a 100644
> --- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -36,6 +36,9 @@ properties:
>         - const: aclk
>         - const: hclk
>   
> +  power-domains:
> +    maxItems: 1
> +
>     resets:
>       items:
>         - description: vclk domain reset
> @@ -77,6 +80,7 @@ examples:
>         reg = <0x400000 0x200000>;
>         clocks = <&clk 0>, <&clk 1>, <&clk 2>;
>         clock-names = "vclk", "aclk", "hclk";
> +      power-domains = <&power>;
>         resets = <&resets 0>, <&resets 1>, <&resets 2>;
>         reset-names = "vresetn", "aresetn", "hresetn";
>         /* Example interrupt numbers. */
> 

