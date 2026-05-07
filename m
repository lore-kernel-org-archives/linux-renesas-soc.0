Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D5A31E824;
	Thu,  7 May 2026 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177917; cv=none; b=HD+ZI7O4O6llyCLDpyaoiGqo9IFJ234c++Q858VIgmT9nXIl0AWZO2FKLEV/J5gh8E+6NRowAXeLm8wohSoFeDInC0FNAF1SxZYRWd3h0quSq91b2YaKpAhIGNk8QRnk85r2qb217Ow58nwvjIxFU0L5R4GYhRGjsLvbCaxjiI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177917; c=relaxed/simple;
	bh=ONpoIh5b7yPeDMI26ygxWBktfV+Z0zNWTIccFVvt6Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U56tYTcBg84DZvLIwkwuOhBFH2bteV8nUr99CHMKXFNSd8yArLhYg/g4iFHXGqPZDGjWxa2qdFAW5YdyUapS0w9IfWgyctL1WUKXeLDc9e6nUB7ekeZ6gCx1XT/qhys9HXD0BsxVgSVHzD/UalYYi8bL/VtilZ2RtRfKeCIi/50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dW1n0g8z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dW1n0g8z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A7DC2BCB2;
	Thu,  7 May 2026 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778177916;
	bh=ONpoIh5b7yPeDMI26ygxWBktfV+Z0zNWTIccFVvt6Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dW1n0g8zF1Yz74tmgHh0G90o2To8GbURxTC4/sBKQClGvV1K8BXWstNgHo3DTwCVX
	 nYqOjbfhTPg0u9F/pJcq96g9CyXg6gFD1yXNfNE647oW7RrRtnfB/fcauTnkp3L3S2
	 Q2q5uO1Jb3pzuQFuq9UbsNwgt5MP5PxwhnJ6sEbq5du31c8QASGX1+CBpaezIUSRD0
	 R3XVhiEYntPw1ma3VKCuRZ0/eol0N/mQgpxFcT8q0B7zC3ZHYRZF7d7UQnZ3rjvzWf
	 PPNM0kRkgMn74f677RFEIA6UfLcYxMoByuZD5zWkw6Nxo9+zfbAycxWj+RdBVgXp2b
	 ZtLBnDE6J2Hyg==
Date: Thu, 7 May 2026 13:18:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: renesas,fcp: Document
 RZ/T2H and RZ/N2H SoCs
Message-ID: <177817791354.2205190.11201568660914418852.robh@kernel.org>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Thu, 30 Apr 2026 11:09:27 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the FCPVD blocks present on the RZ/T2H and RZ/N2H SoCs.
> 
> The FCPVD implementation on these SoCs is identical to that found on the
> RZ/G2L family.
> 
> Update the schema to disallow the "resets" property for these SoCs,
> reflecting the absence of a reset control for the FCPVD instance.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/media/renesas,fcp.yaml | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

