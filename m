Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EC73E00BF;
	Mon, 18 May 2026 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091678; cv=none; b=Yk6p8rIY+S+Ne+L/WsIw3Lpb/JlP4TKTslErTEYfd0TGGJE0D7aQlCFtanBda49EV8AsWsEkXOOD2edREbMSBVFCHRtZJEbGtn0P9l9rqR+CGtotzuahJ9vCu6LsaI8eNXkb8lmUvvgzXTBq6NsYscdf4Mt2k+z0uoq9S7MMQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091678; c=relaxed/simple;
	bh=N1rL5bYlFWe078xRHvCAZk6s22s0flwwFGijxeLG0KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVUmhzBeZTM2tbdoAIr22H+5mzR/6LkZA2koSLmckVYbyxvRymAoi4gvE+FkkCGYW1i9vq0PK1yBnmrQdbU1ghkt3umj2Cb+voPmFdokTxKGwb6rEpSco2Em5HXSzZupV9Fx5VBjINBq0d3rM/GoKpDFIn3WHgV7Gdgcof+/E74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uj2yTF+3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uj2yTF+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E978AC2BCB7;
	Mon, 18 May 2026 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091678;
	bh=N1rL5bYlFWe078xRHvCAZk6s22s0flwwFGijxeLG0KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uj2yTF+3LWZriiVDbn8AhZQSFq7vI0WPONPTnykNwWRjxRqHm0Xvj5Uqw3qCR97Ur
	 PvlIUX0ZSTMIW9fr155150i3B7qJVW2xdwuHbRhIpWqNY3gcN8iGMq/WwsZTM/YHBy
	 TXGHXyWCOZBlaK30nCbPajYA5VFU3r4Ejfgnqo8wbeSO8S8x2N/ZycIJWmnsVM3s6p
	 PbGKAnVC7xzx0Z2okKJiw3yGWI8zlPYYu7vpnZcznLzqYhdkx+Cf4CmotcJGT5clbC
	 SHKjsYYc9OsiOOufXY1aFr2Rww5gv24ueyq976By+OG2pYMJ3f5/XpEJAwi+mnRt2/
	 LOZspQ7tugolA==
Date: Mon, 18 May 2026 10:07:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add
 RZ/T2H and RZ/N2H support
Message-ID: <20260518-efficient-pheasant-of-courtesy-eeca11@quoll>
References: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260515115202.1515577-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515115202.1515577-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, May 15, 2026 at 12:52:01PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document xSPI controller found on the Renesas RZ/T2H and RZ/N2H SoCs.
> The xSPI IP on these SoCs is identical to that found on the RZ/G3E SoC.
> 
> The RZ/G3E HW manual (Rev.1.15) references bridge channel 1 and its
> bits, however the hardware actually supports only a single bridge
> channel (channel 0), matching the RZ/T2H design. The references to
> channel 1 and its configuration bits will be corrected in a future
> revision of the HW manual.
> 
> Update clock/reset constraints to handle the SoC differences.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Wearing DT hat to fulfill the process:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

but anyway I will be applying this.

Best regards,
Krzysztof

