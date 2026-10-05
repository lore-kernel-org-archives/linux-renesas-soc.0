Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F24D7D5D;
	Mon,  5 Oct 2026 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221954; cv=none; b=c6bPoMXQrTiFbZLgd233IGFcrMIUUNK0FeLRtS/S/bDtSTMklRM8tzwrN8tGQi03K6pnEWbKhv3baj92q//u+4pmiV/nk3GkHbpSnESG8oV8ybhEVBxtgLAG0XG/vISwyaUTAoVvm5AtogkGhg8RW3u8U0xV6vggpoiyC+NZFfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221954; c=relaxed/simple;
	bh=lxBV57PQQD4PuzlFSh0CYZQsUfnY5J+vpm9OS1j8nxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQuMggl0qmMXyKZstKCHCow9Qd0idr2xyvsd0ifVWAwgwgpMRXXhIiccWtBbcjEp1vnf6O7Iz27/uCNd8nc6Myl8lBm9tS7unOG6n3UM6LSEzIO/m95jdnFajt3oUuPkVhCodogQ9XSnL7jnwoW35Spg9XToe1WQr6JJBjrYHCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwFYPjRb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwFYPjRb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB411F000FF;
	Mon,  5 Oct 2026 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791221953;
	bh=eCPJZtVJXTADLwsNhZD1XApZ0vEibMymUd9muRDXjOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cwFYPjRbLQKCy+QJaODafwbM5tR0Vf4SHjNQfIzmtSWc0D0Zu6uZszaaBnLDjtzmF
	 J5UXljKKvSaM7g/+YLhnvoK7BwZ85Xaw8jnK0wAFuh2/WDIL2J5QqwOop6mA7SaY+b
	 iq1ngAre2ufnxZaNcTiQyFiwz7pAdaV0hpqzVhhUH+JPPMGBLdMCUHzzdMOHQwF4sW
	 hn46xddnqr2Nt8kj0jM04d6dTr1mB052esh8ZneDTeNU3psfpc54kw22Z/UIyFEZ3H
	 anFbAKADvR2qhZBhr1khFlXGFiUh3r4WikD/CvVuYLyw1wAH0LPK8KmuxLxR1+U0oY
	 Onj4lTxqBznbg==
Date: Mon, 5 Oct 2026 12:39:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
Message-ID: <179122195174.1254255.13778319081731408123.robh@kernel.org>
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>


On Mon, 28 Sep 2026 14:21:48 +0200, Linus Walleij wrote:
> Mali-C55 exposes separate full-resolution and UV DMA writer line-tick
> interrupts in addition to its combined core interrupt.
> 
> Describe these optional interrupts, keeping the core interrupt first and
> requiring only that entry to preserve support for existing device trees.
> Extend the example to show all three interrupts using mock interrupt
> numbers.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

