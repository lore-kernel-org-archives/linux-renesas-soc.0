Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436946;
	b=BaGZEXt5d5qu9GwjC75XPrDp6na8XDUfua5eJNjE+0Q2j7GATniZrTGSpEj9h0TbkKjV
	 RU89M7CKHiDm/ePJhj4J9rkKnJ3iRwMKHVvBmgy4xOeVhVX4PQ4iV2Ftn2aNlUxcGJZ1o
	 5IJGvwE6VXTQtBqM+YoYbqV68xTZ8xIraIMHJa8mP+0K2EOrFfJPhSWf5z/TsZK4fIAXf
	 nhcM4sA0G7Qomqu4vSvyndQh8JWSC0T4ldBln6JLUGzswE7cNOK6zgYDTY/ikbgwwuPjM
	 lOyndJC/fjuK9qYmITCc2t7lZnFcbUQqGcRyCpRI68/7e9C3XLl1Z2dAbYdNJsoji8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
	b=dM9XiYfEYqhJHkH5Crxxa0SV91ZfBMvgzWPuIZ1/vpjC464GHDHdCvVkejm/x4tCOuJl
	 RknU9aCkWTt3WHDZ2iej/rTPXX78ScAK+QSTrkGS+GYT7c31hh4b0ICrbsH0HDIWER+Ba
	 qs20B3fBBveS6ofMx32U9j0xJ2xuCBxGfXAwnrLGt7SXloPZotzaP4OhyExYC4tNSgfoW
	 uc8DVUyW27YdeaLhZ/yMBWogGRkJ8rjCp7MG5X+TF2HLiNMiEHcH7jkdHiKIgfS+Rm6MQ
	 B8Rz8n1Xq+vA6zCjvmJXRLZvKlABHDVYtsQS0iqVbqnzd56REQj2dcI57Ee4Wt9MOXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="exdAKoY/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78100606A32D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 12:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78100606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exdAKoY/
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1766748f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 04:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436945; cv=none;
        d=google.com; s=arc-20260327;
        b=jMWJxVLVs6Wlb8bbBRYKDW3AebvCKQhKzmoCmL1eAbcbi59D39G5XWl0MZI1iLzqYv
         8dJ2uqOPrVhRY3D9Otqr8FIqDoF9/yAN0FWq5iJEeCuLtpKR/kektojbH9zcOG+YSCI0
         dNBiWdqvE+iRA/YIkAjur78Wmf1Y7fL/jd7e1DYNwABcgASrYa2iRJ9lAzavk2iI06UV
         ZGIA+NWyfdvDMpxQW/FJ7wPfdCGKfYbS7hWFSMWidohegoB/t3la6RjhR/F04YqWu1Go
         /J9FxxyEvGPEFT9Q7y+iKI0yUGhx4t4elB0LaSBF4aHWCO6DEVaksMf4I1Bnaira8ku1
         xaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
        fh=fpGN2lNe71EhlxaEI2nCEAutFYpTGU5/+OPaUS6KLkw=;
        b=czBHE/FoqwVIvswse2e2oG+pNjhlglib75b/q33ViS/pmeuMxN4OSoSk6EAfaz0wxo
         Bi+AfZYpwdEv2KVhRcL+RYnh+Rw4cwr5Jd3uFzDhwONZKOWhb4wgZ9Zwq0Bg6tX4VG7Y
         bDD7CIB2YI0mX/XJrdEHsyZEEy9akAwEl/tzmMOCovXp2rbotpufUZxQso4w893RK2ic
         Zx3jEev3KXHGvC1C41gVIeFobPgiDDAOqcKAHDsveuFTRyB8Fg4RNp1Ow+JmZJhgSIN7
         jJT4CdEXf4FHYGGeHutiT0EielVw2pGla/cs2qRAaU+wpCLZRpqppE3Su5SmYxhpy8dJ
         krHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436945; x=1796041745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
        b=exdAKoY/Sj/1MXfEqx6dzg3yHAtBCcka/a3q+wOk9rh8sSSJckb+zIRZkfr40oLKVH
         wfDW18ceNJCsog9LvJkKKnghF7uN1XMi7rRx/tO5FjZoD5OrqUrAehqlQ0o+5/u1ZdCb
         GjRUDPBlgZ21WMLM6Qxns5OK/KkgTPAcivTBlc1CcXwqPlJqxNik/s1J7qwpFImIZej2
         640uIY7tOPlp+LT4oahfc1rtLth1nAfWuweJxebo0Bt75ROek64MzxDq+chxxDV2I5JG
         9xX70cNeoctg55raFUoP/6PYAvapBr3jiT2FrzhU8eCeQ+J/6BN/7aeCO6ctwfkxnxAC
         VOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436945; x=1796041745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
        b=djPNUl1inU18HZVll1YD1iWobcWqyTD+Xn+ISDmbawDV2hRwhKGV/LDlrVCHUBuvPC
         KCvHsunNLyhjFEQ5dMJrmIZN2Pc3Yv7b9+iVRsyWfKV4hLbnz4361rRMwEE4yz0fx0JT
         9aZWgAqmWeyIfoLRzistlm3SG7TtLwP4w8ORG6tbdUEl7pz+VxCQbqLh/6Jodf5mRY8n
         FccBU01bx4If20Dyaz5VW29EIldqdrQmUEi2RTRUwV+2M3EuJvLraV9gS7NxhsjIMx15
         gXWX/GLxUocPJMnhBqhpbjHe+e09b6M7FIIBv8YbzMI/+CgfOAQjRaSSqEBKj2IcP8qp
         HdTA==
