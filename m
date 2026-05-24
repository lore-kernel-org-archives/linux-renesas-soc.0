Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA97231280C;
	Sun, 24 May 2026 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650982; cv=none; b=pE7LEWx5btBi2UDM1OpsObo6IpGQ1uZfaiQh7NKJ5Coleh01Q3nGCpGBvbojkg5ok97rPIyZBlFgOOR34+ggjtyC27fhsQCKoPmwkPQh3A7WnCxcGso+PXXrRK95BT3FPMh8N5eIL8SNtYlmdeMdVjy4rnBnouElWcGsfp1i/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650982; c=relaxed/simple;
	bh=wImq6jKuqYqhDCu5q+ahPfuCrK631dvNC5EDpZdiv0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ftvrjRTf/dQ4Cdllu8rhQ9vLKrrE4Z9K6InqbtVee8SRFMZdUWNaRxG8phZT80OC1BRmTeWrWf1fR581dea/EaYKuShc9/yUDRTqxXdnzaOiqeV6NuGDFzR3lIsCDFGVbcK6PV4OF53WZQLDjpfJV9cRKBl9f3siryLk1aEp5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5ITfi8b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5ITfi8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2181F000E9;
	Sun, 24 May 2026 19:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779650981;
	bh=p6+qkxAZKqBDOmUVVqq9TQEE/gac+Mmbpaa2SUZOBQU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D5ITfi8bMiDS3Doy2+j5EamOgfAJifqodYgyltWHxWfGQViSs+Zh+h7uaM4s278/P
	 0nLEP8apapyd8FEKO0T4ZiIGFiRUtq3DByrsLu1LyI6W1zK4Px65RlMnThKzHBSD8c
	 g9XVTPPsbOPvf0ACBfVzuK3LVrkzCYg2VqJReTBvnr08AhphXKn6tQKDwu4+ms7bm8
	 5KjJa0T+oF/U96QtTLvT0XYnkFUbgRy4+PV/WrZaRE8Q9pIc/QXtZKVUc1M+eY9OYg
	 n1rMaRKBsiDTeP+liGwBx0W/aF9vp5ISQi24ZWEfupniznXlbN1WIG4yPGOcWRaszY
	 GMKjOO3VfJu8w==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 0/2] Add xSPI support for RZ/T2H and RZ/N2H SoCs
Message-Id: <177965097904.27165.1581576321825641919.b4-ty@b4>
Date: Sun, 24 May 2026 21:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 15 May 2026 12:52:00 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> Add support for the xSPI (Extended SPI) Interface on Renesas RZ/T2H and
> RZ/N2H SoCs. The xSPI IP on these SoCs is identical to that found on the
> RZ/G3E SoC.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a6954060adc9d956a99f909f46bf9fb0348c4fa2
[2/2] memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms
      https://git.kernel.org/krzk/linux-mem-ctrl/c/3fcf9f334d272989b57acc7b94d4eac717206118

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

