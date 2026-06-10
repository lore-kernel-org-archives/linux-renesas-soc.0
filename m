Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EE65B1EB;
	Wed, 10 Jun 2026 20:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122570; cv=none; b=Ms6gU5Yqel27OyFtUvdHrHINGBFmDZuQqePK0nRlaKjlYXLdq+rypeyFUu41qYEgw0ojdLV1oV6nabWWX38QqfR1srg2g/c1diT4Fd4xYeDy7NgjizI3MqVjwQFmd+Wv+5sVojRqtQhua4EegipV1TigmF5xUXoyLQoC5HygyDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122570; c=relaxed/simple;
	bh=1n3bZS8I/VceVU3Bld5daiuU36dh1kTtX7dWM0RSfUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPQ7ZIlLkswen9MV01kPGnelwKia8uFNxbEnWkvyYqsZM6/a4dX8sUxIDYnoU5/xuepeDh2NVSV2pr5XRGPhq5nWUE77v6mTRKyHxq5viAGKSAE0QIbl1TCQTqCE1s8yvLvqYqxOqz3rvDLXDSXxEG/LHrykfBpOKtP0IuIBWZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdpK5zYk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdpK5zYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740131F00893;
	Wed, 10 Jun 2026 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781122568;
	bh=so9DqOpbIr30UHFoCxEBiHg7QsGE3smYdeJydKVvvS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IdpK5zYkk+IyW2kCCxwDA2A7EX4v2QYUOHaHhMdBiJ4pekOBqmTg/4B3pXiwr/1vS
	 V8QWIWSGADQmVCQIdFtMX1UyyKSgO3fqSGngcIecwIg+AQW66HLzhRoaVMBkfiBciR
	 lBdL+7Tsp6VuhA4r3uxV5N8+qKdXdchKPMKCDvxFnO9LxIR7/pfAFg3ackZUy9q2Mc
	 x6XUyaU9HjRZaemwOfp52LXeh3s6vsa8bdDyPeO7CiE3ZAkhvNRLMFjIHwIn9f4X5R
	 WgHqTjsrDFI6WJHosOQZ+vnuZbHtKnwcf7BMu25Dr8++mmtRXCm1HE3j5EM3hke5ly
	 qrWs3fkqcRjSg==
Date: Wed, 10 Jun 2026 15:16:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller:
 renesas,r9a09g077-icu: Fix reg size in example
Message-ID: <178112255975.731343.7950819042460717467.robh@kernel.org>
References: <364ff570c8a1845fab24bd89557f06c9e406f8de.1781105007.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <364ff570c8a1845fab24bd89557f06c9e406f8de.1781105007.git.geert+renesas@glider.be>


On Wed, 10 Jun 2026 17:24:45 +0200, Geert Uytterhoeven wrote:
> According to Figure 5.1 ("Unified memory map"), the safety register
> block is 64 KiB large, just like the non-safety register block.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> v2:
>   - Drop Fixes tag,
>   - Add Acked-by.
> ---
>  .../bindings/interrupt-controller/renesas,r9a09g077-icu.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

