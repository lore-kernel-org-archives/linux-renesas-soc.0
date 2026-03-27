Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB13DA7E7;
	Fri, 27 Mar 2026 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602663; cv=none; b=uNaXh/F0nH12Urfmn7y/2+QN/VVF6m9SQmn5qJHC00oPJzgK6nkY8xKkGIy5iShcgi5kQOhBG32iIx7PeR2Z+We6EIcj/pY7WpwyBtaWCtZmw4MwVP+yrPiXuJJbHRPchYNqMrgNBYGR/IwZKcIlnr+55Tzgos0vYugsliUR93o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602663; c=relaxed/simple;
	bh=7pnfBL44hki3rABoq3LGWT3iYReOHb/JvBtn+6DpyJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+o8GhZJQY7k+kmbSMLS8U21iswHQjbgbFkDdsYysefBH/PbGH4J3+JwlOULLVO+gZ8LSdF9xkI7LrTk7npVhekaGxIQtAgekWklxIfyiPcc7BRUGeoJnj1v1KtMbeMqkQyfUuJjt2U048Q+LLoW0shi93KJ3ZeOsHY93LTA4CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UDK0FIVQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UDK0FIVQ"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DE4651783;
	Fri, 27 Mar 2026 10:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774602576;
	bh=7pnfBL44hki3rABoq3LGWT3iYReOHb/JvBtn+6DpyJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDK0FIVQEde8xzYvKoBoCtYsp1Z2rjn3fdUsKguFJaQsEtXnmd51+EAqY2c9WTdXx
	 qThPxYpdLVaCpYj7mDuDBzOC6dGYKGgV/NtBIHvq1mNdOFrmJblRofaAiSHWrVjSYl
	 AHJJkyJbFDMZRoJ8NkChSd44VXX1zyEH9wtRB56k=
Date: Fri, 27 Mar 2026 11:10:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into DU subnode
Message-ID: <20260327091053.GD3026970@killaraus.ideasonboard.com>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>

On Thu, Mar 26, 2026 at 05:24:01AM +0100, Marek Vasut wrote:
> Add missing cells and reg DT property into DU subnode to fix
> the following warning:
> 
> "
> arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:29.10-33.5: Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
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
>  arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> index 36707576030d4..f5412578ee65f 100644
> --- a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> @@ -26,7 +26,12 @@ &du {
>  	status = "okay";
>  
>  	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		port@0 {
> +			reg = <0>;
> +
>  			du_out_rgb: endpoint {
>  				remote-endpoint = <&adv7513_in>;
>  			};

-- 
Regards,

Laurent Pinchart
