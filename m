Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF0D3F99F3;
	Tue, 11 Aug 2026 06:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786430874; cv=none; b=BlA1tjv3vniHTFTvApzC4KH/qWOc8trlUZrFXfF/UNIfRvTLH7BldhSs+LgwOlJ6uQECA4MjlEzmrKqJ5YKMXk6xJQY/LMA8Jdk1hitTPd+KoyFcy28jWRPsqKQc11B/y2cW/litfNtaciW/Lp35u6D0FdZo3JgGaLXEKbv9qMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786430874; c=relaxed/simple;
	bh=B2CR2DkKIEU53JKV3IdesW5ouwap0PGDkijuMSJKROc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITuIHUm/8VB5cy9fAunr33kVuROHqqk+4lwqcXknJFXhsmMmhOOYaxbt+H5aNRE8JLaePP/NHTqX5/6g01kAvANzLqMsTyAyKc6nAwhafE4LnGu6qFwkw5Zze3Saga+Bk+cYshXOQQobWqwm6MpS/PXgYaOk5THO/IA4IrPTqbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdAwZUZm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdAwZUZm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EEC1F000E9;
	Tue, 11 Aug 2026 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786430871;
	bh=1RLWFDuDn19UssagA6LY+0OUCCcb29TGPRATABlduAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BdAwZUZmamQziTknda9NBcd8Vud5e3Sj2SVW7iIgJkb1IRXJqbwdC0X/URsQFk5y7
	 c7WHzZmjHU6dyyfcKJ3Ob+KANOzEptGa0KVLIOd91oSZuwVy80Ty8B67oxw3cVjT3F
	 T3w4BHB4ttpwCMspjmZEbkgOVFnCXHVLByR7Ta3AJp7JsHqNNppU4C1o6v23g6DF/Y
	 q2QlXIsi1H+XLULxdl4MBPAv2HO4ofPFG1/lYAH4bI7IMCpiNoI326mqubhAbBMas2
	 3qYe325Pyk9Z3WIxORMymcFRNXpSA0i2aVmiQvmtU+7oSM1oiSXGC34FZ7dCQoGSca
	 IGSv6qbqaPitA==
Date: Tue, 11 Aug 2026 08:47:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 02/10] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Message-ID: <20260811-condor-of-satisfying-eternity-3b43aa@quoll>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
 <20260806102236.149159-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806102236.149159-3-biju.das.jz@bp.renesas.com>

On Thu, Aug 06, 2026 at 11:22:21AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document Renesas RZ/G3L (r9a08g046) USB PHY controller bindings.
> The RZ/G3L USB PHY block is similar to RZ/G3S but differs in that each
> port has its own OTG controller, whereas RZ/G3S only has one on port 1.
> To reflect this, RZ/G3L uses a regulators sub-node with per-port vbus0
> and vbus1 entries instead of the single regulator-vbus property used
> by other compatible SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
>  * No change.

Unaddressed review from Sashiko.

Best regards,
Krzysztof

