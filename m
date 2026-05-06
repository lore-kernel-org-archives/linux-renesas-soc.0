Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4839F2236EE;
	Wed,  6 May 2026 19:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096629; cv=none; b=L9/+LuvpHimKBojJfLXn8vsZFYq/4LtAH9a6OgMaeHTmt0bpBtfJfQ05gTOgvVPvdAgqHbMannqmiaFdy/IBF6TnaogyN96G0D2CYFSTKelfKU5KmVnK3LP3tCAP4F+T/fC1ZFxaL7SAZVx61kiRFBsAuDBXLF+G1yoq3SDnrys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096629; c=relaxed/simple;
	bh=yBKhUTLCJ2QHF56yMuQaZcb5yds3Ll46g1mWTKd7ads=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmw0D2o9CuIRTFDi7BoAIX5676LiYxN8A+XnM6muNa68jqV52pMk0oym44hvHUCKIjtqfhs7gHb95Mt3K6LujYDIwP5kFZXQVCrhkFCpkEpCMX3cg9kuRAwPF5ubHWceMQAQTBDzUy4OKHYOK5YqEgLIA8wOljme0x+MrFfQ1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCq6KrSN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCq6KrSN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C797C2BCB0;
	Wed,  6 May 2026 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778096628;
	bh=yBKhUTLCJ2QHF56yMuQaZcb5yds3Ll46g1mWTKd7ads=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCq6KrSNkSQO91CBMGr4ZxfEL0nMqSHwov+dNb1ce79jaaRcmGUnQST0w5yuS7jON
	 e30q9jKRiWa00x58mJSARedHjp1OsuDFfylHa1yJqERtVSJrmM45yw9Phadc7i232u
	 Ht4p89Hcgwa5Cu3n2k/3kYy75hZOE4PkBmePeyo/F0Lzv1q2jH9+W8/IRuY+ksrAMq
	 uINmzVkT4sCsYW3TTDL4JRl0tPERFaz+Aq/spOPxJodhAr5dwt7XUbZNSI0CPuAkKj
	 RhmTVucwnREQhRPdivWrVmrW80aEHgRG0nmzkFulgI3ajgdmLe2nafQKybBNLe/8rZ
	 N9YClUXE1XUKQ==
Date: Wed, 6 May 2026 14:43:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	David Airlie <airlied@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
Message-ID: <177809662589.2997094.4845644199076103667.robh@kernel.org>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Wed, 29 Apr 2026 18:00:09 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.
> 
> The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU and
> supports the DPI interface, but includes SoC-specific register differences.
> Add a dedicated compatible string to represent this variant.
> 
> As the DU implementation on RZ/N2H matches RZ/T2H, describe it using an
> RZ/N2H specific compatible string with the RZ/T2H compatible as fallback.
> 
> Unlike other DU variants which use a multi-port model, the RZ/T2H and
> RZ/N2H DU has a single output and is modelled using a single port node
> with one endpoint. Add a port property to support this and update the
> allOf constraints accordingly.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

