Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110829;
	b=gn4MpbVLgab8sm7GGMAfCk3kt240Jph+d0QTovHXEshLh0utFqUVethvcKrPE1K0dn2K
	 7dpMisUZyKOYkMuKhsR3HNn9VH6kRvRuDOPxuQssFXsds996KpU2S2nEUXNGBWksUGsku
	 gDc/3Yz3HqSOUJZ6rKG6jVUf7+fh5m7lPCNJOojQHdN9tpM0ExWGJ2OMRxl6z8dJiNUuK
	 FRks9OOGG+i5cUfC6nZ/rZLezTlKhQT2EE3Ce3jeRgGitaXv+eZWKZ2L1Zh0gH0KJQqrh
	 1DWOZW11wNswzitEfZIapK2nLu8dT0f41xrT65Vs2xjSaHb1vdvjog8wAhAxSVniJSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110829;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GGNr41yBdTpZYx2SDxAZUmAJloAwnOll1e229XCkLow=;
	b=AS8oRikn1fWNEzfRRZU+pxJWRcqsoI6zTCdt2QzSC72cgjSWwjnU6qhBLi+Hb7AVbArX
	 I7AASoHwkC6tHEKfxJyTrgwpBHiALzDc4NDSbdhnWIiz3Dx7NrjfeKQNhnVoVhRD8DyID
	 iR3t5slYuDWLu8CeTa/8RIo3mwjTgEpZywHYY/A3K1CkzFJjgScxw9eddllYNjB0GyUuq
	 OQ8j+jrSDVhzd7ns8MLgIx3gGghZRviLxdvK/e6ZsJnK9lJKU4oaa2HK98Ab3sQgtGpTM
	 qf/rBk0DrTf3MPqxY3wcvHDhQdIIAFwmic3bNH+1opvqG3/s1jeA9g0Y0IXVNIinwZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/3197F/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC2606A320
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/3197F/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCFF1F031EC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110827;
	bh=GGNr41yBdTpZYx2SDxAZUmAJloAwnOll1e229XCkLow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I/3197F//5bf406jcAf97sCVxQOGKU6UQ+ppRF4YfsIIKbMuoTYo9LTj5Sjy3AD8w
	 KzUFb/HWCvyqo6L0w0RA7Mux0i2L9tlWeNARzqQCoTEuRvWNWYhZUgP4kshPwZnbqR
	 qLTdSi5pTD64Oq88TgupSzSmf5UvVYDrrasz4m671Snyp+Qd5JLlhhCzeJ6yacD0A1
	 ot3I4+kOrMBuvLutRTGJ/d8Tc0Og1ksLmp6oy4CedyYgX6NINvi1kEE5e0iYTsAhic
	 BWtWbqRrF12zvUIqmwHD09OsGL0TYIP5ow6FProRbLMo8vvbOqpDP+oG7cmSY0LqTR
	 dCULZxEgiBaxQ==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a71d0c4233so1681284fac.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 07:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+eQhCjs136VjSlvO949n3HaLedaN1NDn5ICEAx4WgPoQS2DYtwUuyDUrFyXwNcHvdwY3ym4kiwHXiTXsywTChkg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJKW3YG0CNTrkbydiIYGjh6HP3ukEciNzWPxc9Z5rfJO9PNnW8W
	ssAAREoV8Ti6u7RS1dHhPycoXfdVuTEViRVGv/e2T7loI24MDgINkiDbDws8ohFprepgbhVIZzW
	p1FUENWDUlN1dWcnUCTtXAmVqW41ggc0=
X-Received: by 2002:a05:6870:c2b5:b0:47d:b8a7:40f5 with SMTP id
 586e51a60fabf-4a83f533260mr6584722fac.22.1793110827181; Tue, 27 Oct 2026
 07:20:27 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
In-Reply-To: <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:20:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=7GkFOS9i46WDuKHcJa0S-VemJ1OW33H8EKK-SZ67ufQ@mail.gmail.com>
X-Gm-Features: AclHuK9MY21FRxc3OT2vCWHfUpZZ9cxWX59B-lOuZ_icl7P9J24tGPdGErZiGJg
Message-ID: <CAD++jL=7GkFOS9i46WDuKHcJa0S-VemJ1OW33H8EKK-SZ67ufQ@mail.gmail.com>
Subject: Re: [PATCH/DNI 7/7] arm64: dts: renesas: r8a78000: Add gpio-ranges
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:55=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Link all GPIO controllers to the Pin Function Controller using
> "gpio-ranges" properties.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
