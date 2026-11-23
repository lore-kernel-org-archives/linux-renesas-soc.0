Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439566;
	b=DVhpx2tuwJw44i3k/mTCxBXVy7DCXxDHsBghvXuKL/bgtdVVk0bG5DJIZ70Z8sS5FTd2
	 boYX6u/uVNNJUBKHD9VHsFU9gfNM1a4REwPlIDHL4moDoVMBLpmZjTzEPSTymmt+7fx/4
	 bI8Wz0Gs7p2Of1lI7+vtDVDmU/6QmhrxIpPr+CBayTGwBRqcH/KCT1IW+ifPOPGDFha5D
	 SK0obAY4Ds+FOjRcDeCbZvhc7A02EYyJ4YzSbBEwGn9a7D+ChNNJDYi5dCJTAhy2S0zh2
	 aTD4NdCaiiFjuPxowkeVxPsj+yfAgS4HaJHEfd+Emx9K+xE2cUkqXorqA++IP74GLKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439566;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=w6eqsCdQF3I2GhYQxS52iBVcQvGlWjO6LkwGaOHisJYoSr5BTrN+ef2m9d/0WLJSyFwV
	 +2j7CzRgBbSBWNzBXnS8KWlGtCaJKWjXzwcxPpBBFmJZ/OAv0zk2XXTAywZNomu8Kj1r5
	 T0jwJINlzTUc81L3moEzBUA/g/oPn4o+/tIuBFcWy6ozMxD9B7d5aocs//QZxuyxDUbrQ
	 RJ3HzgOGYdTRw83IhRhZUXWX4KL+QImTqDE3S/22t614Brfpe27LkkP0EdUqfZZTF2cp7
	 +ImM8pG4bdWdGdjupGIMxFaFqORGPRlQV3W+KyB1etAlyAQxou3/SlARWX5OVPyUYkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pl3FZ6Wh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C7606A31A;
	Mon, 23 Nov 2026 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pl3FZ6Wh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9A51F000D2;
	Mon, 23 Nov 2026 13:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439566;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pl3FZ6WhF+5BtB66fte8JV5RPlpfc7eGLvXZlog8ELGkOJt4uPK7/HkE3sgpKOtil
	 UY4x9LHrZwbnh2iuTIkfaJH0y3o0H9O3fqqsGMGCY6Vvc1dKNmEO6kgUI0CEAx7Ei3
	 kRLjg1jc8c+p9/PGyLswW1boMCnhE2C5+cPbj84errBWA7TZpkKCFfato9+Wm0DjqT
	 //pnu0JwVyQE63zuJ3tfN4MJn9sHGmM2qZy5Y/sb087OyXtBAeu73fIT9LjNURldbF
	 g+ZwUDl014TCbdLqI/ct8Lgc2SUPvggMLzen3VI8LTykxi02qKDOhjxW2LR60ZZ9gS
	 IxbUmQKU2r8GQ==
From: netdev-bot+sinfo@kernel.org
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@linux.dev>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: 
 Re: [PATCH net v6 0/4] net: dsa: Fix various issues in rzn1-a5psw driver
Date: Mon, 23 Nov 2026 13:12:44 +0000
Message-ID: <179543956483.3294.440601604363377666@kernel.org>
In-Reply-To:
 <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
