Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8441C48E0D3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Oct 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369280; cv=none; b=BqUOpXKEhcVmZWt3wdk4ZsizNVpGUhKsX56zMyc3G6IgPrcYXxapbzYIedtBaLZwu6FSDv1L4jUB0EFIadMabGxLUX62OVXbRDjh3TBcTsqlnG7737OZljnFvG+bR2DvR5JSzG8ff0ahtYB6UQUf7XuyTisSLljMgqPJdOlO+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369280; c=relaxed/simple;
	bh=U9IrEoBQVBwO19e1F+Rb7P6y3+fNsIUQk5OiPRca568=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFSLzj7ENELJYd2jlyLbiWRZR+i2gZajkmqDJ/tWiKXfuBkEmFsYMmKEZmuDc1vjusRIm/eHSfeqFxCjKYd24IyjOV3KqPoHC3preZEFKjsB/5TP9noVQOu+YNEp2GukeBYECBKjep87Ml/qmpYneYED3v8VhxL+8jvTmfqxsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DK3kbvO3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DK3kbvO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE0B1F008A1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Oct 2026 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369247;
	bh=Aa0rQrbop3hax8Vjke2ivUTPfY3ro4fUWMamHs2fjyc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DK3kbvO3dtQN9WgIpPnuJ5qxOps1o94UACrHsImrnQpQI4lhk+aYOTiYo/eR/SYNe
	 XSDGRmHI5Q5vt0IYEDJTPfgH5RhQIM1JejtrUr5ojsFsx/UaWOqB4AJDqHoA2qm6Bn
	 kOlP+c0h78S1WZ2RYbm+hulTzq+4NVpp4i6A76PnbPE2rV9cwB+nZuvu4SwZlJcbMm
	 /lMxKwknNyyEK95rwW6LFHG19nFCPLYEWwJmRRDYq2UNKixwipxfCGxuSZNuHWQuNx
	 N67XYMg6ZeuAlWQ6kKQBeIRGq0wa3MQaEGbfk1ZPv6bfuuuifvhgjGfEC24N6yOXTF
	 A9YbNvMidjc5w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a1981228f8so12947951fa.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Oct 2026 03:34:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwX+74XunU/5jKkXmjFKQmGFX5xOdPp7FJ5+JC4PahmctVJgBrIGgWquQreE6swW1rdUNIpQdfQHkqZXHPgQ+qSbQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIA+gcPObJjALY0p5+fV3lridxSrPStrVoQdkBFZt4THoHzW6aF
	HXXJeHbcMYrgQnR3C8F18S41DHC52r5s502Cj2hnRC955iw3ZVWGHz4S10zO1vkdnXc+/tuPD8d
	BJggQRRiTwksBREleRNORWOGYcQdiO6g=
X-Received: by 2002:a05:651c:a20f:20b0:3a6:6d9a:4188 with SMTP id
 38308e7fff4ca-3a9a2cf45e1mr3189651fa.15.1791369245722; Wed, 07 Oct 2026
 03:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-3-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-3-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:33:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLm6QnhOwZzCsJJkvYDkxhE-bRUvytjkEDzZJnKaJ5go6w@mail.gmail.com>
X-Gm-Features: AclHuK9VzSEG96mQtUPQl6mYgcJWO0uGPLmiDvdU6LQqSE9k0_R11BxY9w5t8qY
Message-ID: <CAD++jLm6QnhOwZzCsJJkvYDkxhE-bRUvytjkEDzZJnKaJ5go6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 10:32=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
> node fails after map storage has been reserved, the top-level callback
> returns without releasing mappings built for the current and previous
> nodes.
>
> Free the accumulated map on every error path.  The caller ignores the
> output parameters when the mapping callback returns an error, so they do
> not need to be reset after freeing the map.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Geert will look into this patch and handle it.

Yours,
Linus Walleij
