Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038A3B52F1;
	Mon,  8 Jun 2026 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914046; cv=none; b=r9rOIlyKhfI+dIdckqF56VWnntvyJlKE56YU7kgZSJUptgA138Jm3VAFuCYhKgM9gJ15MM0hEH8R+iDhx8aWxMgrCpUHav1Qiv/j6bIehPdD866kT1EtD1H6558BZl5je2qtL8w2izx+Gyo8rG3TDbFt1ZyrK27ut84NzX7Wb3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914046; c=relaxed/simple;
	bh=fL9oXuCp5N4xE42DmAiwdZMhI6Rt9BDs+gCZbnhRyUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXrgkR7e0AUIH12ZfDmuF4tk2odUSvnT2lV4OHsjy2BFwcgeXE1XKyMzWRwiPXIn0UxG1nwIK2eIGCGy/13Uq6c/+Xu6qm8I+3YjD9DtC4yrqpMYr9jzxRrGcvJhVzqMIRcV8rQ3k8vBW6O16ppTTdHwbHI/03Moahy3BixhtdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDy4Tnoh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDy4Tnoh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9831F00893;
	Mon,  8 Jun 2026 10:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780914045;
	bh=6ekkNqY9qbrUR/M9eukGJ2msOzNE/+SipyIqMlv3w/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IDy4TnohuBZFCdEydOYjvJUNZwFSH7RzPaptpyPPFW+tEDivxKMSazRBppYqmdBwK
	 Q00rObCnBHt0mkUIPLPcWrD6ovxVMdchPMw36wIJuvp4TO6MlRFQv9l0f6NFE8049h
	 Ga+7bcBl6tBWsenIjUduZT72bU1s2yVNUQVHRGhsTPxV/aXVApvoLBAVOfYYCIFNlf
	 iG8Jv0K1icwMRoy0Uy6aYOiFlxwwX/KmgSrdQ8MUljCwwnu/9rhdtQb4K8GgonwFsL
	 pjiFU6twGmZUzVOGul3rsXsQrhFnJE2/8h4nc1/GupN7Z4mekpaRsqybpRK0pv/NmW
	 z7WaIRu4p14qg==
Date: Mon, 8 Jun 2026 12:20:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Make ranges required for
 renesas,r9a08g046-lvds-cmn
Message-ID: <20260608-alluring-remarkable-echidna-d107ea@quoll>
References: <20260602131331.90756-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602131331.90756-1-biju.das.jz@bp.renesas.com>

On Tue, Jun 02, 2026 at 02:13:29PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add a conditional schema rule to the syscon bindings that requires the
> ranges property when the compatible string contains
> renesas,r9a08g046-lvds-cmn. This ensures the LVDS common control block
> on the RZ/G3L SoC correctly declares its address translation, as the
> device has child nodes that need a valid ranges mapping to be described
> in the device tree.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 9c81010d5a74..cbf83a06ae25 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -269,6 +269,8 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  ranges: true

There are no children allowed, so ranges property is wrong.

You are changing binding which DOES NOT allow simple-mfd or any other
children. Ranges is not a problem here.

Best regards,
Krzysztof

