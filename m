Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD093DD505;
	Tue,  9 Jun 2026 10:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002549; cv=none; b=amr/ZfMG3bzTM00Fk9hR4cVdVOjHhJAgy7Yr2m/ZHZVOOytyikhww6RK0WMRl9a5gaFfdCABxij4+d5192ehAZf9uMswa63F0lk1upiKPplrGK6S7HS9jZWcWOZzXHdyWV7VXWXP9ZpYuz4s5jNW3LoRNFa9S+7s8d7rol39ZPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002549; c=relaxed/simple;
	bh=beKfc4r4KzVPu14v7c2Up2dCryd+1ea0ljrSoi4u1vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rldSC1Oq9fao/gcKgFKjlQt4IKBw54VoZrPBE+A42I9R88AUzlZw7eVjXUfxkZeXAYZMjfyasVPuHm1qvu9STQ5lnGZeffX29RbJVbyjHaT9ofSWNFfLBLB9DK8XGqQ8ijv5CGa75PBhZW+sktSLDnsf3/3fRWCIo2Um0lIZheY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nh0+1DoW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nh0+1DoW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB5A1F00899;
	Tue,  9 Jun 2026 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002547;
	bh=eWt1hIGUG4VVl6t3Lb7SwzBt8jaRjmM77PJvAbXYh6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nh0+1DoWGz8PxRCjAefH/c7JUS42e1lHnLFPOcQEFnOJQO9/ipqJR2pb5SUwjLoNz
	 opn2WT/tah17G395xBWCFM1u2SlSD3Sd03U3P9omegst+hOVt5ZvgKj7goVFV8IBA/
	 BwMWEagqWbIfuRd9RdrN3Gej3IX3RiSo4LmSZyh6jNpr4Wnmql9VwgAHTsIPXaNyaX
	 6Qy+s4ROu7fcKvbGB62YHRGU6/oZ6o1qJKNc5nmLQGQFiQzJ1zdZ+CevFDS0GPejBI
	 0+r7oHmMCy5n14HxKscWKfFn5SNkJEswN1gCYxAxiXrxd9HE/cebhQUaJomBfDBUUo
	 /iSy26G8OMqwA==
Date: Tue, 9 Jun 2026 12:55:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)
Message-ID: <20260609-imposing-noisy-griffin-5c87ea@quoll>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
 <cover.1780319122.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1780319122.git.geert+renesas@glider.be>

On Mon, Jun 01, 2026 at 03:18:19PM +0200, Geert Uytterhoeven wrote:
> The following changes since commit 44f1ef06ceec55b7704c7d773d6136ca8b90f8b7:
> 
>   ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6 (2026-05-15 11:35:25 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.2-tag2
> 
> for you to fetch changes up to 0d4ed954061efc3e47fa889d3de0675f933f438f:
> 
>   arm64: dts: renesas: r9a08g046l48-smarc: Enable audio (2026-05-31 10:52:23 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

