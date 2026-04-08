Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF27389469;
	Wed,  8 Apr 2026 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775651384; cv=none; b=beWhlFNmPmbmdG8tV4b8hq09G3aHU+A1JPz09QkFyiOYq4+fpwfGm3AgGf5m20pSrfBq6jBPrwPH0IniDuU278wrKL4atOWCKhaNTYhwz6EXbkpZS1rHBdHfustdoevda2nLJ5VBxvUZ1mP7qWKIDd1XSnC5epCah5GCdbZMfn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775651384; c=relaxed/simple;
	bh=yM2ahm6us06/0feDNIJ2hYfHn73oIGDlboU0FcqHqJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsSN1se9CbBsXFr0WQ/q5xjfr33wW5h8tK59PJHqOIWWxVnINIY1Jj3/kOa7pgpaVl+xAfsS+XsS2jjMGFfyVJQokjaCGnxRwbgjOs4gLyamY8SIcyI9cqS/T29ETTbI0Q6FdLQFzhrN12E6ty5PUlR6pn14qKtM57xuv3B8YPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vOpM/cVw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vOpM/cVw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2118C19421;
	Wed,  8 Apr 2026 12:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775651384;
	bh=yM2ahm6us06/0feDNIJ2hYfHn73oIGDlboU0FcqHqJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vOpM/cVwG3VcpU38OcH5QdIG1h3L2wVv8kOqZllCxPFk+kbBbCJSgl34XsT6c/ISK
	 VFqeY+s7C8nKcjyBmFykOX9BQG6HX00Qy3H1uY3/z1WD4xtiAVvwWryrEQuEIjNCOP
	 6PRrIFJ9AaC+SyPHkLuO8ucIXDAh5QBtotu3p5CnI3nH/tRwq6L+cXwAguAPfmW0AL
	 7D9s83515mS7m2k/Fn5uRgr3BTucgXwngG13Apa2+hFPdp2QUJn3OHBo9mKsmivINF
	 chTMNPyuUoFHGo6c1F47DE49Lv5jgGK2j2JcK9Ttsybs9H6jTqt/sLSP6ERqn93Pu6
	 8gW7TcRlSOX6g==
Date: Wed, 8 Apr 2026 07:29:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: renesas,fcp: Document RZ/G3L
 FCPVD IP
Message-ID: <177565138197.1864598.3476824558170800947.robh@kernel.org>
References: <20260330110012.131273-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330110012.131273-1-biju.das.jz@bp.renesas.com>


On Mon, 30 Mar 2026 12:00:10 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The FCPVD block on the RZ/G3L SoC is identical to the one found on the
> RZ/G2L SoC. Document RZ/G3L FCPVD IP.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

