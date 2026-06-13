Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3AC338596;
	Sat, 13 Jun 2026 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781347248; cv=none; b=n0tX0MUQZw3sD2deKZ+sgHUqzjQ++JL2r97561Kpuk1+yVAbdklklih60sWKN8Sok/NdCRdc+9eWV4xdYMWrwhSBQ/cmOaN6tAZwgLfMSjU/bv7jTCYEmDyrAXFRRdYR7tEChOHQ1gC5hKiUtjz2jk0FlbE7lYFgggDSv7pyl3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781347248; c=relaxed/simple;
	bh=nw3emtNAfqy4Bw7o7x43wK74V3m2FX25W8w3V3jTNp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7ih++nkFysvl1OEBYBRsqiDPJZgS3mWF86Pe+EOBbLjnGJk9zD+20Pxg4Rh+hx8fU1TiSsGbF8lj8wOIjC515+x3tNFdkFDEZNxEHNndjs8VdC0w1ezT0NN5HzidlmmUxtNsOCHqeg7w4dB/XgzgPlvzovCu75Db3hdIObkw/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4XpbPhD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4XpbPhD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E201F000E9;
	Sat, 13 Jun 2026 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781347246;
	bh=nWOk3abyiQHdHW4G8RTGKQ2z2ZistSp8ZODaxHo3anI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V4XpbPhDcpbDM6anoxdey5ApfNSDXT0NFEPXRiFm1XD2/fOiLZn0WcCmBt6pqquE4
	 CvPP+d/J6J0Fp/hMFzaa9EKsikx1dzgm4TjhZEoOtowo75GbpD46ufUPr7V0pRY38n
	 /Qu6kpT95Irncoekgl8sXx6wxzKIU/fcli5U3DL6hrlRJskjO2o8UaxLJvuDNbLSzj
	 dWA+K3EHXC9IbnDkWMVznsmUiTeLQBpZ7Q1yZs2NN3a1XygkqU6CEEdPHIdVXtqLEo
	 KrNoOcDyjhv4bpok3qFJAa/2bI5BlcxBCOQ90xXiTPvHVHLRg4qa+N9Q+qBYZu/awZ
	 pcd/DdvH2zenw==
Date: Sat, 13 Jun 2026 12:40:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 02/11] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G3L PHY bindings
Message-ID: <20260613-authentic-eagle-of-enhancement-aefda8@quoll>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612143048.317907-3-biju.das.jz@bp.renesas.com>

On Fri, Jun 12, 2026 at 03:30:30PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add device tree binding support for the RZ/G3L (r9a08g046) USB2 PHY.
> The RZ/G3L USB PHY is almost identical to the RZ/G3S USB PHY, the
> difference being 2 OTG blocks on RZ/G3L compared to 1 on RZ/G3S.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

