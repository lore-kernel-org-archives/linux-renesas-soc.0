Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD483D301B;
	Fri, 27 Mar 2026 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602588; cv=none; b=ZaHMhR6BicSu7G5RuW2qPNhkFkms733gWHXqhhjqFTwD7PX7pkbSIoTNjkIcWA/qLpXMegppnVW2dEd5dC+y1Jo9sYueUF1dx9lPDcZGlUbzIGUPCVhA/Sjao3BknCpH4bPwQ7/qQW2pXIMt3yTxRlJasaqKC35H7EJ8Q6pNYpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602588; c=relaxed/simple;
	bh=ei1i5cV8a/IBRvWiha54HpphTcf28300D3GC22f3cHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvAZPz6wscFEobd+wUutq6MegbdO/Q0ZB+xxDHxRMnEXpaalQmoeqdJ2k4irJUdv67hZmGI4HLHBeJNDSq5eHS7W6I0rKTJhuJ4LJMeIPV0D4vVSe+ukoVPKzMRfxlo9kh4lzGu7gEqpNy5VOand6SmYWhNioH/URkXZuHU55GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XLPlgZHv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XLPlgZHv"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 67AB91783;
	Fri, 27 Mar 2026 10:08:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774602505;
	bh=ei1i5cV8a/IBRvWiha54HpphTcf28300D3GC22f3cHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLPlgZHvraNag+g5XxAUcVeWCzwyBNlWYWGGp7VlJPKTXYvQaBxlXlWQ12Xy1RHKp
	 J7MFUrNl+RlE6DF4fht/ldC2DMuAgSegYAPAsm5mzTIZaFIlO1zMUN3sAQGfhLCTur
	 XeLT6dLDi8v5cKZwdtgPqdAgKyjxDL03V1vCSTFE=
Date: Fri, 27 Mar 2026 11:09:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into CSI2 subnode
Message-ID: <20260327090943.GC3026970@killaraus.ideasonboard.com>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>

On Thu, Mar 26, 2026 at 05:24:00AM +0100, Marek Vasut wrote:
> Add missing cells and reg DT property into CSI2 subnode to fix
> the following warning:
> 
> "
> arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi:49.10-55.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
> "
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
> index 4d2b0655859ab..3feffa4f16a9a 100644
> --- a/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
> @@ -46,7 +46,12 @@ &csi2 {
>  	status = "okay";
>  
>  	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		port@0 {
> +			reg = <0>;
> +
>  			csi2_in: endpoint {
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;

-- 
Regards,

Laurent Pinchart
