Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C0A35E93B;
	Wed, 13 May 2026 22:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711023; cv=none; b=Xoejxrl6HdTnyySxS12r00ymR+5jx2SOTEvBmXaqP4scTrJYcc1mFXWm2OYWntb/BB91gCaoujcZ5BJz434Me8PwexJoEfE1u6OsgUtd/DFkaG4J1ajCf80iQJOUozSdRtJOf2LvOz/PKy7cBmWmqF95tKEqFSD2iCc+tTO3LyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711023; c=relaxed/simple;
	bh=t+tir+PRgneAWfWoTC5RK7pzxvSMpABDsyPgzRiVycs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fz1KrpfqgcyXcYI+HDUWhezIndLrzCD9bnYVWZgJBX/0a0Jtc3NfE5reWl2McXbgJ8l+wWkK4jjk9HKLMBe86Pin5z/nrvxMNgGrOytauP3dCqr8tGo+mKpMXv63PXjThtK0KLr/MTnQgUq4qK6w6nAdTRgw2MYAu8lrzgzWkTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBf2ecT/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBf2ecT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1980FC19425;
	Wed, 13 May 2026 22:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778711023;
	bh=t+tir+PRgneAWfWoTC5RK7pzxvSMpABDsyPgzRiVycs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBf2ecT/Ub9ZjYRcDiQ7NU8Uw3D3NceGGbNVUrDIg8QncThENHBU3aC5KmpwmNIXD
	 7wwvfFh1ITwyYhjYhOMV4N9atieblKVULCp6m/SEKFrWH5j9drTV4Ci98B5G/BtJdQ
	 fnRn9N3M0BmScwk10XBaRG20G4UlUSa4br7JrVZpTPOjFxIlxLptDSiQizXXu+MhrV
	 KIkMUFvoPcLi6W2NwKwDX//OCud0BQCl9eQ3pfi63bAd9+rydQfKQatzqDP7VE0Y+8
	 fYxTnlpMWndrh0Upkl7cTe9WMfRKvHAst+DMFg1MzVFVLcOcYnBhKFwXzWhwut/oro
	 e0wlTS3NDp4cw==
Date: Wed, 13 May 2026 17:23:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, geert@linux-m68k.org,
	Conor Dooley <conor+dt@kernel.org>,
	laurent.pinchart@ideasonboard.com,
	Philipp Zabel <p.zabel@pengutronix.de>, tomm.merciai@gmail.com,
	biju.das.jz@bp.renesas.com, dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v7 01/13] dt-bindings: display: renesas,rzg2l-du: Refuse
 port@1 for RZ/G2UL
Message-ID: <177871101980.2066607.4695270235260805346.robh@kernel.org>
References: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
 <d1e0d4e0fe74e60345a3d043fb4f9128c1057638.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1e0d4e0fe74e60345a3d043fb4f9128c1057638.1778141145.git.tommaso.merciai.xr@bp.renesas.com>


On Thu, 07 May 2026 11:21:29 +0200, Tommaso Merciai wrote:
> The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
> port@1 in the ports node.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v6->v7:
>  - Collected LPinchart tag.
>  - Removed wrong fixes tag.
> 
> v5->v6:
>  - New patch.
> 
>  Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

