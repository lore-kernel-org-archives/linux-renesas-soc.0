Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110473043CE;
	Wed, 24 Jun 2026 06:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284085; cv=none; b=hpVPlZmBP+wHnrsmBtCCfcICkPcXQq4KunHfA5aaXI5cCYypps3sOTc6HeMg2QwQtdRLFIi5bRgDTCwvduqOG4pd4PC4afWcfjYZlEq4h3xpjCOcRm5Ze1j0hpnkVduqiY/q+UJM3Z+ZSOF0eOOTa/aY0h3cHNs6GKF3P/g2mTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284085; c=relaxed/simple;
	bh=2Fg/QGGGzid3AXP1F4Ce3P5oT8xbQFNGTUsX+bdFCEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cT68vRUnUsoQEBtkKlfYxy34ncxKdqAmBlhq5eXhxUfh4VHD6UKOLUhPSje2b8clDnlievvN8iZAn6ef/ulkU1Jzk8KFtnaKdZwj7HoyB0jpqdhNP+e2b4G1RqUJwEO2ES57nfDJ/IQcbFHYXMD4dU4e8X3iyAiGBoWiSWct/fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7etd0EK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7etd0EK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCB11F000E9;
	Wed, 24 Jun 2026 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782284083;
	bh=eUEgOxIyYt3NMIhcgazfhnCBtv48+0aBbIMcropJEa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l7etd0EKsqEU4OrzXbg4S9/+K3sPJiLBId0lo85N3TGQAwZL0rk0Vm2q1xmfuyZjt
	 fSLnrhP+iia0xc6W7Mh0BaHw2LgG7QKfiEDfB9gN/dI/VOWLmu1yF5yO6C6CEFnFvG
	 nkPTiiKYnOswiJEq6SAeLI+fYQU8AxmF2DsE141BVLWY7fah3kyXxCVp2ZOft6h44n
	 c+9iGY0USIvRcLLj0tt1xCP/vQXuTg064fpMtY1q1Q9Rrd5O3ZHSfu6UpOf8bN2Cg1
	 /WldVF6SV1rO3naHSRnKA1OTdjGC9t69wqgqd+bwrQ91yiOuxK7eVBEE54/SCWlW/5
	 eqW6K/BdUbV1A==
Date: Wed, 24 Jun 2026 08:54:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Message-ID: <20260624-crafty-hysterical-muskox-1bd1f9@quoll>
References: <20260619101026.323633-1-biju.das.jz@bp.renesas.com>
 <20260619101026.323633-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260619101026.323633-2-biju.das.jz@bp.renesas.com>

On Fri, Jun 19, 2026 at 11:10:16AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
> single-link mode. LVDS and the DSI interface share a peripheral clock and
> the MIPI_DSI_PRESET_N reset signal. However, the LVDS module cannot be
> used at the same time as MIPI-DSI.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

