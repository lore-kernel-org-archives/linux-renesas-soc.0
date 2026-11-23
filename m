Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423184;
	b=Dv0fM1QwC+x0hrVD42btdT4x4g061w6ZXHbwzNBkmh5b9iVJRjUaUJCqZ6Xf2g1gf7g/
	 QBXVwEfW3IUDYJqaZnaHEabHxWwR6hJbwZmwZTx0m99y3nddTpOXgxekuaEqsj6LomxJN
	 rHnwvSJmQ2Xc++udZuC03/LobA8ytrnKFfxcUnqZy44q+cbs18S3D5t3hdj+eLjis4cqv
	 HmGsdgYRAvToJvApRiFwYmsRPrOfysc0HjyZEOMWl/UF5KlXLSHMlaSPZooy+tFPPboOr
	 Sf6ARG6U2TiBzn4B0HZ08KGXdtk7mfKiwn5B0zdNRn67OCArnjAPb87a9CR8z6u7K/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423184;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rHcVKFskE16WvqfDEM8dKQQtjFYJBQrFBuOWdXceh9k=;
	b=c39X4b1MyizihcewbkfiYuqiS8enWKxBNhcZU92jzL+vvgqAg1mpARhCfQjKBdzIJcth
	 dCBqMU8L6wsG3xRXUpnBu1wTp1rXtUpPnwCNGJ/rykPr+J7IOCFPa5oxoV6yoIXKXPrYn
	 EPFtM202fGMaHRBjqsnOCi0HYguF3vcVbdpcU13Y1p6PJauufKiopF5DmI1fvbf36TmbO
	 Y2OM3psqS5S1ESFrITtOu4jl7oTIQ+YNxMF6asxfULW+otneaC9mjyFFizz54334WINTk
	 LK+s2AHoP6Lz42qqlZSgIzSyqiI5V3xdLcft5Ue+kL27tt6APLgcG+EmPa6xe2jS/cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KmenOAP4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4A3606A31E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KmenOAP4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78041F000D3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795423183;
	bh=rHcVKFskE16WvqfDEM8dKQQtjFYJBQrFBuOWdXceh9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KmenOAP47x+39hMYReotJM518HSXLWQldWFXDbA2alkm463YBdRmuxk3Ki2lSnZtA
	 zFgnjhWae7b0SYVAKvF3ZhkUkl8sj+fwCVjsB0ObvpU9LwHNx4TfLTspYUGRjyJazQ
	 86eN49zVapq4S2Wx43NcPomFkBXw4AvaVvD+/moOjRuNP+IWjzgKfZ4I4vOHKEtbvk
	 3vYz2hV+odubKMSI1mQDagvMz6AAfgFQ+oYN88958fBI4VKLzs1fXkZ3J694+JV16O
	 PFHqgAYop70iIHoB8HWnp7fkoavpmpVXnRGztS1sCMhjL6490+/I+cgbxce5fevsnD
	 /obZqgPT9x09w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c31369ae36so220120e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 00:39:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFO1H6s2voQSACyka7cGRmYEA2snDulH+BTShlSd1Ze8DgtmAdttnlzcbKrK5kGU6TuJfEWHzsIdCTnjRaXJlqpcA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9P265i1SOhnJfwWnHrIbe+T86iDn0IKS7h8BWKvsxJn/38PJw7
	Y9h9HD/J8QjfRumhEbd304MYo2OxG5xXAkOKbYJ0PkskUBy0J/aNKZngkam4pO2xv1p2ZjYvmWD
	gteXBuyr7fl5L8Ms7hodCVWU+EWzfj5c=
X-Received: by 2002:a05:6512:3093:b0:5c1:595f:b370 with SMTP id
 2adb3069b0e04-5c1bc6d253fmr3038979e87.3.1795423182665; Mon, 23 Nov 2026
 00:39:42 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
 <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com> <awPxSN7wctw6xsDf@zed>
In-Reply-To: <awPxSN7wctw6xsDf@zed>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 09:39:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=iu-zT5BwUwiTmyzQpWf2M0ZBT6FsheGziKT-+xRBGYw@mail.gmail.com>
X-Gm-Features: Aa3M54p4GsfoEWdtkuj5oItCwPGzhNvJwHA_MjvL3pV3p_XEjQVQ1NHvHx4FvqE
Message-ID: <CAD++jL=iu-zT5BwUwiTmyzQpWf2M0ZBT6FsheGziKT-+xRBGYw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:55=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> I have queued the patches already for my forthcoming PR for 7.5
> https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/pr/mali=
-ivc/for-7.5

Thanks Jacopo excellent news!

> > I guess the DTS patches go to the
> > renesas tree and Jacopo picks up the dt-bindings and the driver fix?
>
> As we prefer, I got a PR for all 6 patches ready.

That works fine, I don't think there will be any conflicts.

Yours,
Linus Walleij
