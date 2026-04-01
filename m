Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E49266581;
	Wed,  1 Apr 2026 07:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775030261; cv=none; b=FtBkVkX216imUMu9DvqOKAaWWa6heSwUUJJahONi31yEuYAvTKsjqkjZkhS9Lv9SGYlNc034ju0PCsctCt3WK9j3edunvV7lEhBrRDwyGeU35DFY1iY6Bq5U3M85nHCYLFQA1iqPIb6pXJPokSHeWijAMR4TuArBvBr5pV2iKqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775030261; c=relaxed/simple;
	bh=QjkEJPKjIZhjl2jqwltNPqulEQj3DSE1FMlMdbATbtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQlQt4m4PhXYg1Z4V/rh+Dyo+YqBlxVG7jBlL+aFeThQGHTgBpwx1FoTgY32JK8sRrSBp04+NjZwTZbFobvACEA8lk2KOJFgrwb/qjOa6x0Nrg2/Pb5yEajrXCUkVpM/jz9WIjJkbauS+60LTzc069H3tHxZY0Gd690HTO3u+ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCl82MBo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCl82MBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604CFC4CEF7;
	Wed,  1 Apr 2026 07:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775030260;
	bh=QjkEJPKjIZhjl2jqwltNPqulEQj3DSE1FMlMdbATbtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCl82MBo+1cYjGFJwMjmX1fFsHm3Yj0bjVYwjKmFCddtNyONvWKQeBfuIPRIcycPb
	 knudQeXo6CmibsAyl/GKu8zN7EV9DKvU6dlSlmR7UpLbZt2LP/G9ZI/yC1yrQFmR8Z
	 QiGxM8ifxbFWwHzKCf/nc2zfDV192U61kmL42+6Mic7ZXvWHkQb1WR9seE88lAL+Ha
	 5MSPt4hxIxoDQOt6hW0NrPPbeAWPeUSP/tgDpQpFDVLCB5QguiqqCzo1UJ08PzllKD
	 4uorrr1kQnxoBnZWb2yOirn6p1tV/XuqIvsSe/tOa7r2gUqYNPNHQqq9oyEgOcxy1v
	 bBs3Uv5DArHwQ==
Date: Wed, 1 Apr 2026 09:57:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/4] dt-bindings: timer: Add the Renesas RZ/N1 timer
Message-ID: <20260401-boisterous-crab-of-contentment-e8cd01@quoll>
References: <20260331152616.197031-1-herve.codina@bootlin.com>
 <20260331152616.197031-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331152616.197031-2-herve.codina@bootlin.com>

On Tue, Mar 31, 2026 at 05:26:12PM +0200, Herve Codina (Schneider Electric) wrote:
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r9a06g032-timer   # RZ/N1D
> +      - const: renesas,rzn1-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB internal bus clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 8

Drop minItems

With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

