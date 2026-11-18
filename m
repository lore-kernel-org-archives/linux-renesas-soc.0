Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968411;
	b=2/Qs/RsyUz7m8sfwzll0JJZi4xAQhO4xfkdyE9EvCa1DELsyZn3wm0dX/Msh+BZXlrMt
	 Xu3L9LExD0kH2yS4Zf8xPm+C+KJGKepkEReRR93ua6/0TMIT8C/MmqhLTcMzgvNm9UsVj
	 b/CboXcprCltXmNssUlKOLU3pEIYSSdh+TTeM60uCWjHLQxxYcAAy9LJaJMO1WWghLcEh
	 IwtCluBjd4DBzD02OJfKrXrAPLMblv+wrIYOmj74pTS9xwVNHVyFe8ac7kz91FjDxaIdC
	 fEKzXSTRyvVZbCieQv+5d9+4KvaIZbJk1MiN/aOVbp2qhrXGMoqeItle1YcnaIEvpug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968411;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=wfiq63kxiT5aoOR+3JCcFGRHHMJmr2LUP/R1Uemy2Gw=;
	b=Nq9jilnfDo7g716FTIQT6PJnAXsOmzT5WPoTAE9CU6uDcDcyRWQWTN/GIkvSqfnf7CI8
	 L/1XKZyO+IY/YKNVvi1KYz0UVuoWObh6E0Rt4aePFkPn8YdosdSVMcxl6Ck0Y0jdOxuNW
	 bfumFbPGX/X022zaN22KSPp+OpAnC0DAdOL4txkH02NgggqUpJv8hk5dqJfkfiinQ8R2O
	 LL9O72SAr7T1O7+Ixlys4M1eUzul3Pmy5gnb9Rf3NyQP7Evj4PTGIO1f2L4IjWsI9hRHW
	 yDYChs0l8gEWMWW/JcI7qWOc0KlJHH49WA1bB0nd8jaeaLaI7ZuUDlTZ3rf2Ds3yGJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mbt2Zd09;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D5606A325;
	Wed, 18 Nov 2026 02:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mbt2Zd09
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05D51F000C4;
	Wed, 18 Nov 2026 02:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794968410;
	bh=wfiq63kxiT5aoOR+3JCcFGRHHMJmr2LUP/R1Uemy2Gw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Mbt2Zd09GXxNobCPq2u+OrOepxJCJbRWZ0kLPLMJdbjwJizalY8UA+ii7iXJmDrh2
	 sHCW1Xt+5lhBjDv8W+S7mQ09CvFoag8SuNhreaHU2/hEeKqDeyTiqMCaBRyLSjjtr8
	 Wn96twBnvHrwsNdJwkYdDt2MQAo64N+4bskLIBmqNX7nJMbMfcpTEKo0ZO3rHygeRn
	 w1Y5VknZmuylflvjzJGm+fFuK3NnyvwaIg9a4y4c274ALQQmSFrKTVQiFfZ3jH/0Bm
	 UDA0HlwEobWZcSgwa8RjtJ1bv9YTaGHNMhoykJwZrBG/aqlxcwTs0r0fqJCtHFqY7h
	 jJUBgRIY3EiPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B45D7392B1FF;
	Wed, 18 Nov 2026 02:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v17 0/4] net: dsa: add DSA support for the
 LAN9645x switch chip family
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496840952.1411964.17679885943964442392.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 02:20:09 +0000
References: 
 <20261111-dsa_lan9645x_switch_driver_base-v17-0-83a471c5bddb@microchip.com>
In-Reply-To: 
 <20261111-dsa_lan9645x_switch_driver_base-v17-0-83a471c5bddb@microchip.com>
To: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard_=3Cjensemil=2Eschulzostergaard=40?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?microchip=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 woojung.huh@microchip.com, linux@armlinux.org.uk,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, edumazet@kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Nov 2026 16:33:50 +0100 you wrote:
> This series provides the Microchip LAN9645X Switch driver.
> 
> The LAN9645x is a family of chips with ethernet switch functionality and
> multiple peripheral functions. The switch delivers up to 9 ethernet
> ports and 12 Gbps switching bandwidth.
> 
> The switch chip has 5 integrated copper PHYs, support for 2x RGMII
> interfaces, 2x SGMII and one QSGMII interface.
> 
> [...]

Here is the summary with links:
  - [net-next,v17,1/4] net: dsa: add tag driver for LAN9645X
    https://git.kernel.org/netdev/net-next/c/4a7653aee5fd
  - [net-next,v17,2/4] dt-bindings: net: dsa: add Microchip LAN9645x switch
    https://git.kernel.org/netdev/net-next/c/4b4e23155b27
  - [net-next,v17,3/4] net: dsa: lan9645x: add autogenerated register macros
    https://git.kernel.org/netdev/net-next/c/12748b403a6a
  - [net-next,v17,4/4] net: dsa: lan9645x: add basic dsa driver for LAN9645X
    https://git.kernel.org/netdev/net-next/c/8138a7745064

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


