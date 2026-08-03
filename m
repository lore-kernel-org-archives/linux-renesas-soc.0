Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E249833711D;
	Mon,  3 Aug 2026 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785746084; cv=none; b=oiYEUaUo5xfURTb0ICAnaX+tRKbZO+EX1Hffql131L/34I3sCsPNNxg2rDlW5FhopANhYHvCvMHiwYhhshN+x0XGCZNwfb7MgUu5hwIuzQLOvzrBmOqKUc8TwO5xNg7taamqkFW39t/RergDsjNztty5A/105yXeH+teJE6qWxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785746084; c=relaxed/simple;
	bh=HRQxkLwFBi/0wtOa2Mi2C6c26iWFYPmOVjqgSPIZiR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6PlETlp9L6MIfoAi45tYsUNjA9H+3bJ4vS1slQHSiY9Oa1fa+tZ/aJX4WL4JE602CoYIDb/Kc56aLK3y3ZSLCZH/L5wQmOr3zsukGOKFeuEdgHpRs6yzJGw0QRHbkls6PCIkRPyEE3l2tpIWBwCHGssGHcBGN8WStOjrf91xzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKhtBaNr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKhtBaNr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17EF1F000E9;
	Mon,  3 Aug 2026 08:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785746083;
	bh=T6PSTdosSJnetlCgA4yczYZf9xWsTaKV6oTuRV6Emuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NKhtBaNrIBauI28AWY25IcFZCIgLheck3JBQSqTkVbFuugR6EbSHcx2WlWBtVV7Bn
	 86CPeGDlfWd9/ZkokCgYdu7belIvuWkJgAGuFEfgjAhXFHsWq5ROxxxA52ycLPJEPN
	 PYce/7Wlm2WJ3I3H58En4+veUcG/1yx+9Tjv7jL2Zay3jWA4apztCJX7uOek2Gs/Gy
	 R7AjtXC413FPaZJyF9gH8bMssSKshF76BGCEjK70YHjC9cjbMaWm8FP1pZQK0UQbjt
	 WwMpxoDF8uqq74bzfT8LsCyXX82XRDnE58944HAOsHf5ZUisWWPO3kw+ninkM8mubw
	 cWNxUsCBTbojQ==
Date: Mon, 3 Aug 2026 10:34:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 07/16] dt-bindings: display: renesas,rzg2l-du:
 Document RZ/G3L SoC
Message-ID: <20260803-screeching-merry-lobster-cc6a7c@quoll>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
 <20260729125516.230757-8-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729125516.230757-8-biju.das.jz@bp.renesas.com>

On Wed, Jul 29, 2026 at 01:54:59PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The DU block on the RZ/G3L SoC is identical to the one found on the RZ/G2L
> SoC. However, it supports the DSI, DPI, and LVDS interfaces, while the
> RZ/G2L supports only the DSI and DPI interfaces.
> 
> Due to this difference, a SoC-specific compatible string,
> 'renesas,r9a08g046-du', is added for the RZ/G3L SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Restored ports.
>  * Replaced endpoint with port in ports node.
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

