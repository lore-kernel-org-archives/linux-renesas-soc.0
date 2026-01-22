Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83347328611;
	Thu, 22 Jan 2026 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076122; cv=none; b=AV4eW1IDUG7XKc6v0iSwXugQXZdo+l+jAfUJcy3/ubYiGPTshuooVRz5VTGpvWHR79AFEYybgd7TTJCETjIDXOnrGSx9BXgnlwHZ9XnYoOHa3m9H5QLvh+QVAa7kSoIRalCbGk5KPIB7KegcbS4inOJ6Ga8Fn5lNah4SXHS2+3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076122; c=relaxed/simple;
	bh=7h+008P1K3Q9jVhJ+zav5FmELojwMkYGr9xmOqdNFI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3t3rvHNEE6AdYUC04lQnTXn6nMFfxhXf5EgCRUqXut6ddK1I5kqvDXnqTBvX1z5ABxXLASFmjWndJFzwF3zktiTuZfAmUrSy+0r/sPVIYsVnrmG981bKkTgSpAQtxM7WHD/vccqlZ7zPXHAd78JyK5vlleofZyOvPVNgo+2ABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gz98mo8N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gz98mo8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48B5C19423;
	Thu, 22 Jan 2026 10:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769076122;
	bh=7h+008P1K3Q9jVhJ+zav5FmELojwMkYGr9xmOqdNFI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gz98mo8N0KWRiRpzZFJuFpKOQg8rZBN1K/NhbZFUP4uwzzouEvz1YIW1Qu6RlEaI/
	 KCkQ54oy3nX6vm0cvgRMsKcfKyZYXdWY5F60P74m8vn6lEBYv7UDNt3iXxUorsK9AS
	 nElZ12YCTCoHdhf7Y0CRxpriIOtpwhw3QFr7TAYqCCFiYII21aMMEp8CDkx0fUXi9U
	 EFCuK0jco0RvXpF54QYpGgtf1BdISsoMdnP+StToAqmldG0zv1QIk5V9fzokcg3lsY
	 xsSBP7sMkxmi+hpgZFMgoo1cwNSbBJWJA0uEg/egL5/+0He2tMj4TxmS+JwL5Bk9Y0
	 rvtlgKiU/7rXQ==
Date: Thu, 22 Jan 2026 11:01:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Renesas DT binding updates for v6.20
Message-ID: <20260122-fragrant-auburn-oxpecker-33aa7b@quoll>
References: <cover.1768559762.git.geert+renesas@glider.be>
 <cover.1768559767.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1768559767.git.geert+renesas@glider.be>

On Fri, Jan 16, 2026 at 11:50:17AM +0100, Geert Uytterhoeven wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.20-tag1
> 
> for you to fetch changes up to f3b795d298a280687ed70211d51043ed5fc7a96a:
> 
>   dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplexer (2026-01-15 11:56:09 +0100)
> 
> ----------------------------------------------------------------
> Renesas DT binding updates for v6.20
> 
>   - Document the RZ/N1 GPIO Interrupt Multiplexer.

This belongs to the driver patch (see submitting patches in DT) and is
not supposed to be separate pull. If you wanted to share with your DTS
branch then maybe just pull it as dependency, but the problem is that
Arnd just merged all driver pulls and this one was skipped.

I'll leave this one to Arnd to decide where to pull this.

Best regards,
Krzysztof

