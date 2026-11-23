Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795392696;
	b=HDqI+GkLf6KCehfuc2RocogRw+tpxMYPZMFwbXEjE1otlH/JtRIw4XNuQBBkyVHL5SrY
	 IRKzQvm4riNq6xbOb8T3b8UAAGueR8QnARQmvtK48G9TE/aBwuPe6Mz4jeWet4bO5Js9C
	 lskdwF4J5fmMHD4LCjhNOCKRkXWuEyoU3gBcJ33pxduQpLlWLhGsOOCd/I/9vD8jFncbl
	 BYjmDNOM6LlLFBeC7NTSFfjF/friseTLWGnKVctZ3vhhUEDbnvOQASvc1hWQmcNMQWppq
	 mI5FGKnZBdhhjS2kBKPgtZsBIIz2ShCXJZeoTW8UWb0Uw9MaBYuGvd+RBSll8iFOpDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795392696;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pzL1OdNmy4Sn4HuW7URSYpC45FZ9iIyQh9nhTGJnRkM=;
	b=3n/ChSWGmuFbnZ1svJjDbbyfRHeYgJqnaKz1yqVQ8irIkZHw/gj9TsHEaFLCfCMpLrHK
	 JvYH1steRigy+eajSyllaYPWj1wHXgPsoUEn1e3UYKrzRH7W1t9aM9NHBxJm0/lWF/J2i
	 zEPneEuDjOZazVuiG8PuNy4blX6laPYYFpx4lcKgDhBwL5HrJ0xb/GNu1e1CLNhrdecJe
	 OS0AEhWYguXx9hEmruJWi2m0J4HlOgayxAiowekiQUJ9fCG+n2fLDW9wp+DhrJ2081ObN
	 f1ekhDg0P7WjyIcdhXhNO4AaQbVjj0zU+7mEArK9O6PwrSEJ4oEYgmFkK4XrOxCRx+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMZ+2RYj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE29C606A320
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 00:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMZ+2RYj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151901F000EC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795392696;
	bh=pzL1OdNmy4Sn4HuW7URSYpC45FZ9iIyQh9nhTGJnRkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZMZ+2RYjViG2bmZiZGIipjwncVIeQyEHxkeGVgpmu22W7CUuIX0cycyklNR/CZaH8
	 m6f2i1YqfBuIEb2bdZrvMtTbc5YwxvhgYBMZz474HCj4VJ6M5zYYTYj4yloOlz07vl
	 TNjs8Us/HR2AOVtrtXEKS8MVZizK0oYiiP5mziUQ7qKadNIFQo81I1c9aKwALhYLJm
	 aMVHWv1hV9oGaBZX5YQfQcFaAOi2zXwu7oh7qulZo+DbiiD45AQsN31YrdjUStWf4t
	 Bwpfak1Ro35QHZVD4lJF1H9Ck0RoZPDePY6HxAAxP2WEnL4hkSLWsazJzZtSpkrDFW
	 tV6EYfgs0+xYw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso4011605e87.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Nov 2026 16:11:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEeKCTrsxOg4FimvA6WnwyAlcXAaxfXW059WGdY7yA8704SvBHDus5H1kGkUQ38ONmtA6zZfWeafcyGDPlWfO6+Hw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/mpo45NMwjCtXh+iJsgS118I9SPPWigMK1AG5h28Duf1lj60D6
	Ox4Vl4O75A2h2iMbeh9LjScDkDPLOi77jxw4QfARD2Z8g5p6vSF3rjr1ySOLko/urQpLwTBxG0T
	3z6erFZY44mw2Ez0ixN4lrLMIdbwQzTs=
X-Received: by 2002:a05:6512:1391:b0:5c1:5a23:ec04 with SMTP id
 2adb3069b0e04-5c1bc85b7b6mr2662412e87.44.1795392694735; Sun, 22 Nov 2026
 16:11:34 -0800 (PST)
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
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 01:11:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com>
X-Gm-Features: Aa3M54rrgEQGFcFfn8yM1_2n_V2A0OA5mXHg_mnx-6IzawOxF5-bkLruJCdf87k
Message-ID: <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:53=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:

> Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect the=
ir
> video endpoints, and enable both blocks on the RZ/V2H EVK.

Gentle ping on this series, everyone happy?

I guess the DTS patches go to the
renesas tree and Jacopo picks up the dt-bindings and the driver fix?

Yours,
Linus Walleij
