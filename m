Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B33E025C;
	Thu, 14 May 2026 13:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764862; cv=none; b=UXD9oOCVunAdqe5rAMNIVo8VPJQP2zRK4WLnBDxQr06Bs2xi5N670OsxaYlnrUWTNfHWh27ZEe0y4yr8V1ZcYNR4NxI2LqnhnnNU5UOxWdJCSe7yEYXMZgyaxAjg8hMWNZidp++Uq1md8X9kjclydX8AXpGg7IaEORb1/i6zD2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764862; c=relaxed/simple;
	bh=/d6JkD/4Duqh2N5CT7o3NdRCDzek83LRZbMUXKP5S00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmFojGZJv0LakYyqWkU8CCoDdf7UXGybgqv6gUImZTRgUf5gULn7LQj2tFm5plsjhwFwPpjDYwPCjsYv1rOFXC8HrxI92Xy5076ln/OCzY+SYA4OztAfd2nRg0pXf5LCB9nLvHpxxnK5vx/IZisD+hjzCOhol+FCmPd063//K68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhl+pvbS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhl+pvbS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A688DC2BCB8;
	Thu, 14 May 2026 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764862;
	bh=/d6JkD/4Duqh2N5CT7o3NdRCDzek83LRZbMUXKP5S00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhl+pvbSZ6S7HzUWEwRzIj50xuMqM3Kgs2qd7rxxwC4uLXgbHc3tWEqcAYPoSxtkU
	 3DEN8LsChgWX4ZRW+YUit/4awrUqPZPc58VxaVbbCfQrvBwB/x/krfHDcJzxdy0XMY
	 08YIQcSG5vtx5EUc98+p53OrmIbu+n/ibskNAyTv2L3X3S83QwQsx73KBM1CcKk1BG
	 BIEueWAugB+95p5UFSETqu2XgSq0IplOZEOTTYNy8xmAm35pXsfDGfEOiu41vfmuLJ
	 5Pbbt6gWe02B6QLI1UvdAzouzyWrgHJvymcmpaecpV7z/+vItbu7DJNqNtAuXKfxOl
	 GMhSDq9UjtDMg==
Date: Thu, 14 May 2026 08:20:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: renesas,rzg2l-du: Refuse
 port@1 for RZ/G2UL
Message-ID: <177876485382.133353.4226109265397951012.robh@kernel.org>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512144104.761531-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Tue, 12 May 2026 15:41:00 +0100, Prabhakar wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
> port@1 in the ports node.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3:
> - Was orignally part of separate series [0]
> [0] https://lore.kernel.org/all/d1e0d4e0fe74e60345a3d043fb4f9128c1057638.1778141145.git.tommaso.merciai.xr@bp.renesas.com/
> ---
>  Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

