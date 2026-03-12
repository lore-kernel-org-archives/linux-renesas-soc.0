Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C582D97B7;
	Thu, 12 Mar 2026 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323363; cv=none; b=SjT67BygvpscOlFqcqMoo8J8ZX0ZMXdi4Wj0veCABCjIs0PAzCUaxJLrfzmlEX3vLZO7OYK9FnlMzvLY6zROx36oOGvcE976tl9WkoWaRlRbthL5uEj1zavT7k9Fhk5mi6e95ivj7qLDKfsqFh+89TMG4NGTmtq7tffgQb/tU1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323363; c=relaxed/simple;
	bh=QDMPR7U4L7mnN7ggql5N7UaT6DsoORGTULdo7gqhKxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGQR/TfZkjoIqoas904Gklh5a7aSAqJgxjWa+ueX35eTdMSkVM5L1EKzzG5nPHTDOfuvNdhMJF0rvWPyCv463pI8soLcKCyf/O4vXQaf/XWItLLgAj1g6EhYR6QKjIxqglXEqMPONH1HRZvgtBsXRTGOdY7SPpind9qRuSAG3sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiZrR55R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiZrR55R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0473EC4CEF7;
	Thu, 12 Mar 2026 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773323363;
	bh=QDMPR7U4L7mnN7ggql5N7UaT6DsoORGTULdo7gqhKxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EiZrR55RyFPgwrqfon6RNjN+art4S8H/cUBWF1w086oZjsRzI1XP/wRBznlcPlxx9
	 qlGLdvtVSFX9BCA/+VWHxBKp/dAP+Y06TK1yAw9D518gKoLKDbxnWiDpsmV1jryt+T
	 oxzwd3ueEYatfH/z+lfCS1wQtASjujE9fnljImS/9FoJqamCjWklPuN9FXbh6cYeZK
	 p5ib7EA36vzAGQDqF6W7i11u95ByA4tA1xMPzRdXtsVl5x6XEf9e2ZR2aqNOZYRj3f
	 kg7a0kgjRsK6YflhdnZrsbuj3Zv9bLDDXtcBZTEZQX7cA1Zv0jDtGJYAc6dp5XJTxX
	 Ym1lqrWdud7Iw==
Date: Thu, 12 Mar 2026 08:49:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, linux-renesas-soc@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/G3L SoC
Message-ID: <177332336177.2902176.2580675840603611415.robh@kernel.org>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
 <20260304134845.267030-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304134845.267030-2-biju.das.jz@bp.renesas.com>


On Wed, 04 Mar 2026 13:48:36 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add a compatible string for the Renesas RZ/G3L SoC variants that include a
> Mali-G31 GPU. These variants share the same restrictions on interrupts,
> clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
> validation accordingly.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

