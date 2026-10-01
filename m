Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4568740A928;
	Thu,  1 Oct 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851966; cv=none; b=QLDjolkiqJb05uwTpWIngQ3b7Nn1wHhSzpcQaFyvE0xybXaE9YWtEkNCesihu0sqgFA+6V0FgeTgoRMg/ya9vHXg890cH3Au5REBbn7fZsSi0KUS1iJOeBtgOHaTSVhZ4a9tg8Bzm2Ni13tETC305GoUaCx0GLGwocrmHIrodNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851966; c=relaxed/simple;
	bh=780ay/rPZSN3NbrBW3TTFXkcQj7FwFJFVcYCj/QF0XY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFs4B+Sys4qRBE0jAw2mL84IlqE9WZOvyygaOYgT62I84OlRs8NgO82gZP9Klw25m42q5XzT8G3Q6HFD/AJBck7L0cs62fy8PIZGDigv+lJuboSB9wOMjuUJ9axBe3Xtk3uJmCrYvf0OdW8RjIBChDH9psRwKOlfNjYqeefSMfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1A+EKm2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1A+EKm2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDE61F000FF;
	Thu,  1 Oct 2026 10:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790851964;
	bh=5v+zWwwJPJ+6upaLSj7GZeordEUySthm51XOvMAy040=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O1A+EKm20eeiMQW5rVeHqHTUdrdzjgpqeAM2j6LLSTlsFSr2nqsw188zHDCXLytcC
	 qn5EmGljjmkKXFg+RI31wTMHavfCkKvhK5OgrDAXpCPewd6zb85JN4yrrf4nLdLFkM
	 377C1qhlPR3t61itb6HDJT/HG5O2Uhxg0vzMrn87RepV42GPp7m37vVixuUeGcQg4C
	 xZg5Ywct6UDJERvP+k9+fuAUg/IeiADWYb/8K13CCzbTT0BVapHxO51noeJZkemmKh
	 s1qw2gLU/9jmSqbT66teOHHfDvShWIFbysmxEZaeZxOXY74Yzz4Ti/a2iXMScEQ8Ep
	 9O8obJOPgS9tw==
Date: Thu, 1 Oct 2026 12:52:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 3/3] Renesas DTS updates for v7.4
Message-ID: <20261001-relaxed-annoying-swine-56f50e@quoll>
References: <cover.1789722868.git.geert+renesas@glider.be>
 <cover.1789722875.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1789722875.git.geert+renesas@glider.be>

On Fri, Sep 18, 2026 at 11:37:05AM +0200, Geert Uytterhoeven wrote:
> The following changes since commit 8dc2615d5702059b2b71fca6f93c0d7d10ae54cb:
> 
>   arm64: dts: renesas: r8a779f0: Set UFS lane count (2026-09-14 10:07:09 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.4-tag1
> 
> for you to fetch changes up to b43aa6a6ebe8ca8bdd75ee688e1eb2d0d16a888e:
> 
>   arm64: dts: renesas: r8a779f0: Add GICv3 ITS and update PCIe nodes (2026-09-15 10:46:16 +0200)
> 
> ----------------------------------------------------------------
> Renesas DTS updates for v7.4

Thanks, applied

Best regards,
Krzysztof