X-Forwarded-Encrypted: i=1; AL+hErFEIKmeWB2KiUGSBxc77BUX4gNIMwX7Xg5Pcyb8rASXGDc5zCbfNfzLxWyITpHFOAInE2IJ0I64D+ztOCuXntt3tw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8g8JJenpgJch1ap6kO0gzJcYY9ihhmqFWT69/N0t6aXdd2Z+aq
	+CkdK3a8tlldIAIdePmy+4OozayGKpKBC8U5MZqvnp0/EUtZi8hxJa1zQ9EICoGRZc4IB3fHLiC
	VTHDFyHJkyRxDFdUUvNsI1pvnU/piH9k=
X-Gm-Gg: AZFdTZdmYSN6b//ZXRoOZ8TVQsyt6+T7n8N3yeOHEYdQMaeO/loa4hwMhhh8wZ7YLvN
	zbYCBsg3Nt9dSwemfYshSI+8WX4bBlEHPUdSsSN/U/1Vqad/rb4gOJUfo7fDXqH7aUk0wJpksI8
	aO1PTyJ9TCvblrfLO7QGP61Ae9RR54yY1xNM0YH3S5PklGwutbdFCRgXSAOLD9huav5dZ9leDQ7
	FC2FL/0HLXPnHyi5UfN7Jv+AAgPziftGhP6ssTZwUy8Gh/iTtUqSJUfWU1pif4MhjCTNKj93xoL
	ZtYXTgS3eGgbCwN/ZkA3zbAQWkWtHBLIbmriD6UuCrj+Q153vo3dI1wpf9ojB2jOxUIyJCqKgHn
	0KU6sYp7K9g6Dk4C6HT2eeCVAdHYdKBkZhvJQ7Qya/OdjakPDk0HPJcOhRcDx0LsbuplGPNAe9/
	xDy200hRI5tH2r9Bb9eSbpX6tfyXjShYNey1whQiM0vvaSMLbqQr0DW4AYkA==
X-Received: by 2002:a5d:5f41:0:b0:4b4:510c:519e with SMTP id
 ffacd0b85a97d-4b4510c5231mr3941260f8f.27.1795436944634; Mon, 23 Nov 2026
 04:29:04 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <457ae5cb-fea3-4366-802f-f81447cca3cf@lunn.ch>
In-Reply-To: <457ae5cb-fea3-4366-802f-f81447cca3cf@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 23 Nov 2026 12:28:38 +0000
X-Gm-Features: Aa3M54pwpdIWaGuuMBrn27ZxcRZ-1H1x8XFbCBtqvnWS6semHXinABmTSf51p7Q
Message-ID: <CA+V-a8vGO+pf-2fSZ3BEfNepz7wpPmqiRB00MUMWrW87mN13JQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 12/24] net: dsa: rzn1-a5psw: Add support for
 optional reset control
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you for the review.

On Fri, Nov 20, 2026 at 3:32=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
> > SoCs, where the ETHSW IP block is connected to a dedicated reset line
> > that must be controlled by software.
>
> So it is not optional for those? At least the DT binding should mark
> it as required for these compatibles.
>
Yes the resets are not present on RZ/N1 hence I made it optional. For
the RZ/T2H SoC where the reset is present the DT binding marks resets
as a required property.

Cheers,
Prabhakar
