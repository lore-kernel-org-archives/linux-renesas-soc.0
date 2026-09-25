Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84BA3A1A3F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337828; cv=none; b=be3BAu1gaEHQpHKTD0gbRZwo19KzszGteKJ3xVk99oeb+2VLCT76pqTKdEbRbkej9GvFQqWesCR7+BFK6Xc8yGdmI+c6YorUtHp+t1kmVQ/oQlyeW6Bxvd6jp3GBLleYmm/CuTyIygu0TgFynxS79lykZ1bpdcVi52na/kKy5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337828; c=relaxed/simple;
	bh=lJxMO3M40di0AO23KdpByzlm/CRDJOu5GRiy0q3Q0zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9z42WUqTQyDtjDkCaSndzSMs8M2SRqPXvfbIq6vRljULnYrRgPXwW4Mq9QX7QltYcIg0hqhPKh+23RF3JRnDxXoTwYc8yDCqOUbYnF7kSIcAfcdhoGereeB5Hr2qoY1vUwz2IxfQMKgWUNhh1Jbfug8x+nrR8MB58T7FNSSidE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoJDs9c6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoJDs9c6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A521F0089A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 12:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790337820;
	bh=lJxMO3M40di0AO23KdpByzlm/CRDJOu5GRiy0q3Q0zc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XoJDs9c6I6CbS9hMnzvNqyM/ZAlY3tbU6iefHUnmTigvbrhgh+Fdah3UNFwb9aBwO
	 JtSpyNWiGxJhRaOdq76FU6pglX7yUtjGby+xKfRu5Yi2MgXnl80ne789zcJ6nUJgm7
	 q8QIChnD02GO4SDcFBkz/+UzW0EeEl5K504BlJm9qSJ4i99LsRmWH2gh/E2mRss0Ub
	 HUYR1Hs0Pk3JiDvNbjZJCYBcqNJaN/nmQEBa0Fl7UFhHMQfbN4k1HEAso3FY0UaQNk
	 TAKvoctKR8JgvDdh6foaimZGRvy35Z7fDxp5/1v1aW0De3Lf1ltRyje3agmL8KLe1B
	 WhBkNX5BySFZg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso358470e87.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 05:03:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwkaiSSD7KuEtUAxFYz9bhHa1alzGAoX1x1njetfvnp+mjxgA4VXSHK5kiZnWQPFUtxZ++8zm0m/k6ZEMiZ2j1lJw==@vger.kernel.org
X-Gm-Message-State: AFuF++l95Asthv4Eht05gFoWfoZB2x0SbJUz64vzx5ptEBcjZu6w8HRl
	fN79TD5YEg/4j0n+0PKRGwgumdYR8oU04BDrKpJmSTeT7m1QaVwzA7zqburj3TfczWYkRD3vUPy
	lImZQjEpUxMjdxTiExflQPKFmD0wShUM=
X-Received: by 2002:a05:6512:668e:20b0:5b6:1a7c:3b with SMTP id
 2adb3069b0e04-5b8e6decc04mr445082e87.62.1790337818793; Fri, 25 Sep 2026
 05:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
 <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
 <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com> <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
In-Reply-To: <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 14:03:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL=pAN9pb3z7JtqMdXePe8f8=9CQKsE=Rm1_Vgv7ja9nLQ@mail.gmail.com>
X-Gm-Features: AclHuK_cojpfqn9CdY3sbAIoHIC6GK9YpMDVlN2Zl6sCiirs4lAdRcsP0Dp2udU
Message-ID: <CAD++jL=pAN9pb3z7JtqMdXePe8f8=9CQKsE=Rm1_Vgv7ja9nLQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Fri, Sep 25, 2026 at 11:48=E2=80=AFAM Dan Scally <dan.scally@ideasonboar=
d.com> wrote:

> > I'll address the comments and send a v2.
>
> Huh; not sure why I never followed up on this. I haven't touched the boar=
d in some time, so it must
> have slipped my mind. I can pick it back up and address the comments, inc=
luding adding the other
> interrupts.

Don't worry, I got you covered here. I had to fix it anyway.

Yours,
Linus Walleij
