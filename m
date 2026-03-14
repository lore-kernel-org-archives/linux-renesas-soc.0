Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA89171CD;
	Sat, 14 Mar 2026 00:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773446775; cv=none; b=m4dEYDZJwb37amcVM3VaGssHF9XwnrCjHTuitFLPrU35doaCCW5ijjuEyZzfabKIToNbqqDeHUkXy5aZ2D98XfOaG9Iib3Bgf2QyCXXVhaKAuPUQsZ72ZuRHVKZuHpYVG1V4YqSuT+EL8sX+B0KdczX5UNXwEBJ9kTYUEXiBWsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773446775; c=relaxed/simple;
	bh=+1mGqsTCzmyeptm4zZFJrDwcCw1teWFPqxDEfyiccas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sN5ndM7wO075Lt82HJ9lmRfCDg7stuz9Pu9w1zN+1JtsKgJEkGNyAy8cNlgVlVPSny4NRCb8GdFsGTZE09oOdXHWCFhD8/nlv6d1wa7yGhgVyAQkYc1JxtSWNfEwXPKfGhiJF51z7PaKk82a/jJu9nWatPG40Oabx7ehbxwCFkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3GA5kVz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3GA5kVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81228C19421;
	Sat, 14 Mar 2026 00:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773446775;
	bh=+1mGqsTCzmyeptm4zZFJrDwcCw1teWFPqxDEfyiccas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3GA5kVzqOIbO9+vW0WHtPcADkumsKArf9JIO9g63lxrn0lYIZ+8asM7PM8O+2qXm
	 7SHWJKlOXvMlzODRB14xixa89QdjMRGtGioqN75b6uRgzccdMlS6zAddfdfEzQ9vE4
	 rkGT9trdvKOPLpvauThoy0bgqsuwumhW7gAmG65mG/i0MbGa08m4sz5FtRLUiqCcvR
	 J1PYVf9oj4BbHClb8T7ZKA9DOD1bP+2Uo4hjzLZmQVs4xYhfyj+vS8udU33M+NXL2j
	 wzpNTNiBXoILtlLi26yhuDIw/qNNNe7zfXBTFodMUM9zWT5pvwSvP6fFNuIrBwm92e
	 poqG8JqOvX5qQ==
Date: Fri, 13 Mar 2026 19:06:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 02/15] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G3L SoC
Message-ID: <177344677088.3704014.4761763624670554477.robh@kernel.org>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311192459.609064-3-biju.das.jz@bp.renesas.com>


On Wed, 11 Mar 2026 19:24:33 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document RZ/G3L (R9A08G046) IRQC. The IRQC block on the RZ/G3L SoC is
> nearly identical to that found on the RZ/G3S SoC, with the following
> differences: it supports more external interrupts and GPT error
> interrupts, and adds registers for GPT/MTU interrupt selection and shared
> interrupt selection between external interrupt and TINT. A new compatible
> string "renesas,r9a08g046-irqc" is therefore introduced for the RZ/G3L
> SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * No change.
> v3->v4: [4]
>  * Updated commit description.
> v2->v3: [3]
>  * Dropped items and instead used enum for single compatible values
>  * Add minItems for interrupts and interrupt-names properties of
>    the RZ/{G2L,G2UL,Five,V2L} SoCs
>  * Replaced maxItems->minItems for interrupts and interrupt-names
>    properties of the RZ/G3L SoC.
> v1->v2: [2]
>  * Simplified the binding using pattern
> 
> [4] https://lore.kernel.org/all/20260227140316.308106-3-biju.das.jz@bp.renesas.com/
> [3] https://lore.kernel.org/all/20260204180632.249139-3-biju.das.jz@bp.renesas.com/
> [2] https://lore.kernel.org/all/20260206111658.231934-3-biju.das.jz@bp.renesas.com/
> [1]https://lore.kernel.org/all/20260204142320.103184-2-biju.das.jz@bp.renesas.com/
> ---
>  .../renesas,rzg2l-irqc.yaml                   | 43 ++++++++++++++++---
>  1 file changed, 36 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

