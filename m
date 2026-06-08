Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5135E2571DD;
	Mon,  8 Jun 2026 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927942; cv=none; b=W8nSvNLwL8V+TgEmHpB2z4fLa2zlzv/22lVQ9ZeMlYz4fC36QrPytUX5PY7wNNW4/aT97FXyrHi8Q8KMwMnXHtPCsRVAY3hkC3t0gUM1ADQsXUsJURLdNGMAcCGjDy+25YsqIeND/GvYZcwg7xyqTNu4wK4vBm1W5pm3e6wxBNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927942; c=relaxed/simple;
	bh=DkilVGjZZ8mH36mHs2ezpNM/hCSxFlcR8Se6qRGtt6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L20AVL3f0QICL+PoyZV8mTy4oxse1oP8ZeocD6zgVTyz9agRzcGODv7Q/s4h/qglC94VZ5LkP4bYqlD3LLQOe5t6n1XMTMY29hvfrCOCf6LVmPsseXcwGeFLHtPLb4he8WBasX5j3jOFuVgKz9vuaANNMys0UtjRbuK7Zygqyn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STvMYlEQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STvMYlEQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC47B1F00898;
	Mon,  8 Jun 2026 14:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927941;
	bh=OEBUB4frnuV0v1syjChJn+9M/EhF9VBLynr6hUTAR6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=STvMYlEQaY6lXysPYA7cehtnajVaPWxctTuFBoASfyo/xlZBZlyWvfa88ipFBnn4D
	 D7EQ/QRH58XNGZDAQ4LhC3aZrvftt0k41y+/Og76HMhPegtby6s2m+kVkDSuPlk+b7
	 9+GG6AOc7zkJ6fofN/5tuY9NZ+0qQTKA4FFJSbRAhl5k3WbCbwkmuKIzBPnUMJdMDV
	 18yzD7y7bP6P0U8qqXWQsERy/kDsYiib6p64piD7H8yqYrO5gxNjCMG65xnhGA4Cel
	 zizD7Xlj92iQqNXrNajiscyBGd1AZeT98DGzeIJdaSd3b8xPfyHLuabW28nvO1qXM3
	 LoY76NCp2CEuA==
Date: Mon, 8 Jun 2026 09:12:20 -0500
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names and ports schema
Message-ID: <20260608141220.GA2500736-robh@kernel.org>
References: <20260605200526.683577-1-john.madieu.xa@bp.renesas.com>
 <178069496769.286078.10840905064274842451.robh@kernel.org>
 <TY6PR01MB17377F8945B85671FCD20B83DFF1F2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY6PR01MB17377F8945B85671FCD20B83DFF1F2@TY6PR01MB17377.jpnprd01.prod.outlook.com>

On Sun, Jun 07, 2026 at 08:50:49PM +0000, John Madieu wrote:
> Hi Rob,
> 
> Thanks for your review.
> 
> > -----Original Message-----
> > From: Rob Herring (Arm) <robh@kernel.org>
> > Sent: Freitag, 5. Juni 2026 23:29
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
> > dma-names and ports schema
> 
> [...]
> 
> > >
> > >  .../sound/renesas,r9a09g047-sound.yaml        | 100 +++++++++---------
> > >  1 file changed, 50 insertions(+), 50 deletions(-)
> > >
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-
> > ci/linux/Documentation/devicetree/bindings/sound/renesas,r9a09g047-
> > sound.example.dtb: sound@13c00000 (renesas,r9a09g047-sound):
> > ports:port@0:endpoint:capture:0: [6, 7, 8] is too long
> > 	from schema $id:
> > http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml
> > /builds/robherring/dt-review-
> > ci/linux/Documentation/devicetree/bindings/sound/renesas,r9a09g047-
> > sound.example.dtb: sound@13c00000 (renesas,r9a09g047-sound):
> > ports:port@0:endpoint:playback:0: [3, 4, 5] is too long
> > 	from schema $id:
> > http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml
> 
> This is the 'items: maxItems: 1' I added on playback/capture per your v7
> Comment [1] on the original audio driver series. These phandles point at
> the ssi-N/src-N/dvc-N sub-nodes, which aren't specifier providers and
> have no #*-cells, so the list isn't split per-entry and the constraint
> trips.
> 
> Would you prefer I drop it and keep them as a bare phandle-array, as
> renesas,rsnd.yaml does, or is there a form you'd rather see here?

The problem lies in renesas,rsnd.yaml having no constraints. That 
should have the same constraints. However, you really shouldn't be 
redefining these properties again here, but refactor whatever is common 
into a common schema.

I suppose for fixing the rest of the issues, you can drop 'items: 
maxItems: 1' constraint on this patch and address that separately.

Rob
